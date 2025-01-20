@interface PUAirPlaySettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)compensateForOverscan;
- (BOOL)ignoreMirroredScreens;
- (BOOL)ignoreScreenRecordingScreens;
- (BOOL)switchToMediaPresentationMode;
- (double)maximumZoomForScrollPadding;
- (double)minimumZoomForScrollPadding;
- (double)simulatedScreenContentHeight;
- (double)simulatedScreenContentWidth;
- (id)debugDescription;
- (id)parentSettings;
- (int64_t)routeAvailabilityOverride;
- (unint64_t)placeholderForMirroredScreen;
- (unint64_t)placeholderForSecondScreen;
- (void)setCompensateForOverscan:(BOOL)a3;
- (void)setDefaultValues;
- (void)setIgnoreMirroredScreens:(BOOL)a3;
- (void)setIgnoreScreenRecordingScreens:(BOOL)a3;
- (void)setMaximumZoomForScrollPadding:(double)a3;
- (void)setMinimumZoomForScrollPadding:(double)a3;
- (void)setPlaceholderForMirroredScreen:(unint64_t)a3;
- (void)setPlaceholderForSecondScreen:(unint64_t)a3;
- (void)setRouteAvailabilityOverride:(int64_t)a3;
- (void)setSimulatedScreenContentHeight:(double)a3;
- (void)setSimulatedScreenContentWidth:(double)a3;
- (void)setSwitchToMediaPresentationMode:(BOOL)a3;
@end

@implementation PUAirPlaySettings

- (void)setDefaultValues
{
  [(PUAirPlaySettings *)self setIgnoreScreenRecordingScreens:MEMORY[0x1B3E7A510]([(PUAirPlaySettings *)self setIgnoreMirroredScreens:0])];
  [(PUAirPlaySettings *)self setCompensateForOverscan:0];
  [(PUAirPlaySettings *)self setPlaceholderForMirroredScreen:0];
  [(PUAirPlaySettings *)self setPlaceholderForSecondScreen:2];
  [(PUAirPlaySettings *)self setMinimumZoomForScrollPadding:1.20000005];
  [(PUAirPlaySettings *)self setMaximumZoomForScrollPadding:2.0];
  [(PUAirPlaySettings *)self setSimulatedScreenContentWidth:320.0];
  [(PUAirPlaySettings *)self setSimulatedScreenContentHeight:180.0];
  [(PUAirPlaySettings *)self setRouteAvailabilityOverride:0];
  [(PUAirPlaySettings *)self setSwitchToMediaPresentationMode:1];
}

- (void)setSimulatedScreenContentWidth:(double)a3
{
  self->_simulatedScreenContentWidth = a3;
}

- (void)setSimulatedScreenContentHeight:(double)a3
{
  self->_simulatedScreenContentHeight = a3;
}

- (void)setRouteAvailabilityOverride:(int64_t)a3
{
  self->_routeAvailabilityOverride = a3;
}

- (void)setPlaceholderForSecondScreen:(unint64_t)a3
{
  self->_placeholderForSecondScreen = a3;
}

- (void)setPlaceholderForMirroredScreen:(unint64_t)a3
{
  self->_placeholderForMirroredScreen = a3;
}

- (void)setMinimumZoomForScrollPadding:(double)a3
{
  self->_minimumZoomForScrollPadding = a3;
}

- (void)setMaximumZoomForScrollPadding:(double)a3
{
  self->_maximumZoomForScrollPadding = a3;
}

- (void)setIgnoreScreenRecordingScreens:(BOOL)a3
{
  self->_ignoreScreenRecordingScreens = a3;
}

- (void)setIgnoreMirroredScreens:(BOOL)a3
{
  self->_ignoreMirroredScreens = a3;
}

- (void)setCompensateForOverscan:(BOOL)a3
{
  self->_compensateForOverscan = a3;
}

- (void)setSwitchToMediaPresentationMode:(BOOL)a3
{
  self->_switchToMediaPresentationMode = a3;
}

- (int64_t)routeAvailabilityOverride
{
  return self->_routeAvailabilityOverride;
}

- (double)simulatedScreenContentHeight
{
  return self->_simulatedScreenContentHeight;
}

- (double)simulatedScreenContentWidth
{
  return self->_simulatedScreenContentWidth;
}

