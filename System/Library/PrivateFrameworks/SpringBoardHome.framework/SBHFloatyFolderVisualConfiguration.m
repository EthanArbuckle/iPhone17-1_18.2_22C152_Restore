@interface SBHFloatyFolderVisualConfiguration
- (BOOL)isEqual:(id)a3;
- (CGSize)contentBackgroundSize;
- (CGSize)pageControlCustomPadding;
- (NSString)description;
- (SBHFloatyFolderVisualConfiguration)init;
- (double)continuousCornerRadius;
- (double)pageControlAreaHeight;
- (double)rubberBandIntervalForOverscroll;
- (double)titleFontSize;
- (double)titleHorizontalInset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setContentBackgroundSize:(CGSize)a3;
- (void)setContinuousCornerRadius:(double)a3;
- (void)setPageControlAreaHeight:(double)a3;
- (void)setPageControlCustomPadding:(CGSize)a3;
- (void)setRubberBandIntervalForOverscroll:(double)a3;
- (void)setTitleFontSize:(double)a3;
- (void)setTitleHorizontalInset:(double)a3;
@end

@implementation SBHFloatyFolderVisualConfiguration

- (CGSize)pageControlCustomPadding
{
  double width = self->_pageControlCustomPadding.width;
  double height = self->_pageControlCustomPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)contentBackgroundSize
{
  double width = self->_contentBackgroundSize.width;
  double height = self->_contentBackgroundSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)titleHorizontalInset
{
  return self->_titleHorizontalInset;
}

- (double)pageControlAreaHeight
{
  return self->_pageControlAreaHeight;
}

- (double)titleFontSize
{
  return self->_titleFontSize;
}

- (SBHFloatyFolderVisualConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBHFloatyFolderVisualConfiguration;
  v2 = [(SBHFloatyFolderVisualConfiguration *)&v7 init];
  if (v2)
  {
    +[SBFolderBackgroundView folderBackgroundSize];
    v2->_contentBackgroundSize.double width = v3;
    v2->_contentBackgroundSize.double height = v4;
    +[SBFolderBackgroundView cornerRadiusToInsetContent];
    v2->_continuousCornerRadius = v5;
    *(_OWORD *)&v2->_titleFontSize = xmmword_1D81E5180;
    *(_OWORD *)&v2->_pageControlAreaHeight = xmmword_1D81E5190;
    v2->_pageControlCustomPadding = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_OWORD *)result + 3) = self->_contentBackgroundSize;
    *((void *)result + 1) = *(void *)&self->_continuousCornerRadius;
    *((void *)result + 2) = *(void *)&self->_titleFontSize;
    *((void *)result + 3) = *(void *)&self->_titleHorizontalInset;
    *((void *)result + 4) = *(void *)&self->_pageControlAreaHeight;
    *((_OWORD *)result + 4) = self->_pageControlCustomPadding;
    *((void *)result + 5) = *(void *)&self->_rubberBandIntervalForOverscroll;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  CGFloat v4 = (SBHFloatyFolderVisualConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    double v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v7 = v4;
      BOOL v8 = self->_contentBackgroundSize.width == v7[6] && self->_contentBackgroundSize.height == v7[7];
      if (v8
        && self->_continuousCornerRadius == v7[1]
        && self->_titleFontSize == v7[2]
        && self->_titleHorizontalInset == v7[3]
        && self->_pageControlAreaHeight == v7[4])
      {
        BOOL v9 = 0;
        if (self->_pageControlCustomPadding.width == v7[8] && self->_pageControlCustomPadding.height == v7[9]) {
          BOOL v9 = self->_rubberBandIntervalForOverscroll == v7[5];
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_contentBackgroundSize.width
                          + self->_contentBackgroundSize.height
                          + self->_continuousCornerRadius
                          + self->_titleFontSize
                          + self->_titleHorizontalInset
                          + self->_pageControlAreaHeight
                          + self->_pageControlCustomPadding.width
                          + self->_pageControlCustomPadding.height
                          + self->_rubberBandIntervalForOverscroll);
}

- (NSString)description
{
  return (NSString *)[(SBHFloatyFolderVisualConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHFloatyFolderVisualConfiguration *)self succinctDescriptionBuilder];
  CGFloat v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  CGFloat v3 = [(SBHFloatyFolderVisualConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  CGFloat v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  CGFloat v4 = [(SBHFloatyFolderVisualConfiguration *)self succinctDescriptionBuilder];
  [(SBHFloatyFolderVisualConfiguration *)self contentBackgroundSize];
  id v5 = (id)objc_msgSend(v4, "appendSize:withName:", @"contentBackgroundSize");
  [(SBHFloatyFolderVisualConfiguration *)self continuousCornerRadius];
  id v6 = (id)objc_msgSend(v4, "appendFloat:withName:", @"continuousCornerRadius");
  [(SBHFloatyFolderVisualConfiguration *)self titleFontSize];
  id v7 = (id)objc_msgSend(v4, "appendFloat:withName:", @"titleFontSize");
  [(SBHFloatyFolderVisualConfiguration *)self titleHorizontalInset];
  id v8 = (id)objc_msgSend(v4, "appendFloat:withName:", @"titleHorizontalInset");
  [(SBHFloatyFolderVisualConfiguration *)self pageControlAreaHeight];
  id v9 = (id)objc_msgSend(v4, "appendFloat:withName:", @"pageControlAreaHeight");
  [(SBHFloatyFolderVisualConfiguration *)self pageControlCustomPadding];
  v10 = NSStringFromCGSize(v14);
  [v4 appendString:v10 withName:@"pageControlCustomPadding"];

  [(SBHFloatyFolderVisualConfiguration *)self rubberBandIntervalForOverscroll];
  id v11 = (id)objc_msgSend(v4, "appendFloat:withName:", @"rubberBandIntervalForOverscroll");
  return v4;
}

- (void)setContentBackgroundSize:(CGSize)a3
{
  self->_contentBackgroundSize = a3;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (void)setContinuousCornerRadius:(double)a3
{
  self->_continuousCornerRadius = a3;
}

- (void)setTitleFontSize:(double)a3
{
  self->_titleFontSize = a3;
}

- (void)setTitleHorizontalInset:(double)a3
{
  self->_titleHorizontalInset = a3;
}

- (void)setPageControlAreaHeight:(double)a3
{
  self->_pageControlAreaHeight = a3;
}

- (void)setPageControlCustomPadding:(CGSize)a3
{
  self->_pageControlCustomPadding = a3;
}

- (double)rubberBandIntervalForOverscroll
{
  return self->_rubberBandIntervalForOverscroll;
}

- (void)setRubberBandIntervalForOverscroll:(double)a3
{
  self->_rubberBandIntervalForOverscroll = a3;
}

@end