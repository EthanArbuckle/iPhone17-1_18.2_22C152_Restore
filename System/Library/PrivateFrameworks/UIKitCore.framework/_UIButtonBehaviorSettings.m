@interface _UIButtonBehaviorSettings
+ (id)settingsControllerModule;
- (BOOL)_useImageSettings;
- (BOOL)_useMixedSettings;
- (BOOL)_useTextSettings;
- (double)closeButtonMinSize;
- (double)closeButtonOutset;
- (double)imageButtonMinHeight;
- (double)imageButtonMinWidth;
- (double)imageButtonOutsetBottom;
- (double)imageButtonOutsetLeading;
- (double)imageButtonOutsetTop;
- (double)imageButtonOutsetTrailing;
- (double)mixedButtonMinHeight;
- (double)mixedButtonMinWidth;
- (double)mixedButtonOutsetBottom;
- (double)mixedButtonOutsetLeading;
- (double)mixedButtonOutsetTop;
- (double)mixedButtonOutsetTrailing;
- (double)roundButtonMinSize;
- (double)roundButtonOutset;
- (double)textButtonMinHeight;
- (double)textButtonMinWidth;
- (double)textButtonOutsetBottom;
- (double)textButtonOutsetLeading;
- (double)textButtonOutsetTop;
- (double)textButtonOutsetTrailing;
- (void)setCloseButtonMinSize:(double)a3;
- (void)setCloseButtonOutset:(double)a3;
- (void)setDefaultValues;
- (void)setImageButtonMinHeight:(double)a3;
- (void)setImageButtonMinWidth:(double)a3;
- (void)setImageButtonOutsetBottom:(double)a3;
- (void)setImageButtonOutsetLeading:(double)a3;
- (void)setImageButtonOutsetTop:(double)a3;
- (void)setImageButtonOutsetTrailing:(double)a3;
- (void)setMixedButtonMinHeight:(double)a3;
- (void)setMixedButtonMinWidth:(double)a3;
- (void)setMixedButtonOutsetBottom:(double)a3;
- (void)setMixedButtonOutsetLeading:(double)a3;
- (void)setMixedButtonOutsetTop:(double)a3;
- (void)setMixedButtonOutsetTrailing:(double)a3;
- (void)setRoundButtonMinSize:(double)a3;
- (void)setRoundButtonOutset:(double)a3;
- (void)setTextButtonMinHeight:(double)a3;
- (void)setTextButtonMinWidth:(double)a3;
- (void)setTextButtonOutsetBottom:(double)a3;
- (void)setTextButtonOutsetLeading:(double)a3;
- (void)setTextButtonOutsetTop:(double)a3;
- (void)setTextButtonOutsetTrailing:(double)a3;
@end

@implementation _UIButtonBehaviorSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIButtonBehaviorSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UIButtonBehaviorSettings *)self setTextButtonOutsetLeading:10.0];
  [(_UIButtonBehaviorSettings *)self setTextButtonOutsetTrailing:10.0];
  [(_UIButtonBehaviorSettings *)self setTextButtonOutsetTop:7.5];
  [(_UIButtonBehaviorSettings *)self setTextButtonOutsetBottom:8.5];
  [(_UIButtonBehaviorSettings *)self setTextButtonMinWidth:0.0];
  [(_UIButtonBehaviorSettings *)self setTextButtonMinHeight:0.0];
  [(_UIButtonBehaviorSettings *)self setImageButtonOutsetLeading:8.0];
  [(_UIButtonBehaviorSettings *)self setImageButtonOutsetTrailing:8.0];
  [(_UIButtonBehaviorSettings *)self setImageButtonOutsetTop:8.0];
  [(_UIButtonBehaviorSettings *)self setImageButtonOutsetBottom:8.0];
  [(_UIButtonBehaviorSettings *)self setImageButtonMinWidth:0.0];
  [(_UIButtonBehaviorSettings *)self setImageButtonMinHeight:0.0];
  [(_UIButtonBehaviorSettings *)self setMixedButtonOutsetLeading:10.0];
  [(_UIButtonBehaviorSettings *)self setMixedButtonOutsetTrailing:10.0];
  [(_UIButtonBehaviorSettings *)self setMixedButtonOutsetTop:7.5];
  [(_UIButtonBehaviorSettings *)self setMixedButtonOutsetBottom:8.5];
  [(_UIButtonBehaviorSettings *)self setMixedButtonMinWidth:0.0];
  [(_UIButtonBehaviorSettings *)self setMixedButtonMinHeight:0.0];
  [(_UIButtonBehaviorSettings *)self setRoundButtonOutset:8.0];
  [(_UIButtonBehaviorSettings *)self setRoundButtonMinSize:0.0];
  [(_UIButtonBehaviorSettings *)self setCloseButtonOutset:0.0];
  [(_UIButtonBehaviorSettings *)self setCloseButtonMinSize:0.0];
}

