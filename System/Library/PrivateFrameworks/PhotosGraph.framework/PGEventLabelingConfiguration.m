@interface PGEventLabelingConfiguration
+ (BOOL)isEventLabelingEnabled;
+ (BOOL)usePrimaryMeaningDomainForEventLabelingMeanings;
+ (NSString)bundlePath;
- (BOOL)useEventLabelingToInferWithMeaningLabel:(id)a3;
- (NSSet)meaningLabels;
- (PGEventLabelingConfiguration)init;
- (id)thresholdsBy:(id)a3;
- (int64_t)modelVersion;
@end

@implementation PGEventLabelingConfiguration

- (int64_t)modelVersion
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___PGEventLabelingConfiguration_modelVersion);
}

- (NSSet)meaningLabels
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D1EBE420();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (PGEventLabelingConfiguration)init
{
  return (PGEventLabelingConfiguration *)EventLabelingConfiguration.init()();
}

- (id)thresholdsBy:(id)a3
{
  uint64_t v4 = sub_1D1EBDE60();
  uint64_t v6 = v5;
  v7 = self;
  v8 = EventLabelingConfiguration.thresholds(by:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (BOOL)useEventLabelingToInferWithMeaningLabel:(id)a3
{
  uint64_t v4 = sub_1D1EBDE60();
  uint64_t v6 = v5;
  v12 = &type metadata for PhotosFeatureFlags;
  unint64_t v13 = sub_1D1AAB8D4();
  v7 = self;
  char v8 = sub_1D1EBCCA0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  if ((v8 & 1) != 0 && PFOSVariantHasInternalDiagnostics()) {
    char v9 = sub_1D18623E8(v4, v6, *(uint64_t *)((char *)&v7->super.isa + OBJC_IVAR___PGEventLabelingConfiguration_meaningLabels));
  }
  else {
    char v9 = 0;
  }

  swift_bridgeObjectRelease();
  return v9 & 1;
}

+ (BOOL)isEventLabelingEnabled
{
  uint64_t v5 = &type metadata for PhotosFeatureFlags;
  unint64_t v6 = sub_1D1AAB8D4();
  char v2 = sub_1D1EBCCA0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  if (v2) {
    return PFOSVariantHasInternalDiagnostics();
  }
  else {
    return 0;
  }
}

+ (BOOL)usePrimaryMeaningDomainForEventLabelingMeanings
{
  char v2 = self;
  return objc_msgSend(v2, sel_useMeaningEdgeForEventLabelingAlgorithm);
}

+ (NSString)bundlePath
{
  _s11PhotosGraph26EventLabelingConfigurationC10bundlePathSSSgvgZ_0();
  if (v2)
  {
    v3 = (void *)sub_1D1EBDE30();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end