@interface TVRUIDeviceInfo
+ (TVRUIDeviceInfo)currentDeviceInfo;
- (BOOL)hasHomeButton;
- (BOOL)isPad;
- (CGRect)_userIntentButtonRect;
- (CGRect)_volumeDownButtonRect;
- (CGRect)_volumeUpButtonRect;
- (CGRect)volumeButtonsRect;
- (TVRUIDeviceInfo)init;
- (double)_volumeButtonsX;
- (double)volumeButtonHeight;
- (id)_volumeButtonsDictionaryForSpecificHardware;
- (id)description;
- (id)hardwareInfoForOrientation:(int64_t)a3;
- (void)_readPlistForParametersIfNeeded;
- (void)setVolumeButtonHeight:(double)a3;
- (void)setVolumeButtonsRect:(CGRect)a3;
@end

@implementation TVRUIDeviceInfo

+ (TVRUIDeviceInfo)currentDeviceInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return (TVRUIDeviceInfo *)v2;
}

- (TVRUIDeviceInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)TVRUIDeviceInfo;
  result = [(TVRUIDeviceInfo *)&v4 init];
  if (result)
  {
    result->_volumeButtonHeight = 0.0;
    CGSize v3 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    result->_volumeButtonsRect.origin = (CGPoint)*MEMORY[0x263F001A8];
    result->_volumeButtonsRect.size = v3;
  }
  return result;
}

- (BOOL)isPad
{
  id v2 = [MEMORY[0x263F82670] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (BOOL)hasHomeButton
{
  if (hasHomeButton_onceToken != -1) {
    dispatch_once(&hasHomeButton_onceToken, &__block_literal_global_10);
  }
  return hasHomeButton_hasHomeButton;
}

uint64_t __32__TVRUIDeviceInfo_hasHomeButton__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  hasHomeButton_hasHomeButton = result != 2;
  return result;
}

- (id)hardwareInfoForOrientation:(int64_t)a3
{
  [(TVRUIDeviceInfo *)self _userIntentButtonRect];
  double v28 = v5;
  double v29 = v4;
  double v26 = v7;
  double v27 = v6;
  [(TVRUIDeviceInfo *)self _volumeUpButtonRect];
  double v25 = v8;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(TVRUIDeviceInfo *)self _volumeDownButtonRect];
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  [(TVRUIDeviceInfo *)self volumeButtonsRect];
  v23 = -[TVRUIDeviceHardwareInfo initWithUserIntentButton:volumeUpButton:volumeDownButton:volumeTotalHeight:]([TVRUIDeviceHardwareInfo alloc], "initWithUserIntentButton:volumeUpButton:volumeDownButton:volumeTotalHeight:", v29, v28, v27, v26, v25, v10, v12, v14, v16, v18, v20, v22, CGRectGetHeight(v31));
  return v23;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIDeviceInfo isPad](self, "isPad"), @"isPad");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIDeviceInfo hasHomeButton](self, "hasHomeButton"), @"hasHomeButton");
  double v6 = [v3 build];

  return v6;
}

- (CGRect)_volumeUpButtonRect
{
  [(TVRUIDeviceInfo *)self _readPlistForParametersIfNeeded];
  [(TVRUIDeviceInfo *)self _volumeButtonsX];
  double v4 = v3;
  [(TVRUIDeviceInfo *)self volumeButtonsRect];
  CGFloat MinY = CGRectGetMinY(v12);
  [(TVRUIDeviceInfo *)self volumeButtonsRect];
  CGFloat Width = CGRectGetWidth(v13);
  [(TVRUIDeviceInfo *)self volumeButtonHeight];
  double v8 = v7;
  double v9 = v4;
  double v10 = MinY;
  double v11 = Width;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)_volumeDownButtonRect
{
  [(TVRUIDeviceInfo *)self _readPlistForParametersIfNeeded];
  [(TVRUIDeviceInfo *)self _volumeButtonsX];
  double v4 = v3;
  [(TVRUIDeviceInfo *)self volumeButtonsRect];
  double MaxY = CGRectGetMaxY(v14);
  [(TVRUIDeviceInfo *)self volumeButtonHeight];
  double v7 = MaxY - v6;
  [(TVRUIDeviceInfo *)self volumeButtonsRect];
  CGFloat Width = CGRectGetWidth(v15);
  [(TVRUIDeviceInfo *)self volumeButtonHeight];
  double v10 = v9;
  double v11 = v4;
  double v12 = v7;
  double v13 = Width;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_userIntentButtonRect
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__TVRUIDeviceInfo__userIntentButtonRect__block_invoke;
  block[3] = &unk_2647FFF70;
  block[4] = self;
  if (_userIntentButtonRect_onceToken != -1) {
    dispatch_once(&_userIntentButtonRect_onceToken, block);
  }
  id v2 = _TVRUIDeviceInfoLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = NSStringFromCGRect(*(CGRect *)_userIntentButtonRect_frame);
    *(_DWORD *)buf = 138412290;
    double v10 = v3;
    _os_log_impl(&dword_227326000, v2, OS_LOG_TYPE_DEFAULT, "Power button frame - %@", buf, 0xCu);
  }
  double v5 = *(double *)&_userIntentButtonRect_frame[8];
  double v4 = *(double *)_userIntentButtonRect_frame;
  double v6 = *(double *)&_userIntentButtonRect_frame[16];
  double v7 = *(double *)&_userIntentButtonRect_frame[24];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

