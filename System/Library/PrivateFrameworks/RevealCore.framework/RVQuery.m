@interface RVQuery
+ (BOOL)supportsSecureCoding;
- (NSString)identifier;
- (NSString)title;
- (NSString)userAgent;
- (RVQuery)initWithCoder:(id)a3;
- (RVQuery)initWithTitle:(id)a3 clientIdentifier:(id)a4 userAgent:(id)a5 queryID:(int64_t)a6 queryProvider:(id)a7;
- (id)queryProvider;
- (int64_t)queryID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RVQuery

- (void).cxx_destruct
{
  objc_storeStrong(&self->_queryProvider, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (id)queryProvider
{
  return self->_queryProvider;
}

- (int64_t)queryID
{
  return self->_queryID;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (RVQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RVQuery;
  v5 = [(RVQuery *)&v13 init];
  if (v5)
  {
    v5->_queryID = [v4 decodeIntegerForKey:@"queryID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userAgent"];
    userAgent = v5->_userAgent;
    v5->_userAgent = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t queryID = self->_queryID;
  id v5 = a3;
  [v5 encodeInteger:queryID forKey:@"queryID"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_userAgent forKey:@"userAgent"];
  [v5 encodeObject:self->_title forKey:@"title"];
}

- (RVQuery)initWithTitle:(id)a3 clientIdentifier:(id)a4 userAgent:(id)a5 queryID:(int64_t)a6 queryProvider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)RVQuery;
  v17 = [(RVQuery *)&v22 init];
  v18 = v17;
  if (v17)
  {
    v17->_int64_t queryID = a6;
    objc_storeStrong((id *)&v17->_identifier, a4);
    objc_storeStrong((id *)&v18->_userAgent, a5);
    objc_storeStrong((id *)&v18->_title, a3);
    uint64_t v19 = MEMORY[0x210558890](v16);
    id queryProvider = v18->_queryProvider;
    v18->_id queryProvider = (id)v19;
  }
  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end