@interface PHUtilityCollection(PhotosUICore)
+ (__CFString)px_builtInAlbumNameForUtilityCollectionType:()PhotosUICore;
+ (uint64_t)px_utilityCollectionTypeforBuiltInAlbumName:()PhotosUICore;
- (uint64_t)px_navigationWellKnownName;
@end

@implementation PHUtilityCollection(PhotosUICore)

- (uint64_t)px_navigationWellKnownName
{
  v1 = (void *)MEMORY[0x1E4F39340];
  uint64_t v2 = [a1 type];
  return objc_msgSend(v1, "px_builtInAlbumNameForUtilityCollectionType:", v2);
}

+ (uint64_t)px_utilityCollectionTypeforBuiltInAlbumName:()PhotosUICore
{
  id v3 = a3;
  if (px_utilityCollectionTypeforBuiltInAlbumName__onceToken != -1) {
    dispatch_once(&px_utilityCollectionTypeforBuiltInAlbumName__onceToken, &__block_literal_global_857);
  }
  v4 = [(id)px_utilityCollectionTypeforBuiltInAlbumName__utilityCollectionTypes objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4) {
    unsigned __int16 v6 = [v4 unsignedIntegerValue];
  }
  else {
    unsigned __int16 v6 = 0;
  }

  return v6;
}

+ (__CFString)px_builtInAlbumNameForUtilityCollectionType:()PhotosUICore
{
  id v3 = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      id v3 = @"utility-generic-documents";
      goto LABEL_9;
    case 2:
      id v3 = @"utility-receipts";
      goto LABEL_9;
    case 3:
      id v3 = @"utility-illustrations";
      goto LABEL_9;
    case 4:
      id v3 = @"utility-handwriting";
      goto LABEL_9;
    case 5:
      id v3 = @"utility-qr-codes";
      goto LABEL_9;
    case 6:
      id v3 = @"utility-maps";
LABEL_9:
      v4 = v3;
LABEL_10:
      return v3;
    default:
      PXAssertGetLog();
  }
}

@end