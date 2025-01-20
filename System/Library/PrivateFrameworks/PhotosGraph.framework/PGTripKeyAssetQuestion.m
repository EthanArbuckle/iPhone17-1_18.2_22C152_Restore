@interface PGTripKeyAssetQuestion
- (PGTripKeyAssetQuestion)initWithKeyAssetUUID:(id)a3 tripName:(id)a4 isLongTrip:(BOOL)a5 localFactoryScore:(double)a6;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGTripKeyAssetQuestion

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
  return 3;
}

- (unsigned)displayType
{
  return 5;
}

- (unsigned)type
{
  return 12;
}

- (PGTripKeyAssetQuestion)initWithKeyAssetUUID:(id)a3 tripName:(id)a4 isLongTrip:(BOOL)a5 localFactoryScore:(double)a6
{
  BOOL v7 = a5;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PGTripKeyAssetQuestion;
  v13 = [(PGTripKeyAssetQuestion *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_entityIdentifier, a3);
    v14->_state = 0;
    v20[0] = @"tripName";
    v20[1] = @"isLongTrip";
    v21[0] = v12;
    v15 = [NSNumber numberWithBool:v7];
    v21[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    additionalInfo = v14->_additionalInfo;
    v14->_additionalInfo = (NSDictionary *)v16;

    v14->_localFactoryScore = a6;
  }

  return v14;
}

@end