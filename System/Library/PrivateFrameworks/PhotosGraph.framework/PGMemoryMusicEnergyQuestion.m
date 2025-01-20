@interface PGMemoryMusicEnergyQuestion
- (PGMemoryMusicEnergyQuestion)initWithMemory:(id)a3 song:(id)a4 localFactoryScore:(double)a5;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGMemoryMusicEnergyQuestion

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
  return 16;
}

- (PGMemoryMusicEnergyQuestion)initWithMemory:(id)a3 song:(id)a4 localFactoryScore:(double)a5
{
  v29[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PGMemoryMusicEnergyQuestion;
  v10 = [(PGMemoryMusicEnergyQuestion *)&v27 init];
  if (v10)
  {
    uint64_t v11 = [v8 uuid];
    entityIdentifier = v10->_entityIdentifier;
    v10->_entityIdentifier = (NSString *)v11;

    v10->_state = 0;
    v10->_localFactoryScore = a5;
    v28[0] = *MEMORY[0x1E4F8E9E8];
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "category"));
    v29[0] = v13;
    v28[1] = *MEMORY[0x1E4F8E9F0];
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "subcategory"));
    v29[1] = v14;
    v28[2] = *MEMORY[0x1E4F8EA08];
    uint64_t v15 = [v9 playbackStoreID];
    v16 = (void *)v15;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    else {
      v17 = @"Unknown";
    }
    v29[2] = v17;
    v28[3] = *MEMORY[0x1E4F8EA10];
    uint64_t v18 = [v9 title];
    v19 = (void *)v18;
    if (v18) {
      v20 = (__CFString *)v18;
    }
    else {
      v20 = @"Unknown";
    }
    v29[3] = v20;
    v28[4] = *MEMORY[0x1E4F8E9F8];
    uint64_t v21 = [v9 artist];
    v22 = (void *)v21;
    if (v21) {
      v23 = (__CFString *)v21;
    }
    else {
      v23 = @"Unknown";
    }
    v29[4] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:5];
    additionalInfo = v10->_additionalInfo;
    v10->_additionalInfo = (NSDictionary *)v24;
  }
  return v10;
}

@end