- (BOOL)switchToMediaPresentationMode
{
  return self->_switchToMediaPresentationMode;
}

- (double)maximumZoomForScrollPadding
{
  return self->_maximumZoomForScrollPadding;
}

- (double)minimumZoomForScrollPadding
{
  return self->_minimumZoomForScrollPadding;
}

- (unint64_t)placeholderForMirroredScreen
{
  return self->_placeholderForMirroredScreen;
}

- (unint64_t)placeholderForSecondScreen
{
  return self->_placeholderForSecondScreen;
}

- (BOOL)compensateForOverscan
{
  return self->_compensateForOverscan;
}

- (BOOL)ignoreScreenRecordingScreens
{
  return self->_ignoreScreenRecordingScreens;
}

- (BOOL)ignoreMirroredScreens
{
  return self->_ignoreMirroredScreens;
}

- (id)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(PUAirPlaySettings *)self description];
  v5 = [v3 stringWithString:v4];

  if ([(PUAirPlaySettings *)self ignoreMirroredScreens]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v5 appendFormat:@"\n\tIgnore mirrored screens: %@", v6];
  if ([(PUAirPlaySettings *)self ignoreScreenRecordingScreens]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v5 appendFormat:@"\n\tIgnore screen recording screens: %@", v7];
  if ([(PUAirPlaySettings *)self compensateForOverscan]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v5 appendFormat:@"\n\tCompensate for overscan: %@", v8];
  unint64_t v9 = [(PUAirPlaySettings *)self placeholderForMirroredScreen];
  if (v9 > 2) {
    v10 = 0;
  }
  else {
    v10 = off_1E5F23028[v9];
  }
  [v5 appendFormat:@"\n\tMirrored placeholder type: %@", v10];
  unint64_t v11 = [(PUAirPlaySettings *)self placeholderForSecondScreen];
  if (v11 > 2) {
    v12 = 0;
  }
  else {
    v12 = off_1E5F23028[v11];
  }
  [v5 appendFormat:@"\n\tSecond-screen placeholder type: %@", v12];
  [(PUAirPlaySettings *)self minimumZoomForScrollPadding];
  objc_msgSend(v5, "appendFormat:", @"\n\tMin zoom for scroll padding: %f", v13);
  [(PUAirPlaySettings *)self maximumZoomForScrollPadding];
  objc_msgSend(v5, "appendFormat:", @"\n\tMax zoom for scroll padding: %f", v14);
  return v5;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v55[6] = *MEMORY[0x1E4F143B8];
  v46 = (void *)MEMORY[0x1E4F94160];
  v44 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Ignore mirrored screens" valueKeyPath:@"ignoreMirroredScreens"];
  v55[0] = v44;
  v42 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Ignore screen recording screens" valueKeyPath:@"ignoreScreenRecordingScreens"];
  v55[1] = v42;
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Compensate for overscan" valueKeyPath:@"compensateForOverscan"];
  v55[2] = v2;
  v3 = [MEMORY[0x1E4F94108] rowWithTitle:@"Mirrored-screen placeholder" valueKeyPath:@"placeholderForMirroredScreen"];
  v54[0] = @"None";
  v54[1] = @"No content";
  v54[2] = @"Last content";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  v5 = [v3 possibleValues:&unk_1F078AB98 titles:v4];
  v55[3] = v5;
  v6 = [MEMORY[0x1E4F94108] rowWithTitle:@"Second-screen placeholder" valueKeyPath:@"placeholderForSecondScreen"];
  v53[0] = @"None";
  v53[1] = @"No content";
  v53[2] = @"Last content";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
  v8 = [v6 possibleValues:&unk_1F078ABB0 titles:v7];
  v55[4] = v8;
  unint64_t v9 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable HDR (switch to media presentation mode)" valueKeyPath:@"switchToMediaPresentationMode"];
  v55[5] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:6];
  v47 = [v46 sectionWithRows:v10 title:@"AirPlay Screens"];

  unint64_t v11 = (void *)MEMORY[0x1E4F94160];
  v12 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Min zoom for scroll padding" valueKeyPath:@"minimumZoomForScrollPadding"];
  uint64_t v13 = [v12 minValue:1.10000002 maxValue:1.79999995];
  v52[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max zoom for scroll padding" valueKeyPath:@"maximumZoomForScrollPadding"];
  v15 = [v14 minValue:1.79999995 maxValue:2.5];
  v52[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  v45 = [v11 sectionWithRows:v16 title:@"Browsing"];

  v17 = (void *)MEMORY[0x1E4F94160];
  v18 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:output:", @"AirPlay debug info", &__block_literal_global_109);
  v51 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  v43 = [v17 sectionWithRows:v19 title:@"Debugging"];

  v20 = (void *)MEMORY[0x1E4F94160];
  v41 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Toggle Simulated AirPlay Screen", &__block_literal_global_119);
  v50[0] = v41;
  v21 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Width" valueKeyPath:@"simulatedScreenContentWidth"];
  v22 = [v21 minValue:50.0 maxValue:500.0];
  v23 = objc_msgSend(v22, "pu_increment:", 5.0);
  v50[1] = v23;
  v24 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Height" valueKeyPath:@"simulatedScreenContentHeight"];
  v25 = [v24 minValue:50.0 maxValue:500.0];
  v26 = objc_msgSend(v25, "pu_increment:", 5.0);
  v50[2] = v26;
  v27 = [MEMORY[0x1E4F94108] rowWithTitle:@"Route Availability" valueKeyPath:@"routeAvailabilityOverride"];
  v28 = [v27 possibleValues:&unk_1F078ABC8 titles:&unk_1F078ABE0];
  v50[3] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
  v30 = [v20 sectionWithRows:v29 title:@"Simulation"];

  v31 = (void *)MEMORY[0x1E4F94160];
  v32 = (void *)MEMORY[0x1E4F940F8];
  v33 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v34 = [v32 rowWithTitle:@"Restore Defaults" action:v33];
  v49 = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v36 = [v31 sectionWithRows:v35];

  v37 = (void *)MEMORY[0x1E4F94160];
  v48[0] = v47;
  v48[1] = v45;
  v48[2] = v43;
  v48[3] = v30;
  v48[4] = v36;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:5];
  v39 = [v37 moduleWithTitle:@"AirPlay Settings" contents:v38];

  return v39;
}

