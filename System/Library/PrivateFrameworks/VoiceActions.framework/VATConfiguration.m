@interface VATConfiguration
+ (OS_os_log)logger;
- (DecoderConfig)decoder;
- (FeatureExtractorConfig)featureExtractor;
- (NSString)description;
- (NeuralNetworkConfig)neuralNetwork;
- (RuntimeConfig)runtime;
- (SecondPassConfig)secondPass;
- (VATConfiguration)init;
- (VATConfiguration)initWithFilename:(id)a3 error:(id *)a4;
- (void)_replaceModelPathWithCustomModelPathForTestWithPrefix:(id)a3;
- (void)setDecoder:(id)a3;
- (void)setFeatureExtractor:(id)a3;
- (void)setNeuralNetwork:(id)a3;
- (void)setRuntime:(id)a3;
- (void)setSecondPass:(id)a3;
@end

@implementation VATConfiguration

+ (OS_os_log)logger
{
  if (qword_26A919E80 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26A9201A0;
  return (OS_os_log *)v2;
}

- (NeuralNetworkConfig)neuralNetwork
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VATConfiguration_neuralNetwork);
  swift_beginAccess();
  return (NeuralNetworkConfig *)*v2;
}

- (void)setNeuralNetwork:(id)a3
{
}

- (FeatureExtractorConfig)featureExtractor
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VATConfiguration_featureExtractor);
  swift_beginAccess();
  return (FeatureExtractorConfig *)*v2;
}

- (void)setFeatureExtractor:(id)a3
{
}

- (DecoderConfig)decoder
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VATConfiguration_decoder);
  swift_beginAccess();
  return (DecoderConfig *)*v2;
}

- (void)setDecoder:(id)a3
{
}

- (SecondPassConfig)secondPass
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VATConfiguration_secondPass);
  swift_beginAccess();
  return (SecondPassConfig *)*v2;
}

- (void)setSecondPass:(id)a3
{
}

- (RuntimeConfig)runtime
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VATConfiguration_runtime);
  swift_beginAccess();
  return (RuntimeConfig *)*v2;
}

- (void)setRuntime:(id)a3
{
}

- (VATConfiguration)init
{
  return (VATConfiguration *)sub_261443368();
}

- (VATConfiguration)initWithFilename:(id)a3 error:(id *)a4
{
  if (a3)
  {
    uint64_t v4 = sub_2614D53A8();
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
  }
  return (VATConfiguration *)VATConfiguration.init(filename:)(v4, v5);
}

- (void)_replaceModelPathWithCustomModelPathForTestWithPrefix:(id)a3
{
  uint64_t v4 = sub_2614D53A8();
  uint64_t v6 = v5;
  v7 = (void *)MEMORY[0x263F8EED0];
  v8 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x78);
  v9 = self;
  v10 = (void *)v8();
  (*(void (**)(void))((*v7 & *v10) + 0x68))();

  v11 = (void *)v8();
  swift_bridgeObjectRetain();
  sub_2614D54D8();
  swift_bridgeObjectRetain();
  sub_2614D54D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))((*v7 & *v11) + 0x70))(v4, v6);

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  sub_261445068();

  v3 = (void *)sub_2614D5378();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VATConfiguration_runtime);
}

@end