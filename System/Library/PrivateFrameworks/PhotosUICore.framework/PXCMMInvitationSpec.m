@interface PXCMMInvitationSpec
+ (id)specForLayoutVariant:(int64_t)a3;
- (PXCMMInvitationSpec)init;
- (UIColor)posterTitleColor;
- (UIColor)subtitle1Color;
- (UIColor)subtitle2Color;
- (UIColor)titleBulletColor;
- (UIColor)titleColor;
- (UIFont)posterTitleFont;
- (UIFont)subtitle2Font;
- (UIFont)titleEmphasizedFont;
- (UIFont)titleFont;
- (double)aspectRatio;
- (double)bulletSize;
- (double)cornerRadius;
- (double)insets;
- (double)subtitleSpacing;
- (double)titleSpacing;
- (double)verticalPadding;
- (id)_initWithLayoutVariant:(int64_t)a3;
- (int64_t)layoutVariant;
- (int64_t)posterTitleTextStyle;
- (int64_t)subtitle2TextStyle;
- (int64_t)titleTextStyle;
@end

@implementation PXCMMInvitationSpec

- (int64_t)layoutVariant
{
  return self->_layoutVariant;
}

- (UIColor)subtitle2Color
{
  return (UIColor *)[MEMORY[0x1E4FB1618] tertiaryLabelColor];
}

- (UIColor)subtitle1Color
{
  return (UIColor *)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (UIColor)titleBulletColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] systemBlueColor];
}

- (UIColor)titleColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] labelColor];
}

- (UIColor)posterTitleColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] whiteColor];
}

- (int64_t)subtitle2TextStyle
{
  return 12;
}

- (int64_t)titleTextStyle
{
  if (self->_layoutVariant >= 4uLL)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXCMMInvitationSpec.m" lineNumber:253 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 7;
}

- (int64_t)posterTitleTextStyle
{
  unint64_t layoutVariant = self->_layoutVariant;
  if (layoutVariant >= 4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXCMMInvitationSpec.m" lineNumber:242 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return qword_1AB35CAB8[layoutVariant];
}

- (UIFont)subtitle2Font
{
}

- (UIFont)titleEmphasizedFont
{
}

- (UIFont)titleFont
{
}

- (UIFont)posterTitleFont
{
}

- (double)subtitleSpacing
{
  unint64_t v2 = self->_layoutVariant - 1;
  if (v2 >= 3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXCMMInvitationSpec.m" lineNumber:124 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return dbl_1AB35CAA0[v2];
}

- (double)titleSpacing
{
  int64_t layoutVariant = self->_layoutVariant;
  double result = 2.0;
  if (layoutVariant != 1)
  {
    if (layoutVariant != 3)
    {
      v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 2.0);
      [v6 handleFailureInMethod:a2 object:self file:@"PXCMMInvitationSpec.m" lineNumber:110 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    return 0.0;
  }
  return result;
}

- (double)bulletSize
{
  if ((unint64_t)(self->_layoutVariant - 1) >= 3)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXCMMInvitationSpec.m" lineNumber:97 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 12.0;
}

- (double)verticalPadding
{
  int64_t layoutVariant = self->_layoutVariant;
  double result = 9.0;
  if (layoutVariant != 1)
  {
    if (layoutVariant != 3)
    {
      v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 9.0);
      [v6 handleFailureInMethod:a2 object:self file:@"PXCMMInvitationSpec.m" lineNumber:85 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    return 0.0;
  }
  return result;
}

- (double)insets
{
  unint64_t layoutVariant = self->_layoutVariant;
  if (layoutVariant >= 4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXCMMInvitationSpec.m" lineNumber:72 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return dbl_1AB35CA80[layoutVariant];
}

- (double)cornerRadius
{
  unint64_t layoutVariant = self->_layoutVariant;
  if (layoutVariant >= 4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXCMMInvitationSpec.m" lineNumber:58 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return dbl_1AB35CA60[layoutVariant];
}

- (double)aspectRatio
{
  unint64_t layoutVariant = self->_layoutVariant;
  if (layoutVariant >= 4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXCMMInvitationSpec.m" lineNumber:45 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return dbl_1AB35CA40[layoutVariant];
}

- (id)_initWithLayoutVariant:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXCMMInvitationSpec;
  id result = [(PXCMMInvitationSpec *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (PXCMMInvitationSpec)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMInvitationSpec.m", 23, @"%s is not available as initializer", "-[PXCMMInvitationSpec init]");

  abort();
}

+ (id)specForLayoutVariant:(int64_t)a3
{
  if (specForLayoutVariant__predicate != -1) {
    dispatch_once(&specForLayoutVariant__predicate, &__block_literal_global_265476);
  }
  v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(id)specForLayoutVariant__specs objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [[PXCMMInvitationSpec alloc] _initWithLayoutVariant:a3];
    [(id)specForLayoutVariant__specs setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

void __44__PXCMMInvitationSpec_specForLayoutVariant___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)specForLayoutVariant__specs;
  specForLayoutVariant__specs = (uint64_t)v0;
}

@end