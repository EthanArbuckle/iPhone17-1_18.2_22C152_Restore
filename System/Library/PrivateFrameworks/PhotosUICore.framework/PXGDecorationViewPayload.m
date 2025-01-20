@interface PXGDecorationViewPayload
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSeparateViewLayers;
- (PXGDecorationViewPayload)initWithDecorationOptions:(unint64_t)a3 viewClass:(Class)a4 userData:(id)a5;
- (int64_t)decorationOptions;
- (unint64_t)hash;
@end

@implementation PXGDecorationViewPayload

- (int64_t)decorationOptions
{
  return self->_decorationOptions;
}

- (BOOL)shouldSeparateViewLayers
{
  v6.receiver = self;
  v6.super_class = (Class)PXGDecorationViewPayload;
  BOOL v3 = [(PXGViewPayload *)&v6 shouldSeparateViewLayers];
  if (v3)
  {
    v4 = [(PXGViewPayload *)self viewClass];
    LOBYTE(v3) = v4 != (objc_class *)objc_opt_class();
  }
  return v3;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)PXGDecorationViewPayload;
  unint64_t v3 = [(PXGViewPayload *)&v5 hash];
  return v3 ^ (4 * [(PXGDecorationViewPayload *)self decorationOptions]);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXGDecorationViewPayload *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXGDecorationViewPayload;
    if ([(PXGViewPayload *)&v8 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v5 = [(PXGDecorationViewPayload *)v4 decorationOptions];
      BOOL v6 = v5 == [(PXGDecorationViewPayload *)self decorationOptions];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (PXGDecorationViewPayload)initWithDecorationOptions:(unint64_t)a3 viewClass:(Class)a4 userData:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PXGDecorationViewPayload;
  result = [(PXGViewPayload *)&v7 initWithViewClass:a4 userData:a5];
  if (result) {
    result->_decorationOptions = a3;
  }
  return result;
}

@end