void __40__TVRUIDeviceInfo__userIntentButtonRect__block_invoke(uint64_t a1)
{
  CFDataRef v2 = (const __CFData *)MGCopyAnswer();
  if (v2)
  {
    CFDataRef v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFDataGetTypeID())
    {
      BytePtr = (long long *)CFDataGetBytePtr(v3);
      long long v6 = BytePtr[1];
      _userIntentButtonRect_frame = *BytePtr;
      *(_OWORD *)&qword_26817A000 = v6;
    }
    CFRelease(v3);
    double v7 = [MEMORY[0x263F82B60] mainScreen];
    [v7 _referenceBounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v35.origin.x = v9;
    v35.origin.y = v11;
    v35.size.width = v13;
    v35.size.height = v15;
    float v16 = CGRectGetWidth(v35) * *(double *)&_userIntentButtonRect_frame;
    double v17 = floorf(v16);
    v36.origin.x = v9;
    v36.origin.y = v11;
    v36.size.width = v13;
    v36.size.height = v15;
    float v18 = CGRectGetHeight(v36) * *((double *)&_userIntentButtonRect_frame + 1);
    float v19 = floorf(v18);
    v37.origin.x = v9;
    v37.origin.y = v11;
    v37.size.width = v13;
    v37.size.height = v15;
    float v20 = CGRectGetWidth(v37) * *(double *)&qword_26817A000;
    float v21 = floorf(v20);
    v38.origin.x = v9;
    v38.origin.y = v11;
    v38.size.width = v13;
    v38.size.height = v15;
    float v22 = CGRectGetHeight(v38) * *(double *)&qword_26817A008;
    double v23 = floorf(v22);
  }
  else
  {
    if (![*(id *)(a1 + 32) hasHomeButton]) {
      return;
    }
    v24 = [MEMORY[0x263F82B60] mainScreen];
    [v24 _referenceBounds];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    v39.origin.x = v26;
    v39.origin.y = v28;
    v39.size.width = v30;
    v39.size.height = v32;
    float Height = CGRectGetHeight(v39);
    float v19 = floorf(Height);
    v40.origin.x = v26;
    v40.origin.y = v28;
    v40.size.width = v30;
    v40.size.height = v32;
    float Width = CGRectGetWidth(v40);
    float v21 = floorf(Width);
    double v17 = 0.0;
    double v23 = 0.0;
  }
  *(double *)&_userIntentButtonRect_frame = v17;
  *((double *)&_userIntentButtonRect_frame + 1) = v19;
  *(double *)&qword_26817A000 = v21;
  qword_26817A008 = *(void *)&v23;
}

- (double)_volumeButtonsX
{
  [(TVRUIDeviceInfo *)self volumeButtonsRect];
  if (CGRectGetWidth(v22) <= 0.0)
  {
    [(TVRUIDeviceInfo *)self volumeButtonsRect];
    if (CGRectGetMinX(v23) <= 0.0)
    {
      return 0.0;
    }
    else
    {
      [(TVRUIDeviceInfo *)self volumeButtonsRect];
      return CGRectGetMinX(*(CGRect *)&v17);
    }
  }
  else
  {
    CFDataRef v3 = [MEMORY[0x263F82B60] mainScreen];
    [v3 bounds];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;

    uint64_t v12 = v5;
    uint64_t v13 = v7;
    uint64_t v14 = v9;
    uint64_t v15 = v11;
    return CGRectGetWidth(*(CGRect *)&v12);
  }
}

