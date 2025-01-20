@interface DBSFineTuneController
- (DBSFineTuneController)init;
- (id)getMeasuredLuminance:(id)a3;
- (id)getMeasuredWhitePointX:(id)a3;
- (id)getMeasuredWhitePointY:(id)a3;
- (id)getTargetLuminance:(id)a3;
- (id)getTargetWhitePointX:(id)a3;
- (id)getTargetWhitePointY:(id)a3;
- (id)specifiers;
- (void)addOrRemoveTargetFooter;
- (void)openFineTuneHelpLink;
- (void)openTargetOutOfRangeHelpLink;
- (void)restoreDefaults:(id)a3;
- (void)setMeasuredLuminance:(id)a3 forSpecifier:(id)a4;
- (void)setMeasuredWhitePointX:(id)a3 forSpecifier:(id)a4;
- (void)setMeasuredWhitePointY:(id)a3 forSpecifier:(id)a4;
- (void)setTargetLuminance:(id)a3 forSpecifier:(id)a4;
- (void)setTargetWhitePointX:(id)a3 forSpecifier:(id)a4;
- (void)setTargetWhitePointY:(id)a3 forSpecifier:(id)a4;
- (void)updateTargetLuminanceValidationRange;
- (void)updateValidationRanges;
- (void)userDidTapCancel:(id)a3;
- (void)userDidTapDone:(id)a3;
- (void)validateUserAdjustment;
- (void)viewDidLoad;
@end

@implementation DBSFineTuneController

