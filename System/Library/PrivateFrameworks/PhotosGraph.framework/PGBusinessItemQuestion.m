@interface PGBusinessItemQuestion
- (PGBusinessItemQuestion)initWithAssetUUID:(id)a3 businessUUID:(id)a4 businessName:(id)a5 localFactoryScore:(double)a6;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGBusinessItemQuestion

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
  return 0;
}

- (unsigned)type
{
  return 4;
}

- (PGBusinessItemQuestion)initWithAssetUUID:(id)a3 businessUUID:(id)a4 businessName:(id)a5 localFactoryScore:(double)a6
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGBusinessItemQuestion;
  v14 = [(PGBusinessItemQuestion *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_entityIdentifier, a3);
    v15->_localFactoryScore = a6;
    v15->_state = 0;
    v20[0] = @"businessUUID";
    v20[1] = @"businessName";
    v21[0] = v12;
    v21[1] = v13;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    additionalInfo = v15->_additionalInfo;
    v15->_additionalInfo = (NSDictionary *)v16;
  }
  return v15;
}

@end