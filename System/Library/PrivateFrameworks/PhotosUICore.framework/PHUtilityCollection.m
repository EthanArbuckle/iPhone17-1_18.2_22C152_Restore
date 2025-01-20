@interface PHUtilityCollection
@end

@implementation PHUtilityCollection

void __81__PHUtilityCollection_PhotosUICore__px_utilityCollectionTypeforBuiltInAlbumName___block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"utility-generic-documents";
  v2[1] = @"utility-receipts";
  v3[0] = &unk_1F02D9A18;
  v3[1] = &unk_1F02D9A30;
  v2[2] = @"utility-illustrations";
  v2[3] = @"utility-handwriting";
  v3[2] = &unk_1F02D9A48;
  v3[3] = &unk_1F02D9A60;
  v2[4] = @"utility-maps";
  v2[5] = @"utility-qr-codes";
  v3[4] = &unk_1F02D9A78;
  v3[5] = &unk_1F02D9A90;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)px_utilityCollectionTypeforBuiltInAlbumName__utilityCollectionTypes;
  px_utilityCollectionTypeforBuiltInAlbumName__utilityCollectionTypes = v0;
}

@end