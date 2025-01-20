@interface PLPTPAssetHandle
- (BOOL)hasSiblingAssetWithAssetHandleType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresConversion;
- (NSManagedObjectID)assetID;
- (NSManagedObjectID)sidecarID;
- (NSSet)siblingAssetHandleTypes;
- (NSString)auxiliaryResourceFilenameMarker;
- (PLPTPAssetHandle)initWithType:(int64_t)a3 assetID:(id)a4 sidecarID:(id)a5 requiresConversion:(BOOL)a6;
- (PLPTPAssetHandle)initWithType:(int64_t)a3 assetID:(id)a4 sidecarID:(id)a5 requiresConversion:(BOOL)a6 siblingAssetHandleTypes:(id)a7;
- (id)assetHandleBySettingRequiresConversion;
- (id)assetHandleBySettingSiblingAssetHandleTypes:(id)a3;
- (id)description;
- (int64_t)type;
@end

@implementation PLPTPAssetHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siblingAssetHandleTypes, 0);
  objc_storeStrong((id *)&self->_sidecarID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

- (NSSet)siblingAssetHandleTypes
{
  return self->_siblingAssetHandleTypes;
}

- (BOOL)requiresConversion
{
  return self->_requiresConversion;
}

- (NSManagedObjectID)sidecarID
{
  return self->_sidecarID;
}

- (NSManagedObjectID)assetID
{
  return self->_assetID;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)auxiliaryResourceFilenameMarker
{
  unint64_t v2 = self->_type - 2;
  if (v2 <= 9 && ((0x3FDu >> v2) & 1) != 0) {
    v3 = *(&off_1E586AC20)[v2];
  }
  else {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    BOOL v6 = self->_type == v5[2]
      && PLObjectIsEqual()
      && PLObjectIsEqual()
      && self->_requiresConversion == *((unsigned __int8 *)v5 + 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = +[PLDescriptionBuilder descriptionBuilderWithObject:self];
  [v3 appendName:@"type" typeCode:"q" value:&self->_type];
  [v3 appendName:@"assetID" typeCode:"@" value:&self->_assetID];
  [v3 appendName:@"sidecarID" typeCode:"@" value:&self->_sidecarID];
  [v3 appendName:@"requiresConversion" typeCode:"B" value:&self->_requiresConversion];
  id v4 = [v3 build];

  return v4;
}

- (BOOL)hasSiblingAssetWithAssetHandleType:(int64_t)a3
{
  siblingAssetHandleTypes = self->_siblingAssetHandleTypes;
  id v4 = [NSNumber numberWithInteger:a3];
  LOBYTE(siblingAssetHandleTypes) = [(NSSet *)siblingAssetHandleTypes containsObject:v4];

  return (char)siblingAssetHandleTypes;
}

- (id)assetHandleBySettingSiblingAssetHandleTypes:(id)a3
{
  id v4 = a3;
  v5 = [[PLPTPAssetHandle alloc] initWithType:self->_type assetID:self->_assetID sidecarID:self->_sidecarID requiresConversion:self->_requiresConversion siblingAssetHandleTypes:v4];

  return v5;
}

- (id)assetHandleBySettingRequiresConversion
{
  unint64_t v2 = [[PLPTPAssetHandle alloc] initWithType:self->_type assetID:self->_assetID sidecarID:self->_sidecarID requiresConversion:1];
  return v2;
}

- (PLPTPAssetHandle)initWithType:(int64_t)a3 assetID:(id)a4 sidecarID:(id)a5 requiresConversion:(BOOL)a6 siblingAssetHandleTypes:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PLPTPAssetHandle;
  v15 = [(PLPTPAssetHandle *)&v23 init];
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    uint64_t v17 = [v12 copy];
    assetID = v16->_assetID;
    v16->_assetID = (NSManagedObjectID *)v17;

    uint64_t v19 = [v13 copy];
    sidecarID = v16->_sidecarID;
    v16->_sidecarID = (NSManagedObjectID *)v19;

    v16->_requiresConversion = a6;
    objc_storeStrong((id *)&v16->_siblingAssetHandleTypes, a7);
    v21 = v16;
  }

  return v16;
}

- (PLPTPAssetHandle)initWithType:(int64_t)a3 assetID:(id)a4 sidecarID:(id)a5 requiresConversion:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLPTPAssetHandle;
  id v12 = [(PLPTPAssetHandle *)&v15 init];
  if (v12) {
    id v13 = [(PLPTPAssetHandle *)v12 initWithType:a3 assetID:v10 sidecarID:v11 requiresConversion:v6 siblingAssetHandleTypes:0];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

@end