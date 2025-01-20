@interface _UIStatusBarVoiceControlPillItem
- (BOOL)_pulsingForVoiceControlType:(int64_t)a3;
- (CGSize)pillSize;
- (_UIStatusBarPillView)pillView;
- (double)imageOpacityForVoiceControlType:(int64_t)a3;
- (id)_backgroundColorForVoiceControlType:(int64_t)a3 styleAttributes:(id)a4;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)createDisplayItemForIdentifier:(id)a3;
- (void)_create_pillView;
- (void)setPillSize:(CGSize)a3;
- (void)setPillView:(id)a3;
@end

@implementation _UIStatusBarVoiceControlPillItem

- (id)createDisplayItemForIdentifier:(id)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)_UIStatusBarVoiceControlPillItem;
  id v19 = [(_UIStatusBarItem *)&v23 createDisplayItemForIdentifier:a3];
  [(_UIStatusBarVoiceControlPillItem *)self pillSize];
  double v5 = v4;
  double v7 = v6;
  v8 = [(_UIStatusBarVoiceControlPillItem *)self pillView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(_UIStatusBarIndicatorItem *)self imageView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setFontStyle:0];
  [v8 addSubview:v9];
  [v8 setSubviewForBaselineAlignment:v9];
  v22 = [v9 centerXAnchor];
  v21 = [v8 centerXAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v24[0] = v20;
  v10 = [v9 centerYAnchor];
  v11 = [v8 centerYAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v24[1] = v12;
  v13 = [v8 widthAnchor];
  v14 = [v13 constraintEqualToConstant:v5];
  v24[2] = v14;
  v15 = [v8 heightAnchor];
  v16 = [v15 constraintEqualToConstant:v7];
  v24[3] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];

  [MEMORY[0x1E4F5B268] activateConstraints:v17];
  return v19;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarVoiceControlPillItem;
  double v7 = [(_UIStatusBarVoiceControlItem *)&v15 applyUpdate:v6 toDisplayItem:a4];
  v8 = [v6 data];
  v9 = [v8 voiceControlEntry];

  if (([v6 dataChanged] & 1) != 0 || objc_msgSend(v6, "styleAttributesChanged"))
  {
    uint64_t v10 = [v9 type];
    v11 = [(_UIStatusBarVoiceControlPillItem *)self pillView];
    v12 = [v6 styleAttributes];
    v13 = [(_UIStatusBarVoiceControlPillItem *)self _backgroundColorForVoiceControlType:v10 styleAttributes:v12];
    [v11 setPillColor:v13];

    objc_msgSend(v11, "setPulsing:", -[_UIStatusBarVoiceControlPillItem _pulsingForVoiceControlType:](self, "_pulsingForVoiceControlType:", v10));
  }

  return v7;
}

- (double)imageOpacityForVoiceControlType:(int64_t)a3
{
  if (!a3) {
    return 0.75;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarVoiceControlPillItem;
  -[_UIStatusBarVoiceControlItem imageOpacityForVoiceControlType:](&v4, sel_imageOpacityForVoiceControlType_);
  return result;
}

- (id)_backgroundColorForVoiceControlType:(int64_t)a3 styleAttributes:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  switch(a3)
  {
    case 2:
      uint64_t v9 = +[UIColor systemRedColor];
LABEL_7:
      objc_super v4 = (void *)v9;
      break;
    case 1:
      uint64_t v9 = +[UIColor systemBlueColor];
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

- (_UIStatusBarPillView)pillView
{
  pillView = self->_pillView;
  if (!pillView)
  {
    [(_UIStatusBarVoiceControlPillItem *)self _create_pillView];
    pillView = self->_pillView;
  }
  return pillView;
}

- (void)_create_pillView
{
  v3 = [_UIStatusBarPillView alloc];
  objc_super v4 = -[_UIStatusBarPillView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  pillView = self->_pillView;
  self->_pillView = v4;
}

- (CGSize)pillSize
{
  double width = self->_pillSize.width;
  double height = self->_pillSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPillSize:(CGSize)a3
{
  self->_pillSize = a3;
}

- (void)setPillView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end