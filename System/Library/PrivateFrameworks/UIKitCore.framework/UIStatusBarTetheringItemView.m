@interface UIStatusBarTetheringItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (id)contentsImage;
@end

@implementation UIStatusBarTetheringItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  int v5 = *(_DWORD *)([a3 rawData] + 2532);
  int tetheringConnectionCount = self->_tetheringConnectionCount;
  if (v5 != tetheringConnectionCount) {
    self->_int tetheringConnectionCount = v5;
  }
  return v5 != tetheringConnectionCount;
}

- (id)contentsImage
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v3 = [(UIStatusBarItemView *)self imageWithShadowNamed:@"DataTypeiOSHotspot"];
  v4 = [v3 image];

  [v4 size];
  double v6 = v5;
  double v8 = v7;
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_tetheringConnectionCount);
  v10 = [(UIStatusBarItemView *)self foregroundStyle];
  v11 = [v10 textColorForStyle:3];

  v12 = [off_1E52D39B8 boldSystemFontOfSize:8.5];
  uint64_t v13 = *(void *)off_1E52D2040;
  v28[0] = *(void *)off_1E52D2048;
  v28[1] = v13;
  v29[0] = v11;
  v29[1] = v12;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  UIFloorToViewScale(self);
  double v16 = v15;
  UIFloorToViewScale(self);
  double v18 = v17;
  [v9 sizeWithAttributes:v14];
  double v20 = v19;
  double v21 = v16 + v19;
  if (self->_tetheringConnectionCount <= 0) {
    double v21 = -0.0;
  }
  double v22 = v6 + v21;
  [(UIStatusBarItemView *)self beginImageContextWithMinimumWidth:v6 + v21];
  objc_msgSend(v4, "drawInRect:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v6, v8);
  if (self->_tetheringConnectionCount >= 1)
  {
    v23 = [(UIStatusBarItemView *)self foregroundStyle];
    [v23 height];
    objc_msgSend(v9, "drawInRect:withAttributes:", v14, v6 + v16, v18, v20, v24);
  }
  v25 = [(UIStatusBarItemView *)self imageFromImageContextClippedToWidth:v22];
  [(UIStatusBarItemView *)self endImageContext];
  v26 = +[_UILegibilityImageSet imageFromImage:v25 withShadowImage:0];

  return v26;
}

@end