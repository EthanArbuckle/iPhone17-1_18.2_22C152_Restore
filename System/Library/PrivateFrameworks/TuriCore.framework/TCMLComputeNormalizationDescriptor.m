@interface TCMLComputeNormalizationDescriptor
+ (id)normalizationDescriptorWithInputFeatureChannels:(unint64_t)a3;
@end

@implementation TCMLComputeNormalizationDescriptor

+ (id)normalizationDescriptorWithInputFeatureChannels:(unint64_t)a3
{
  return (id)[a1 descriptorWithKernelWidth:1 kernelHeight:1 inputFeatureChannelCount:a3 outputFeatureChannelCount:1];
}

@end