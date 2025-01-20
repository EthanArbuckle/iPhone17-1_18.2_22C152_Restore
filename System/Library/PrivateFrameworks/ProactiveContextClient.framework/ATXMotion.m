@interface ATXMotion
+ (BOOL)canPredictClipsForActivityStream:(id)a3;
+ (id)_getMotionStringFromCMMotionActivity:(id)a3;
+ (id)findMostCommonAndRecent:(id)a3 identityFunc:(id)a4;
+ (id)getMotionStringFromMotionType:(int64_t)a3;
+ (id)summarizeActivityStream:(id)a3;
+ (int64_t)_getMotionTypeFromCMMotionActivity:(id)a3;
- (ATXMotion)initWithMotionType:(int64_t)a3 stationary:(BOOL)a4 canPredictClipsGivenRecentMotion:(BOOL)a5;
- (BOOL)canPredictClipsGivenRecentMotion;
- (BOOL)stationary;
- (id)getMotionString;
- (id)initFromCMMotionActivity:(id)a3;
- (id)initFromCMMotionActivity:(id)a3 canPredictClipsGivenRecentMotion:(BOOL)a4;
- (id)print;
- (int64_t)motiontype;
@end

@implementation ATXMotion

- (ATXMotion)initWithMotionType:(int64_t)a3 stationary:(BOOL)a4 canPredictClipsGivenRecentMotion:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ATXMotion;
  result = [(ATXMotion *)&v9 init];
  if (result)
  {
    result->_motiontype = a3;
    result->_stationary = a4;
    result->_canPredictClipsGivenRecentMotion = a5;
  }
  return result;
}

- (id)initFromCMMotionActivity:(id)a3
{
  return [(ATXMotion *)self initFromCMMotionActivity:a3 canPredictClipsGivenRecentMotion:1];
}

- (id)initFromCMMotionActivity:(id)a3 canPredictClipsGivenRecentMotion:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = +[ATXMotion _getMotionTypeFromCMMotionActivity:v6];
  if (v6) {
    uint64_t v8 = [v6 stationary];
  }
  else {
    uint64_t v8 = 1;
  }
  objc_super v9 = [(ATXMotion *)self initWithMotionType:v7 stationary:v8 canPredictClipsGivenRecentMotion:v4];

  return v9;
}

+ (id)_getMotionStringFromCMMotionActivity:(id)a3
{
  if (a3) {
    int64_t v3 = +[ATXMotion _getMotionTypeFromCMMotionActivity:](ATXMotion, "_getMotionTypeFromCMMotionActivity:");
  }
  else {
    int64_t v3 = 4;
  }
  BOOL v4 = +[ATXMotion getMotionStringFromMotionType:v3];

  return v4;
}

+ (int64_t)_getMotionTypeFromCMMotionActivity:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    if ([v3 walking])
    {
      int64_t v5 = 0;
    }
    else if ([v4 running])
    {
      int64_t v5 = 1;
    }
    else if ([v4 cycling])
    {
      int64_t v5 = 2;
    }
    else if ([v4 automotive])
    {
      int64_t v5 = 3;
    }
    else
    {
      int64_t v5 = 4;
    }
  }
  else
  {
    int64_t v5 = 4;
  }

  return v5;
}

+ (id)getMotionStringFromMotionType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"unknown";
  }
  else {
    return off_1E6BE7B00[a3];
  }
}

- (id)getMotionString
{
  return +[ATXMotion getMotionStringFromMotionType:self->_motiontype];
}

- (id)print
{
  if (self->_stationary)
  {
    id v3 = [NSString alloc];
    BOOL v4 = [(ATXMotion *)self getMotionString];
    int64_t v5 = (void *)[v3 initWithFormat:@"%@|stationary", v4];
  }
  else
  {
    int64_t v5 = [(ATXMotion *)self getMotionString];
  }

  return v5;
}