- (DBSFineTuneController)init
{
  v8.receiver = self;
  v8.super_class = (Class)DBSFineTuneController;
  v2 = [(DBSFineTuneController *)&v8 init];
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    xyNumberFormatter = v2->_xyNumberFormatter;
    v2->_xyNumberFormatter = v3;

    [(NSNumberFormatter *)v2->_xyNumberFormatter setNumberStyle:1];
    v5 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    luminanceNumberFormatter = v2->_luminanceNumberFormatter;
    v2->_luminanceNumberFormatter = v5;

    [(NSNumberFormatter *)v2->_luminanceNumberFormatter setNumberStyle:1];
    [(NSNumberFormatter *)v2->_luminanceNumberFormatter setRoundingMode:2];
  }
  return v2;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)DBSFineTuneController;
  [(DBSFineTuneController *)&v10 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_userDidTapCancel_];
  v4 = [(DBSFineTuneController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_userDidTapDone_];
  v6 = [(DBSFineTuneController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  v7 = [(DBSFineTuneController *)self navigationItem];
  objc_super v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:0];

  v9 = DBS_LocalizedStringForDisplays(@"FINE_TUNE");
  [(DBSFineTuneController *)self setTitle:v9];
}

- (id)specifiers
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v49 = (int)*MEMORY[0x263F5FDB8];
    v4 = [(DBSFineTuneController *)self loadSpecifiersFromPlistName:@"FineTune" target:self];
    v5 = [v4 specifierForID:@"RESTORE_DEFAULTS"];
    restoreDefaultsSpecifier = self->_restoreDefaultsSpecifier;
    self->_restoreDefaultsSpecifier = v5;

    v7 = [MEMORY[0x263F15778] mainDisplay];
    objc_super v8 = [v7 currentPreset];
    v9 = [v8 userAdjustment];

    [v9 xDelta];
    v48 = v9;
    if (v10 == 0.0 && ([v9 yDelta], v11 == 0.0) && (objc_msgSend(v9, "luminanceScale"), v12 == 1.0))
    {
      [(PSSpecifier *)self->_restoreDefaultsSpecifier setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
    }
    else
    {
      v13 = [v4 specifierForID:@"RESTORE_DEFAULTS_GROUP"];
      v14 = NSSelectorFromString(&cfstr_Timestamp.isa);
      if (objc_opt_respondsToSelector())
      {
        v15 = (void *)MEMORY[0x263EFF910];
        [v9 v14];
        v16 = objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
        v17 = [MEMORY[0x263F08790] localizedStringFromDate:v16 dateStyle:3 timeStyle:3];
        [v13 setObject:v17 forKeyedSubscript:*MEMORY[0x263F600F8]];
      }
    }
    v18 = [v4 specifierForID:@"MEASURED_WHITE_POINT_X"];
    measuredWhitePointXSpecifier = self->_measuredWhitePointXSpecifier;
    self->_measuredWhitePointXSpecifier = v18;

    v20 = [v4 specifierForID:@"MEASURED_WHITE_POINT_Y"];
    measuredWhitePointYSpecifier = self->_measuredWhitePointYSpecifier;
    self->_measuredWhitePointYSpecifier = v20;

    v22 = [v4 specifierForID:@"MEASURED_LUMINANCE"];
    measuredLuminanceSpecifier = self->_measuredLuminanceSpecifier;
    self->_measuredLuminanceSpecifier = v22;

    v24 = [v4 specifierForID:@"TARGET_WHITE_POINT_X"];
    targetWhitePointXSpecifier = self->_targetWhitePointXSpecifier;
    self->_targetWhitePointXSpecifier = v24;

    v26 = [v4 specifierForID:@"TARGET_WHITE_POINT_Y"];
    targetWhitePointYSpecifier = self->_targetWhitePointYSpecifier;
    self->_targetWhitePointYSpecifier = v26;

    v28 = [v4 specifierForID:@"TARGET_LUMINANCE"];
    targetLuminanceSpecifier = self->_targetLuminanceSpecifier;
    self->_targetLuminanceSpecifier = v28;

    v30 = [v4 specifierForID:@"INTRODUCTION"];
    introductionSpecifier = self->_introductionSpecifier;
    self->_introductionSpecifier = v30;

    v32 = [v4 specifierForID:@"TARGET_GROUP"];
    fineTuneTargetGroupSpecifier = self->_fineTuneTargetGroupSpecifier;
    self->_fineTuneTargetGroupSpecifier = v32;

    uint64_t v34 = *MEMORY[0x263F60038];
    [(PSSpecifier *)self->_measuredWhitePointXSpecifier setObject:&unk_26E9391C0 forKeyedSubscript:*MEMORY[0x263F60038]];
    uint64_t v35 = *MEMORY[0x263F60030];
    [(PSSpecifier *)self->_measuredWhitePointXSpecifier setObject:&unk_26E9391D0 forKeyedSubscript:*MEMORY[0x263F60030]];
    [(PSSpecifier *)self->_measuredWhitePointYSpecifier setObject:&unk_26E9391E0 forKeyedSubscript:v34];
    [(PSSpecifier *)self->_measuredWhitePointYSpecifier setObject:&unk_26E9391F0 forKeyedSubscript:v35];
    [(PSSpecifier *)self->_measuredLuminanceSpecifier setObject:&unk_26E939200 forKeyedSubscript:v34];
    [(PSSpecifier *)self->_measuredLuminanceSpecifier setObject:&unk_26E939210 forKeyedSubscript:v35];
    [(PSSpecifier *)self->_targetWhitePointXSpecifier setObject:&unk_26E9391C0 forKeyedSubscript:v34];
    [(PSSpecifier *)self->_targetWhitePointXSpecifier setObject:&unk_26E9391D0 forKeyedSubscript:v35];
    [(PSSpecifier *)self->_targetWhitePointYSpecifier setObject:&unk_26E9391E0 forKeyedSubscript:v34];
    [(PSSpecifier *)self->_targetWhitePointYSpecifier setObject:&unk_26E9391F0 forKeyedSubscript:v35];
    [(PSSpecifier *)self->_targetLuminanceSpecifier setObject:&unk_26E939200 forKeyedSubscript:v34];
    [(PSSpecifier *)self->_targetLuminanceSpecifier setObject:&unk_26E939210 forKeyedSubscript:v35];
    v36 = DBS_LocalizedStringForFineTune(@"INTRO_MAIN_TEXT");
    v37 = DBS_LocalizedStringForFineTune(@"INTRO_LINK_TEXT");
    v38 = [NSString stringWithFormat:@"%@\n%@", v36, v37];
    v39 = self->_introductionSpecifier;
    v40 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v40);
    [(PSSpecifier *)v39 setProperty:v41 forKey:*MEMORY[0x263F600C0]];

    [(PSSpecifier *)self->_introductionSpecifier setProperty:v38 forKey:*MEMORY[0x263F600E8]];
    v42 = self->_introductionSpecifier;
    v51.location = [v38 rangeOfString:v37];
    v43 = NSStringFromRange(v51);
    [(PSSpecifier *)v42 setProperty:v43 forKey:*MEMORY[0x263F600D0]];

    v44 = self->_introductionSpecifier;
    v45 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [(PSSpecifier *)v44 setProperty:v45 forKey:*MEMORY[0x263F600E0]];

    [(PSSpecifier *)self->_introductionSpecifier setProperty:@"openFineTuneHelpLink" forKey:*MEMORY[0x263F600C8]];
    v46 = *(Class *)((char *)&self->super.super.super.super.super.isa + v49);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v49) = (Class)v4;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v49);
  }
  return v3;
}