- (BOOL)_useTextSettings
{
  return 1;
}

- (BOOL)_useImageSettings
{
  return 1;
}

- (BOOL)_useMixedSettings
{
  return 1;
}

+ (id)settingsControllerModule
{
  v86[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_385];
  v77 = (void *)MEMORY[0x1E4F94160];
  v79 = (void *)v2;
  v75 = [MEMORY[0x1E4F94148] rowWithTitle:@"Leading" valueKeyPath:@"textButtonOutsetLeading"];
  v72 = [v75 between:0.0 and:20.0];
  v86[0] = v72;
  v69 = [MEMORY[0x1E4F94148] rowWithTitle:@"Trailing" valueKeyPath:@"textButtonOutsetTrailing"];
  v65 = [v69 between:0.0 and:20.0];
  v86[1] = v65;
  objc_super v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Top" valueKeyPath:@"textButtonOutsetTop"];
  v4 = [v3 between:0.0 and:20.0];
  v86[2] = v4;
  v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Bottom" valueKeyPath:@"textButtonOutsetBottom"];
  v6 = [v5 between:0.0 and:20.0];
  v86[3] = v6;
  v7 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Width" valueKeyPath:@"textButtonMinWidth"];
  v8 = [v7 between:0.0 and:100.0];
  v86[4] = v8;
  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Height" valueKeyPath:@"textButtonMinHeight"];
  v10 = [v9 between:0.0 and:100.0];
  v86[5] = v10;
  v11 = [MEMORY[0x1E4F940F8] rowWithTitle:@"Use for All Text/Image Buttons" action:v2];
  v86[6] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:7];
  v78 = [v77 sectionWithRows:v12 title:@"Text Only Buttons"];

  uint64_t v13 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_559_0];
  v73 = (void *)MEMORY[0x1E4F94160];
  v76 = (void *)v13;
  v70 = [MEMORY[0x1E4F94148] rowWithTitle:@"Leading" valueKeyPath:@"imageButtonOutsetLeading"];
  v66 = [v70 between:0.0 and:20.0];
  v85[0] = v66;
  v63 = [MEMORY[0x1E4F94148] rowWithTitle:@"Trailing" valueKeyPath:@"imageButtonOutsetTrailing"];
  v61 = [v63 between:0.0 and:20.0];
  v85[1] = v61;
  v14 = [MEMORY[0x1E4F94148] rowWithTitle:@"Top" valueKeyPath:@"imageButtonOutsetTop"];
  v15 = [v14 between:0.0 and:20.0];
  v85[2] = v15;
  v16 = [MEMORY[0x1E4F94148] rowWithTitle:@"Bottom" valueKeyPath:@"imageButtonOutsetBottom"];
  v17 = [v16 between:0.0 and:20.0];
  v85[3] = v17;
  v18 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Width" valueKeyPath:@"imageButtonMinWidth"];
  v19 = [v18 between:0.0 and:100.0];
  v85[4] = v19;
  v20 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Height" valueKeyPath:@"imageButtonMinHeight"];
  v21 = [v20 between:0.0 and:100.0];
  v85[5] = v21;
  v22 = [MEMORY[0x1E4F940F8] rowWithTitle:@"Use for All Text/Image Buttons" action:v13];
  v85[6] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:7];
  v74 = [v73 sectionWithRows:v23 title:@"Image Only Buttons"];

  uint64_t v24 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_582_1];
  v67 = (void *)MEMORY[0x1E4F94160];
  v71 = (void *)v24;
  v64 = [MEMORY[0x1E4F94148] rowWithTitle:@"Leading" valueKeyPath:@"mixedButtonOutsetLeading"];
  v62 = [v64 between:0.0 and:20.0];
  v84[0] = v62;
  v60 = [MEMORY[0x1E4F94148] rowWithTitle:@"Trailing" valueKeyPath:@"mixedButtonOutsetTrailing"];
  v59 = [v60 between:0.0 and:20.0];
  v84[1] = v59;
  v25 = [MEMORY[0x1E4F94148] rowWithTitle:@"Top" valueKeyPath:@"mixedButtonOutsetTop"];
  v26 = [v25 between:0.0 and:20.0];
  v84[2] = v26;
  v27 = [MEMORY[0x1E4F94148] rowWithTitle:@"Bottom" valueKeyPath:@"mixedButtonOutsetBottom"];
  v28 = [v27 between:0.0 and:20.0];
  v84[3] = v28;
  v29 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Width" valueKeyPath:@"mixedButtonMinWidth"];
  v30 = [v29 between:0.0 and:100.0];
  v84[4] = v30;
  v31 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Height" valueKeyPath:@"mixedButtonMinHeight"];
  v32 = [v31 between:0.0 and:100.0];
  v84[5] = v32;
  v33 = [MEMORY[0x1E4F940F8] rowWithTitle:@"Use for All Text/Image Buttons" action:v24];
  v84[6] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:7];
  v68 = [v67 sectionWithRows:v34 title:@"Text & Image Buttons"];

  v35 = (void *)MEMORY[0x1E4F94160];
  v36 = [MEMORY[0x1E4F94148] rowWithTitle:@"Outset" valueKeyPath:@"roundButtonOutset"];
  v37 = [v36 between:0.0 and:20.0];
  v83[0] = v37;
  v38 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Size" valueKeyPath:@"roundButtonMinSize"];
  v39 = [v38 between:0.0 and:100.0];
  v83[1] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
  v41 = [v35 sectionWithRows:v40 title:@"Round Buttons"];

  v42 = (void *)MEMORY[0x1E4F94160];
  v43 = [MEMORY[0x1E4F94148] rowWithTitle:@"Outset" valueKeyPath:@"closeButtonOutset"];
  v44 = [v43 between:0.0 and:20.0];
  v82[0] = v44;
  v45 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Size" valueKeyPath:@"closeButtonMinSize"];
  v46 = [v45 between:0.0 and:100.0];
  v82[1] = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
  v48 = [v42 sectionWithRows:v47 title:@"Close Buttons"];

  v49 = (void *)MEMORY[0x1E4F940F8];
  v50 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v51 = [v49 rowWithTitle:@"Restore Defaults" action:v50];

  v52 = (void *)MEMORY[0x1E4F94160];
  v81 = v51;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
  v54 = [v52 sectionWithRows:v53];

  v55 = (void *)MEMORY[0x1E4F94160];
  v80[0] = v78;
  v80[1] = v74;
  v80[2] = v68;
  v80[3] = v41;
  v80[4] = v48;
  v80[5] = v54;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:6];
  v57 = [v55 moduleWithTitle:0 contents:v56];

  return v57;
}

