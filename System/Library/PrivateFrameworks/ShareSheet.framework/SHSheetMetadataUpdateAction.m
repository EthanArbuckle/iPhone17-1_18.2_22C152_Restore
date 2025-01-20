@interface SHSheetMetadataUpdateAction
- (LPLinkMetadata)metadata;
- (NSData)serializedMetadata;
- (SHSheetMetadataUpdateAction)initWithSerializedMetadata:(id)a3;
@end

@implementation SHSheetMetadataUpdateAction

- (SHSheetMetadataUpdateAction)initWithSerializedMetadata:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F62860];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:v5 forSetting:1];

  v7 = [(SHSheetMetadataUpdateAction *)self initWithInfo:v6 responder:0];
  return v7;
}

- (NSData)serializedMetadata
{
  v2 = [(SHSheetMetadataUpdateAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSData *)v3;
}

- (LPLinkMetadata)metadata
{
  Class LPLinkMetadataClass_0 = getLPLinkMetadataClass_0();
  v4 = [(SHSheetMetadataUpdateAction *)self serializedMetadata];
  id v5 = [(objc_class *)LPLinkMetadataClass_0 metadataWithDataRepresentationForLocalUseOnly:v4];

  return (LPLinkMetadata *)v5;
}

@end