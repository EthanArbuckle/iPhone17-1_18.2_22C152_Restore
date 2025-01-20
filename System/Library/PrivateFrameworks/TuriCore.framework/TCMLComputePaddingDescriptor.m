@interface TCMLComputePaddingDescriptor
+ (id)paddingDescriptorWithPaddingSize:(unint64_t)a3;
@end

@implementation TCMLComputePaddingDescriptor

+ (id)paddingDescriptorWithPaddingSize:(unint64_t)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v14[0] = v5;
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  v14[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  v13[0] = v8;
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  v13[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v11 = [a1 descriptorWithKernelSizes:&unk_26D796B18 inputFeatureChannelCount:1 outputFeatureChannelCount:1 strides:v7 paddingPolicy:0 paddingSizes:v10];

  return v11;
}

@end