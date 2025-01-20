@interface PGExternalAssetRelevanceQuestion
- (PGExternalAssetRelevanceQuestion)initWithAssetUUID:(id)a3 momentLocalIdentifiers:(id)a4 assetInferredAsRelevant:(BOOL)a5;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGExternalAssetRelevanceQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (unsigned)state
{
  return self->_state;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (unsigned)entityType
{
  return 0;
}

- (unsigned)displayType
{
  return 1;
}

- (unsigned)type
{
  return 29;
}

- (PGExternalAssetRelevanceQuestion)initWithAssetUUID:(id)a3 momentLocalIdentifiers:(id)a4 assetInferredAsRelevant:(BOOL)a5
{
  BOOL v5 = a5;
  v22[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PGExternalAssetRelevanceQuestion;
  v11 = [(PGExternalAssetRelevanceQuestion *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entityIdentifier, a3);
    v12->_state = 0;
    v21[0] = *MEMORY[0x1E4F8E958];
    v13 = [NSNumber numberWithBool:v5];
    uint64_t v14 = *MEMORY[0x1E4F397F0];
    v22[0] = v13;
    v22[1] = v10;
    uint64_t v15 = *MEMORY[0x1E4F8E918];
    v21[1] = v14;
    v21[2] = v15;
    v16 = [NSNumber numberWithUnsignedLongLong:*MEMORY[0x1E4F8E890]];
    v22[2] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    additionalInfo = v12->_additionalInfo;
    v12->_additionalInfo = (NSDictionary *)v17;
  }
  return v12;
}

@end