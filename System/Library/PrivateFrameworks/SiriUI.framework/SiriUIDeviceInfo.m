@interface SiriUIDeviceInfo
+ (id)sharedInstance;
- (BOOL)deviceShouldDeferFlamesView;
- (BOOL)deviceShouldFreezeAura;
- (BOOL)deviceShouldSkipGuidePreloading;
- (BOOL)deviceShouldUseFrozenBackdropSnapshot;
- (BOOL)deviceSupportsProximitySensor;
- (BOOL)isDeviceZoomed;
- (BOOL)isLargeFormatPhone;
- (SiriUIDeviceInfo)initWithLargeFormatPhone:(BOOL)a3 gestaltModes:(id)a4 screenSize:(CGSize)a5;
- (void)_updateProductTypeDerivedProperties;
@end

@implementation SiriUIDeviceInfo

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SiriUIDeviceInfo_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

void __34__SiriUIDeviceInfo_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v2 = MGGetBoolAnswer();
  id v10 = (id)MGCopyAnswer();
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 _referenceBounds];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithLargeFormatPhone:gestaltModes:screenSize:", v2, v10, v5, v7);
  v9 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = v8;
}

- (SiriUIDeviceInfo)initWithLargeFormatPhone:(BOOL)a3 gestaltModes:(id)a4 screenSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SiriUIDeviceInfo;
  id v10 = [(SiriUIDeviceInfo *)&v20 init];
  if (v10)
  {
    v10->_deviceSupportsProximitySensor = MGGetBoolAnswer();
    v10->_largeFormatPhone = a3;
    if (v9)
    {
      v11 = [v9 objectForKeyedSubscript:@"zoomed"];
      if ((unint64_t)[v11 count] < 4)
      {
        BOOL v15 = 0;
      }
      else
      {
        v12 = [v11 objectAtIndexedSubscript:1];
        uint64_t v13 = [v11 objectAtIndexedSubscript:3];
        v14 = (void *)v13;
        BOOL v15 = 0;
        if (v12 && v13)
        {
          [v12 floatValue];
          double v17 = v16;
          [v14 floatValue];
          BOOL v15 = height == v18 && width == v17;
        }
      }
    }
    else
    {
      BOOL v15 = 0;
    }
    v10->_deviceZoomed = v15;
    [(SiriUIDeviceInfo *)v10 _updateProductTypeDerivedProperties];
  }

  return v10;
}

- (void)_updateProductTypeDerivedProperties
{
  BOOL v3 = 1;
  uint64_t v4 = MGGetProductType();
  if (v4 <= 1737882205)
  {
    if (v4 == 445396642) {
      goto LABEL_9;
    }
    uint64_t v5 = 1701146937;
  }
  else
  {
    if (v4 == 1737882206 || v4 == 3637438250) {
      goto LABEL_9;
    }
    uint64_t v5 = 3933982784;
  }
  if (v4 != v5) {
    BOOL v3 = 0;
  }
LABEL_9:
  self->_deviceShouldUseFrozenBackdropSnapshot = v3;
  self->_deviceShouldFreezeAura = v3;
  self->_deviceShouldDeferFlamesView = v3;
  self->_deviceShouldSkipGuidePreloading = v3;
}

- (BOOL)isDeviceZoomed
{
  return self->_deviceZoomed;
}

- (BOOL)isLargeFormatPhone
{
  return self->_largeFormatPhone;
}

- (BOOL)deviceShouldUseFrozenBackdropSnapshot
{
  return self->_deviceShouldUseFrozenBackdropSnapshot;
}

- (BOOL)deviceShouldFreezeAura
{
  return self->_deviceShouldFreezeAura;
}

- (BOOL)deviceShouldDeferFlamesView
{
  return self->_deviceShouldDeferFlamesView;
}

- (BOOL)deviceSupportsProximitySensor
{
  return self->_deviceSupportsProximitySensor;
}

- (BOOL)deviceShouldSkipGuidePreloading
{
  return self->_deviceShouldSkipGuidePreloading;
}

@end