- (void)_readPlistForParametersIfNeeded
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_227326000, log, OS_LOG_TYPE_ERROR, "Error loading HardwareInfo plist", v1, 2u);
}

- (id)_volumeButtonsDictionaryForSpecificHardware
{
  v11[2] = *MEMORY[0x263EF8340];
  if (_volumeButtonsDictionaryForSpecificHardware_onceToken != -1) {
    dispatch_once(&_volumeButtonsDictionaryForSpecificHardware_onceToken, &__block_literal_global_33);
  }
  CFDataRef v3 = 0;
  if (_volumeButtonsDictionaryForSpecificHardware_productType <= 2722529671)
  {
    if (_volumeButtonsDictionaryForSpecificHardware_productType > 1434404432)
    {
      if (_volumeButtonsDictionaryForSpecificHardware_productType > 2159747552)
      {
        if (_volumeButtonsDictionaryForSpecificHardware_productType != 2159747553)
        {
          if (_volumeButtonsDictionaryForSpecificHardware_productType != 2309863438) {
            goto LABEL_44;
          }
          uint64_t v9 = @"volumeButtonHeight";
          LODWORD(v2) = 1115815936;
          uint64_t v5 = [NSNumber numberWithFloat:v2];
          uint64_t v6 = (void *)v5;
          uint64_t v10 = @"volumeButtonsRect";
          uint64_t v7 = @"{{0,221},{0,151}}";
          goto LABEL_43;
        }
      }
      else
      {
        if (_volumeButtonsDictionaryForSpecificHardware_productType == 1434404433)
        {
          uint64_t v9 = @"volumeButtonHeight";
          LODWORD(v2) = 1115684864;
          uint64_t v5 = [NSNumber numberWithFloat:v2];
          uint64_t v6 = (void *)v5;
          uint64_t v10 = @"volumeButtonsRect";
          uint64_t v7 = @"{{0,218},{0,152}}";
          goto LABEL_43;
        }
        if (_volumeButtonsDictionaryForSpecificHardware_productType != 2078329141) {
          goto LABEL_44;
        }
      }
      uint64_t v9 = @"volumeButtonHeight";
      LODWORD(v2) = 1115684864;
      uint64_t v5 = [NSNumber numberWithFloat:v2];
      uint64_t v6 = (void *)v5;
      uint64_t v10 = @"volumeButtonsRect";
      uint64_t v7 = @"{{0,79},{0,145}}";
      goto LABEL_43;
    }
    if (_volumeButtonsDictionaryForSpecificHardware_productType > 746003605)
    {
      if (_volumeButtonsDictionaryForSpecificHardware_productType != 746003606)
      {
        uint64_t v4 = 1060988941;
        goto LABEL_27;
      }
      goto LABEL_35;
    }
    if (_volumeButtonsDictionaryForSpecificHardware_productType != 133314240)
    {
      if (_volumeButtonsDictionaryForSpecificHardware_productType != 689804742) {
        goto LABEL_44;
      }
      uint64_t v9 = @"volumeButtonHeight";
      LODWORD(v2) = 1115160576;
      uint64_t v5 = [NSNumber numberWithFloat:v2];
      uint64_t v6 = (void *)v5;
      uint64_t v10 = @"volumeButtonsRect";
      uint64_t v7 = @"{{0,220},{0,155}}";
      goto LABEL_43;
    }
LABEL_36:
    uint64_t v9 = @"volumeButtonHeight";
    LODWORD(v2) = 1116471296;
    uint64_t v5 = [NSNumber numberWithFloat:v2];
    uint64_t v6 = (void *)v5;
    uint64_t v10 = @"volumeButtonsRect";
    uint64_t v7 = @"{{0,227},{0,147}}";
    goto LABEL_43;
  }
  if (_volumeButtonsDictionaryForSpecificHardware_productType <= 3585085678)
  {
    if (_volumeButtonsDictionaryForSpecificHardware_productType <= 2941181570)
    {
      if (_volumeButtonsDictionaryForSpecificHardware_productType == 2722529672)
      {
        uint64_t v9 = @"volumeButtonHeight";
        LODWORD(v2) = 1115160576;
        uint64_t v5 = [NSNumber numberWithFloat:v2];
        uint64_t v6 = (void *)v5;
        uint64_t v10 = @"volumeButtonsRect";
        uint64_t v7 = @"{{0,170},{0,144}}";
      }
      else
      {
        if (_volumeButtonsDictionaryForSpecificHardware_productType != 2793418701) {
          goto LABEL_44;
        }
        uint64_t v9 = @"volumeButtonHeight";
        LODWORD(v2) = 1115684864;
        uint64_t v5 = [NSNumber numberWithFloat:v2];
        uint64_t v6 = (void *)v5;
        uint64_t v10 = @"volumeButtonsRect";
        uint64_t v7 = @"{{0,226},{0,150}}";
      }
      goto LABEL_43;
    }
    if (_volumeButtonsDictionaryForSpecificHardware_productType != 2941181571)
    {
      if (_volumeButtonsDictionaryForSpecificHardware_productType != 3054476161) {
        goto LABEL_44;
      }
      uint64_t v9 = @"volumeButtonHeight";
      LODWORD(v2) = 1112276992;
      uint64_t v5 = [NSNumber numberWithFloat:v2];
      uint64_t v6 = (void *)v5;
      uint64_t v10 = @"volumeButtonsRect";
      uint64_t v7 = @"{{0,170},{1,114}}";
      goto LABEL_43;
    }
    goto LABEL_36;
  }
  if (_volumeButtonsDictionaryForSpecificHardware_productType > 3743999267)
  {
    if (_volumeButtonsDictionaryForSpecificHardware_productType == 3743999268)
    {
      uint64_t v9 = @"volumeButtonHeight";
      LODWORD(v2) = 1115160576;
      uint64_t v5 = [NSNumber numberWithFloat:v2];
      uint64_t v6 = (void *)v5;
      uint64_t v10 = @"volumeButtonsRect";
      uint64_t v7 = @"{{0,152},{0,140}}";
    }
    else
    {
      if (_volumeButtonsDictionaryForSpecificHardware_productType != 3825599860)
      {
        uint64_t v4 = 3885279870;
LABEL_27:
        if (_volumeButtonsDictionaryForSpecificHardware_productType != v4) {
          goto LABEL_44;
        }
        uint64_t v9 = @"volumeButtonHeight";
        LODWORD(v2) = 1116209152;
        uint64_t v5 = [NSNumber numberWithFloat:v2];
        uint64_t v6 = (void *)v5;
        uint64_t v10 = @"volumeButtonsRect";
        uint64_t v7 = @"{{0,184},{0,156}}";
        goto LABEL_43;
      }
      uint64_t v9 = @"volumeButtonHeight";
      LODWORD(v2) = 1115684864;
      uint64_t v5 = [NSNumber numberWithFloat:v2];
      uint64_t v6 = (void *)v5;
      uint64_t v10 = @"volumeButtonsRect";
      uint64_t v7 = @"{{0,224},{0,148}}";
    }
LABEL_43:
    v11[0] = v5;
    v11[1] = v7;
    CFDataRef v3 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v9 count:2];

    goto LABEL_44;
  }
  if (_volumeButtonsDictionaryForSpecificHardware_productType == 3585085679)
  {
    uint64_t v9 = @"volumeButtonHeight";
    LODWORD(v2) = 1115815936;
    uint64_t v5 = [NSNumber numberWithFloat:v2];
    uint64_t v6 = (void *)v5;
    uint64_t v10 = @"volumeButtonsRect";
    uint64_t v7 = @"{{0,219},{0,151}}";
    goto LABEL_43;
  }
  if (_volumeButtonsDictionaryForSpecificHardware_productType == 3677894691)
  {
LABEL_35:
    uint64_t v9 = @"volumeButtonHeight";
    LODWORD(v2) = 1112276992;
    uint64_t v5 = [NSNumber numberWithFloat:v2];
    uint64_t v6 = (void *)v5;
    uint64_t v10 = @"volumeButtonsRect";
    uint64_t v7 = @"{{0,52},{1,114}}";
    goto LABEL_43;
  }
LABEL_44:
  return v3;
}

uint64_t __62__TVRUIDeviceInfo__volumeButtonsDictionaryForSpecificHardware__block_invoke()
{
  uint64_t result = MGGetProductType();
  _volumeButtonsDictionaryForSpecificHardware_productType = result;
  return result;
}

- (double)volumeButtonHeight
{
  return self->_volumeButtonHeight;
}

- (void)setVolumeButtonHeight:(double)a3
{
  self->_volumeButtonfloat Height = a3;
}

- (CGRect)volumeButtonsRect
{
  double x = self->_volumeButtonsRect.origin.x;
  double y = self->_volumeButtonsRect.origin.y;
  double width = self->_volumeButtonsRect.size.width;
  double height = self->_volumeButtonsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVolumeButtonsRect:(CGRect)a3
{
  self->_volumeButtonsRect = a3;
}

@end