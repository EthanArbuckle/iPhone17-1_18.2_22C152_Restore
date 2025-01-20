@interface SBHFolderSettings
+ (id)settingsControllerModule;
- (BOOL)allowNestedFolders;
- (BOOL)animatesPageScrubbing;
- (BOOL)pinchToClose;
- (double)minPinchScale;
- (void)setAllowNestedFolders:(BOOL)a3;
- (void)setAnimatesPageScrubbing:(BOOL)a3;
- (void)setDefaultValues;
- (void)setMinPinchScale:(double)a3;
- (void)setPinchToClose:(BOOL)a3;
@end

@implementation SBHFolderSettings

- (BOOL)pinchToClose
{
  return self->_pinchToClose;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHFolderSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBHFolderSettings *)self setAllowNestedFolders:0];
  [(SBHFolderSettings *)self setPinchToClose:0];
  [(SBHFolderSettings *)self setMinPinchScale:0.8];
  [(SBHFolderSettings *)self setAnimatesPageScrubbing:0];
}

+ (id)settingsControllerModule
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow Nested Folders" valueKeyPath:@"allowNestedFolders"];
  v14[0] = v2;
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Pinch to Close" valueKeyPath:@"pinchToClose"];
  v14[1] = v3;
  v4 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Pinch Scale" valueKeyPath:@"minPinchScale"];
  v5 = [v4 between:0.0 and:1.0];
  v14[2] = v5;
  v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Animate page scrubbing" valueKeyPath:@"animatesPageScrubbing"];
  v14[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];

  v8 = [MEMORY[0x1E4F94160] sectionWithRows:v7];
  v9 = (void *)MEMORY[0x1E4F94160];
  v13 = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v11 = [v9 moduleWithTitle:@"Folders" contents:v10];

  return v11;
}

- (BOOL)allowNestedFolders
{
  return self->_allowNestedFolders;
}

- (void)setAllowNestedFolders:(BOOL)a3
{
  self->_allowNestedFolders = a3;
}

- (void)setPinchToClose:(BOOL)a3
{
  self->_pinchToClose = a3;
}

- (double)minPinchScale
{
  return self->_minPinchScale;
}

- (void)setMinPinchScale:(double)a3
{
  self->_minPinchScale = a3;
}

- (BOOL)animatesPageScrubbing
{
  return self->_animatesPageScrubbing;
}

- (void)setAnimatesPageScrubbing:(BOOL)a3
{
  self->_animatesPageScrubbing = a3;
}

@end