- (double)textButtonOutsetLeading
{
  return self->_textButtonOutsetLeading;
}

- (void)setTextButtonOutsetLeading:(double)a3
{
  self->_textButtonOutsetLeading = a3;
}

- (double)textButtonOutsetTrailing
{
  return self->_textButtonOutsetTrailing;
}

- (void)setTextButtonOutsetTrailing:(double)a3
{
  self->_textButtonOutsetTrailing = a3;
}

- (double)textButtonOutsetTop
{
  return self->_textButtonOutsetTop;
}

- (void)setTextButtonOutsetTop:(double)a3
{
  self->_textButtonOutsetTop = a3;
}

- (double)textButtonOutsetBottom
{
  return self->_textButtonOutsetBottom;
}

- (void)setTextButtonOutsetBottom:(double)a3
{
  self->_textButtonOutsetBottom = a3;
}

- (double)textButtonMinWidth
{
  return self->_textButtonMinWidth;
}

- (void)setTextButtonMinWidth:(double)a3
{
  self->_textButtonMinWidth = a3;
}

- (double)textButtonMinHeight
{
  return self->_textButtonMinHeight;
}

- (void)setTextButtonMinHeight:(double)a3
{
  self->_textButtonMinHeight = a3;
}

- (double)imageButtonOutsetLeading
{
  return self->_imageButtonOutsetLeading;
}

