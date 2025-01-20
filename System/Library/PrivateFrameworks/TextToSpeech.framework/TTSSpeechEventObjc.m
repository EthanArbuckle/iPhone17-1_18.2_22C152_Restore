@interface TTSSpeechEventObjc
+ (id)makeWithOtherRewrite:(id)a3 from:(id)a4 to:(id)a5;
+ (id)makeWithStart:(id)a3;
- (_TtC12TextToSpeech18TTSSpeechEventObjc)init;
@end

@implementation TTSSpeechEventObjc

+ (id)makeWithOtherRewrite:(id)a3 from:(id)a4 to:(id)a5
{
  uint64_t v5 = sub_1A6892000();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1A6892000();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1A6892000();
  uint64_t v13 = v12;
  v14 = (objc_class *)type metadata accessor for TTSSpeechEventObjc();
  v15 = (char *)objc_allocWithZone(v14);
  v16 = &v15[OBJC_IVAR____TtC12TextToSpeech18TTSSpeechEventObjc_wrappedEvent];
  *(void *)v16 = v5;
  *((void *)v16 + 1) = v7;
  *((void *)v16 + 2) = v8;
  *((void *)v16 + 3) = v10;
  *((void *)v16 + 4) = v11;
  *((void *)v16 + 5) = v13;
  *((void *)v16 + 6) = 0;
  *((void *)v16 + 7) = 0;
  v16[64] = 3;
  v19.receiver = v15;
  v19.super_class = v14;
  id v17 = objc_msgSendSuper2(&v19, sel_init);

  return v17;
}

+ (id)makeWithStart:(id)a3
{
  uint64_t v3 = sub_1A6892000();
  uint64_t v5 = v4;
  uint64_t v6 = (objc_class *)type metadata accessor for TTSSpeechEventObjc();
  uint64_t v7 = (char *)objc_allocWithZone(v6);
  uint64_t v8 = &v7[OBJC_IVAR____TtC12TextToSpeech18TTSSpeechEventObjc_wrappedEvent];
  *(void *)uint64_t v8 = v3;
  *((void *)v8 + 1) = v5;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  v8[64] = 4;
  v11.receiver = v7;
  v11.super_class = v6;
  id v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

- (_TtC12TextToSpeech18TTSSpeechEventObjc)init
{
  result = (_TtC12TextToSpeech18TTSSpeechEventObjc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC12TextToSpeech18TTSSpeechEventObjc_wrappedEvent;
  sub_1A67E9768(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech18TTSSpeechEventObjc_wrappedEvent), *((void *)v2 + 1), *((void *)v2 + 2), *((void *)v2 + 3), *((void *)v2 + 4), *((void *)v2 + 5), *((void *)v2 + 6), *((void *)v2 + 7), v2[64]);
}

@end