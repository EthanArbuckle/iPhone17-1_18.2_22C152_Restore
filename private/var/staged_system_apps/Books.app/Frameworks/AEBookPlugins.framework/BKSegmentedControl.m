@interface BKSegmentedControl
- ($46C59B5655F30DA7E82DF15A2439003D)_appearanceStruct;
- (BKSegmentedControl)initWithItems:(id)a3;
- (BOOL)useCustomButton;
- (CGPoint)frameOffset;
- (CGSize)textShadowOffset;
- (UIColor)textColor;
- (UIFont)font;
- (UIImage)background;
- (UIImage)backgroundMini;
- (UIImage)backgroundSelected;
- (UIImage)backgroundSelectedMini;
- (UIImage)divider;
- (UIImage)dividerLeftPressed;
- (UIImage)dividerLeftPressedMini;
- (UIImage)dividerMini;
- (UIImage)dividerRightPressed;
- (UIImage)dividerRightPressedMini;
- (void)setBackground:(id)a3;
- (void)setBackgroundMini:(id)a3;
- (void)setBackgroundSelected:(id)a3;
- (void)setBackgroundSelectedMini:(id)a3;
- (void)setDivider:(id)a3;
- (void)setDividerLeftPressed:(id)a3;
- (void)setDividerLeftPressedMini:(id)a3;
- (void)setDividerMini:(id)a3;
- (void)setDividerRightPressed:(id)a3;
- (void)setDividerRightPressedMini:(id)a3;
- (void)setFont:(id)a3;
- (void)setFrameOffset:(CGPoint)a3;
- (void)setTextColor:(id)a3;
- (void)setTextShadowOffset:(CGSize)a3;
- (void)updateAppearance;
@end

@implementation BKSegmentedControl

- (BKSegmentedControl)initWithItems:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKSegmentedControl;
  v3 = [(BKSegmentedControl *)&v6 initWithItems:a3];
  v4 = v3;
  if (v3)
  {
    [(BKSegmentedControl *)v3 setFont:0];
    [(BKSegmentedControl *)v4 updateAppearance];
  }
  return v4;
}

- (BOOL)useCustomButton
{
  return 1;
}

- (void)updateAppearance
{
  v3 = [(BKSegmentedControl *)self background];

  if (v3)
  {
    -[BKSegmentedControl _appearanceStruct](self, "_appearanceStruct", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0);
    [(BKSegmentedControl *)self _setSegmentedControlAppearance:&v4];
  }
}

