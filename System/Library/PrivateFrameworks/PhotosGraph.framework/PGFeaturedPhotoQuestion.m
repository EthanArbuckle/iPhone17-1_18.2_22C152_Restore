@interface PGFeaturedPhotoQuestion
- (BOOL)isEquivalentToQuestion:(id)a3;
- (PGFeaturedPhotoQuestion)initWithAssetUUID:(id)a3 suggestionType:(unsigned __int16)a4 suggestionSubtype:(unsigned __int16)a5;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGFeaturedPhotoQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
}

- (unsigned)state
{
  return self->_state;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (BOOL)isEquivalentToQuestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 entityIdentifier];
  v6 = [(PGFeaturedPhotoQuestion *)self entityIdentifier];
  if ([v5 isEqualToString:v6]
    && (int v7 = [v4 entityType], v7 == -[PGFeaturedPhotoQuestion entityType](self, "entityType")))
  {
    int v8 = [v4 type];
    BOOL v9 = v8 == [(PGFeaturedPhotoQuestion *)self type];
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
  return 14;
}

- (PGFeaturedPhotoQuestion)initWithAssetUUID:(id)a3 suggestionType:(unsigned __int16)a4 suggestionSubtype:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  v19[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PGFeaturedPhotoQuestion;
  v10 = [(PGFeaturedPhotoQuestion *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_entityIdentifier, a3);
    v11->_state = 0;
    v18[0] = @"suggestionType";
    v12 = [NSNumber numberWithUnsignedShort:v6];
    v18[1] = @"suggestionSubType";
    v19[0] = v12;
    v13 = [NSNumber numberWithUnsignedShort:v5];
    v19[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    additionalInfo = v11->_additionalInfo;
    v11->_additionalInfo = (NSDictionary *)v14;
  }
  return v11;
}

@end