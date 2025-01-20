@interface AudioUnitFactory
- (_TtC8SiriAUSP16AudioUnitFactory)init;
- (id)createAudioUnitWithComponentDescription:(AudioComponentDescription *)a3 error:(id *)a4;
- (void)beginRequestWithExtensionContext:(id)a3;
@end

@implementation AudioUnitFactory

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context) = (Class)a3;
  id v3 = a3;
}

- (id)createAudioUnitWithComponentDescription:(AudioComponentDescription *)a3 error:(id *)a4
{
  sub_100003918();
  v5 = self;
  uint64_t v6 = sub_100003908();
  uint64_t v7 = OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit;
  v8 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit) = (Class)v6;

  v10 = *(Class *)((char *)&v5->super.isa + v7);
  if (v10)
  {
    id v11 = v10;

    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC8SiriAUSP16AudioUnitFactory)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return [(AudioUnitFactory *)&v3 init];
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context);
}

@end