- (void)userDidTapCancel:(id)a3
{
  id v3 = [(DBSFineTuneController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)userDidTapDone:(id)a3
{
  currentPreset = self->_currentPreset;
  v5 = objc_msgSend(MEMORY[0x263F15778], "mainDisplay", a3);
  [v5 setCurrentPreset:currentPreset];

  id v6 = [(DBSFineTuneController *)self navigationController];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)updateTargetLuminanceValidationRange
{
  id v3 = [MEMORY[0x263F15778] mainDisplay];
  v4 = [v3 currentPreset];
  id v50 = [v4 userAdjustmentCommand];

  [v50 minXDelta];
  double v6 = v5;
  v7 = [v50 userAdjustment];
  [v7 xDelta];
  double v9 = v6 - v8;

  [v50 maxXDelta];
  double v11 = v10;
  double v12 = [v50 userAdjustment];
  [v12 xDelta];
  double v14 = v11 - v13;

  [v50 minYDelta];
  double v49 = v15;
  v16 = [v50 userAdjustment];
  [v16 yDelta];
  double v18 = v17;

  [v50 maxYDelta];
  double v20 = v19;
  v21 = [v50 userAdjustment];
  [v21 yDelta];
  double v23 = v22;

  [(NSNumber *)self->_targetWhitePointX doubleValue];
  double v25 = v24;
  [(NSNumber *)self->_measuredWhitePointX doubleValue];
  double v27 = v25 - v26;
  [(NSNumber *)self->_targetWhitePointY doubleValue];
  double v29 = v28;
  [(NSNumber *)self->_measuredWhitePointY doubleValue];
  double WhitepointShiftLuminanceLoss = 1.0;
  if (v9 + -0.000001 < v27 && v14 + 0.000001 > v27)
  {
    double v33 = v29 - v30.f64[0];
    if (v49 - v18 + -0.000001 < v29 - v30.f64[0] && v20 - v23 + 0.000001 > v33)
    {
      v30.f64[0] = v27;
      double WhitepointShiftLuminanceLoss = GetWhitepointShiftLuminanceLoss(v30, v33);
    }
  }
  [v50 minLuminanceScale];
  double v36 = v35;
  v37 = [v50 userAdjustment];
  [v37 luminanceScale];
  double v39 = v38;

  [v50 maxLuminanceScale];
  double v41 = v40;
  v42 = [v50 userAdjustment];
  [v42 luminanceScale];
  double v44 = v43;

  if (numberInSpecifierValidationRange(self->_measuredLuminance, self->_measuredLuminanceSpecifier))
  {
    [(NSNumber *)self->_measuredLuminance doubleValue];
    targetLuminanceSpecifier = self->_targetLuminanceSpecifier;
    double v47 = WhitepointShiftLuminanceLoss * v41 / v44 * v46;
    double v48 = WhitepointShiftLuminanceLoss * v36 / v39 * v46;
  }
  else
  {
    targetLuminanceSpecifier = self->_targetLuminanceSpecifier;
    double v48 = 40.0;
    double v47 = 1200.0;
  }
  updateSpecifierValidationRange(targetLuminanceSpecifier, v48, v47);
  [(DBSFineTuneController *)self reloadSpecifier:self->_targetLuminanceSpecifier];
}

- (void)updateValidationRanges
{
  id v3 = [MEMORY[0x263F15778] mainDisplay];
  v4 = [v3 currentPreset];
  id v33 = [v4 userAdjustmentCommand];

  [v33 minXDelta];
  double v6 = v5;
  v7 = [v33 userAdjustment];
  [v7 xDelta];
  double v9 = v8;

  [v33 maxXDelta];
  double v11 = v10;
  double v12 = [v33 userAdjustment];
  [v12 xDelta];
  double v14 = v13;

  [v33 minYDelta];
  double v16 = v15;
  double v17 = [v33 userAdjustment];
  [v17 yDelta];
  double v19 = v18;

  [v33 maxYDelta];
  double v21 = v20;
  double v22 = [v33 userAdjustment];
  [v22 yDelta];
  double v24 = v23;

  if (numberInSpecifierValidationRange(self->_measuredWhitePointX, self->_measuredWhitePointXSpecifier))
  {
    [(NSNumber *)self->_measuredWhitePointX doubleValue];
    targetWhitePointXSpecifier = self->_targetWhitePointXSpecifier;
    double v27 = v11 - v14 + v26;
    double v28 = v6 - v9 + v26;
  }
  else
  {
    targetWhitePointXSpecifier = self->_targetWhitePointXSpecifier;
    double v28 = 0.269;
    double v27 = 0.376;
  }
  updateSpecifierValidationRange(targetWhitePointXSpecifier, v28, v27);
  [(DBSFineTuneController *)self reloadSpecifier:self->_targetWhitePointXSpecifier];
  if (numberInSpecifierValidationRange(self->_measuredWhitePointY, self->_measuredWhitePointYSpecifier))
  {
    [(NSNumber *)self->_measuredWhitePointY doubleValue];
    targetWhitePointYSpecifier = self->_targetWhitePointYSpecifier;
    double v31 = v21 - v24 + v30;
    double v32 = v16 - v19 + v30;
  }
  else
  {
    targetWhitePointYSpecifier = self->_targetWhitePointYSpecifier;
    double v32 = 0.284;
    double v31 = 0.389;
  }
  updateSpecifierValidationRange(targetWhitePointYSpecifier, v32, v31);
  [(DBSFineTuneController *)self reloadSpecifier:self->_targetWhitePointYSpecifier];
  [(DBSFineTuneController *)self updateTargetLuminanceValidationRange];
}

- (void)addOrRemoveTargetFooter
{
  targetWhitePointX = self->_targetWhitePointX;
  if (targetWhitePointX) {
    BOOL v4 = !numberInSpecifierValidationRange(targetWhitePointX, self->_targetWhitePointXSpecifier);
  }
  else {
    BOOL v4 = 0;
  }
  targetWhitePointY = self->_targetWhitePointY;
  if (targetWhitePointY) {
    BOOL v6 = !numberInSpecifierValidationRange(targetWhitePointY, self->_targetWhitePointYSpecifier);
  }
  else {
    BOOL v6 = 0;
  }
  targetLuminance = self->_targetLuminance;
  if (targetLuminance) {
    BOOL v8 = !numberInSpecifierValidationRange(targetLuminance, self->_targetLuminanceSpecifier);
  }
  else {
    BOOL v8 = 0;
  }
  if (v4 || v6 || v8)
  {
    double v9 = DBS_LocalizedStringForFineTune(@"TARGET_OUTOFRANGE_MAIN_TEXT");
    double v10 = DBS_LocalizedStringForFineTune(@"TARGET_LEARNMORE_TEXT");
    double v11 = [NSString stringWithFormat:@"%@ %@", v9, v10];
    fineTuneTargetGroupSpecifier = self->_fineTuneTargetGroupSpecifier;
    double v13 = (objc_class *)objc_opt_class();
    double v14 = NSStringFromClass(v13);
    [(PSSpecifier *)fineTuneTargetGroupSpecifier setProperty:v14 forKey:*MEMORY[0x263F600C0]];

    [(PSSpecifier *)self->_fineTuneTargetGroupSpecifier setProperty:v11 forKey:*MEMORY[0x263F600E8]];
    double v15 = self->_fineTuneTargetGroupSpecifier;
    v22.location = [v11 rangeOfString:v10];
    double v16 = NSStringFromRange(v22);
    [(PSSpecifier *)v15 setProperty:v16 forKey:*MEMORY[0x263F600D0]];

    double v17 = self->_fineTuneTargetGroupSpecifier;
    double v18 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [(PSSpecifier *)v17 setProperty:v18 forKey:*MEMORY[0x263F600E0]];

    [(PSSpecifier *)self->_fineTuneTargetGroupSpecifier setProperty:@"openTargetOutOfRangeHelpLink" forKey:*MEMORY[0x263F600C8]];
  }
  else
  {
    [(PSSpecifier *)self->_fineTuneTargetGroupSpecifier removePropertyForKey:*MEMORY[0x263F600C0]];
    [(PSSpecifier *)self->_fineTuneTargetGroupSpecifier removePropertyForKey:*MEMORY[0x263F600E8]];
    [(PSSpecifier *)self->_fineTuneTargetGroupSpecifier removePropertyForKey:*MEMORY[0x263F600D0]];
    [(PSSpecifier *)self->_fineTuneTargetGroupSpecifier removePropertyForKey:*MEMORY[0x263F600E0]];
    [(PSSpecifier *)self->_fineTuneTargetGroupSpecifier removePropertyForKey:*MEMORY[0x263F600C8]];
  }
  id v20 = [(DBSFineTuneController *)self table];
  double v19 = [MEMORY[0x263F088D0] indexSetWithIndex:2];
  [v20 _reloadSectionHeaderFooters:v19 withRowAnimation:5];
}

- (void)validateUserAdjustment
{
  [(DBSFineTuneController *)self addOrRemoveTargetFooter];
  if (numberInSpecifierValidationRange(self->_measuredWhitePointX, self->_measuredWhitePointXSpecifier)
    && numberInSpecifierValidationRange(self->_measuredWhitePointY, self->_measuredWhitePointYSpecifier)
    && numberInSpecifierValidationRange(self->_measuredLuminance, self->_measuredLuminanceSpecifier)
    && numberInSpecifierValidationRange(self->_targetWhitePointX, self->_targetWhitePointXSpecifier)
    && numberInSpecifierValidationRange(self->_targetWhitePointY, self->_targetWhitePointYSpecifier)
    && numberInSpecifierValidationRange(self->_targetLuminance, self->_targetLuminanceSpecifier))
  {
    id v3 = [MEMORY[0x263F15778] mainDisplay];
    BOOL v4 = [v3 currentPreset];
    currentPreset = self->_currentPreset;
    self->_currentPreset = v4;

    id v23 = [(CADisplayPreset *)self->_currentPreset userAdjustmentCommand];
    if (!v23) {
      goto LABEL_14;
    }
    [(NSNumber *)self->_targetWhitePointX doubleValue];
    double v8 = v7;
    [(NSNumber *)self->_measuredWhitePointX doubleValue];
    double v10 = v8 - v9;
    [(NSNumber *)self->_targetWhitePointY doubleValue];
    double v12 = v11;
    [(NSNumber *)self->_measuredWhitePointY doubleValue];
    double v14 = v12 - v13;
    [(NSNumber *)self->_targetLuminance doubleValue];
    double v16 = v15;
    [(NSNumber *)self->_measuredLuminance doubleValue];
    char v18 = [v23 transformWhitePointByXDelta:v10 yDelta:v14 luminanceScale:v16 / v17];
    id v6 = v23;
    if (v18)
    {
      [(CADisplayPreset *)self->_currentPreset applyUserAdjustmentCommand:v23];
      double v19 = [(DBSFineTuneController *)self navigationItem];
      id v20 = [v19 rightBarButtonItem];
      double v21 = v20;
      uint64_t v22 = 1;
    }
    else
    {
LABEL_14:
      double v19 = [(DBSFineTuneController *)self navigationItem];
      id v20 = [v19 rightBarButtonItem];
      double v21 = v20;
      uint64_t v22 = 0;
    }
    [v20 setEnabled:v22];
  }
  else
  {
    id v23 = [(DBSFineTuneController *)self navigationItem];
    double v19 = [v23 rightBarButtonItem];
    [v19 setEnabled:0];
  }
}

- (id)getMeasuredWhitePointX:(id)a3
{
  return [(NSNumberFormatter *)self->_xyNumberFormatter stringFromNumber:self->_measuredWhitePointX];
}

- (void)setMeasuredWhitePointX:(id)a3 forSpecifier:(id)a4
{
  -[NSNumberFormatter numberFromString:](self->_xyNumberFormatter, "numberFromString:", a3, a4);
  double v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  measuredWhitePointX = self->_measuredWhitePointX;
  self->_measuredWhitePointX = v5;

  [(DBSFineTuneController *)self updateValidationRanges];
  [(DBSFineTuneController *)self validateUserAdjustment];
}

- (id)getMeasuredWhitePointY:(id)a3
{
  return [(NSNumberFormatter *)self->_xyNumberFormatter stringFromNumber:self->_measuredWhitePointY];
}

- (void)setMeasuredWhitePointY:(id)a3 forSpecifier:(id)a4
{
  -[NSNumberFormatter numberFromString:](self->_xyNumberFormatter, "numberFromString:", a3, a4);
  double v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  measuredWhitePointY = self->_measuredWhitePointY;
  self->_measuredWhitePointY = v5;

  [(DBSFineTuneController *)self updateValidationRanges];
  [(DBSFineTuneController *)self validateUserAdjustment];
}

- (id)getMeasuredLuminance:(id)a3
{
  return [(NSNumberFormatter *)self->_luminanceNumberFormatter stringFromNumber:self->_measuredLuminance];
}

- (void)setMeasuredLuminance:(id)a3 forSpecifier:(id)a4
{
  -[NSNumberFormatter numberFromString:](self->_luminanceNumberFormatter, "numberFromString:", a3, a4);
  double v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  measuredLuminance = self->_measuredLuminance;
  self->_measuredLuminance = v5;

  [(DBSFineTuneController *)self updateValidationRanges];
  [(DBSFineTuneController *)self validateUserAdjustment];
}

- (id)getTargetWhitePointX:(id)a3
{
  return [(NSNumberFormatter *)self->_xyNumberFormatter stringFromNumber:self->_targetWhitePointX];
}

- (void)setTargetWhitePointX:(id)a3 forSpecifier:(id)a4
{
  -[NSNumberFormatter numberFromString:](self->_xyNumberFormatter, "numberFromString:", a3, a4);
  double v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  targetWhitePointX = self->_targetWhitePointX;
  self->_targetWhitePointX = v5;

  [(DBSFineTuneController *)self updateTargetLuminanceValidationRange];
  [(DBSFineTuneController *)self validateUserAdjustment];
}

- (id)getTargetWhitePointY:(id)a3
{
  return [(NSNumberFormatter *)self->_xyNumberFormatter stringFromNumber:self->_targetWhitePointY];
}

- (void)setTargetWhitePointY:(id)a3 forSpecifier:(id)a4
{
  -[NSNumberFormatter numberFromString:](self->_xyNumberFormatter, "numberFromString:", a3, a4);
  double v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  targetWhitePointY = self->_targetWhitePointY;
  self->_targetWhitePointY = v5;

  [(DBSFineTuneController *)self updateTargetLuminanceValidationRange];
  [(DBSFineTuneController *)self validateUserAdjustment];
}

- (id)getTargetLuminance:(id)a3
{
  return [(NSNumberFormatter *)self->_luminanceNumberFormatter stringFromNumber:self->_targetLuminance];
}

- (void)setTargetLuminance:(id)a3 forSpecifier:(id)a4
{
  -[NSNumberFormatter numberFromString:](self->_luminanceNumberFormatter, "numberFromString:", a3, a4);
  double v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  targetLuminance = self->_targetLuminance;
  self->_targetLuminance = v5;

  [(DBSFineTuneController *)self validateUserAdjustment];
}

- (void)restoreDefaults:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263F15778], "mainDisplay", a3);
  double v5 = [v4 currentPreset];
  currentPreset = self->_currentPreset;
  self->_currentPreset = v5;

  double v7 = [(CADisplayPreset *)self->_currentPreset userAdjustmentCommand];
  id v21 = v7;
  if (!v7) {
    goto LABEL_4;
  }
  double v8 = [v7 userAdjustment];
  [v8 xDelta];
  double v10 = -v9;

  double v11 = [v21 userAdjustment];
  [v11 yDelta];
  double v13 = -v12;

  double v14 = [v21 userAdjustment];
  [v14 luminanceScale];
  double v16 = 1.0 / v15;

  if ([v21 transformWhitePointByXDelta:v10 yDelta:v13 luminanceScale:v16])
  {
    [(CADisplayPreset *)self->_currentPreset applyUserAdjustmentCommand:v21];
    double v17 = self->_currentPreset;
    char v18 = [MEMORY[0x263F15778] mainDisplay];
    [v18 setCurrentPreset:v17];

    [(PSSpecifier *)self->_restoreDefaultsSpecifier setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
    [(DBSFineTuneController *)self reloadSpecifier:self->_restoreDefaultsSpecifier];
    double v19 = [(DBSFineTuneController *)self navigationController];
    [v19 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
LABEL_4:
    double v19 = [(DBSFineTuneController *)self navigationItem];
    id v20 = [v19 rightBarButtonItem];
    [v20 setEnabled:0];
  }
}

- (void)openFineTuneHelpLink
{
  id v3 = [MEMORY[0x263F82438] sharedApplication];
  v2 = [NSURL URLWithString:@"https://support.apple.com/HT213349?cid=mc-ols-ipad-article_ht213349-ipados_ui-10022023#calibrate"];
  [v3 openURL:v2 withCompletionHandler:&__block_literal_global_2];
}

void __45__DBSFineTuneController_openFineTuneHelpLink__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = DBSLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_235D7B000, v2, OS_LOG_TYPE_DEFAULT, "Failed to open Fine-Tune support url.", v3, 2u);
    }
  }
}

