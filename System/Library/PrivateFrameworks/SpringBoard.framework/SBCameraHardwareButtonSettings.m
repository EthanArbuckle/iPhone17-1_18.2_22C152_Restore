@interface SBCameraHardwareButtonSettings
+ (id)settingsControllerModule;
- (BOOL)shutterButtonShouldUsePocketDetection;
- (double)shutterButtonLongPressCancellationTimeout;
- (double)shutterButtonLongPressTimeout;
- (void)setDefaultValues;
- (void)setShutterButtonLongPressCancellationTimeout:(double)a3;
- (void)setShutterButtonLongPressTimeout:(double)a3;
- (void)setShutterButtonShouldUsePocketDetection:(BOOL)a3;
@end

@implementation SBCameraHardwareButtonSettings

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)SBCameraHardwareButtonSettings;
  [(PTSettings *)&v5 setDefaultValues];
  v3 = +[SBDefaults localDefaults];
  v4 = [v3 cameraHardwareButtonDefaults];

  [v4 shutterButtonLongPressTimeout];
  [(SBCameraHardwareButtonSettings *)self setShutterButtonLongPressTimeout:"setShutterButtonLongPressTimeout:"];
  [v4 shutterButtonLongPressCancellationTimeout];
  [(SBCameraHardwareButtonSettings *)self setShutterButtonLongPressCancellationTimeout:"setShutterButtonLongPressCancellationTimeout:"];
  -[SBCameraHardwareButtonSettings setShutterButtonShouldUsePocketDetection:](self, "setShutterButtonShouldUsePocketDetection:", [v4 shutterButtonShouldUsePocketDetection]);
}

+ (id)settingsControllerModule
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94140] rowWithTitle:@"Long press timeout" valueKeyPath:@"shutterButtonLongPressTimeout"];
  v3 = [MEMORY[0x1E4F94140] rowWithTitle:@"Long press cancellation timeout" valueKeyPath:@"shutterButtonLongPressCancellationTimeout"];
  v4 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Use pocket detection" valueKeyPath:@"shutterButtonShouldUsePocketDetection"];
  objc_super v5 = [v2 between:0.0 and:10.0];

  v6 = [v3 between:0.0 and:10.0];

  v7 = (void *)MEMORY[0x1E4F94168];
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = v4;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  v9 = [v7 sectionWithRows:v8];

  v10 = (void *)MEMORY[0x1E4F94168];
  v14 = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v12 = [v10 moduleWithTitle:@"Camera Shutter Button" contents:v11];

  return v12;
}

- (double)shutterButtonLongPressTimeout
{
  return self->_shutterButtonLongPressTimeout;
}

- (void)setShutterButtonLongPressTimeout:(double)a3
{
  self->_shutterButtonLongPressTimeout = a3;
}

- (double)shutterButtonLongPressCancellationTimeout
{
  return self->_shutterButtonLongPressCancellationTimeout;
}

- (void)setShutterButtonLongPressCancellationTimeout:(double)a3
{
  self->_shutterButtonLongPressCancellationTimeout = a3;
}

- (BOOL)shutterButtonShouldUsePocketDetection
{
  return self->_shutterButtonShouldUsePocketDetection;
}

- (void)setShutterButtonShouldUsePocketDetection:(BOOL)a3
{
  self->_shutterButtonShouldUsePocketDetection = a3;
}

@end