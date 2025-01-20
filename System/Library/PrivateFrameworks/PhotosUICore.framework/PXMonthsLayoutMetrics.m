@interface PXMonthsLayoutMetrics
- (BOOL)displaceTopLeadingCardTitle;
- (BOOL)isEqual:(id)a3;
- (PXMonthsLayoutMetrics)init;
- (UIEdgeInsets)chapterHeaderPadding;
- (UIEdgeInsets)padding;
- (double)chapterHeaderHeight;
- (double)defaultSectionAspectRatio;
- (double)interitemSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)orientation;
- (int64_t)sizeClass;
- (unint64_t)hash;
- (unint64_t)layoutStyle;
- (void)setChapterHeaderHeight:(double)a3;
- (void)setChapterHeaderPadding:(UIEdgeInsets)a3;
- (void)setDefaultSectionAspectRatio:(double)a3;
- (void)setDisplaceTopLeadingCardTitle:(BOOL)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setLayoutStyle:(unint64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSizeClass:(int64_t)a3;
@end

@implementation PXMonthsLayoutMetrics

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

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (void)setDisplaceTopLeadingCardTitle:(BOOL)a3
{
  self->_displaceTopLeadingCardTitle = a3;
}

- (void)setDefaultSectionAspectRatio:(double)a3
{
  self->_defaultSectionAspectRatio = a3;
}

- (void)setChapterHeaderPadding:(UIEdgeInsets)a3
{
  self->_chapterHeaderPadding = a3;
}

- (void)setChapterHeaderHeight:(double)a3
{
  self->_chapterHeaderHeight = a3;
}

- (PXMonthsLayoutMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXMonthsLayoutMetrics;
  result = [(PXMonthsLayoutMetrics *)&v3 init];
  if (result)
  {
    result->_defaultSectionAspectRatio = 1.0;
    result->_chapterHeaderHeight = 50.0;
    result->_displaceTopLeadingCardTitle = 0;
  }
  return result;
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)displaceTopLeadingCardTitle
{
  return self->_displaceTopLeadingCardTitle;
}

- (UIEdgeInsets)chapterHeaderPadding
{
  double top = self->_chapterHeaderPadding.top;
  double left = self->_chapterHeaderPadding.left;
  double bottom = self->_chapterHeaderPadding.bottom;
  double right = self->_chapterHeaderPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)chapterHeaderHeight
{
  return self->_chapterHeaderHeight;
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

- (double)defaultSectionAspectRatio
{
  return self->_defaultSectionAspectRatio;
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
  v4 = (PXMonthsLayoutMetrics *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v16.receiver = self;
      v16.super_class = (Class)PXMonthsLayoutMetrics;
      if ([(PXLayoutMetrics *)&v16 isEqual:v5])
      {
        uint64_t v6 = [(PXMonthsLayoutMetrics *)v5 sizeClass];
        if (v6 == [(PXMonthsLayoutMetrics *)self sizeClass])
        {
          uint64_t v7 = [(PXMonthsLayoutMetrics *)v5 orientation];
          if (v7 == [(PXMonthsLayoutMetrics *)self orientation])
          {
            [(PXMonthsLayoutMetrics *)v5 interitemSpacing];
            double v9 = v8;
            [(PXMonthsLayoutMetrics *)self interitemSpacing];
            if (v9 == v10)
            {
              [(PXMonthsLayoutMetrics *)v5 defaultSectionAspectRatio];
              double v12 = v11;
              [(PXMonthsLayoutMetrics *)self defaultSectionAspectRatio];
              if (v12 == v13)
              {
                [(PXMonthsLayoutMetrics *)v5 padding];
                [(PXMonthsLayoutMetrics *)self padding];
                PXEdgeInsetsEqualToEdgeInsets();
              }
            }
          }
        }
      }
      BOOL v14 = 0;
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)PXMonthsLayoutMetrics;
  unint64_t v3 = [(PXLayoutMetrics *)&v6 hash];
  int64_t v4 = v3 ^ (2 * [(PXMonthsLayoutMetrics *)self sizeClass]);
  return v4 ^ (4 * [(PXMonthsLayoutMetrics *)self orientation]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXMonthsLayoutMetrics;
  id result = [(PXLayoutMetrics *)&v7 copyWithZone:a3];
  *((void *)result + 4) = self->_sizeClass;
  *((void *)result + 5) = self->_orientation;
  *((void *)result + 6) = *(void *)&self->_interitemSpacing;
  *((void *)result + 7) = *(void *)&self->_defaultSectionAspectRatio;
  long long v5 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)result + 5) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)result + 6) = v5;
  *((void *)result + 8) = *(void *)&self->_chapterHeaderHeight;
  long long v6 = *(_OWORD *)&self->_chapterHeaderPadding.bottom;
  *((_OWORD *)result + 7) = *(_OWORD *)&self->_chapterHeaderPadding.top;
  *((_OWORD *)result + 8) = v6;
  *((unsigned char *)result + 24) = self->_displaceTopLeadingCardTitle;
  *((void *)result + 9) = self->_layoutStyle;
  return result;
}

@end