- (void)openTargetOutOfRangeHelpLink
{
  id v3 = [MEMORY[0x263F82438] sharedApplication];
  v2 = [NSURL URLWithString:@"https://support.apple.com/ht213349?cid=mc-ols-ipad-article_ht213349-ipados_ui-10022023#range-limits"];
  [v3 openURL:v2 withCompletionHandler:&__block_literal_global_95];
}

void __53__DBSFineTuneController_openTargetOutOfRangeHelpLink__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = DBSLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_235D7B000, v2, OS_LOG_TYPE_DEFAULT, "Failed to open Fine-Tune support url.", v3, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fineTuneTargetGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_introductionSpecifier, 0);
  objc_storeStrong((id *)&self->_restoreDefaultsSpecifier, 0);
  objc_storeStrong((id *)&self->_targetLuminanceSpecifier, 0);
  objc_storeStrong((id *)&self->_targetWhitePointYSpecifier, 0);
  objc_storeStrong((id *)&self->_targetWhitePointXSpecifier, 0);
  objc_storeStrong((id *)&self->_measuredLuminanceSpecifier, 0);
  objc_storeStrong((id *)&self->_measuredWhitePointYSpecifier, 0);
  objc_storeStrong((id *)&self->_measuredWhitePointXSpecifier, 0);
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_targetLuminance, 0);
  objc_storeStrong((id *)&self->_targetWhitePointY, 0);
  objc_storeStrong((id *)&self->_targetWhitePointX, 0);
  objc_storeStrong((id *)&self->_measuredLuminance, 0);
  objc_storeStrong((id *)&self->_measuredWhitePointY, 0);
  objc_storeStrong((id *)&self->_measuredWhitePointX, 0);
  objc_storeStrong((id *)&self->_luminanceNumberFormatter, 0);
  objc_storeStrong((id *)&self->_xyNumberFormatter, 0);
}

@end