@interface TCMPSEncodingDescriptor
- (TCMPSConvolutionDescriptor)conv;
- (TCMPSEncodingDescriptor)init;
- (TCMPSInstanceNormalizationDescriptor)inst;
- (void)setConv:(id)a3;
- (void)setInst:(id)a3;
@end

@implementation TCMPSEncodingDescriptor

- (TCMPSEncodingDescriptor)init
{
  v8.receiver = self;
  v8.super_class = (Class)TCMPSEncodingDescriptor;
  v2 = [(TCMPSEncodingDescriptor *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv = v2->_conv;
    v2->_conv = v3;

    v5 = objc_alloc_init(TCMPSInstanceNormalizationDescriptor);
    inst = v2->_inst;
    v2->_inst = v5;
  }
  return v2;
}

- (TCMPSConvolutionDescriptor)conv
{
  return self->_conv;
}

- (void)setConv:(id)a3
{
}

- (TCMPSInstanceNormalizationDescriptor)inst
{
  return self->_inst;
}

- (void)setInst:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inst, 0);
  objc_storeStrong((id *)&self->_conv, 0);
}

@end