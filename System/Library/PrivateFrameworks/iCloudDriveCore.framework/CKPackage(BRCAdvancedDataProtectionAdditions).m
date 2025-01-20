@interface CKPackage(BRCAdvancedDataProtectionAdditions)
+ (id)br_clonedPackageWithRecordID:()BRCAdvancedDataProtectionAdditions databaseScope:fieldName:boundaryKey:error:;
+ (id)br_packageWithBoundaryKey:()BRCAdvancedDataProtectionAdditions error:;
+ (id)br_packageWithPackage:()BRCAdvancedDataProtectionAdditions error:;
@end

@implementation CKPackage(BRCAdvancedDataProtectionAdditions)

+ (id)br_packageWithBoundaryKey:()BRCAdvancedDataProtectionAdditions error:
{
  v5 = (void *)MEMORY[0x263EFD790];
  id v6 = a3;
  v7 = [v5 packageWithError:a4];
  v8 = [MEMORY[0x263EFD5E0] transferOptionsWithMMCSV2:v6 != 0];
  [v7 setAssetTransferOptions:v8];

  [v7 setBoundaryKey:v6];
  return v7;
}

+ (id)br_packageWithPackage:()BRCAdvancedDataProtectionAdditions error:
{
  v5 = (void *)MEMORY[0x263EFD790];
  id v6 = a3;
  v7 = [v5 packageWithPackage:v6 error:a4];
  v8 = [v6 boundaryKey];

  v9 = [MEMORY[0x263EFD5E0] transferOptionsWithMMCSV2:v8 != 0];
  [v7 setAssetTransferOptions:v9];

  [v7 setBoundaryKey:v8];
  return v7;
}

+ (id)br_clonedPackageWithRecordID:()BRCAdvancedDataProtectionAdditions databaseScope:fieldName:boundaryKey:error:
{
  v11 = (void *)MEMORY[0x263EFD790];
  id v12 = a6;
  v13 = [v11 clonedPackageWithRecordID:a3 databaseScope:a4 fieldName:a5 signature:0 error:a7];
  v14 = [MEMORY[0x263EFD5E0] transferOptionsWithMMCSV2:v12 != 0];
  [v13 setAssetTransferOptions:v14];

  [v13 setBoundaryKey:v12];
  return v13;
}

@end