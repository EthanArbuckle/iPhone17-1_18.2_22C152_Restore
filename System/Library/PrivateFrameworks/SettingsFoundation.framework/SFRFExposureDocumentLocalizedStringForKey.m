@interface SFRFExposureDocumentLocalizedStringForKey
@end

@implementation SFRFExposureDocumentLocalizedStringForKey

void ___SFRFExposureDocumentLocalizedStringForKey_block_invoke()
{
  v0 = NSURL;
  v1 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/Notices");
  id v6 = [v0 fileURLWithPath:v1];

  v2 = [NSString stringWithFormat:@"%@.bundle", @"RFExposure"];
  v3 = [v6 URLByAppendingPathComponent:v2];

  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithURL:v3];
  v5 = (void *)_SFRFExposureDocumentLocalizedStringForKey___rfExposureBundle;
  _SFRFExposureDocumentLocalizedStringForKey___rfExposureBundle = v4;
}

@end