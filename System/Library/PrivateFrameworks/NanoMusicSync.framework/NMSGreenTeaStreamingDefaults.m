@interface NMSGreenTeaStreamingDefaults
+ (id)sharedInstance;
- (BOOL)_BOOLForKey:(id)a3;
- (BOOL)greenTeaMusicAllowCellularForHighQualityStreaming;
- (BOOL)greenTeaMusicAllowCellularForStreaming;
- (BOOL)greenTeaMusicAllowsDownloadsOverCellular;
- (BOOL)greenTeaMusicIsMirroringStreamingSettings;
- (NMSGreenTeaStreamingDefaults)init;
- (void)_setBool:(BOOL)a3 forKey:(id)a4;
- (void)setGreenTeaMusicAllowCellularForHighQualityStreaming:(BOOL)a3;
- (void)setGreenTeaMusicAllowCellularForStreaming:(BOOL)a3;
- (void)setGreenTeaMusicAllowsDownloadsOverCellular:(BOOL)a3;
- (void)setGreenTeaMusicIsMirroringStreamingSettings:(BOOL)a3;
@end

@implementation NMSGreenTeaStreamingDefaults

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NMSGreenTeaStreamingDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

uint64_t __46__NMSGreenTeaStreamingDefaults_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (NMSGreenTeaStreamingDefaults)init
{
  v6.receiver = self;
  v6.super_class = (Class)NMSGreenTeaStreamingDefaults;
  v2 = [(NMSGreenTeaStreamingDefaults *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.NanoMusicSync"];
    sharedDefaults = v2->_sharedDefaults;
    v2->_sharedDefaults = (NSUserDefaults *)v3;
  }
  return v2;
}

- (BOOL)greenTeaMusicIsMirroringStreamingSettings
{
  return [(NMSGreenTeaStreamingDefaults *)self _BOOLForKey:@"GreenTeaMobileIpodCellularKeysAreMirrored"];
}

- (void)setGreenTeaMusicIsMirroringStreamingSettings:(BOOL)a3
{
}

- (BOOL)greenTeaMusicAllowCellularForStreaming
{
  return [(NMSGreenTeaStreamingDefaults *)self _BOOLForKey:@"GreenTeaMusicAllowsCellularData"];
}

- (void)setGreenTeaMusicAllowCellularForStreaming:(BOOL)a3
{
}

- (BOOL)greenTeaMusicAllowCellularForHighQualityStreaming
{
  return [(NMSGreenTeaStreamingDefaults *)self _BOOLForKey:@"GreenTeaMusicAllowsHighQualityStreamingOnCellular"];
}

- (void)setGreenTeaMusicAllowCellularForHighQualityStreaming:(BOOL)a3
{
}

- (BOOL)greenTeaMusicAllowsDownloadsOverCellular
{
  return [(NMSGreenTeaStreamingDefaults *)self _BOOLForKey:@"GreenTeaMusicAllowsDownloadsOverCellular"];
}

- (void)setGreenTeaMusicAllowsDownloadsOverCellular:(BOOL)a3
{
}

- (BOOL)_BOOLForKey:(id)a3
{
  uint64_t v3 = self;
  sharedDefaults = self->_sharedDefaults;
  id v5 = a3;
  [(NSUserDefaults *)sharedDefaults synchronize];
  LOBYTE(v3) = [(NSUserDefaults *)v3->_sharedDefaults BOOLForKey:v5];

  return (char)v3;
}

- (void)_setBool:(BOOL)a3 forKey:(id)a4
{
  [(NSUserDefaults *)self->_sharedDefaults setBool:a3 forKey:a4];
  sharedDefaults = self->_sharedDefaults;

  [(NSUserDefaults *)sharedDefaults synchronize];
}

- (void).cxx_destruct
{
}

@end