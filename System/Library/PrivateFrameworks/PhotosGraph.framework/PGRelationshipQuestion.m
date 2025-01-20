@interface PGRelationshipQuestion
- (PGRelationshipQuestion)initWithRelationshipLabel:(id)a3 confirmedPersonUUID:(id)a4;
- (PGRelationshipQuestion)initWithRelationshipLabel:(id)a3 personUUID:(id)a4 displayString:(id)a5 localFactoryScore:(double)a6;
- (PGRelationshipQuestion)initWithRelationshipLabel:(id)a3 personUUID:(id)a4 localFactoryScore:(double)a5;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGRelationshipQuestion

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
  return 5;
}

- (PGRelationshipQuestion)initWithRelationshipLabel:(id)a3 personUUID:(id)a4 displayString:(id)a5 localFactoryScore:(double)a6
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PGRelationshipQuestion;
  v13 = [(PGRelationshipQuestion *)&v23 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_entityIdentifier, a4);
    v14->_state = 0;
    v14->_localFactoryScore = a6;
    if (v12)
    {
      v14->_entityType = 4;
      v14->_displayType = 6;
      uint64_t v15 = *MEMORY[0x1E4F8EA28];
      v26[0] = *MEMORY[0x1E4F8E940];
      v26[1] = v15;
      v27[0] = v12;
      v27[1] = v10;
      v16 = (void *)MEMORY[0x1E4F1C9E8];
      v17 = (id *)v27;
      v18 = v26;
      uint64_t v19 = 2;
    }
    else
    {
      v14->_entityType = 1;
      v14->_displayType = 2;
      uint64_t v24 = *MEMORY[0x1E4F8EA28];
      id v25 = v10;
      v16 = (void *)MEMORY[0x1E4F1C9E8];
      v17 = &v25;
      v18 = &v24;
      uint64_t v19 = 1;
    }
    uint64_t v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
    additionalInfo = v14->_additionalInfo;
    v14->_additionalInfo = (NSDictionary *)v20;
  }
  return v14;
}

- (PGRelationshipQuestion)initWithRelationshipLabel:(id)a3 confirmedPersonUUID:(id)a4
{
  result = [(PGRelationshipQuestion *)self initWithRelationshipLabel:a3 personUUID:a4 displayString:0 localFactoryScore:1.0];
  if (result) {
    result->_state = 2;
  }
  return result;
}

- (PGRelationshipQuestion)initWithRelationshipLabel:(id)a3 personUUID:(id)a4 localFactoryScore:(double)a5
{
  return [(PGRelationshipQuestion *)self initWithRelationshipLabel:a3 personUUID:a4 displayString:0 localFactoryScore:a5];
}

@end