@interface PGPublicEventQuestion
- (PGPublicEventQuestion)initWithAssetUUID:(id)a3 publicEventMUID:(unint64_t)a4 publicEventName:(id)a5 localFactoryScore:(double)a6;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGPublicEventQuestion

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
  return 6;
}

- (PGPublicEventQuestion)initWithAssetUUID:(id)a3 publicEventMUID:(unint64_t)a4 publicEventName:(id)a5 localFactoryScore:(double)a6
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGPublicEventQuestion;
  v13 = [(PGPublicEventQuestion *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_entityIdentifier, a3);
    v14->_localFactoryScore = a6;
    v14->_state = 0;
    v20[0] = @"publicEventMUID";
    v15 = [NSNumber numberWithUnsignedLongLong:a4];
    v20[1] = @"publicEventName";
    v21[0] = v15;
    v21[1] = v12;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    additionalInfo = v14->_additionalInfo;
    v14->_additionalInfo = (NSDictionary *)v16;
  }
  return v14;
}

@end