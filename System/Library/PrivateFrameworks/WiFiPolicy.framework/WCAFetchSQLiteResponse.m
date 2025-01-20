@interface WCAFetchSQLiteResponse
+ (BOOL)supportsSecureCoding;
- (NSArray)records;
- (WCAFetchSQLiteResponse)initWithCoder:(id)a3;
- (WCAFetchSQLiteResponse)initWithRecords:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRecords:(id)a3;
@end

@implementation WCAFetchSQLiteResponse

- (WCAFetchSQLiteResponse)initWithRecords:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WCAFetchSQLiteResponse;
  id v3 = a3;
  v4 = [(WCAFetchSQLiteResponse *)&v6 init];
  -[WCAFetchSQLiteResponse setRecords:](v4, "setRecords:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringWithFormat:@"<%@ : %p ", v5, self];

  [v6 appendFormat:@"records: %@", self->_records];
  [v6 appendString:@">"];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WCAFetchSQLiteResponse;
  id v4 = a3;
  [(WCAFetchResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_records, @"_records", v5.receiver, v5.super_class);
}

- (WCAFetchSQLiteResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WCAFetchSQLiteResponse;
  objc_super v5 = [(WCAFetchResponse *)&v14 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_records"];
    records = v5->_records;
    v5->_records = (NSArray *)v11;
  }
  return v5;
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (void).cxx_destruct
{
}

@end