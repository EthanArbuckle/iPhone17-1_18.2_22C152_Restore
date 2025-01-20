@interface NeuralNetworkConfig
- (NSString)description;
- (NSString)modelPath;
- (NeuralNetworkConfig)init;
- (float)logMinimum;
- (float)logThreshold;
- (void)setLogMinimum:(float)a3;
- (void)setLogThreshold:(float)a3;
- (void)setModelPath:(id)a3;
@end

@implementation NeuralNetworkConfig

- (NSString)modelPath
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2614D5378();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setModelPath:(id)a3
{
  uint64_t v4 = sub_2614D53A8();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___NeuralNetworkConfig_modelPath);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (float)logThreshold
{
  v2 = (float *)((char *)self + OBJC_IVAR___NeuralNetworkConfig_logThreshold);
  swift_beginAccess();
  return *v2;
}

- (void)setLogThreshold:(float)a3
{
  uint64_t v4 = (float *)((char *)self + OBJC_IVAR___NeuralNetworkConfig_logThreshold);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (float)logMinimum
{
  v2 = (float *)((char *)self + OBJC_IVAR___NeuralNetworkConfig_logMinimum);
  swift_beginAccess();
  return *v2;
}

- (void)setLogMinimum:(float)a3
{
  uint64_t v4 = (float *)((char *)self + OBJC_IVAR___NeuralNetworkConfig_logMinimum);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NeuralNetworkConfig)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___NeuralNetworkConfig_modelPath);
  void *v2 = 0xD000000000000041;
  v2[1] = 0x80000002614E3C90;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___NeuralNetworkConfig_logThreshold) = -1035468800;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___NeuralNetworkConfig_logMinimum) = -1027080192;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NeuralNetworkConfig();
  return [(NeuralNetworkConfig *)&v4 init];
}

- (NSString)description
{
  uint64_t v3 = sub_2614D5408();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2614D4AE8();
  swift_allocObject();
  objc_super v4 = self;
  sub_2614D4AD8();
  type metadata accessor for NeuralNetworkConfig();
  sub_2614393F8(&qword_26A9155D8, v5, (void (*)(uint64_t))type metadata accessor for NeuralNetworkConfig);
  uint64_t v6 = sub_2614D4AC8();
  unint64_t v8 = v7;
  swift_release();
  sub_2614D53F8();
  sub_2614D53C8();
  if (v9)
  {
    sub_2613C2314(v6, v8);

    v10 = (void *)sub_2614D5378();
    swift_bridgeObjectRelease();
    return (NSString *)v10;
  }
  else
  {
    __break(1u);
    result = (NSString *)swift_unexpectedError();
    __break(1u);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end