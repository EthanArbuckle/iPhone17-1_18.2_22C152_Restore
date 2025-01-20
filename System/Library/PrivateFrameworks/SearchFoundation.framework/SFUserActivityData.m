@interface SFUserActivityData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)userInfo;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)activityType;
- (SFUserActivityData)initWithCoder:(id)a3;
- (SFUserActivityData)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityType:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation SFUserActivityData

- (SFUserActivityData)initWithProtobuf:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFUserActivityData;
  v5 = [(SFUserActivityData *)&v22 init];
  if (v5)
  {
    v6 = [v4 activityType];

    if (v6)
    {
      v7 = [v4 activityType];
      [(SFUserActivityData *)v5 setActivityType:v7];
    }
    v8 = [v4 userInfos];
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
    v10 = objc_msgSend(v4, "userInfos", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
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
          v15 = [[SFUserActivityInfo alloc] initWithProtobuf:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }

    [(SFUserActivityData *)v5 setUserInfo:v9];
    v16 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

- (void)setUserInfo:(id)a3
{
}

- (NSArray)userInfo
{
  return self->_userInfo;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (unint64_t)hash
{
  v3 = [(SFUserActivityData *)self activityType];
  uint64_t v4 = [v3 hash];
  v5 = [(SFUserActivityData *)self userInfo];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFUserActivityData *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFUserActivityData *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      v7 = [(SFUserActivityData *)self activityType];
      v8 = [(SFUserActivityData *)v6 activityType];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      id v9 = [(SFUserActivityData *)self activityType];
      if (v9)
      {
        v3 = [(SFUserActivityData *)self activityType];
        v10 = [(SFUserActivityData *)v6 activityType];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        long long v21 = v10;
      }
      uint64_t v12 = [(SFUserActivityData *)self userInfo];
      uint64_t v13 = [(SFUserActivityData *)v6 userInfo];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
      }
      else
      {
        uint64_t v15 = [(SFUserActivityData *)self userInfo];
        if (v15)
        {
          v16 = (void *)v15;
          long long v19 = [(SFUserActivityData *)self userInfo];
          [(SFUserActivityData *)v6 userInfo];
          v17 = long long v20 = v3;
          char v11 = [v19 isEqual:v17];

          v3 = v20;
        }
        else
        {

          char v11 = 1;
        }
      }
      v10 = v21;
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFUserActivityData *)self activityType];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setActivityType:v6];

  v7 = [(SFUserActivityData *)self userInfo];
  v8 = (void *)[v7 copy];
  [v4 setUserInfo:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBUserActivityData alloc] initWithFacade:self];
  v3 = [(_SFPBUserActivityData *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBUserActivityData alloc] initWithFacade:self];
  v3 = [(_SFPBUserActivityData *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBUserActivityData alloc] initWithFacade:self];
  v5 = [(_SFPBUserActivityData *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFUserActivityData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBUserActivityData alloc] initWithData:v5];
  v7 = [(SFUserActivityData *)self initWithProtobuf:v6];

  return v7;
}

@end