@interface CKRecordZoneID(CKRecordZoneID)
+ (id)brc_containerMetadataZoneID;
+ (id)brc_sideCarZoneID;
+ (id)brc_zoneHealthZoneID;
@end

@implementation CKRecordZoneID(CKRecordZoneID)

+ (id)brc_containerMetadataZoneID
{
  id v0 = objc_alloc(MEMORY[0x263EFD808]);
  v1 = (void *)[v0 initWithZoneName:*MEMORY[0x263F324D8] ownerName:*MEMORY[0x263EFD488]];
  return v1;
}

+ (id)brc_zoneHealthZoneID
{
  id v0 = objc_alloc(MEMORY[0x263EFD808]);
  v1 = (void *)[v0 initWithZoneName:*MEMORY[0x263F32550] ownerName:*MEMORY[0x263EFD488]];
  return v1;
}

+ (id)brc_sideCarZoneID
{
  id v0 = objc_alloc(MEMORY[0x263EFD808]);
  v1 = (void *)[v0 initWithZoneName:*MEMORY[0x263F327C8] ownerName:*MEMORY[0x263EFD488]];
  return v1;
}

@end