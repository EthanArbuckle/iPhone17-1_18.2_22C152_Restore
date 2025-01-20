@interface TCMPSVgg16Block2Descriptor
- (TCMPSConvolutionDescriptor)conv1;
- (TCMPSConvolutionDescriptor)conv2;
- (TCMPSConvolutionDescriptor)conv3;
- (TCMPSPoolingDescriptor)pooling;
- (TCMPSVgg16Block2Descriptor)init;
- (void)setConv1:(id)a3;
- (void)setConv2:(id)a3;
- (void)setConv3:(id)a3;
- (void)setPooling:(id)a3;
@end

@implementation TCMPSVgg16Block2Descriptor

- (TCMPSVgg16Block2Descriptor)init
{
  v12.receiver = self;
  v12.super_class = (Class)TCMPSVgg16Block2Descriptor;
  v2 = [(TCMPSVgg16Block2Descriptor *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv1 = v2->_conv1;
    v2->_conv1 = v3;

    v5 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv2 = v2->_conv2;
    v2->_conv2 = v5;

    v7 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv3 = v2->_conv3;
    v2->_conv3 = v7;

    v9 = objc_alloc_init(TCMPSPoolingDescriptor);
    pooling = v2->_pooling;
    v2->_pooling = v9;
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

- (TCMPSConvolutionDescriptor)conv3
{
  return self->_conv3;
}

- (void)setConv3:(id)a3
{
}

- (TCMPSPoolingDescriptor)pooling
{
  return self->_pooling;
}

- (void)setPooling:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pooling, 0);
  objc_storeStrong((id *)&self->_conv3, 0);
  objc_storeStrong((id *)&self->_conv2, 0);
  objc_storeStrong((id *)&self->_conv1, 0);
}

@end