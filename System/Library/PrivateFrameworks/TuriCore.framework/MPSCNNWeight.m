@interface MPSCNNWeight
- (BOOL)load;
- (MPSCNNWeight)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 strideInPixelsX:(unint64_t)a7 strideInPixelsY:(unint64_t)a8 neuronType:(int)a9 neuronA:(float)a10 neuronB:(float)a11;
- (float)biasTerms;
- (id).cxx_construct;
- (id)descriptor;
- (id)label;
- (unint64_t)biasSize;
- (unint64_t)weightSize;
- (unsigned)dataType;
- (void)dealloc;
- (void)weights;
@end

@implementation MPSCNNWeight

- (MPSCNNWeight)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 strideInPixelsX:(unint64_t)a7 strideInPixelsY:(unint64_t)a8 neuronType:(int)a9 neuronA:(float)a10 neuronB:(float)a11
{
  v30.receiver = self;
  v30.super_class = (Class)MPSCNNWeight;
  v19 = [(MPSCNNWeight *)&v30 init];
  if (v19)
  {
    uint64_t v20 = [MEMORY[0x263F13118] cnnConvolutionDescriptorWithKernelWidth:a3 kernelHeight:a4 inputFeatureChannels:a5 outputFeatureChannels:a6];
    desc = v19->_desc;
    v19->_desc = (MPSCNNConvolutionDescriptor *)v20;

    *(float *)&double v22 = a10;
    *(float *)&double v23 = a11;
    [(MPSCNNConvolutionDescriptor *)v19->_desc setNeuronType:a9 parameterA:v22 parameterB:v23];
    [(MPSCNNConvolutionDescriptor *)v19->_desc setStrideInPixelsX:a7];
    [(MPSCNNConvolutionDescriptor *)v19->_desc setStrideInPixelsY:a8];
    std::vector<float>::resize((uint64_t)&v19->_bias, a6);
    int v24 = a4 * a3 * a5 * a6;
    std::vector<float>::resize((uint64_t)&v19->_weight, v24);
    if (v24 >= 1) {
      bzero(v19->_weight.__begin_, 4 * v24);
    }
    begin = v19->_bias.__begin_;
    uint64_t v26 = (char *)v19->_bias.__end_ - (char *)begin;
    if (v26)
    {
      unint64_t v27 = v26 >> 2;
      if (v27 <= 1) {
        unint64_t v27 = 1;
      }
      bzero(begin, 4 * v27);
    }
    v28 = v19;
  }

  return v19;
}

- (unsigned)dataType
{
  return 268435488;
}

- (id)descriptor
{
  return self->_desc;
}

- (void)weights
{
  return self->_weight.__begin_;
}

- (float)biasTerms
{
  if (self->_bias.__end_ == self->_bias.__begin_) {
    return 0;
  }
  else {
    return self->_bias.__begin_;
  }
}

- (unint64_t)weightSize
{
  return self->_weight.__end_ - self->_weight.__begin_;
}

- (unint64_t)biasSize
{
  return self->_bias.__end_ - self->_bias.__begin_;
}

- (BOOL)load
{
  return 1;
}

- (id)label
{
  return @"MPSCNNWeight";
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MPSCNNWeight;
  [(MPSCNNWeight *)&v2 dealloc];
}

- (void).cxx_destruct
{
  begin = self->_bias.__begin_;
  if (begin)
  {
    self->_bias.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_weight.__begin_;
  if (v4)
  {
    self->_weight.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_desc, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end