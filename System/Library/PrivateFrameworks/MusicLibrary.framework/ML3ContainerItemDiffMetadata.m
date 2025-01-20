@interface ML3ContainerItemDiffMetadata
+ (id)diffMetadataWithPersistentID:(int64_t)a3;
+ (id)diffMetadataWithPersistentID:(int64_t)a3 containerPersistentID:(int64_t)a4 itemPersistentID:(int64_t)a5 newPosition:(int64_t)a6 previousPosition:(int64_t)a7 uuid:(id)a8 positionUUD:(id)a9 occurrenceID:(id)a10;
- (NSString)occurrenceID;
- (NSString)positionUUID;
- (NSString)uuid;
- (int64_t)containerPersistentID;
- (int64_t)itemPersistentID;
- (int64_t)newPosition;
- (int64_t)persistentID;
- (int64_t)previousPosition;
- (void)setContainerPersistentID:(int64_t)a3;
- (void)setItemPersistentID:(int64_t)a3;
- (void)setNewPosition:(int64_t)a3;
- (void)setOccurrenceID:(id)a3;
- (void)setPersistentID:(int64_t)a3;
- (void)setPositionUUID:(id)a3;
- (void)setPreviousPosition:(int64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation ML3ContainerItemDiffMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceID, 0);
  objc_storeStrong((id *)&self->_positionUUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setOccurrenceID:(id)a3
{
}

- (NSString)occurrenceID
{
  return self->_occurrenceID;
}

- (void)setPositionUUID:(id)a3
{
}

- (NSString)positionUUID
{
  return self->_positionUUID;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setPreviousPosition:(int64_t)a3
{
  self->_previousPosition = a3;
}

- (int64_t)previousPosition
{
  return self->_previousPosition;
}

- (void)setNewPosition:(int64_t)a3
{
  self->_newPosition = a3;
}

- (int64_t)newPosition
{
  return self->_newPosition;
}

- (void)setItemPersistentID:(int64_t)a3
{
  self->_itemPersistentID = a3;
}

- (int64_t)itemPersistentID
{
  return self->_itemPersistentID;
}

- (void)setContainerPersistentID:(int64_t)a3
{
  self->_containerPersistentID = a3;
}

- (int64_t)containerPersistentID
{
  return self->_containerPersistentID;
}

- (void)setPersistentID:(int64_t)a3
{
  self->_persistentID = a3;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

+ (id)diffMetadataWithPersistentID:(int64_t)a3 containerPersistentID:(int64_t)a4 itemPersistentID:(int64_t)a5 newPosition:(int64_t)a6 previousPosition:(int64_t)a7 uuid:(id)a8 positionUUD:(id)a9 occurrenceID:(id)a10
{
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  v18 = +[ML3ContainerItemDiffMetadata diffMetadataWithPersistentID:a3];
  [v18 setContainerPersistentID:a4];
  [v18 setItemPersistentID:a5];
  [v18 setNewPosition:a6];
  [v18 setPreviousPosition:a7];
  [v18 setUuid:v15];
  [v18 setPositionUUID:v16];
  [v18 setOccurrenceID:v17];

  return v18;
}

+ (id)diffMetadataWithPersistentID:(int64_t)a3
{
  v4 = objc_alloc_init(ML3ContainerItemDiffMetadata);
  [(ML3ContainerItemDiffMetadata *)v4 setPersistentID:a3];

  return v4;
}

@end