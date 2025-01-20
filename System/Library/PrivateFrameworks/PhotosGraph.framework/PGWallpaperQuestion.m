@interface PGWallpaperQuestion
- (PGWallpaperQuestion)initWithAssetUUID:(id)a3 suggestionSubtype:(unsigned __int16)a4;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGWallpaperQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
}

- (unsigned)state
{
  return self->_state;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (unsigned)entityType
{
  return 0;
}

- (unsigned)displayType
{
  return 7;
}

- (unsigned)type
{
  return 22;
}

- (PGWallpaperQuestion)initWithAssetUUID:(id)a3 suggestionSubtype:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGWallpaperQuestion;
  v8 = [(PGWallpaperQuestion *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_entityIdentifier, a3);
    v9->_state = 0;
    v15 = @"suggestionSubtype";
    v10 = [NSNumber numberWithUnsignedShort:v4];
    v16[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    additionalInfo = v9->_additionalInfo;
    v9->_additionalInfo = (NSDictionary *)v11;
  }
  return v9;
}

@end