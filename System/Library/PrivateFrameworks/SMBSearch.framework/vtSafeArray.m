@interface vtSafeArray
- (NSArray)vData;
- (safeArrayBound)rgsBoundArr;
- (unsigned)cDims;
- (unsigned)cbElementSize;
- (unsigned)fFeatures;
- (void)setCDims:(unsigned __int16)a3;
- (void)setCbElementSize:(unsigned int)a3;
- (void)setFFeatures:(unsigned __int16)a3;
- (void)setRgsBoundArr:(id)a3;
- (void)setVData:(id)a3;
- (vtSafeArray)initWithArray:(id)a3 ElementSize:(unsigned int)a4;
@end

@implementation vtSafeArray

- (vtSafeArray)initWithArray:(id)a3 ElementSize:(unsigned int)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)vtSafeArray;
  v7 = [(vtSafeArray *)&v12 init];
  v8 = v7;
  if (v7)
  {
    *(_DWORD *)&v7->_cDims = 1;
    v7->_cbElementSize = a4;
    v9 = -[safeArrayBound initWithElements:LowBound:]([safeArrayBound alloc], "initWithElements:LowBound:", [v6 count], 0);
    rgsBoundArr = v8->_rgsBoundArr;
    v8->_rgsBoundArr = v9;

    if (v8->_rgsBoundArr)
    {
      [(vtSafeArray *)v8 setVData:v6];
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (unsigned)cDims
{
  return self->_cDims;
}

- (void)setCDims:(unsigned __int16)a3
{
  self->_cDims = a3;
}

- (unsigned)fFeatures
{
  return self->_fFeatures;
}

- (void)setFFeatures:(unsigned __int16)a3
{
  self->_fFeatures = a3;
}

- (unsigned)cbElementSize
{
  return self->_cbElementSize;
}

- (void)setCbElementSize:(unsigned int)a3
{
  self->_cbElementSize = a3;
}

- (safeArrayBound)rgsBoundArr
{
  return (safeArrayBound *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRgsBoundArr:(id)a3
{
}

- (NSArray)vData
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vData, 0);

  objc_storeStrong((id *)&self->_rgsBoundArr, 0);
}

@end