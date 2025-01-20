@interface PPEventsAggregator
- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4;
- (NSArray)eventsPool;
- (PPEventsAggregator)initWithEventsPool:(id)a3;
- (id)tripCandidatesFromEventsPool;
- (id)tripCandidatesFromEventsPoolForCategory:(void *)a1;
- (void)dedupeEventsInPool;
- (void)dedupeEventsInPoolForCategory:(void *)a1;
- (void)setEventsPool:(id)a3;
@end

@implementation PPEventsAggregator

- (void).cxx_destruct
{
}

- (void)setEventsPool:(id)a3
{
}

- (NSArray)eventsPool
{
  return self->_eventsPool;
}

- (void)dedupeEventsInPool
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"dedupeEventsInPool: Method must be overridden" userInfo:0];
  objc_exception_throw(v2);
}

- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"isEvent: Method must be overridden" userInfo:0];
  objc_exception_throw(v7);
}

- (id)tripCandidatesFromEventsPool
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"tripCandidatesFromEventsPool: Method must be overridden" userInfo:0];
  objc_exception_throw(v2);
}

- (PPEventsAggregator)initWithEventsPool:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPEventsAggregator;
  id v6 = [(PPEventsAggregator *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_eventsPool, a3);
  }

  return v7;
}

- (void)dedupeEventsInPoolForCategory:(void *)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v15 = a1;
  id obj = [a1 eventsPool];
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = v4;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          while (2)
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              if (objc_msgSend(v9, "pp_isDupeOfEvent:forCategory:", *(void *)(*((void *)&v17 + 1) + 8 * v14), a2))
              {

                goto LABEL_16;
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        [v10 addObject:v9];
LABEL_16:
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  [v15 setEventsPool:v4];
}

- (id)tripCandidatesFromEventsPoolForCategory:(void *)a1
{
  if (a1)
  {
    char v2 = a2;
    -[PPEventsAggregator dedupeEventsInPoolForCategory:](a1, a2);
    v4 = [a1 eventsPool];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__PPEventsAggregator_tripCandidatesFromEventsPoolForCategory___block_invoke;
    v7[3] = &__block_descriptor_33_e34___PPTripCandidate_16__0__EKEvent_8l;
    char v8 = v2;
    uint64_t v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v7);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

id __62__PPEventsAggregator_tripCandidatesFromEventsPoolForCategory___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_opt_new();
  switch(*(unsigned char *)(a1 + 32))
  {
    case 0:
    case 0xB:
    case 0xC:
      uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3C8];
      objc_super v9 = @"tripCandidatesFromEventsPoolForCategory: Unsupported category";
      goto LABEL_11;
    case 1:
      uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3C8];
      objc_super v9 = @"tripCandidatesFromEventsPoolForCategory: Flight category is not supported";
LABEL_11:
      id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
      objc_exception_throw(v10);
    case 2:
    case 8:
    case 9:
      v13[0] = v3;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [v4 setOthers:v5];
      goto LABEL_5;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      id v12 = v3;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
      [v4 setGroundTransports:v5];
      goto LABEL_5;
    case 0xA:
      id v11 = v3;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
      [v4 setHotels:v5];
LABEL_5:

      break;
    default:
      break;
  }

  return v4;
}

@end