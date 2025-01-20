@interface _SFPBUserActivityData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)userInfos;
- (NSData)jsonData;
- (NSString)activityType;
- (_SFPBUserActivityData)initWithDictionary:(id)a3;
- (_SFPBUserActivityData)initWithFacade:(id)a3;
- (_SFPBUserActivityData)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)userInfoAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)userInfoCount;
- (void)addUserInfo:(id)a3;
- (void)clearUserInfo;
- (void)setActivityType:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBUserActivityData

- (_SFPBUserActivityData)initWithFacade:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBUserActivityData *)self init];
  if (v5)
  {
    v6 = [v4 activityType];

    if (v6)
    {
      v7 = [v4 activityType];
      [(_SFPBUserActivityData *)v5 setActivityType:v7];
    }
    v8 = [v4 userInfo];
    if (v8) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v9 = 0;
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v10 = objc_msgSend(v4, "userInfo", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[_SFPBUserActivityInfo alloc] initWithFacade:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [(_SFPBUserActivityData *)v5 setUserInfos:v9];
    v16 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfos, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

- (void)setUserInfos:(id)a3
{
}

- (NSArray)userInfos
{
  return self->_userInfos;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (_SFPBUserActivityData)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFPBUserActivityData;
  v5 = [(_SFPBUserActivityData *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"activityType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBUserActivityData *)v5 setActivityType:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"userInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[_SFPBUserActivityInfo alloc] initWithDictionary:v14];
              [(_SFPBUserActivityData *)v5 addUserInfo:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;
  }
  return v5;
}

- (_SFPBUserActivityData)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBUserActivityData *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBUserActivityData *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_activityType)
  {
    id v4 = [(_SFPBUserActivityData *)self activityType];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"activityType"];
  }
  if ([(NSArray *)self->_userInfos count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = self->_userInfos;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"userInfo"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_activityType hash];
  return [(NSArray *)self->_userInfos hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBUserActivityData *)self activityType];
  v6 = [v4 activityType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBUserActivityData *)self activityType];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBUserActivityData *)self activityType];
    uint64_t v10 = [v4 activityType];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBUserActivityData *)self userInfos];
  v6 = [v4 userInfos];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBUserActivityData *)self userInfos];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBUserActivityData *)self userInfos];
    long long v15 = [v4 userInfos];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBUserActivityData *)self activityType];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBUserActivityData *)self userInfos];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBUserActivityDataReadFrom(self, (uint64_t)a3);
}

- (id)userInfoAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_userInfos objectAtIndexedSubscript:a3];
}

- (unint64_t)userInfoCount
{
  return [(NSArray *)self->_userInfos count];
}

- (void)addUserInfo:(id)a3
{
  id v4 = a3;
  userInfos = self->_userInfos;
  id v8 = v4;
  if (!userInfos)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_userInfos;
    self->_userInfos = v6;

    id v4 = v8;
    userInfos = self->_userInfos;
  }
  [(NSArray *)userInfos addObject:v4];
}

- (void)clearUserInfo
{
}

- (void)setUserInfo:(id)a3
{
  self->_userInfos = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setActivityType:(id)a3
{
  self->_activityType = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end