@interface STUIStatusBarVoiceControlPillItem
- (BOOL)_pulsingForVoiceControlType:(int64_t)a3;
- (BOOL)canBecomeFocused;
- (CGSize)pillSize;
- (STUIStatusBarPillView)pillView;
- (double)imageOpacityForVoiceControlType:(int64_t)a3;
- (double)pillPadding;
- (id)_backgroundColorForVoiceControlType:(int64_t)a3 styleAttributes:(id)a4;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)createDisplayItemForIdentifier:(id)a3;
- (void)_create_pillView;
- (void)setPillPadding:(double)a3;
- (void)setPillSize:(CGSize)a3;
- (void)setPillView:(id)a3;
@end

@implementation STUIStatusBarVoiceControlPillItem

- (void)setPillSize:(CGSize)a3
{
  self->_pillSize = a3;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  v30[6] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)STUIStatusBarVoiceControlPillItem;
  id v21 = [(STUIStatusBarItem *)&v29 createDisplayItemForIdentifier:a3];
  [(STUIStatusBarVoiceControlPillItem *)self pillSize];
  double v5 = v4;
  double v7 = v6;
  v8 = [(STUIStatusBarVoiceControlPillItem *)self pillView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(STUIStatusBarIndicatorItem *)self imageView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setFontStyle:0];
  [v8 addSubview:v9];
  [v8 setSubviewForBaselineAlignment:v9];
  v28 = [v9 centerXAnchor];
  v27 = [v8 centerXAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v30[0] = v26;
  v25 = [v9 centerYAnchor];
  v24 = [v8 centerYAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v30[1] = v23;
  v22 = [v9 widthAnchor];
  [(STUIStatusBarVoiceControlPillItem *)self pillPadding];
  v11 = [v22 constraintEqualToConstant:v5 - v10];
  v30[2] = v11;
  v12 = [v9 heightAnchor];
  [(STUIStatusBarVoiceControlPillItem *)self pillPadding];
  v14 = [v12 constraintEqualToConstant:v7 - v13];
  v30[3] = v14;
  v15 = [v8 widthAnchor];
  v16 = [v15 constraintEqualToConstant:v5];
  v30[4] = v16;
  v17 = [v8 heightAnchor];
  v18 = [v17 constraintEqualToConstant:v7];
  v30[5] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:6];

  [MEMORY[0x1E4F28DC8] activateConstraints:v19];
  return v21;
}

- (double)pillPadding
{
  return self->_pillPadding;
}

- (STUIStatusBarPillView)pillView
{
  pillView = self->_pillView;
  if (!pillView)
  {
    [(STUIStatusBarVoiceControlPillItem *)self _create_pillView];
    pillView = self->_pillView;
  }
  return pillView;
}

- (CGSize)pillSize
{
  double width = self->_pillSize.width;
  double height = self->_pillSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_create_pillView
{
  v3 = [STUIStatusBarPillView alloc];
  double v4 = -[STUIStatusBarPillView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  pillView = self->_pillView;
  self->_pillView = v4;
  MEMORY[0x1F41817F8](v4, pillView);
}

- (void).cxx_destruct
{
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STUIStatusBarVoiceControlPillItem;
  double v7 = [(STUIStatusBarVoiceControlItem *)&v15 applyUpdate:v6 toDisplayItem:a4];
  v8 = [v6 data];
  v9 = [v8 voiceControlEntry];

  if (([v6 dataChanged] & 1) != 0 || objc_msgSend(v6, "styleAttributesChanged"))
  {
    uint64_t v10 = [v9 type];
    v11 = [(STUIStatusBarVoiceControlPillItem *)self pillView];
    v12 = [v6 styleAttributes];
    double v13 = [(STUIStatusBarVoiceControlPillItem *)self _backgroundColorForVoiceControlType:v10 styleAttributes:v12];
    [v11 setPillColor:v13];

    objc_msgSend(v11, "setPulsing:", -[STUIStatusBarVoiceControlPillItem _pulsingForVoiceControlType:](self, "_pulsingForVoiceControlType:", v10));
  }

  return v7;
}

- (double)imageOpacityForVoiceControlType:(int64_t)a3
{
  if (!a3) {
    return 0.75;
  }
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarVoiceControlPillItem;
  -[STUIStatusBarVoiceControlItem imageOpacityForVoiceControlType:](&v4, sel_imageOpacityForVoiceControlType_);
  return result;
}

- (id)_backgroundColorForVoiceControlType:(int64_t)a3 styleAttributes:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  switch(a3)
  {
    case 2:
      uint64_t v9 = [MEMORY[0x1E4FB1618] systemRedColor];
LABEL_7:
      objc_super v4 = (void *)v9;
      break;
    case 1:
      uint64_t v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
      goto LABEL_7;
    case 0:
      v8 = [v6 imageTintColor];
      objc_super v4 = [v8 colorWithAlphaComponent:0.12];

      break;
  }

  return v4;
}

- (BOOL)_pulsingForVoiceControlType:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)setPillPadding:(double)a3
{
  self->_pillPadding = a3;
}

- (void)setPillView:(id)a3
{
}

@end