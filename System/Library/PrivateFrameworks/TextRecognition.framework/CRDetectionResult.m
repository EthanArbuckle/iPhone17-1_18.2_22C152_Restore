@interface CRDetectionResult
- (CRDetectionResult)initWithLines:(id)a3;
- (NSArray)lines;
- (NSArray)pyramidPreIntraScaleNMSTextFeatures;
- (NSMutableArray)pyramidScaleName;
- (NSMutableArray)pyramidScaleSize;
- (const)tableRegions;
- (id).cxx_construct;
- (void)setPyramidPreIntraScaleNMSTextFeatures:(id)a3;
- (void)setPyramidScaleName:(id)a3;
- (void)setPyramidScaleSize:(id)a3;
- (void)setTableRegions:(const void *)a3;
@end

@implementation CRDetectionResult

- (CRDetectionResult)initWithLines:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRDetectionResult;
  v6 = [(CRDetectionResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lines, a3);
  }

  return v7;
}

- (void)setTableRegions:(const void *)a3
{
  p_tableRegions = &self->_tableRegions;
  if (&self->_tableRegions != a3)
  {
    v6 = *(void ***)a3;
    id v5 = (void **)*((void *)a3 + 1);
    uint64_t v7 = (uint64_t)v5 - *(void *)a3;
    unint64_t v8 = v7 >> 3;
    begin = self->_tableRegions.__begin_;
    if (v7 >> 3 <= (unint64_t)(((char *)self->_tableRegions.var1.__value_ - (char *)begin) >> 3))
    {
      unint64_t v15 = self->_tableRegions.var0 - begin;
      if (v15 >= v8)
      {
        v20 = (__end_cap_ **)std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CRNormalizedQuad * {__strong}*,CRNormalizedQuad * {__strong}*,CRNormalizedQuad * {__strong}*>(v6, v5, (id *)begin);
        for (i = self->_tableRegions.var0; i != v20; --i)
        {
          v22 = *(i - 1);
        }
        self->_tableRegions.var0 = v20;
      }
      else
      {
        v16 = &v6[v15];
        std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CRNormalizedQuad * {__strong}*,CRNormalizedQuad * {__strong}*,CRNormalizedQuad * {__strong}*>(v6, v16, (id *)begin);
        var0 = self->_tableRegions.var0;
        if (v16 != v5)
        {
          v18 = self->_tableRegions.var0;
          do
          {
            v19 = *v16++;
            *v18++ = (__end_cap_ *)v19;
            ++var0;
          }
          while (v16 != v5);
        }
        self->_tableRegions.var0 = var0;
      }
    }
    else
    {
      std::vector<CRNormalizedQuad * {__strong}>::__vdeallocate((void **)&self->_tableRegions.__begin_);
      if (v7 < 0) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      int64_t v10 = (char *)self->_tableRegions.var1.__value_ - (char *)self->_tableRegions.__begin_;
      uint64_t v11 = v10 >> 2;
      if (v10 >> 2 <= v8) {
        uint64_t v11 = v7 >> 3;
      }
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v11;
      }
      std::vector<unsigned long>::__vallocate[abi:ne180100](p_tableRegions, v12);
      v13 = self->_tableRegions.var0;
      while (v6 != v5)
      {
        v14 = *v6++;
        *v13++ = (__end_cap_ *)v14;
      }
      self->_tableRegions.var0 = v13;
    }
  }
}

- (const)tableRegions
{
  return &self->_tableRegions;
}

- (NSArray)lines
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)pyramidPreIntraScaleNMSTextFeatures
{
  return self->_pyramidPreIntraScaleNMSTextFeatures;
}

- (void)setPyramidPreIntraScaleNMSTextFeatures:(id)a3
{
}

- (NSMutableArray)pyramidScaleSize
{
  return self->_pyramidScaleSize;
}

- (void)setPyramidScaleSize:(id)a3
{
}

- (NSMutableArray)pyramidScaleName
{
  return self->_pyramidScaleName;
}

- (void)setPyramidScaleName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pyramidScaleName, 0);
  objc_storeStrong((id *)&self->_pyramidScaleSize, 0);
  objc_storeStrong((id *)&self->_pyramidPreIntraScaleNMSTextFeatures, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  p_tableRegions = &self->_tableRegions;
  std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_tableRegions);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end