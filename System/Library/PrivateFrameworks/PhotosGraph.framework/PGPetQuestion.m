@interface PGPetQuestion
- (PGPetQuestion)initWithPetUUID:(id)a3 displayString:(id)a4 localFactoryScore:(double)a5;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGPetQuestion

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
  return self->_entityType;
}

- (unsigned)displayType
{
  return self->_displayType;
}

- (unsigned)type
{
  return 13;
}

- (PGPetQuestion)initWithPetUUID:(id)a3 displayString:(id)a4 localFactoryScore:(double)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PGPetQuestion;
  v11 = [(PGPetQuestion *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entityIdentifier, a3);
    v12->_state = 0;
    v12->_localFactoryScore = a5;
    if (v10)
    {
      v12->_entityType = 4;
      v12->_displayType = 6;
      uint64_t v17 = *MEMORY[0x1E4F8E940];
      v18[0] = v10;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      additionalInfo = v12->_additionalInfo;
      v12->_additionalInfo = (NSDictionary *)v13;
    }
    else
    {
      v12->_entityType = 1;
      v12->_displayType = 2;
      additionalInfo = v12->_additionalInfo;
      v12->_additionalInfo = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
  }
  return v12;
}

@end