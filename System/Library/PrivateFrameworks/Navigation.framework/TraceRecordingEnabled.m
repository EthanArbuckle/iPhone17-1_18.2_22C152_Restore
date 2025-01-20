@interface TraceRecordingEnabled
@end

@implementation TraceRecordingEnabled

id NavigationConfig_TraceRecordingEnabled_Metadata_block_invoke_102()
{
  v0 = NSNumber;
  v1 = [MEMORY[0x1E4F64860] sharedPlatform];
  v2 = objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "isInternalInstall"));

  return v2;
}

@end