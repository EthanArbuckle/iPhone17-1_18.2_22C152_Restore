@interface CRSingleLocaleTextRecognizer
- (CRNeuralTextRecognizer)neuralRecognizer;
- (CRPerformanceStatistics)decodingStats;
- (CRPerformanceStatistics)inferenceStats;
- (CRSingleLocaleTextRecognizer)init;
- (CRSingleLocaleTextRecognizer)initWithConfigurationOptions:(id)a3;
- (CRSingleLocaleTextRecognizer)initWithImageReaderOptions:(id)a3 error:(id *)a4;
- (id)identifierForTextRegion:(id)a3;
- (id)recognizerForIdentifier:(id)a3;
- (void)cancel;
@end

@implementation CRSingleLocaleTextRecognizer

- (CRNeuralTextRecognizer)neuralRecognizer
{
  return (CRNeuralTextRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR___CRSingleLocaleTextRecognizer_neuralRecognizer));
}

- (CRSingleLocaleTextRecognizer)initWithImageReaderOptions:(id)a3 error:(id *)a4
{
  sub_1DD8A7440();
  sub_1DD737E00();
  return result;
}

- (id)recognizerForIdentifier:(id)a3
{
  v3 = [(CRSingleLocaleTextRecognizer *)self neuralRecognizer];
  return v3;
}

- (CRPerformanceStatistics)inferenceStats
{
  return (CRPerformanceStatistics *)sub_1DD738298(self, (uint64_t)a2, (SEL *)&selRef_inferenceStats);
}

- (CRPerformanceStatistics)decodingStats
{
  return (CRPerformanceStatistics *)sub_1DD738298(self, (uint64_t)a2, (SEL *)&selRef_decodingStats);
}

- (id)identifierForTextRegion:(id)a3
{
  v3 = (void *)sub_1DD8A7470();
  return v3;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)CRSingleLocaleTextRecognizer;
  v2 = self;
  [(CRMultiModelTextRecognizer *)&v4 cancel];
  v3 = [(CRSingleLocaleTextRecognizer *)v2 neuralRecognizer];
  [(CRNeuralTextRecognizer *)v3 cancel];
}

- (CRSingleLocaleTextRecognizer)initWithConfigurationOptions:(id)a3
{
  result = (CRSingleLocaleTextRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CRSingleLocaleTextRecognizer)init
{
  result = (CRSingleLocaleTextRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end