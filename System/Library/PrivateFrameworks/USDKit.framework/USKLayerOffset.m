@interface USKLayerOffset
- (BOOL)isEqual:(id)a3;
- (SdfLayerOffset)sdfLayerOffset;
- (USKLayerOffset)init;
- (USKLayerOffset)initWithOffset:(double)a3 scale:(double)a4;
- (USKLayerOffset)initWithSdfLayerOffset:(SdfLayerOffset)a3;
- (double)offset;
- (double)scale;
- (id).cxx_construct;
- (unint64_t)hash;
- (void)setOffset:(double)a3;
- (void)setScale:(double)a3;
@end

@implementation USKLayerOffset

- (double)offset
{
  return self->_layerOffset._offset;
}

- (SdfLayerOffset)sdfLayerOffset
{
  double offset = self->_layerOffset._offset;
  double scale = self->_layerOffset._scale;
  result._double scale = scale;
  result._double offset = offset;
  return result;
}

- (USKLayerOffset)init
{
  v6.receiver = self;
  v6.super_class = (Class)USKLayerOffset;
  v2 = [(USKLayerOffset *)&v6 init];
  if (v2)
  {
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)&v5, 0.0, 1.0);
    *(_OWORD *)(v2 + 8) = v5;
    v3 = v2;
  }

  return (USKLayerOffset *)v2;
}

- (USKLayerOffset)initWithSdfLayerOffset:(SdfLayerOffset)a3
{
  double scale = a3._scale;
  double offset = a3._offset;
  v9.receiver = self;
  v9.super_class = (Class)USKLayerOffset;
  long long v5 = [(USKLayerOffset *)&v9 init];
  objc_super v6 = v5;
  if (v5)
  {
    v5->_layerOffset._double offset = offset;
    v5->_layerOffset._double scale = scale;
    v7 = v5;
  }

  return v6;
}

- (USKLayerOffset)initWithOffset:(double)a3 scale:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)USKLayerOffset;
  objc_super v6 = [(USKLayerOffset *)&v10 init];
  if (v6)
  {
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)&v9, a3, a4);
    *(_OWORD *)(v6 + 8) = v9;
    v7 = v6;
  }

  return (USKLayerOffset *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (USKLayerOffset *)a3;
  long long v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_sdfLayerOffset(v5, v6, v7, v8);
    char v9 = pxrInternal__aapl__pxrReserved__::SdfLayerOffset::operator==();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return MEMORY[0x270FA45A8](&self->_layerOffset, a2);
}

- (void)setOffset:(double)a3
{
  self->_double offset = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (id).cxx_construct
{
  return self;
}

@end