@interface OBDevice
+ (id)currentDevice;
- (BOOL)hasHomeButton;
- (BOOL)isMiniPad;
- (unint64_t)templateType;
- (unint64_t)templateTypeForBoundsWidth:(double)a3;
- (unint64_t)type;
- (void)setHasHomeButton:(BOOL)a3;
- (void)setTemplateType:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation OBDevice

+ (id)currentDevice
{
  if (currentDevice_onceToken != -1) {
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)currentDevice_currentDevice;
  return v2;
}

uint64_t __25__OBDevice_currentDevice__block_invoke()
{
  v0 = objc_alloc_init(OBDevice);
  v1 = (void *)currentDevice_currentDevice;
  currentDevice_currentDevice = (uint64_t)v0;

  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (CFStringCompare(v2, @"iPad", 0)) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(id)currentDevice_currentDevice setType:v3];
  if (v2) {
    CFRelease(v2);
  }
  int v4 = MGGetSInt32Answer();
  v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  if ([(id)currentDevice_currentDevice type] == 1)
  {
    switch(v4)
    {
      case 5:
        v10 = (void *)currentDevice_currentDevice;
        uint64_t v11 = 5;
        goto LABEL_19;
      case 8:
      case 9:
      case 22:
        v10 = (void *)currentDevice_currentDevice;
        uint64_t v11 = 4;
        goto LABEL_19;
      case 10:
        v10 = (void *)currentDevice_currentDevice;
        uint64_t v11 = 3;
        goto LABEL_19;
      case 15:
      case 19:
      case 24:
      case 30:
      case 36:
        v10 = (void *)currentDevice_currentDevice;
        goto LABEL_15;
      case 18:
      case 25:
      case 31:
      case 37:
        v10 = (void *)currentDevice_currentDevice;
        if (v7 < 414.0 || v9 < 896.0) {
LABEL_15:
        }
          uint64_t v11 = 2;
        else {
          uint64_t v11 = 1;
        }
        goto LABEL_19;
      default:
        goto LABEL_20;
    }
  }
  v10 = (void *)currentDevice_currentDevice;
  uint64_t v11 = 6;
LABEL_19:
  [v10 setTemplateType:v11];
LABEL_20:
  BOOL v13 = MGGetSInt32Answer() != 2;
  v14 = (void *)currentDevice_currentDevice;
  return [v14 setHasHomeButton:v13];
}

- (unint64_t)templateTypeForBoundsWidth:(double)a3
{
  if (a3 <= 320.0) {
    return 7;
  }
  if (a3 >= 744.0) {
    return 6;
  }
  if (a3 >= 414.0) {
    return 9;
  }
  return 8;
}

- (BOOL)isMiniPad
{
  BOOL v2 = 1;
  uint64_t v3 = MGGetProductType();
  if (v3 > 2903084587)
  {
    if (v3 == 2903084588) {
      return v2;
    }
    uint64_t v4 = 3184375231;
  }
  else
  {
    if (v3 == 88647037) {
      return v2;
    }
    uint64_t v4 = 1895344378;
  }
  if (v3 != v4) {
    return 0;
  }
  return v2;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (void)setTemplateType:(unint64_t)a3
{
  self->_templateType = a3;
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (void)setHasHomeButton:(BOOL)a3
{
  self->_hasHomeButton = a3;
}

@end