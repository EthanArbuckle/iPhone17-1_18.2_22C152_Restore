@interface PGFrequentLocationQuestion
- (PGFrequentLocationQuestion)initWithAssetUUID:(id)a3 location:(id)a4 locationTypeName:(id)a5;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGFrequentLocationQuestion

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
  return 4;
}

- (unsigned)type
{
  return 8;
}

- (PGFrequentLocationQuestion)initWithAssetUUID:(id)a3 location:(id)a4 locationTypeName:(id)a5
{
  v30[5] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PGFrequentLocationQuestion;
  v12 = [(PGFrequentLocationQuestion *)&v27 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityIdentifier, a3);
    [(id)*MEMORY[0x1E4F8E938] doubleValue];
    v13->_localFactoryScore = v14;
    v13->_state = 0;
    uint64_t v15 = *MEMORY[0x1E4F8E9A0];
    v30[0] = *MEMORY[0x1E4F8E998];
    v30[1] = v15;
    uint64_t v16 = *MEMORY[0x1E4F8E970];
    v30[2] = *MEMORY[0x1E4F8E9A8];
    v30[3] = v16;
    v30[4] = *MEMORY[0x1E4F8E988];
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
    [v10 coordinate];
    double v19 = v18;
    uint64_t v20 = *MEMORY[0x1E4F8E968];
    v29[0] = v17;
    uint64_t v21 = *MEMORY[0x1E4F8E978];
    v28[0] = v20;
    v28[1] = v21;
    v22 = objc_msgSend(NSNumber, "numberWithDouble:");
    v29[1] = v22;
    v28[2] = *MEMORY[0x1E4F8E980];
    v23 = [NSNumber numberWithDouble:v19];
    v28[3] = *MEMORY[0x1E4F8E990];
    v29[2] = v23;
    v29[3] = v11;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
    additionalInfo = v13->_additionalInfo;
    v13->_additionalInfo = (NSDictionary *)v24;
  }
  return v13;
}

@end