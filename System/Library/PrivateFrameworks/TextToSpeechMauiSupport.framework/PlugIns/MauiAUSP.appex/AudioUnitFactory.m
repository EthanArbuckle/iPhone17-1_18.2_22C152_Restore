@interface AudioUnitFactory
- (_TtC8MauiAUSP16AudioUnitFactory)init;
- (id)createAudioUnitWithComponentDescription:(AudioComponentDescription *)a3 error:(id *)a4;
@end

@implementation AudioUnitFactory

- (id)createAudioUnitWithComponentDescription:(AudioComponentDescription *)a3 error:(id *)a4
{
  unint64_t v4 = *(void *)&a3->componentType;
  unint64_t v5 = *(void *)&a3->componentManufacturer;
  UInt32 componentFlagsMask = a3->componentFlagsMask;
  v7 = self;
  id v8 = (id)sub_1000036B8(v4, v5, componentFlagsMask);

  return v8;
}

- (_TtC8MauiAUSP16AudioUnitFactory)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_auAudioUnit) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_observation) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return [(AudioUnitFactory *)&v3 init];
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_observation);
}

@end