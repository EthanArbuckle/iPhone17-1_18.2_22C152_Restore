@interface SBAmbientLiveActivitiesSettings
+ (id)settingsControllerModule;
- (BOOL)fullScreenDismissGestureEnabled;
- (double)fullScreenDragCornerRadiusDampingRatio;
- (double)fullScreenDragCornerRadiusResponse;
- (double)fullScreenDragPositionDampingRatio;
- (double)fullScreenDragPositionResponse;
- (double)fullScreenDragScaleDampingRatio;
- (double)fullScreenDragScaleResponse;
- (double)fullScreenTransitionToCompactDampingRatio;
- (double)fullScreenTransitionToCompactResponse;
- (void)setDefaultValues;
- (void)setFullScreenDismissGestureEnabled:(BOOL)a3;
- (void)setFullScreenDragCornerRadiusDampingRatio:(double)a3;
- (void)setFullScreenDragCornerRadiusResponse:(double)a3;
- (void)setFullScreenDragPositionDampingRatio:(double)a3;
- (void)setFullScreenDragPositionResponse:(double)a3;
- (void)setFullScreenDragScaleDampingRatio:(double)a3;
- (void)setFullScreenDragScaleResponse:(double)a3;
- (void)setFullScreenTransitionToCompactDampingRatio:(double)a3;
- (void)setFullScreenTransitionToCompactResponse:(double)a3;
@end

@implementation SBAmbientLiveActivitiesSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBAmbientLiveActivitiesSettings;
  [(PTSettings *)&v3 setDefaultValues];
  self->_fullScreenDragCornerRadiusDampingRatio = 0.845;
  self->_fullScreenDragCornerRadiusResponse = 0.531;
  self->_fullScreenDragScaleDampingRatio = 0.845;
  self->_fullScreenDragScaleResponse = 0.531;
  self->_fullScreenDragPositionDampingRatio = 0.845;
  self->_fullScreenDragPositionResponse = 0.531;
  self->_fullScreenTransitionToCompactDampingRatio = 0.75;
  self->_fullScreenTransitionToCompactResponse = 0.52;
  self->_fullScreenDismissGestureEnabled = 0;
}

+ (id)settingsControllerModule
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v27 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Damping Ratio" valueKeyPath:@"fullScreenDragCornerRadiusDampingRatio"];
  v26 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Response" valueKeyPath:@"fullScreenDragCornerRadiusResponse"];
  v25 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Damping Ratio" valueKeyPath:@"fullScreenDragScaleDampingRatio"];
  v24 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Response" valueKeyPath:@"fullScreenDragScaleResponse"];
  v23 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Damping Ratio" valueKeyPath:@"fullScreenDragPositionDampingRatio"];
  v29 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Response" valueKeyPath:@"fullScreenDragPositionResponse"];
  v28 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Damping Ratio" valueKeyPath:@"fullScreenTransitionToCompactDampingRatio"];
  v20 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Response" valueKeyPath:@"fullScreenTransitionToCompactResponse"];
  v21 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Full screen dismiss gesture" valueKeyPath:@"fullScreenDismissGestureEnabled"];
  v2 = (void *)MEMORY[0x1E4F94168];
  v35[0] = v27;
  v35[1] = v26;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v22 = [v2 sectionWithRows:v3 title:@"Full screen drag corner radius"];

  v4 = (void *)MEMORY[0x1E4F94168];
  v34[0] = v25;
  v34[1] = v24;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v6 = [v4 sectionWithRows:v5 title:@"Full screen drag scale"];

  v7 = (void *)MEMORY[0x1E4F94168];
  v33[0] = v23;
  v33[1] = v29;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v9 = [v7 sectionWithRows:v8 title:@"Full screen drag position"];

  v10 = (void *)MEMORY[0x1E4F94168];
  v32[0] = v28;
  v32[1] = v20;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v12 = [v10 sectionWithRows:v11 title:@"Transition to compact"];

  v13 = (void *)MEMORY[0x1E4F94168];
  v31 = v21;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v15 = [v13 sectionWithRows:v14 title:0];

  v16 = (void *)MEMORY[0x1E4F94168];
  v30[0] = v22;
  v30[1] = v6;
  v30[2] = v9;
  v30[3] = v12;
  v30[4] = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
  v18 = [v16 moduleWithTitle:@"Domino Settings" contents:v17];

  return v18;
}

- (double)fullScreenDragCornerRadiusDampingRatio
{
  return self->_fullScreenDragCornerRadiusDampingRatio;
}

- (void)setFullScreenDragCornerRadiusDampingRatio:(double)a3
{
  self->_fullScreenDragCornerRadiusDampingRatio = a3;
}

- (double)fullScreenDragCornerRadiusResponse
{
  return self->_fullScreenDragCornerRadiusResponse;
}

- (void)setFullScreenDragCornerRadiusResponse:(double)a3
{
  self->_fullScreenDragCornerRadiusResponse = a3;
}

- (double)fullScreenDragScaleDampingRatio
{
  return self->_fullScreenDragScaleDampingRatio;
}

- (void)setFullScreenDragScaleDampingRatio:(double)a3
{
  self->_fullScreenDragScaleDampingRatio = a3;
}

- (double)fullScreenDragScaleResponse
{
  return self->_fullScreenDragScaleResponse;
}

- (void)setFullScreenDragScaleResponse:(double)a3
{
  self->_fullScreenDragScaleResponse = a3;
}

- (double)fullScreenDragPositionDampingRatio
{
  return self->_fullScreenDragPositionDampingRatio;
}

- (void)setFullScreenDragPositionDampingRatio:(double)a3
{
  self->_fullScreenDragPositionDampingRatio = a3;
}

- (double)fullScreenDragPositionResponse
{
  return self->_fullScreenDragPositionResponse;
}

- (void)setFullScreenDragPositionResponse:(double)a3
{
  self->_fullScreenDragPositionResponse = a3;
}

- (double)fullScreenTransitionToCompactDampingRatio
{
  return self->_fullScreenTransitionToCompactDampingRatio;
}

- (void)setFullScreenTransitionToCompactDampingRatio:(double)a3
{
  self->_fullScreenTransitionToCompactDampingRatio = a3;
}

- (double)fullScreenTransitionToCompactResponse
{
  return self->_fullScreenTransitionToCompactResponse;
}

- (void)setFullScreenTransitionToCompactResponse:(double)a3
{
  self->_fullScreenTransitionToCompactResponse = a3;
}

- (BOOL)fullScreenDismissGestureEnabled
{
  return self->_fullScreenDismissGestureEnabled;
}

- (void)setFullScreenDismissGestureEnabled:(BOOL)a3
{
  self->_fullScreenDismissGestureEnabled = a3;
}

@end