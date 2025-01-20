@interface PGExhaustiveMomentLabellingQuestion
- (PGExhaustiveMomentLabellingQuestion)initWithMomentUUID:(id)a3 localFactoryScore:(double)a4 meaningLabels:(id)a5;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGExhaustiveMomentLabellingQuestion

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

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (unsigned)entityType
{
  return 7;
}

- (unsigned)displayType
{
  return 1;
}

- (unsigned)type
{
  return 25;
}

- (PGExhaustiveMomentLabellingQuestion)initWithMomentUUID:(id)a3 localFactoryScore:(double)a4 meaningLabels:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PGExhaustiveMomentLabellingQuestion;
  v11 = [(PGExhaustiveMomentLabellingQuestion *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entityIdentifier, a3);
    v12->_state = 0;
    v12->_localFactoryScore = a4;
    if ([v10 count])
    {
      v13 = [v10 array];
      v14 = [v13 componentsJoinedByString:@","];

      uint64_t v19 = *MEMORY[0x1E4F8E948];
      v20[0] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      additionalInfo = v12->_additionalInfo;
      v12->_additionalInfo = (NSDictionary *)v15;
    }
  }

  return v12;
}

@end