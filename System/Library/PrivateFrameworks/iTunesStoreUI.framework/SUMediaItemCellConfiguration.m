@interface SUMediaItemCellConfiguration
+ (id)copyDefaultContext;
- (BOOL)showContentRating;
- (CGSize)artworkSize;
- (SUMediaItemCellConfiguration)initWithStringCount:(unint64_t)a3 imageCount:(unint64_t)a4;
- (UIEdgeInsets)_ratingBorderInsets;
- (double)alphaForImageAtIndex:(unint64_t)a3 fromAlpha:(double *)a4 withModifiers:(unint64_t)a5;
- (double)alphaForLabelAtIndex:(unint64_t)a3 fromAlpha:(double *)a4 withModifiers:(unint64_t)a5;
- (id)copyImageDataProvider;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (int64_t)mediaIconType;
- (void)drawWithModifiers:(unint64_t)a3;
- (void)reloadImages;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
@end

@implementation SUMediaItemCellConfiguration

- (SUMediaItemCellConfiguration)initWithStringCount:(unint64_t)a3 imageCount:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SUMediaItemCellConfiguration;
  return [(SUArrayCellConfiguration *)&v5 initWithStringCount:a3 + 1 imageCount:a4 + 2];
}

- (CGSize)artworkSize
{
  uint64_t v3 = [self->super.super.super.super._context imageProvider];
  if (v3)
  {
    v4 = (void *)v3;
    [self->super.super.super.super._context artworkWidth];
    double v6 = v5;
    [v4 finalSize];
    if (v6 > 0.00000011920929) {
      double v7 = v6;
    }
  }
  else
  {
    double v7 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)copyImageDataProvider
{
  v5.receiver = self;
  v5.super_class = (Class)SUMediaItemCellConfiguration;
  id v3 = [(SUArtworkCellConfiguration *)&v5 copyImageDataProvider];
  [(SUMediaItemCellConfiguration *)self artworkSize];
  objc_msgSend(v3, "setFinalSize:");
  return v3;
}

- (int64_t)mediaIconType
{
  uint64_t v3 = [self->super.super.super.super._representedObject itemType];
  int64_t result = 1;
  if (v3 != 1005 && v3 != 1011)
  {
    if (SUItemTypeIsVideoType(v3))
    {
      return 2;
    }
    else
    {
      objc_super v5 = (void *)[self->super.super.super.super._representedObject itemMediaKind];
      if ([v5 isEqualToString:*MEMORY[0x263F7B968]]) {
        return 2;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)showContentRating
{
  return [self->super.super.super.super._representedObject contentRating] != 0;
}

- (double)alphaForLabelAtIndex:(unint64_t)a3 fromAlpha:(double *)a4 withModifiers:(unint64_t)a5
{
  BOOL v5 = (a5 & 4) != 0 && a3 == 0;
  double result = 0.0;
  if (!v5) {
    double result = 1.0;
  }
  if (a4) {
    *a4 = result;
  }
  return result;
}

- (double)alphaForImageAtIndex:(unint64_t)a3 fromAlpha:(double *)a4 withModifiers:(unint64_t)a5
{
  BOOL v5 = (a5 & 4) != 0 && a3 == 1;
  double result = 0.0;
  if (!v5) {
    double result = 1.0;
  }
  if (a4) {
    *a4 = result;
  }
  return result;
}

+ (id)copyDefaultContext
{
  return objc_alloc_init(SUMediaItemCellContext);
}

- (void)drawWithModifiers:(unint64_t)a3
{
  if ((a3 & 4) == 0 && *self->super.super.super._strings)
  {
    [-[SUCellConfiguration colorForLabelAtIndex:withModifiers:](self colorForLabelAtIndex:0) withModifiers:"set"];
    stringFrames = self->super.super.super._stringFrames;
    [(SUMediaItemCellConfiguration *)self _ratingBorderInsets];
    double v6 = v5 + stringFrames->origin.y;
    double v9 = stringFrames->size.width - (v7 + v8);
    double v11 = stringFrames->size.height - (v5 + v10);
    double v12 = stringFrames->origin.x + v7;
    double v13 = v6;
    double v14 = v9;
    UIRectFrame(*(CGRect *)&v12);
  }
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return (id)[MEMORY[0x263F1C658] boldSystemFontOfSize:7.0];
  }
}

- (void)reloadImages
{
  [(SUMediaItemCellConfiguration *)self artworkSize];
  BOOL v5 = v3 == *MEMORY[0x263F001B0] && v4 == *(double *)(MEMORY[0x263F001B0] + 8);
  if (v5
    || (uint64_t v6 = objc_msgSend((id)objc_msgSend(self->super.super.super.super._representedObject, "itemImageCollection"), "bestImageForSize:", v3, v4)) == 0)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(SUArtworkCellConfiguration *)self artworkImageForItemImage:v6];
  }
  p_images = &self->super.super.super._images;

  *self->super.super.super._images = v7;
  int64_t v9 = [(SUMediaItemCellConfiguration *)self mediaIconType];
  if (v9 && (uint64_t v10 = v9, ([self->super.super.super.super._context hiddenMediaIconTypes] & v9) == 0))
  {
    (*p_images)[1] = (id)SUTableCellGetMediaIcon(v10, 0);
    id v11 = (id)SUTableCellGetMediaIcon(v10, 1);
    p_images = &self->super.super.super._selectedImages;
  }
  else
  {
    id v11 = 0;
    *((void *)self->super.super.super._selectedImages + 1) = 0;
  }
  (*p_images)[1] = v11;
}

- (void)reloadLayoutInformation
{
  id v2 = *self->super.super.super._strings;
  if (v2)
  {
    objc_msgSend(self->super.super.super.super._context, "sizeForString:font:constrainedToSize:", v2, -[SUMediaItemCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 0), 1.79769313e308, 10.0);
    double v5 = v4;
    CGFloat v7 = v6;
    CGFloat v8 = self->super.super.super.super._layoutSize.width + -5.0;
    [(SUMediaItemCellConfiguration *)self _ratingBorderInsets];
    stringFrames = self->super.super.super._stringFrames;
    stringFrames->origin.x = v8 - v5 + v10;
    stringFrames->origin.y = -v11;
    stringFrames->size.width = v5;
    stringFrames->size.height = v7;
  }
}

- (void)reloadStrings
{
  if ([(SUMediaItemCellConfiguration *)self showContentRating]) {
    double v3 = objc_msgSend((id)objc_msgSend(self->super.super.super.super._representedObject, "contentRating"), "ratingLabel");
  }
  else {
    double v3 = 0;
  }

  id v4 = (id)[v3 length];
  if (v4) {
    id v4 = v3;
  }
  *self->super.super.super._strings = v4;
}

- (UIEdgeInsets)_ratingBorderInsets
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
  BOOL v3 = v2 == 2.0;
  double v4 = -0.0;
  double v5 = 0.0;
  if (!v3) {
    double v4 = 0.0;
  }
  double v6 = -3.0;
  if (v3) {
    double v6 = -2.0;
  }
  else {
    double v5 = -1.0;
  }
  double v7 = -2.0;
  result.right = v7;
  result.bottom = v5;
  result.left = v6;
  result.top = v4;
  return result;
}

@end