@interface PGLocationRepresentativeAssetQuestion
- (PGLocationRepresentativeAssetQuestion)initWithAssetUUID:(id)a3 locationName:(id)a4;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGLocationRepresentativeAssetQuestion

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
  return 27;
}

- (PGLocationRepresentativeAssetQuestion)initWithAssetUUID:(id)a3 locationName:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGLocationRepresentativeAssetQuestion;
  v9 = [(PGLocationRepresentativeAssetQuestion *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entityIdentifier, a3);
    v10->_state = 0;
    v15 = @"localizedLocationName";
    v16[0] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    additionalInfo = v10->_additionalInfo;
    v10->_additionalInfo = (NSDictionary *)v11;
  }
  return v10;
}

@end