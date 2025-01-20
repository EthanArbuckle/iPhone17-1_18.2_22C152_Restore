@interface PXSmartAlbumFilenameCondition
+ (id)defaultSingleQueryForEditingContext:(id)a3;
@end

@implementation PXSmartAlbumFilenameCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8B9E8]);
  [v3 setKey:400];
  [v3 setStringValue:&stru_1F00B0030];
  [v3 setComparator:20];
  return v3;
}

@end