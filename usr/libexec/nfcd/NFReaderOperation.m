@interface NFReaderOperation
+ (BOOL)supportsSecureCoding;
- (NFReaderOperation)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFReaderOperation

- (id)description
{
  v3 = objc_opt_new();
  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSS"];
  id v4 = objc_alloc((Class)NSString);
  operation = self->_operation;
  v6 = [v3 stringFromDate:self->_date];
  id v7 = [v4 initWithFormat:@"%@ : %@", operation, v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"Date"];
  [v5 encodeObject:self->_operation forKey:@"Operation"];
}

- (NFReaderOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFReaderOperation;
  id v5 = [(NFReaderOperation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Operation"];
    operation = v5->_operation;
    v5->_operation = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end