+ (id)summarizeActivityStream:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = +[ATXMotion findMostCommonAndRecent:v5 identityFunc:&__block_literal_global_77_0];
    int64_t v7 = +[ATXMotion findMostCommonAndRecent:v6 identityFunc:&__block_literal_global_79];
    if ([v7 count])
    {
      uint64_t v8 = [ATXMotion alloc];
      objc_super v9 = [v7 objectAtIndexedSubscript:0];
      id v10 = -[ATXMotion initFromCMMotionActivity:canPredictClipsGivenRecentMotion:](v8, "initFromCMMotionActivity:canPredictClipsGivenRecentMotion:", v9, [a1 canPredictClipsForActivityStream:v5]);
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __37__ATXMotion_summarizeActivityStream___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = NSNumber;
  int64_t v3 = +[ATXMotion _getMotionTypeFromCMMotionActivity:a2];

  return [v2 numberWithInteger:v3];
}

uint64_t __37__ATXMotion_summarizeActivityStream___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 stationary];

  return [v2 numberWithBool:v3];
}

+ (BOOL)canPredictClipsForActivityStream:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_6;
  }
  int64_t v5 = __atxlog_handle_hero();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __46__ATXMotion_canPredictClipsForActivityStream___block_invoke;
    v22[3] = &__block_descriptor_40_e26__16__0__CMMotionActivity_8l;
    v22[4] = a1;
    id v6 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v22);
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "Current motion activities: %@", buf, 0xCu);
  }
  int64_t v7 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v4, "count") - 1);
  int64_t v8 = +[ATXMotion _getMotionTypeFromCMMotionActivity:v7];

  if (v8 == 3)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
LABEL_6:
    unint64_t v10 = [v4 count];
    uint64_t v11 = [v4 count];
    if (v10 >= 2) {
      uint64_t v12 = v11 - 2;
    }
    else {
      uint64_t v12 = 0;
    }
    if (v10 >= 2) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = v11;
    }
    objc_msgSend(v4, "subarrayWithRange:", v12, v13);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v14 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v15 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v14);
          }
          if ((+[ATXMotion _getMotionTypeFromCMMotionActivity:](ATXMotion, "_getMotionTypeFromCMMotionActivity:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18) & 0xFFFFFFFFFFFFFFFBLL) == 0)
          {
            LOBYTE(v9) = 1;
            goto LABEL_22;
          }
        }
        uint64_t v9 = [v14 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
  return v9;
}

uint64_t __46__ATXMotion_canPredictClipsForActivityStream___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(id)objc_opt_class() _getMotionTypeFromCMMotionActivity:v2];

  return [v3 getMotionStringFromMotionType:v4];
}

+ (id)findMostCommonAndRecent:(id)a3 identityFunc:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  int64_t v7 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v24 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = v6[2](v6, *(void *)(*((void *)&v28 + 1) + 8 * i));
        id v14 = [v7 objectForKeyedSubscript:v13];
        unint64_t v15 = [v14 integerValue] + 1;

        v16 = [NSNumber numberWithUnsignedInteger:v15];
        [v7 setObject:v16 forKeyedSubscript:v13];

        if (v15 >= v10)
        {
          id v17 = v13;

          v24 = v17;
          unint64_t v10 = v15;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }
  else
  {
    v24 = 0;
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __50__ATXMotion_findMostCommonAndRecent_identityFunc___block_invoke;
  v25[3] = &unk_1E6BE7AE0;
  id v26 = v24;
  id v27 = v6;
  long long v18 = v6;
  id v19 = v24;
  long long v20 = [obj indexesOfObjectsPassingTest:v25];
  long long v21 = [obj objectsAtIndexes:v20];

  return v21;
}

BOOL __50__ATXMotion_findMostCommonAndRecent_identityFunc___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  BOOL v3 = v1 == v2;

  return v3;
}

- (int64_t)motiontype
{
  return self->_motiontype;
}

- (BOOL)stationary
{
  return self->_stationary;
}

- (BOOL)canPredictClipsGivenRecentMotion
{
  return self->_canPredictClipsGivenRecentMotion;
}

@end