@interface _REWidthFeatureTransformer
- (BOOL)_validateWithFeatures:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_REWidthFeatureTransformer)initWithWidth:(unint64_t)a3 shift:(unint64_t)a4;
- (int64_t)_bitCount;
- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4;
- (unint64_t)_featureCount;
- (unint64_t)_outputType;
- (unint64_t)hash;
@end

@implementation _REWidthFeatureTransformer

- (BOOL)isEqual:(id)a3
{
  v4 = (_REWidthFeatureTransformer *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_width == v4->_width && self->_shift == v4->_shift;
  }

  return v5;
}

- (int64_t)_bitCount
{
  return self->_width;
}

- (unint64_t)_outputType
{
  return 1;
}

- (unint64_t)hash
{
  return self->_width ^ (self->_shift << 8);
}

- (_REWidthFeatureTransformer)initWithWidth:(unint64_t)a3 shift:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_REWidthFeatureTransformer;
  v6 = [(REFeatureTransformer *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_unint64_t width = a3;
    v6->_shift = a4;
    unint64_t width = v6->_width;
    uint64_t v9 = -1;
    if (width <= 0x3F) {
      uint64_t v9 = ~(-1 << width);
    }
    v6->_mask = v9;
    if (a4) {
      objc_msgSend(NSString, "stringWithFormat:", @"Mask%luShift%lu", width, a4);
    }
    else {
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"Mask%lu", width, v12);
    }
    [(REFeatureTransformer *)v7 setName:v10];
  }
  return v7;
}

- (BOOL)_validateWithFeatures:(id)a3
{
  v3 = [a3 firstObject];
  uint64_t v4 = [v3 featureType];

  return (unint64_t)(v4 - 1) < 2;
}

- (unint64_t)_featureCount
{
  return 1;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  unint64_t v4 = self->_mask & ((unint64_t)REIntegerValueForTaggedPointer(*a3) >> self->_shift);
  return RECreateIntegerFeatureValueTaggedPointer(v4);
}

@end