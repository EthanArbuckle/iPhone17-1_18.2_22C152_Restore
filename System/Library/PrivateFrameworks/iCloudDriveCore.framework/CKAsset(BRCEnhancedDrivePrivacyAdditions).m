@interface CKAsset(BRCEnhancedDrivePrivacyAdditions)
+ (id)br_assetWithAssetReferece:()BRCEnhancedDrivePrivacyAdditions boundaryKey:;
+ (id)br_assetWithDeviceID:()BRCEnhancedDrivePrivacyAdditions fileID:generationID:boundaryKey:;
+ (id)br_assetWithDeviceID:()BRCEnhancedDrivePrivacyAdditions fileID:generationID:useMMCSEncryptionV2:;
+ (id)br_assetWithFileURL:()BRCEnhancedDrivePrivacyAdditions boundaryKey:;
+ (id)br_assetWithFileURL:()BRCEnhancedDrivePrivacyAdditions useMMCSEncryptionV2:;
+ (id)transferOptionsWithMMCSV2:()BRCEnhancedDrivePrivacyAdditions;
@end

@implementation CKAsset(BRCEnhancedDrivePrivacyAdditions)

+ (id)transferOptionsWithMMCSV2:()BRCEnhancedDrivePrivacyAdditions
{
  v4 = objc_opt_new();
  v5 = [NSNumber numberWithBool:a3];
  [v4 setUseMMCSEncryptionV2:v5];

  return v4;
}

+ (id)br_assetWithFileURL:()BRCEnhancedDrivePrivacyAdditions boundaryKey:
{
  BOOL v6 = a4 != 0;
  id v7 = a4;
  v8 = objc_msgSend(a1, "br_assetWithFileURL:useMMCSEncryptionV2:", a3, v6);
  [v8 setBoundaryKey:v7];

  return v8;
}

+ (id)br_assetWithFileURL:()BRCEnhancedDrivePrivacyAdditions useMMCSEncryptionV2:
{
  BOOL v6 = (objc_class *)MEMORY[0x263EFD5E0];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithFileURL:v7];

  v9 = [a1 transferOptionsWithMMCSV2:a4];
  [v8 setAssetTransferOptions:v9];

  return v8;
}

+ (id)br_assetWithDeviceID:()BRCEnhancedDrivePrivacyAdditions fileID:generationID:boundaryKey:
{
  BOOL v10 = a6 != 0;
  id v11 = a6;
  v12 = objc_msgSend(a1, "br_assetWithDeviceID:fileID:generationID:useMMCSEncryptionV2:", a3, a4, a5, v10);
  [v12 setBoundaryKey:v11];

  return v12;
}

+ (id)br_assetWithDeviceID:()BRCEnhancedDrivePrivacyAdditions fileID:generationID:useMMCSEncryptionV2:
{
  BOOL v10 = (objc_class *)MEMORY[0x263EFD5E0];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[[v10 alloc] initWithDeviceID:v13 fileID:v12 generationID:v11];

  v15 = [a1 transferOptionsWithMMCSV2:a6];
  [v14 setAssetTransferOptions:v15];

  return v14;
}

+ (id)br_assetWithAssetReferece:()BRCEnhancedDrivePrivacyAdditions boundaryKey:
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x263EFD5E0]) initWithAssetReference:v6];
  v9 = [a1 transferOptionsWithMMCSV2:v7 != 0];
  [v8 setAssetTransferOptions:v9];

  [v8 setBoundaryKey:v7];
  id v10 = v8;

  return v10;
}

@end