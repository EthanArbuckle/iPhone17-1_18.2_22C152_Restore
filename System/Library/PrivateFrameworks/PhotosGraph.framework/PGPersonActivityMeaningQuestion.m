@interface PGPersonActivityMeaningQuestion
- (PGPersonActivityMeaningQuestion)initWithMeaningLabel:(id)a3 assetUUID:(id)a4 localFactoryScore:(double)a5;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGPersonActivityMeaningQuestion

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
  return 19;
}

- (PGPersonActivityMeaningQuestion)initWithMeaningLabel:(id)a3 assetUUID:(id)a4 localFactoryScore:(double)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGPersonActivityMeaningQuestion;
  v10 = [(PGPersonActivityMeaningQuestion *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_entityIdentifier, a4);
    v11->_state = 0;
    v11->_localFactoryScore = a5;
    v16 = @"personActivityMeaningLabel";
    v17[0] = v8;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    additionalInfo = v11->_additionalInfo;
    v11->_additionalInfo = (NSDictionary *)v12;
  }
  return v11;
}

@end