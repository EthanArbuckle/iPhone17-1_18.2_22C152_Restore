@interface SHSheetMetadataChangedAction
- (LPLinkMetadata)metadata;
- (NSData)serializedMetadata;
- (SHSheetMetadataChangedAction)initWithSerializedMetadata:(id)a3;
@end

@implementation SHSheetMetadataChangedAction

- (SHSheetMetadataChangedAction)initWithSerializedMetadata:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F62860];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:v5 forSetting:0];

  v7 = [(SHSheetMetadataChangedAction *)self initWithInfo:v6 responder:0];
  return v7;
}

- (NSData)serializedMetadata
{
  v2 = [(SHSheetMetadataChangedAction *)self info];
  v3 = [v2 objectForSetting:0];

  return (NSData *)v3;
}

- (LPLinkMetadata)metadata
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v3 = (void *)getLPLinkMetadataClass_softClass_0;
  uint64_t v12 = getLPLinkMetadataClass_softClass_0;
  if (!getLPLinkMetadataClass_softClass_0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getLPLinkMetadataClass_block_invoke_0;
    v8[3] = &unk_1E5A216E8;
    v8[4] = &v9;
    __getLPLinkMetadataClass_block_invoke_0((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  id v5 = [(SHSheetMetadataChangedAction *)self serializedMetadata];
  id v6 = [v4 metadataWithDataRepresentationForLocalUseOnly:v5];

  return (LPLinkMetadata *)v6;
}

@end