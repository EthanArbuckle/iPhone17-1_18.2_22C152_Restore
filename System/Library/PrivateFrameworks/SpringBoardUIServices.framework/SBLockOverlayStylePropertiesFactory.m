@interface SBLockOverlayStylePropertiesFactory
+ (id)overlayPropertiesFactoryWithStyle:(unint64_t)a3;
- (SBLockOverlayStylePropertiesFactory)initWithStyle:(unint64_t)a3;
- (id)_fetchAndCachePropsForDeviceQuality:(int64_t)a3;
- (id)propertiesWithDeviceDefaultGraphicsQuality;
- (unint64_t)style;
@end

@implementation SBLockOverlayStylePropertiesFactory

+ (id)overlayPropertiesFactoryWithStyle:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithStyle:a3];
  return v3;
}

- (SBLockOverlayStylePropertiesFactory)initWithStyle:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBLockOverlayStylePropertiesFactory;
  v4 = [(SBLockOverlayStylePropertiesFactory *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceQualityToProperties = v5->_deviceQualityToProperties;
    v5->_deviceQualityToProperties = v6;
  }
  return v5;
}

- (id)propertiesWithDeviceDefaultGraphicsQuality
{
  uint64_t v3 = SBUIGraphicsQuality();
  return [(SBLockOverlayStylePropertiesFactory *)self propertiesWithGraphicsQuality:v3];
}

- (id)_fetchAndCachePropsForDeviceQuality:(int64_t)a3
{
  v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  v6 = [(NSMutableDictionary *)self->_deviceQualityToProperties objectForKey:v5];
  if (!v6)
  {
    v6 = [[SBLockOverlayStyleProperties alloc] initWithStyle:self->_style quality:a3];
    [(NSMutableDictionary *)self->_deviceQualityToProperties setObject:v6 forKey:v5];
  }

  return v6;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end