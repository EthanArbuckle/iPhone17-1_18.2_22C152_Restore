@interface SiriTTSAudioHardware
+ (id)defaultOutput;
- (BOOL)duckOthers;
- (BOOL)isAppleProduct;
- (BOOL)isBluetooth;
- (NSString)routeType;
- (float)volume;
- (int64_t)productId;
- (int64_t)vendorId;
- (unsigned)audioDeviceID;
- (void)fetchHardwareInfo;
- (void)setAudioDeviceID:(unsigned int)a3;
- (void)setDuckOthers:(BOOL)a3;
@end

@implementation SiriTTSAudioHardware

- (void).cxx_destruct
{
}

- (void)setAudioDeviceID:(unsigned int)a3
{
  self->_audioDeviceID = a3;
}

- (unsigned)audioDeviceID
{
  return self->_audioDeviceID;
}

- (BOOL)duckOthers
{
  return self->_duckOthers;
}

- (float)volume
{
  return self->_volume;
}

- (int64_t)productId
{
  return self->_productId;
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (BOOL)isAppleProduct
{
  return self->_isAppleProduct;
}

- (BOOL)isBluetooth
{
  return self->_isBluetooth;
}

- (NSString)routeType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)fetchHardwareInfo
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  v4 = [v3 attributeForKey:*MEMORY[0x1E4F74C68]];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F74CE8]];
  routeType = self->_routeType;
  self->_routeType = v5;

  if ([(NSString *)self->_routeType isEqualToString:@"Speaker"]) {
    self->_isAppleProduct = 1;
  }
  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F74D80]];
  self->_isBluetooth = [v7 BOOLValue];

  if (!self->_isBluetooth) {
    goto LABEL_10;
  }
  v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F74D70]];
  v9 = [v8 componentsSeparatedByString:@","];
  if ([v9 count] == 2)
  {
    v10 = [v9 firstObject];
    uint64_t v11 = [v10 length];
    if (v11 - 1 >= 0)
    {
      uint64_t v12 = v11;
      int v13 = 1;
      do
      {
        int v14 = [v10 characterAtIndex:--v12];
        if ([v10 characterAtIndex:v12] - 48 > 9) {
          break;
        }
        self->_vendorId += (v14 - 48) * v13;
        v13 *= 10;
      }
      while (v12 > 0);
    }
    id v15 = [v9 lastObject];
    self->_productId = strtol((const char *)[v15 UTF8String], 0, 10);

    self->_isAppleProduct = self->_vendorId == 76;
LABEL_10:
    float v17 = 0.0;
    if ([v3 getActiveCategoryVolume:&v17 andName:0]) {
      self->_volume = v17;
    }
    goto LABEL_15;
  }
  v16 = TTSGetServiceLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    float v17 = 5.7779e-34;
    v18 = v8;
    _os_log_error_impl(&dword_19CD9A000, v16, OS_LOG_TYPE_ERROR, "Unexpected model ID pattern: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_15:
}

- (void)setDuckOthers:(BOOL)a3
{
  v3 = TTSGetServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_19CD9A000, v3, OS_LOG_TYPE_FAULT, "Volume ducking is unsupported on non-macOS devices.", v4, 2u);
  }
}

+ (id)defaultOutput
{
  v2 = objc_alloc_init(SiriTTSAudioHardware);
  [(SiriTTSAudioHardware *)v2 fetchHardwareInfo];
  return v2;
}

@end