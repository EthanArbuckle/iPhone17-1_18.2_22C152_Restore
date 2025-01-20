@interface PGTripTitlingQuestion
- (PGTripTitlingQuestion)initWithTripTitle:(id)a3 legacyTripTitle:(id)a4 keyAssetUUID:(id)a5 localFactoryScore:(double)a6 duplicatedTitles:(BOOL)a7;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGTripTitlingQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (unsigned)state
{
  return self->_state;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
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
  return 26;
}

- (PGTripTitlingQuestion)initWithTripTitle:(id)a3 legacyTripTitle:(id)a4 keyAssetUUID:(id)a5 localFactoryScore:(double)a6 duplicatedTitles:(BOOL)a7
{
  BOOL v7 = a7;
  v26[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PGTripTitlingQuestion;
  v15 = [(PGTripTitlingQuestion *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_entityIdentifier, a5);
    v16->_state = 0;
    v16->_localFactoryScore = a6;
    uint64_t v17 = *MEMORY[0x1E4F8E918];
    v25[0] = *MEMORY[0x1E4F8EAB0];
    v25[1] = v17;
    v26[0] = v12;
    v26[1] = &unk_1F28D2238;
    uint64_t v18 = *MEMORY[0x1E4F8EAA0];
    v26[2] = v13;
    uint64_t v19 = *MEMORY[0x1E4F8EA88];
    v25[2] = v18;
    v25[3] = v19;
    v20 = [NSNumber numberWithBool:v7];
    v26[3] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
    additionalInfo = v16->_additionalInfo;
    v16->_additionalInfo = (NSDictionary *)v21;
  }
  return v16;
}

@end