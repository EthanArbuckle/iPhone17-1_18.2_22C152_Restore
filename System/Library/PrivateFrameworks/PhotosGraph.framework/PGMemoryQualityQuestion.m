@interface PGMemoryQualityQuestion
- (PGMemoryQualityQuestion)initWithMemory:(id)a3 localFactoryScore:(double)a4;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGMemoryQualityQuestion

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
  return 2;
}

- (unsigned)displayType
{
  return 5;
}

- (unsigned)type
{
  return 11;
}

- (PGMemoryQualityQuestion)initWithMemory:(id)a3 localFactoryScore:(double)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGMemoryQualityQuestion;
  v7 = [(PGMemoryQualityQuestion *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [v6 uuid];
    entityIdentifier = v7->_entityIdentifier;
    v7->_entityIdentifier = (NSString *)v8;

    v7->_state = 0;
    v7->_localFactoryScore = a4;
    v16[0] = @"category";
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "category"));
    v16[1] = @"subcategory";
    v17[0] = v10;
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "subcategory"));
    v17[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    additionalInfo = v7->_additionalInfo;
    v7->_additionalInfo = (NSDictionary *)v12;
  }
  return v7;
}

@end