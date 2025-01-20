@interface TCMLComputeUpsamplingDescriptor
+ (id)upsamplingDescriptorWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4;
@end

@implementation TCMLComputeUpsamplingDescriptor

+ (id)upsamplingDescriptorWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4
{
  return (id)[a1 descriptorWithKernelWidth:a3 kernelHeight:a4 inputFeatureChannelCount:1 outputFeatureChannelCount:1];
}

@end