void __45__PUAirPlaySettings_settingsControllerModule__block_invoke_2()
{
  v0 = (void *)testerAirPlayScreenSimulator;
  if (!testerAirPlayScreenSimulator)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v1 = (void *)getPUTesterAirPlayScreenSimulatorClass_softClass;
    uint64_t v17 = getPUTesterAirPlayScreenSimulatorClass_softClass;
    if (!getPUTesterAirPlayScreenSimulatorClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getPUTesterAirPlayScreenSimulatorClass_block_invoke;
      v13[3] = &unk_1E5F2E228;
      v13[4] = &v14;
      __getPUTesterAirPlayScreenSimulatorClass_block_invoke((uint64_t)v13);
      v1 = (void *)v15[3];
    }
    id v2 = v1;
    _Block_object_dispose(&v14, 8);
    uint64_t v3 = [v2 sharedSimulator];
    v4 = (void *)testerAirPlayScreenSimulator;
    testerAirPlayScreenSimulator = v3;

    v0 = (void *)testerAirPlayScreenSimulator;
  }
  id v12 = v0;
  if ([v12 isScreenVisible])
  {
    [v12 hideScreen];
  }
  else
  {
    v5 = PXFirstViewControllerPassingTest();
    v6 = +[PUAirPlaySettings sharedInstance];
    [v6 simulatedScreenContentWidth];
    double v8 = v7;
    unint64_t v9 = +[PUAirPlaySettings sharedInstance];
    [v9 simulatedScreenContentHeight];
    double v11 = v10;

    objc_msgSend(v12, "showScreenWithContentSize:contentProvider:", v5, v8, v11);
  }
}

uint64_t __45__PUAirPlaySettings_settingsControllerModule__block_invoke_3()
{
  return objc_opt_respondsToSelector() & 1;
}

id __45__PUAirPlaySettings_settingsControllerModule__block_invoke()
{
  v0 = +[PHAirPlayScreenController sharedInstance];
  v1 = [v0 debugDescription];

  return v1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7091 != -1) {
    dispatch_once(&sharedInstance_onceToken_7091, &__block_literal_global_7092);
  }
  id v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __35__PUAirPlaySettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 airPlaySettings];
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;
}

@end