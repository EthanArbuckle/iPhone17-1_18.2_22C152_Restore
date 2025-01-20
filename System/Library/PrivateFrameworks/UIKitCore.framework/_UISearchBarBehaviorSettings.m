@interface _UISearchBarBehaviorSettings
+ (id)settingsControllerModule;
- (BOOL)useGenerousPadding;
- (double)buttonGenerousPadding;
- (double)buttonMinimumHeight;
- (double)buttonTightPadding;
- (void)setButtonGenerousPadding:(double)a3;
- (void)setButtonMinimumHeight:(double)a3;
- (void)setButtonTightPadding:(double)a3;
- (void)setDefaultValues;
- (void)setUseGenerousPadding:(BOOL)a3;
@end

@implementation _UISearchBarBehaviorSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UISearchBarBehaviorSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UISearchBarBehaviorSettings *)self setButtonMinimumHeight:36.0];
  [(_UISearchBarBehaviorSettings *)self setButtonTightPadding:8.0];
  [(_UISearchBarBehaviorSettings *)self setButtonGenerousPadding:12.0];
}

+ (id)settingsControllerModule
{
  v26[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v23 = [MEMORY[0x1E4F94148] rowWithTitle:@"Minimum Height" valueKeyPath:@"buttonMinimumHeight"];
  objc_super v3 = [v23 between:30.0 and:50.0];
  v26[0] = v3;
  v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use generous padding values (this will become automatic)" valueKeyPath:@"useGenerousPadding"];
  v26[1] = v4;
  v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Tight Padding" valueKeyPath:@"buttonTightPadding"];
  v6 = [v5 between:4.0 and:20.0];
  v26[2] = v6;
  v7 = [MEMORY[0x1E4F94148] rowWithTitle:@"Generous Padding" valueKeyPath:@"buttonGenerousPadding"];
  v8 = [v7 between:4.0 and:20.0];
  v26[3] = v8;
  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Corner Radius" valueKeyPath:@"buttonCornerRadius"];
  v10 = [v9 between:4.0 and:20.0];
  v26[4] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];
  v12 = [v2 sectionWithRows:v11 title:@"Search Button Highlight"];

  v13 = (void *)MEMORY[0x1E4F940F8];
  v14 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v15 = [v13 rowWithTitle:@"Restore Defaults" action:v14];

  v16 = (void *)MEMORY[0x1E4F94160];
  v25 = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v18 = [v16 sectionWithRows:v17];

  v19 = (void *)MEMORY[0x1E4F94160];
  v24[0] = v12;
  v24[1] = v18;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v21 = [v19 moduleWithTitle:0 contents:v20];

  return v21;
}

- (BOOL)useGenerousPadding
{
  return self->_useGenerousPadding;
}

- (void)setUseGenerousPadding:(BOOL)a3
{
  self->_useGenerousPadding = a3;
}

- (double)buttonMinimumHeight
{
  return self->_buttonMinimumHeight;
}

- (void)setButtonMinimumHeight:(double)a3
{
  self->_buttonMinimumHeight = a3;
}

- (double)buttonTightPadding
{
  return self->_buttonTightPadding;
}

- (void)setButtonTightPadding:(double)a3
{
  self->_buttonTightPadding = a3;
}

- (double)buttonGenerousPadding
{
  return self->_buttonGenerousPadding;
}

- (void)setButtonGenerousPadding:(double)a3
{
  self->_buttonGenerousPadding = a3;
}

@end