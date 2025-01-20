@interface VGHRTFSessionConfig
- (BOOL)writeDebugData;
- (NSString)debugDataRootPath;
- (NSString)modelsRootPath;
- (NSString)version;
- (VGHRTFSessionUpdateDelegate)delegate;
- (void)overwriteWithDefaults;
- (void)setDebugDataRootPath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setModelsRootPath:(id)a3;
- (void)setVersion:(id)a3;
- (void)setWriteDebugData:(BOOL)a3;
@end

@implementation VGHRTFSessionConfig

- (void)overwriteWithDefaults
{
  id v7 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.visage"];
  v3 = [v7 objectForKey:@"writeDebugDataHRTF"];

  if (v3) {
    self->_writeDebugData = [v7 BOOLForKey:@"writeDebugDataHRTF"];
  }
  v4 = [v7 objectForKey:@"debugDataRootPathHRTF"];

  if (v4)
  {
    v5 = [v7 stringForKey:@"debugDataRootPathHRTF"];
    debugDataRootPath = self->_debugDataRootPath;
    self->_debugDataRootPath = v5;
  }
}

- (BOOL)writeDebugData
{
  return self->_writeDebugData;
}

- (void)setWriteDebugData:(BOOL)a3
{
  self->_writeDebugData = a3;
}

- (NSString)modelsRootPath
{
  return self->_modelsRootPath;
}

- (void)setModelsRootPath:(id)a3
{
}

- (NSString)debugDataRootPath
{
  return self->_debugDataRootPath;
}

- (void)setDebugDataRootPath:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (VGHRTFSessionUpdateDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_debugDataRootPath, 0);

  objc_storeStrong((id *)&self->_modelsRootPath, 0);
}

@end