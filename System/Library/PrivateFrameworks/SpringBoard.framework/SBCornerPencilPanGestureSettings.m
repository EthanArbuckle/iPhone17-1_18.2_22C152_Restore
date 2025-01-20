@interface SBCornerPencilPanGestureSettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)settingsControllerModule;
- (double)cornerHorizontalEdgeLength;
- (double)cornerVerticalEdgeLength;
- (void)setCornerHorizontalEdgeLength:(double)a3;
- (void)setCornerVerticalEdgeLength:(double)a3;
- (void)setDefaultValues;
@end

@implementation SBCornerPencilPanGestureSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBCornerPencilPanGestureSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBCornerPencilPanGestureSettings *)self setCornerHorizontalEdgeLength:30.0];
  [(SBCornerPencilPanGestureSettings *)self setCornerVerticalEdgeLength:30.0];
}

+ (id)settingsControllerModule
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Corner Horizontal Edge Length" valueKeyPath:@"cornerHorizontalEdgeLength"];
  objc_super v3 = [v2 minValue:0.0 maxValue:150.0];

  v4 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Corner Vertical Edge Length" valueKeyPath:@"cornerVerticalEdgeLength"];
  v5 = [v4 minValue:0.0 maxValue:150.0];

  v6 = (void *)MEMORY[0x1E4F94168];
  v14[0] = v3;
  v14[1] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v8 = [v6 sectionWithRows:v7 title:@"Basic Configuration"];

  v9 = (void *)MEMORY[0x1E4F94168];
  v13 = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v11 = [v9 moduleWithTitle:@"Corner Swipe Gesture" contents:v10];

  return v11;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"idealSwipeUnitVector"] & 1) != 0
    || ([v3 isEqualToString:@"cornerSwipeGestureEnabled"] & 1) != 0
    || ([v3 isEqualToString:@"type"] & 1) != 0
    || ([v3 isEqualToString:@"useNewCornerGestureHeuristics"] & 1) != 0
    || ([v3 isEqualToString:@"idealSwipeDegrees"] & 1) != 0
    || ([v3 isEqualToString:@"underSwipeForgivenessDegrees"] & 1) != 0
    || ([v3 isEqualToString:@"overSwipeForgivenessDegrees"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"edgeProtectMode"];
  }

  return v4;
}

- (double)cornerHorizontalEdgeLength
{
  return self->_cornerHorizontalEdgeLength;
}

- (void)setCornerHorizontalEdgeLength:(double)a3
{
  self->_cornerHorizontalEdgeLength = a3;
}

- (double)cornerVerticalEdgeLength
{
  return self->_cornerVerticalEdgeLength;
}

- (void)setCornerVerticalEdgeLength:(double)a3
{
  self->_cornerVerticalEdgeLength = a3;
}

@end