@interface PLDeviceConfiguration
+ (id)defaultDeviceConfiguration;
- (BOOL)isMac;
- (BOOL)isMigrationService;
- (BOOL)isPad;
- (BOOL)isRetina;
- (BOOL)isTV;
- (BOOL)isWatch;
- (BOOL)shouldUseNanoThumbnailFormats;
- (BOOL)supportsASTC;
- (CGSize)logicalScreenSize;
- (PLDeviceConfiguration)initWithLogicalScreenSize:(CGSize)a3 screenScale:(double)a4 deviceClass:(void *)a5 supportsASTC:(BOOL)a6 isMigrationService:(BOOL)a7;
- (double)screenScale;
- (id)description;
- (unint64_t)logicalScreenPixelSize;
- (void)setIsMac:(BOOL)a3;
- (void)setIsMigrationService:(BOOL)a3;
- (void)setIsPad:(BOOL)a3;
- (void)setIsRetina:(BOOL)a3;
- (void)setIsTV:(BOOL)a3;
- (void)setIsWatch:(BOOL)a3;
- (void)setSupportsASTC:(BOOL)a3;
@end

@implementation PLDeviceConfiguration

+ (id)defaultDeviceConfiguration
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PLDeviceConfiguration_defaultDeviceConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultDeviceConfiguration_onceToken != -1) {
    dispatch_once(&defaultDeviceConfiguration_onceToken, block);
  }
  v2 = (void *)defaultDeviceConfiguration_defaultConfiguration;
  return v2;
}

- (BOOL)isRetina
{
  return self->_screenScale > 1.0;
}

- (BOOL)shouldUseNanoThumbnailFormats
{
  return self->_isWatch;
}

- (BOOL)isTV
{
  return self->_isTV;
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (BOOL)isMac
{
  return self->_isMac;
}

- (CGSize)logicalScreenSize
{
  double width = self->_logicalScreenSize.width;
  double height = self->_logicalScreenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

void __51__PLDeviceConfiguration_defaultDeviceConfiguration__block_invoke(uint64_t a1)
{
  v2 = (const void *)MGCopyAnswer();
  id v3 = objc_alloc(*(Class *)(a1 + 32));
  double v4 = PLPhysicalScreenSize();
  double v6 = v5;
  pl_dispatch_once(&PLPhysicalScreenScale_didCheck, &__block_literal_global_202);
  double v7 = *(double *)&PLPhysicalScreenScale_screenScale;
  if (PLDeviceSupportsASTC_s_onceToken != -1) {
    dispatch_once(&PLDeviceSupportsASTC_s_onceToken, &__block_literal_global_496);
  }
  uint64_t v8 = objc_msgSend(v3, "initWithLogicalScreenSize:screenScale:deviceClass:supportsASTC:isMigrationService:", v2, PLDeviceSupportsASTC_s_hasSupport, __PLIsMigrationService, v4, v6, v7);
  v9 = (void *)defaultDeviceConfiguration_defaultConfiguration;
  defaultDeviceConfiguration_defaultConfiguration = v8;

  if (v2)
  {
    CFRelease(v2);
  }
}

- (PLDeviceConfiguration)initWithLogicalScreenSize:(CGSize)a3 screenScale:(double)a4 deviceClass:(void *)a5 supportsASTC:(BOOL)a6 isMigrationService:(BOOL)a7
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)PLDeviceConfiguration;
  v13 = [(PLDeviceConfiguration *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_screenScale = a4;
    v13->_logicalScreenSize.CGFloat width = width;
    v13->_logicalScreenSize.CGFloat height = height;
    v13->_supportsASTC = a6;
    v13->_isMigrationService = a7;
    if (a5)
    {
      v13->_isPad = CFEqual(a5, @"iPad") != 0;
      v14->_isTV = CFEqual(a5, @"AppleTV") != 0;
      v14->_isWatch = CFEqual(a5, @"Watch") != 0;
      v14->_isMac = CFEqual(a5, @"Unicorn") != 0;
    }
  }
  return v14;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setIsMigrationService:(BOOL)a3
{
  self->_isMigrationService = a3;
}

- (BOOL)isMigrationService
{
  return self->_isMigrationService;
}

- (void)setSupportsASTC:(BOOL)a3
{
  self->_supportsASTC = a3;
}

- (BOOL)supportsASTC
{
  return self->_supportsASTC;
}

- (void)setIsMac:(BOOL)a3
{
  self->_isMac = a3;
}

- (void)setIsWatch:(BOOL)a3
{
  self->_isWatch = a3;
}

- (BOOL)isWatch
{
  return self->_isWatch;
}

- (void)setIsTV:(BOOL)a3
{
  self->_isTV = a3;
}

- (void)setIsPad:(BOOL)a3
{
  self->_isPad = a3;
}

- (void)setIsRetina:(BOOL)a3
{
  self->_isRetina = a3;
}

- (unint64_t)logicalScreenPixelSize
{
  return (unint64_t)(self->_logicalScreenSize.width * self->_logicalScreenSize.height);
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PLDeviceConfiguration;
  id v3 = [(PLDeviceConfiguration *)&v6 description];
  double v4 = [v3 stringByAppendingFormat:@" - screen size: (%f, %f), scale: %f, isPad: %d, isWatch: %d, isTV: %d, isMac: %d, isRetina: %d", *(void *)&self->_logicalScreenSize.width, *(void *)&self->_logicalScreenSize.height, *(void *)&self->_screenScale, -[PLDeviceConfiguration isPad](self, "isPad"), -[PLDeviceConfiguration shouldUseNanoThumbnailFormats](self, "shouldUseNanoThumbnailFormats"), -[PLDeviceConfiguration isTV](self, "isTV"), -[PLDeviceConfiguration isMac](self, "isMac"), -[PLDeviceConfiguration isRetina](self, "isRetina")];

  return v4;
}

@end