@interface PGCameraLibrarySwitchQuestion
- (BOOL)isEquivalentToPersistedQuestion:(id)a3;
- (BOOL)isEquivalentToQuestion:(id)a3;
- (PGCameraLibrarySwitchQuestion)initWithAssetUUID:(id)a3 libraryScopeUUID:(id)a4 previousSwitchState:(id)a5 currentSwitchState:(id)a6;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGCameraLibrarySwitchQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (unsigned)state
{
  return self->_state;
}

- (BOOL)isEquivalentToPersistedQuestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 entityIdentifier];
  v6 = [(PGCameraLibrarySwitchQuestion *)self entityIdentifier];
  if ([v5 isEqualToString:v6]
    && (int v7 = [v4 entityType], v7 == -[PGCameraLibrarySwitchQuestion entityType](self, "entityType")))
  {
    int v8 = [v4 type];
    BOOL v9 = v8 == -[PGCameraLibrarySwitchQuestion type](self, "type") || [v4 type] == 20;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEquivalentToQuestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 entityIdentifier];
  v6 = [(PGCameraLibrarySwitchQuestion *)self entityIdentifier];
  if ([v5 isEqualToString:v6]
    && (int v7 = [v4 entityType], v7 == -[PGCameraLibrarySwitchQuestion entityType](self, "entityType")))
  {
    int v8 = [v4 type];
    BOOL v9 = v8 == [(PGCameraLibrarySwitchQuestion *)self type];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unsigned)entityType
{
  return 0;
}

- (unsigned)displayType
{
  return 0;
}

- (unsigned)type
{
  return 23;
}

- (PGCameraLibrarySwitchQuestion)initWithAssetUUID:(id)a3 libraryScopeUUID:(id)a4 previousSwitchState:(id)a5 currentSwitchState:(id)a6
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PGCameraLibrarySwitchQuestion;
  v14 = [(PGCameraLibrarySwitchQuestion *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    entityIdentifier = v14->_entityIdentifier;
    v14->_entityIdentifier = (NSString *)v15;

    v14->_state = 0;
    v21[0] = @"previousCameraLibrarySwitchState";
    v21[1] = @"currentCameraLibrarySwitchState";
    v22[0] = v12;
    v22[1] = v13;
    v21[2] = @"libraryScopeUUID";
    v22[2] = v11;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    additionalInfo = v14->_additionalInfo;
    v14->_additionalInfo = (NSDictionary *)v17;
  }
  return v14;
}

@end