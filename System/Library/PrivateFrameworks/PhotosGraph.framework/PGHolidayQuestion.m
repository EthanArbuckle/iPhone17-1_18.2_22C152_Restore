@interface PGHolidayQuestion
- (PGHolidayQuestion)initWithAssetUUID:(id)a3 holidayName:(id)a4 localizedHolidayName:(id)a5 localFactoryScore:(double)a6;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGHolidayQuestion

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
  return 7;
}

- (PGHolidayQuestion)initWithAssetUUID:(id)a3 holidayName:(id)a4 localizedHolidayName:(id)a5 localFactoryScore:(double)a6
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PGHolidayQuestion;
  v14 = [(PGHolidayQuestion *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_entityIdentifier, a3);
    v15->_localFactoryScore = a6;
    v15->_state = 0;
    if (v13) {
      v16 = v13;
    }
    else {
      v16 = v12;
    }
    id v17 = v16;

    v22[0] = @"holidayName";
    v22[1] = @"localizedHolidayName";
    v23[0] = v12;
    v23[1] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    additionalInfo = v15->_additionalInfo;
    v15->_additionalInfo = (NSDictionary *)v18;

    id v13 = v17;
  }

  return v15;
}

@end