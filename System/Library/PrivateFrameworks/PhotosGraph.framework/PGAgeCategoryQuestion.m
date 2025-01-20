@interface PGAgeCategoryQuestion
- (PGAgeCategoryQuestion)initWithPersonUUID:(id)a3 ageCategory:(unint64_t)a4 localFactoryScore:(double)a5;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGAgeCategoryQuestion

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
  return 1;
}

- (unsigned)displayType
{
  return 2;
}

- (unsigned)type
{
  return 10;
}

- (PGAgeCategoryQuestion)initWithPersonUUID:(id)a3 ageCategory:(unint64_t)a4 localFactoryScore:(double)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PGAgeCategoryQuestion;
  v10 = [(PGAgeCategoryQuestion *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_entityIdentifier, a3);
    v11->_state = 0;
    v11->_localFactoryScore = a5;
    v17 = @"ageCategory";
    v12 = [NSNumber numberWithUnsignedInteger:a4];
    v18[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    additionalInfo = v11->_additionalInfo;
    v11->_additionalInfo = (NSDictionary *)v13;
  }
  return v11;
}

@end