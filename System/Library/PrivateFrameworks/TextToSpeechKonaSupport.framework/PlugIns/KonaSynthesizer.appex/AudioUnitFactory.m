@interface AudioUnitFactory
- (_TtC15KonaSynthesizer16AudioUnitFactory)init;
- (id)createAudioUnitWithComponentDescription:(AudioComponentDescription *)a3 error:(id *)a4;
@end

@implementation AudioUnitFactory

- (id)createAudioUnitWithComponentDescription:(AudioComponentDescription *)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3->componentType;
  uint64_t v6 = *(void *)&a3->componentManufacturer;
  UInt32 componentFlagsMask = a3->componentFlagsMask;
  type metadata accessor for KonaSynthesizerAudioUnit();
  v8 = self;
  v9 = (objc_class *)sub_100003068(v5, v6, componentFlagsMask, 0);
  uint64_t v10 = OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit;
  v11 = *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit) = v9;

  v13 = *(Class *)((char *)&v8->super.isa + v10);
  if (v13)
  {
    id v14 = v13;

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC15KonaSynthesizer16AudioUnitFactory)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return [(AudioUnitFactory *)&v3 init];
}

- (void).cxx_destruct
{
}

@end