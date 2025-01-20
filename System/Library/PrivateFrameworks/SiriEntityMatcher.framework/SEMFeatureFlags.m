@interface SEMFeatureFlags
+ (BOOL)isMediaTypeThresholdEnabled;
@end

@implementation SEMFeatureFlags

+ (BOOL)isMediaTypeThresholdEnabled
{
  return MEMORY[0x270ED8070]("SiriInference", "sem_media_type_threshold");
}

@end