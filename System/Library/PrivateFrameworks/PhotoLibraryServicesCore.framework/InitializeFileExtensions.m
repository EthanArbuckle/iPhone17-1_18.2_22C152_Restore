@interface InitializeFileExtensions
@end

@implementation InitializeFileExtensions

uint64_t ___InitializeFileExtensions_block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"THM", @"BTH", @"THL", @"THP", @"JPG", @"WTH", @"LRZ", @"TH2", @"THO", 0);
  v1 = (void *)__metadataFileExtensions;
  __metadataFileExtensions = v0;

  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"LRZ", @"TH2", @"THO", 0);
  v3 = (void *)__obsoleteFileExtensions;
  __obsoleteFileExtensions = v2;

  __imageFileExtensions = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"JPG", @"PNG", @"TIF", @"GIF", @"HEIF", @"HEIC", 0);
  return MEMORY[0x1F41817F8]();
}

@end