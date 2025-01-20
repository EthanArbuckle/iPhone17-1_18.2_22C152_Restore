@interface PDUserDefaults
+ (id)defaults;
- (BOOL)disableDynamicHS2;
- (BOOL)doubleBounceFlagOnly;
- (BOOL)enableDepthPerPixel;
- (BOOL)enableMacroRanges;
- (BOOL)ignoreWarperMesh;
- (BOOL)loopDxpResults;
- (BOOL)replayFirstFrame;
- (BOOL)storeRawFramesInPointCloud;
- (NSString)dumpIspPeridotCalibPath;
- (NSString)dumpPointCloudsPath;
- (NSString)dumpRawFramesPath;
- (NSString)dumpWarperMeshesPath;
- (PDUserDefaults)init;
- (float)reflectivityFilterThreshold;
- (id)getObjectForKey:(id)a3 from:(id)a4 withDefaultValue:(id)a5;
- (unsigned)gmoCfgBits;
@end

@implementation PDUserDefaults

- (BOOL)loopDxpResults
{
  return self->_loopDxpResults;
}

- (NSString)dumpRawFramesPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)dumpPointCloudsPath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

+ (id)defaults
{
  {
    +[PDUserDefaults defaults]::res = objc_alloc_init(PDUserDefaults);
  }
  v2 = (void *)+[PDUserDefaults defaults]::res;
  return v2;
}

- (BOOL)storeRawFramesInPointCloud
{
  return self->_storeRawFramesInPointCloud;
}

- (unsigned)gmoCfgBits
{
  return self->_gmoCfgBits;
}

- (BOOL)doubleBounceFlagOnly
{
  return self->_doubleBounceFlagOnly;
}

- (BOOL)enableMacroRanges
{
  return self->_enableMacroRanges;
}

- (BOOL)enableDepthPerPixel
{
  return self->_enableDepthPerPixel;
}

- (NSString)dumpIspPeridotCalibPath
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)disableDynamicHS2
{
  return self->_disableDynamicHS2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dumpIspPeridotCalibPath, 0);
  objc_storeStrong((id *)&self->_dumpPointCloudsPath, 0);
  objc_storeStrong((id *)&self->_dumpRawFramesPath, 0);
  objc_storeStrong((id *)&self->_dumpWarperMeshesPath, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (NSString)dumpWarperMeshesPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)ignoreWarperMesh
{
  return self->_ignoreWarperMesh;
}

- (BOOL)replayFirstFrame
{
  return self->_replayFirstFrame;
}

- (float)reflectivityFilterThreshold
{
  return self->_reflectivityFilterThreshold;
}

- (id)getObjectForKey:(id)a3 from:(id)a4 withDefaultValue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [@"com.apple.PeridotDepth." stringByAppendingString:v7];
  uint64_t v11 = [v8 objectForKey:v10];
  v12 = (void *)v11;
  v13 = v9;
  if (v11)
  {
    NSLog(&cfstr_WarningRunning.isa, v7, v11);
    v13 = v12;
  }
  id v14 = v13;

  return v14;
}

- (PDUserDefaults)init
{
  v31.receiver = self;
  v31.super_class = (Class)PDUserDefaults;
  v2 = [(PDUserDefaults *)&v31 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v4 = [(PDUserDefaults *)v2 getObjectForKey:@"ReflectivityFilterThreshold" from:v3 withDefaultValue:&unk_27071DBF0];
    [v4 floatValue];
    v2->_reflectivityFilterThreshold = v5;

    v6 = [(PDUserDefaults *)v2 getObjectForKey:@"ReplayFirstFrame" from:v3 withDefaultValue:MEMORY[0x263EFFA80]];
    v2->_replayFirstFrame = [v6 BOOLValue];

    id v7 = [(PDUserDefaults *)v2 getObjectForKey:@"IgnoreWarperMesh" from:v3 withDefaultValue:MEMORY[0x263EFFA80]];
    v2->_ignoreWarperMesh = [v7 BOOLValue];

    uint64_t v8 = [(PDUserDefaults *)v2 getObjectForKey:@"DumpWarperMeshesPath" from:v3 withDefaultValue:0];
    dumpWarperMeshesPath = v2->_dumpWarperMeshesPath;
    v2->_dumpWarperMeshesPath = (NSString *)v8;

    uint64_t v10 = [(PDUserDefaults *)v2 getObjectForKey:@"DumpRawFramesPath" from:v3 withDefaultValue:0];
    dumpRawFramesPath = v2->_dumpRawFramesPath;
    v2->_dumpRawFramesPath = (NSString *)v10;

    uint64_t v12 = [(PDUserDefaults *)v2 getObjectForKey:@"DumpPointCloudsPath" from:v3 withDefaultValue:0];
    dumpPointCloudsPath = v2->_dumpPointCloudsPath;
    v2->_dumpPointCloudsPath = (NSString *)v12;

    uint64_t v14 = [(PDUserDefaults *)v2 getObjectForKey:@"DumpIspPeridotCalibPath" from:v3 withDefaultValue:0];
    dumpIspPeridotCalibPath = v2->_dumpIspPeridotCalibPath;
    v2->_dumpIspPeridotCalibPath = (NSString *)v14;

    v16 = [(PDUserDefaults *)v2 getObjectForKey:@"StoreRawFramesInPointCloud" from:v3 withDefaultValue:MEMORY[0x263EFFA80]];
    v2->_storeRawFramesInPointCloud = [v16 BOOLValue];

    v17 = [(PDUserDefaults *)v2 getObjectForKey:@"DisableDynamicHS2" from:v3 withDefaultValue:MEMORY[0x263EFFA80]];
    v2->_disableDynamicHS2 = [v17 BOOLValue];

    v18 = [(PDUserDefaults *)v2 getObjectForKey:@"EnableDepthPerPixel" from:v3 withDefaultValue:MEMORY[0x263EFFA80]];
    v2->_enableDepthPerPixel = [v18 BOOLValue];

    v19 = [(PDUserDefaults *)v2 getObjectForKey:@"EnableMacroRanges" from:v3 withDefaultValue:MEMORY[0x263EFFA88]];
    v2->_enableMacroRanges = [v19 BOOLValue];

    v20 = [(PDUserDefaults *)v2 getObjectForKey:@"LoopDxpResults" from:v3 withDefaultValue:MEMORY[0x263EFFA80]];
    v2->_loopDxpResults = [v20 BOOLValue];

    v21 = [(PDUserDefaults *)v2 getObjectForKey:@"DoubleBounceFlagOnly" from:v3 withDefaultValue:MEMORY[0x263EFFA80]];
    v2->_doubleBounceFlagOnly = [v21 BOOLValue];

    v22 = [MEMORY[0x263F08850] defaultManager];
    v23 = v22;
    v24 = v2->_dumpWarperMeshesPath;
    if (v24) {
      [v22 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v25 = v2->_dumpRawFramesPath;
    if (v25) {
      [v23 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v26 = v2->_dumpPointCloudsPath;
    if (v26) {
      [v23 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v27 = v2->_dumpIspPeridotCalibPath;
    if (v27) {
      [v23 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v28 = [(PDUserDefaults *)v2 getObjectForKey:@"GmoFlowBits" from:v3 withDefaultValue:&unk_27071DC00];
    v2->_gmoCfgBits = [v28 unsignedIntValue];

    v29 = [(PDUserDefaults *)v2 getObjectForKey:@"PerformanceOverridePath" from:v3 withDefaultValue:0];
    if (v29) {
      [MEMORY[0x263F26C98] setPerformanceOverrides:v29];
    }
  }
  return v2;
}

@end