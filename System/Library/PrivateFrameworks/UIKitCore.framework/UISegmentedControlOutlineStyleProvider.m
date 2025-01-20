@interface UISegmentedControlOutlineStyleProvider
- (BOOL)animateSelectionSliding;
- (BOOL)useSelectionIndicatorStyling;
- (double)defaultContentPaddingWidth;
- (double)defaultHeightForControlSize:(int)a3;
- (double)defaultTextContentPaddingWidth;
- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6;
- (id)fontForControlSize:(int)a3 selected:(BOOL)a4;
@end

@implementation UISegmentedControlOutlineStyleProvider

- (BOOL)useSelectionIndicatorStyling
{
  return 0;
}

- (BOOL)animateSelectionSliding
{
  return 0;
}

- (double)defaultContentPaddingWidth
{
  return 7.0;
}

- (double)defaultTextContentPaddingWidth
{
  return 2.0;
}

- (double)defaultHeightForControlSize:(int)a3
{
  double result = 28.0;
  if (a3 == 1) {
    return 22.0;
  }
  return result;
}

- (id)fontForControlSize:(int)a3 selected:(BOOL)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  if (a3 <= 2) {
    double v4 = dbl_186B9D308[a3];
  }
  double v5 = *(double *)off_1E52D6BF8;
  uint64_t v6 = *(void *)off_1E52D6BD0;
  v17[0] = *(void *)off_1E52D6BC0;
  uint64_t v7 = *(void *)off_1E52D6C08;
  v16[0] = v6;
  v16[1] = v7;
  v8 = [NSNumber numberWithDouble:v5];
  v16[2] = *MEMORY[0x1E4F24578];
  v17[1] = v8;
  v17[2] = &unk_1ED3F6930;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  uint64_t v14 = *(void *)off_1E52D6B98;
  v15 = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v11 = [off_1E52D39C0 fontDescriptorWithFontAttributes:v10];

  v12 = [off_1E52D39B8 fontWithDescriptor:v11 size:v4];

  return v12;
}

- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6
{
  if (a4) {
    [a3 _inheritedInteractionTintColor];
  }
  else {
  uint64_t v6 = [a3 _disabledColor];
  }
  return v6;
}

@end