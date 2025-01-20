@interface PGSocialGroupsQuestion
- (PGSocialGroupsQuestion)initWithSocialGroupID:(id)a3 personLocalIdentifiers:(id)a4 personNames:(id)a5 localFactoryScore:(double)a6;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGSocialGroupsQuestion

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
  return 5;
}

- (unsigned)displayType
{
  return 3;
}

- (unsigned)type
{
  return 17;
}

- (PGSocialGroupsQuestion)initWithSocialGroupID:(id)a3 personLocalIdentifiers:(id)a4 personNames:(id)a5 localFactoryScore:(double)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PGSocialGroupsQuestion;
  v12 = [(PGSocialGroupsQuestion *)&v28 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityIdentifier, a3);
    v13->_localFactoryScore = a6;
    v13->_state = 0;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v11 count])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v11;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v25;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = objc_msgSend(MEMORY[0x1E4F391F0], "uuidFromLocalIdentifier:", *(void *)(*((void *)&v24 + 1) + 8 * v19), (void)v24);
            if (v20) {
              [v14 addObject:v20];
            }

            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v31 count:16];
        }
        while (v17);
      }
    }
    v29 = @"personUUIDs";
    id v30 = v14;
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1, (void)v24);
    additionalInfo = v13->_additionalInfo;
    v13->_additionalInfo = (NSDictionary *)v21;
  }
  return v13;
}

@end