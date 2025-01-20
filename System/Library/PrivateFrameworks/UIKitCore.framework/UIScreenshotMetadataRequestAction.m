@interface UIScreenshotMetadataRequestAction
- (int64_t)UIActionType;
- (void)fulfillRequest;
@end

@implementation UIScreenshotMetadataRequestAction

- (int64_t)UIActionType
{
  return 31;
}

- (void)fulfillRequest
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v3 = (void *)_MergedGlobals_1056;
  uint64_t v9 = _MergedGlobals_1056;
  if (!_MergedGlobals_1056)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getSSScreenshotMetadataHarvesterClass_block_invoke;
    v5[3] = &unk_1E52D9900;
    v5[4] = &v6;
    __getSSScreenshotMetadataHarvesterClass_block_invoke((uint64_t)v5);
    v3 = (void *)v7[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v6, 8);
  [v4 harvestScreenshotMetadataAndRespondToAction:self];
}

@end