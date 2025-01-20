@interface FBSDisplayConfiguration(SSKDisplayMonitorCallbackLogging)
- (id)_flbLoggingDescription;
@end

@implementation FBSDisplayConfiguration(SSKDisplayMonitorCallbackLogging)

- (id)_flbLoggingDescription
{
  v2 = [MEMORY[0x263F29C40] builderWithObject:a1];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __83__FBSDisplayConfiguration_SSKDisplayMonitorCallbackLogging___flbLoggingDescription__block_invoke;
  v9 = &unk_2654B15F8;
  id v10 = v2;
  uint64_t v11 = a1;
  id v3 = v2;
  [v3 appendBodySectionWithName:0 multilinePrefix:@"\t" block:&v6];
  v4 = objc_msgSend(v3, "build", v6, v7, v8, v9);

  return v4;
}

@end