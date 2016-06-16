// start sc server.
// 実行は cmd + enter
s.boot;

// Hello World
"Hello World".postln;

// 正弦波
{Pan2.ar(SinOsc.ar(freq: 440, mul: 0.1))}.play;

// 停止は cmd + .

// SynthDef
(
SynthDef("beep",
	{ arg freq=440, amp=0.1;
		Out.ar(0, Pan2.ar(SinOsc.ar(freq: freq, mul: amp))) }
).add;
)

// Synthでトリガー
Synth("beep");

// Envelopeを追加
// 減衰後Freeして開放してるので、停止する必要は無い
(
SynthDef("env-beep",
	{ arg freq=440, amp=0.1;
		Out.ar(0, Pan2.ar(SinOsc.ar(freq: freq, mul: amp)) *
        EnvGen.kr(Env.perc(0.1, 0.2), doneAction: 2)) }
).add;
)

Synth("env-beep");

// Pbind
(
Pbind(
	\instrument, "env-beep",
	\freq, 880,
	// \dur, Prand([0.125, 0.25], inf),
	\dur, 1,
	\amp, 0.1,
).play;
)

// Steve Reich's Piano Phase
// https://ja.wikipedia.org/wiki/%E3%83%94%E3%82%A2%E3%83%8E%E3%83%BB%E3%83%95%E3%82%A7%E3%82%A4%E3%82%BA
(
SynthDef("env-beep",
	{ arg freq=440, amp=0.1;
		Out.ar(0, Pan2.ar(SinOsc.ar(freq: freq, mul: amp)) *
        EnvGen.kr(Env.perc(0.1, 0.2), doneAction: 2)) }
).add;
~notes = Pseq(#[64, 66, 71, 73, 74, 66, 64, 73, 71, 66, 74, 73].midicps, inf);
Pbind(
	\instrument, "env-beep",
	\freq, ~notes,
	\dur, (0.338/2),
	\amp, 0.1,
).play;

Pbind(
	\instrument, "env-beep",
	\freq, ~notes,
	\dur, (0.335/2),
	\amp, 0.1,
).play;
)
