@interface PXYearsLayoutMetrics
- (BOOL)isEqual:(id)a3;
- (PXYearsLayoutMetrics)init;
- (UIEdgeInsets)padding;
- (double)defaultItemAspectRatio;
- (double)interitemSpacing;
- (double)multiColumnAspectRatio;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)orientation;
- (int64_t)sizeClass;
- (unint64_t)hash;
- (unint64_t)layoutStyle;
- (void)setDefaultItemAspectRatio:(double)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setLayoutStyle:(unint64_t)a3;
- (void)setMultiColumnAspectRatio:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSizeClass:(int64_t)a3;
@end

@implementation PXYearsLayoutMetrics

- (void)setSizeClass:(int64_t)a3
{
  self->_sizeClass = a3;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setMultiColumnAspectRatio:(double)a3
{
  self->_multiColumnAspectRatio = a3;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (void)setDefaultItemAspectRatio:(double)a3
{
  self->_defaultItemAspectRatio = a3;
}

- (PXYearsLayoutMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXYearsLayoutMetrics;
  result = [(PXYearsLayoutMetrics *)&v3 init];
  if (result)
  {
    result->_defaultItemAspectRatio = 1.0;
    result->_multiColumnAspectRatio = 1.0;
  }
  return result;
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)multiColumnAspectRatio
{
  return self->_multiColumnAspectRatio;
}

- (double)defaultItemAspectRatio
{
  return self->_defaultItemAspectRatio;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (int64_t)sizeClass
{
  return self->_sizeClass;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXYearsLayoutMetrics *)a3;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v19.receiver = self;
      v19.super_class = (Class)PXYearsLayoutMetrics;
      if ([(PXLayoutMetrics *)&v19 isEqual:v5])
      {
        uint64_t v6 = [(PXYearsLayoutMetrics *)v5 sizeClass];
        if (v6 == [(PXYearsLayoutMetrics *)self sizeClass])
        {
          uint64_t v7 = [(PXYearsLayoutMetrics *)v5 orientation];
          if (v7 == [(PXYearsLayoutMetrics *)self orientation])
          {
            [(PXYearsLayoutMetrics *)v5 interitemSpacing];
            double v9 = v8;
            [(PXYearsLayoutMetrics *)self interitemSpacing];
            if (v9 == v10)
            {
              [(PXYearsLayoutMetrics *)v5 defaultItemAspectRatio];
              double v12 = v11;
              [(PXYearsLayoutMetrics *)self defaultItemAspectRatio];
              if (v12 == v13)
              {
                [(PXYearsLayoutMetrics *)v5 multiColumnAspectRatio];
                double v15 = v14;
                [(PXYearsLayoutMetrics *)self multiColumnAspectRatio];
                if (v15 == v16)
                {
                  [(PXYearsLayoutMetrics *)v5 padding];
                  [(PXYearsLayoutMetrics *)self padding];
                  PXEdgeInsetsEqualToEdgeInsets();
                }
              }
            }
          }
        }
      }
      BOOL v17 = 0;
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)PXYearsLayoutMetrics;
  unint64_t v3 = [(PXLayoutMetrics *)&v6 hash];
  int64_t v4 = v3 ^ (2 * [(PXYearsLayoutMetrics *)self sizeClass]);
  return v4 ^ (4 * [(PXYearsLayoutMetrics *)self orientation]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXYearsLayoutMetrics;
  id result = [(PXLayoutMetrics *)&v6 copyWithZone:a3];
  *((void *)result + 3) = self->_sizeClass;
  *((void *)result + 4) = self->_orientation;
  *((void *)result + 5) = *(void *)&self->_interitemSpacing;
  *((void *)result + 6) = *(void *)&self->_defaultItemAspectRatio;
  *((void *)result + 7) = *(void *)&self->_multiColumnAspectRatio;
  long long v5 = *(_OWORD *)&self->_padding.bottom;
  *(_OWORD *)((char *)result + 72) = *(_OWORD *)&self->_padding.top;
  *(_OWORD *)((char *)result + 88) = v5;
  *((void *)result + 8) = self->_layoutStyle;
  return result;
}

@end