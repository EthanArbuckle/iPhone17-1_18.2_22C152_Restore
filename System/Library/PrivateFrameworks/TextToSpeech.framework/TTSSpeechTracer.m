@interface TTSSpeechTracer
+ (_TtC12TextToSpeech15TTSSpeechTracer)shared;
- (_TtC12TextToSpeech15TTSSpeechTracer)init;
- (id)makeSpeechJobIdentifier;
- (void)emitWithEvent:(id)a3 forIdentifier:(id)a4;
@end

@implementation TTSSpeechTracer

+ (_TtC12TextToSpeech15TTSSpeechTracer)shared
{
  if (qword_1E96CC3A0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E96CC3A8;

  return (_TtC12TextToSpeech15TTSSpeechTracer *)v2;
}

- (_TtC12TextToSpeech15TTSSpeechTracer)init
{
  return (_TtC12TextToSpeech15TTSSpeechTracer *)TTSSpeechTracer.init()();
}

- (id)makeSpeechJobIdentifier
{
  v2 = self;
  sub_1A67EADE8(0, 5, 0xD00000000000003ELL, 0x80000001A68CEAE0);
  sub_1A6741AD0(&qword_1E96C2C98);
  sub_1A67EB220(&qword_1E96C2CA0, &qword_1E96C2C98);
  sub_1A6892230();

  v3 = (void *)sub_1A6891FD0();
  swift_bridgeObjectRelease();

  return v3;
}

- (void)emitWithEvent:(id)a3 forIdentifier:(id)a4
{
  void (*v8)(uint64_t *__return_ptr);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _TtC12TextToSpeech15TTSSpeechTracer *v21;
  void v22[8];
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t vars8;

  uint64_t v6 = sub_1A6892000();
  v19 = v7;
  v20 = v6;
  v8 = *(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E4FBC8C8] & *(void *)a3) + 0x58);
  v18 = a3;
  v21 = self;
  v8(&v24);
  v9 = v24;
  v10 = v25;
  v11 = v26;
  v12 = v27;
  v13 = v28;
  v17 = v29;
  v14 = v30;
  v15 = v31;
  LOBYTE(self) = v32;
  v22[0] = v24;
  v22[1] = v25;
  v22[2] = v26;
  v22[3] = v27;
  v22[4] = v28;
  v22[5] = v29;
  v22[6] = v30;
  v22[7] = v31;
  v16 = *MEMORY[0x1E4FBC8C8] & (uint64_t)v21->super.isa;
  v23 = v32;
  (*(void (**)(void *, uint64_t, uint64_t))(v16 + 296))(v22, v20, v19);
  sub_1A67E9768(v9, v10, v11, v12, v13, v17, v14, v15, (char)self);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();

  swift_bridgeObjectRelease();
}

@end