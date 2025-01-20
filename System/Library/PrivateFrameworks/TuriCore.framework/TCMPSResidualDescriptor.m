@interface TCMPSResidualDescriptor
- (TCMPSConvolutionDescriptor)conv1;
- (TCMPSConvolutionDescriptor)conv2;
- (TCMPSInstanceNormalizationDescriptor)inst1;
- (TCMPSInstanceNormalizationDescriptor)inst2;
- (TCMPSResidualDescriptor)init;
- (void)setConv1:(id)a3;
- (void)setConv2:(id)a3;
- (void)setInst1:(id)a3;
- (void)setInst2:(id)a3;
@end

@implementation TCMPSResidualDescriptor

- (TCMPSResidualDescriptor)init
{
  v12.receiver = self;
  v12.super_class = (Class)TCMPSResidualDescriptor;
  v2 = [(TCMPSResidualDescriptor *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv1 = v2->_conv1;
    v2->_conv1 = v3;

    v5 = objc_alloc_init(TCMPSInstanceNormalizationDescriptor);
    inst1 = v2->_inst1;
    v2->_inst1 = v5;

    v7 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv2 = v2->_conv2;
    v2->_conv2 = v7;

    v9 = objc_alloc_init(TCMPSInstanceNormalizationDescriptor);
    inst2 = v2->_inst2;
    v2->_inst2 = v9;
  }
  return v2;
}

- (TCMPSConvolutionDescriptor)conv1
{
  return self->_conv1;
}

- (void)setConv1:(id)a3
{
}

- (TCMPSConvolutionDescriptor)conv2
{
  return self->_conv2;
}

- (void)setConv2:(id)a3
{
}

- (TCMPSInstanceNormalizationDescriptor)inst1
{
  return self->_inst1;
}

- (void)setInst1:(id)a3
{
}

- (TCMPSInstanceNormalizationDescriptor)inst2
{
  return self->_inst2;
}

- (void)setInst2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inst2, 0);
  objc_storeStrong((id *)&self->_inst1, 0);
  objc_storeStrong((id *)&self->_conv2, 0);
  objc_storeStrong((id *)&self->_conv1, 0);
}

@end