- (void)setImageButtonOutsetLeading:(double)a3
{
  self->_imageButtonOutsetLeading = a3;
}

- (double)imageButtonOutsetTrailing
{
  return self->_imageButtonOutsetTrailing;
}

- (void)setImageButtonOutsetTrailing:(double)a3
{
  self->_imageButtonOutsetTrailing = a3;
}

- (double)imageButtonOutsetTop
{
  return self->_imageButtonOutsetTop;
}

- (void)setImageButtonOutsetTop:(double)a3
{
  self->_imageButtonOutsetTop = a3;
}

- (double)imageButtonOutsetBottom
{
  return self->_imageButtonOutsetBottom;
}

- (void)setImageButtonOutsetBottom:(double)a3
{
  self->_imageButtonOutsetBottom = a3;
}

- (double)imageButtonMinWidth
{
  return self->_imageButtonMinWidth;
}

- (void)setImageButtonMinWidth:(double)a3
{
  self->_imageButtonMinWidth = a3;
}

- (double)imageButtonMinHeight
{
  return self->_imageButtonMinHeight;
}

- (void)setImageButtonMinHeight:(double)a3
{
  self->_imageButtonMinHeight = a3;
}

- (double)mixedButtonOutsetLeading
{
  return self->_mixedButtonOutsetLeading;
}

- (void)setMixedButtonOutsetLeading:(double)a3
{
  self->_mixedButtonOutsetLeading = a3;
}

- (double)mixedButtonOutsetTrailing
{
  return self->_mixedButtonOutsetTrailing;
}

- (void)setMixedButtonOutsetTrailing:(double)a3
{
  self->_mixedButtonOutsetTrailing = a3;
}

- (double)mixedButtonOutsetTop
{
  return self->_mixedButtonOutsetTop;
}

- (void)setMixedButtonOutsetTop:(double)a3
{
  self->_mixedButtonOutsetTop = a3;
}

- (double)mixedButtonOutsetBottom
{
  return self->_mixedButtonOutsetBottom;
}

- (void)setMixedButtonOutsetBottom:(double)a3
{
  self->_mixedButtonOutsetBottom = a3;
}

- (double)mixedButtonMinWidth
{
  return self->_mixedButtonMinWidth;
}

- (void)setMixedButtonMinWidth:(double)a3
{
  self->_mixedButtonMinWidth = a3;
}

- (double)mixedButtonMinHeight
{
  return self->_mixedButtonMinHeight;
}

- (void)setMixedButtonMinHeight:(double)a3
{
  self->_mixedButtonMinHeight = a3;
}

- (double)roundButtonOutset
{
  return self->_roundButtonOutset;
}

- (void)setRoundButtonOutset:(double)a3
{
  self->_roundButtonOutset = a3;
}

- (double)roundButtonMinSize
{
  return self->_roundButtonMinSize;
}

- (void)setRoundButtonMinSize:(double)a3
{
  self->_roundButtonMinSize = a3;
}

- (double)closeButtonOutset
{
  return self->_closeButtonOutset;
}

- (void)setCloseButtonOutset:(double)a3
{
  self->_closeButtonOutset = a3;
}

- (double)closeButtonMinSize
{
  return self->_closeButtonMinSize;
}

- (void)setCloseButtonMinSize:(double)a3
{
  self->_closeButtonMinSize = a3;
}

@end