- ($46C59B5655F30DA7E82DF15A2439003D)_appearanceStruct
{
  *(_OWORD *)&retstr->var6.var4 = 0u;
  *(_OWORD *)&retstr->var6.var5.height = 0u;
  *(_OWORD *)&retstr->var6.var0 = 0u;
  *(_OWORD *)&retstr->var6.var2 = 0u;
  *(_OWORD *)&retstr->var5.var3 = 0u;
  retstr->var5.var5 = 0u;
  *(_OWORD *)&retstr->var4.var5.height = 0u;
  *(_OWORD *)&retstr->var5.var1 = 0u;
  *(_OWORD *)&retstr->var4.var2 = 0u;
  *(_OWORD *)&retstr->var4.var4 = 0u;
  retstr->var3.var5 = 0u;
  *(_OWORD *)&retstr->var4.var0 = 0u;
  *(_OWORD *)&retstr->var3.var1 = 0u;
  *(_OWORD *)&retstr->var3.var3 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v5 = [(BKSegmentedControl *)self font];
  if (v5) {
    [(BKSegmentedControl *)self font];
  }
  else {
  objc_super v6 = +[UIFont boldSystemFontOfSize:12.0];
  }

  retstr->var0 = v6;
  retstr->var1 = 0.0;
  retstr->var2 = 0.0;
  retstr->var7 = 1;
  id v20 = [(BKSegmentedControl *)self textColor];
  unsigned int v7 = [(BKSegmentedControl *)self controlSize];
  if (v7 == 1) {
    [(BKSegmentedControl *)self dividerMini];
  }
  else {
  v8 = [(BKSegmentedControl *)self divider];
  }
  v9 = [(BKSegmentedControl *)self dividerLeftPressed];
  if (v9)
  {
    id v10 = [(BKSegmentedControl *)self dividerLeftPressed];
  }
  else
  {
    id v10 = v8;
  }
  v11 = v10;

  v12 = [(BKSegmentedControl *)self dividerRightPressed];
  if (v12)
  {
    id v13 = [(BKSegmentedControl *)self dividerRightPressed];
  }
  else
  {
    id v13 = v8;
  }
  v14 = v13;

  if (v7 == 1)
  {
    v15 = [(BKSegmentedControl *)self backgroundMini];
    [(BKSegmentedControl *)self backgroundSelectedMini];
  }
  else
  {
    v15 = [(BKSegmentedControl *)self background];
    [(BKSegmentedControl *)self backgroundSelected];
  v16 = };
  [(BKSegmentedControl *)self textShadowOffset];
  retstr->var3.var0 = v15;
  retstr->var3.var1 = v8;
  retstr->var3.var2 = v8;
  retstr->var3.var3 = v20;
  retstr->var3.var4 = 0;
  retstr->var3.var5.width = v17;
  retstr->var3.var5.height = v18;
  retstr->var4.var0 = v16;
  retstr->var4.var1 = v11;
  retstr->var4.var2 = v14;
  retstr->var4.var3 = v20;
  retstr->var4.var4 = 0;
  retstr->var4.var5.width = v17;
  retstr->var4.var5.height = v18;
  retstr->var5.var0 = v15;
  retstr->var5.var1 = v8;
  retstr->var5.var2 = v8;
  retstr->var5.var3 = v20;
  retstr->var5.var4 = 0;
  retstr->var5.var5.width = v17;
  retstr->var5.var5.height = v18;
  retstr->var6.var0 = v15;
  retstr->var6.var1 = v8;
  retstr->var6.var2 = v8;
  retstr->var6.var3 = v20;
  retstr->var6.var4 = 0;
  retstr->var6.var5.width = v17;
  retstr->var6.var5.height = v18;

  return result;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (CGSize)textShadowOffset
{
  double width = self->_textShadowOffset.width;
  double height = self->_textShadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTextShadowOffset:(CGSize)a3
{
  self->_textShadowOffset = a3;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIImage)divider
{
  return self->_divider;
}

- (void)setDivider:(id)a3
{
}

- (UIImage)dividerMini
{
  return self->_dividerMini;
}

- (void)setDividerMini:(id)a3
{
}

- (UIImage)dividerLeftPressed
{
  return self->_dividerLeftPressed;
}

- (void)setDividerLeftPressed:(id)a3
{
}

- (UIImage)dividerLeftPressedMini
{
  return self->_dividerLeftPressedMini;
}

- (void)setDividerLeftPressedMini:(id)a3
{
}

- (UIImage)dividerRightPressed
{
  return self->_dividerRightPressed;
}

- (void)setDividerRightPressed:(id)a3
{
}

- (UIImage)dividerRightPressedMini
{
  return self->_divideRightPressedMini;
}

- (void)setDividerRightPressedMini:(id)a3
{
}

- (UIImage)background
{
  return self->_background;
}

- (void)setBackground:(id)a3
{
}

- (UIImage)backgroundMini
{
  return self->_backgroundMini;
}

- (void)setBackgroundMini:(id)a3
{
}

- (UIImage)backgroundSelected
{
  return self->_backgroundSelected;
}

- (void)setBackgroundSelected:(id)a3
{
}

- (UIImage)backgroundSelectedMini
{
  return self->_backgroundSelectedMini;
}

- (void)setBackgroundSelectedMini:(id)a3
{
}

- (CGPoint)frameOffset
{
  double x = self->_frameOffset.x;
  double y = self->_frameOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFrameOffset:(CGPoint)a3
{
  self->_frameOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divideRightPressedMini, 0);
  objc_storeStrong((id *)&self->_backgroundSelectedMini, 0);
  objc_storeStrong((id *)&self->_backgroundSelected, 0);
  objc_storeStrong((id *)&self->_backgroundMini, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_dividerRightPressedMini, 0);
  objc_storeStrong((id *)&self->_dividerRightPressed, 0);
  objc_storeStrong((id *)&self->_dividerLeftPressedMini, 0);
  objc_storeStrong((id *)&self->_dividerLeftPressed, 0);
  objc_storeStrong((id *)&self->_dividerMini, 0);
  objc_storeStrong((id *)&self->_divider, 0);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_font, 0);
}

@end