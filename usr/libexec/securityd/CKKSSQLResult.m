@interface CKKSSQLResult
- (BOOL)asBOOL;
- (NSString)stringValue;
- (id)asBase64DecodedData;
- (id)asISO8601Date;
- (id)asNSNumberInteger;
- (id)init:(id)a3;
- (int64_t)asNSInteger;
- (void)setStringValue:(id)a3;
@end

@implementation CKKSSQLResult

- (void).cxx_destruct
{
}

- (void)setStringValue:(id)a3
{
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)asBase64DecodedData
{
  v3 = [(CKKSSQLResult *)self stringValue];

  if (v3)
  {
    id v4 = objc_alloc((Class)NSData);
    v5 = [(CKKSSQLResult *)self stringValue];
    id v6 = [v4 initWithBase64EncodedString:v5 options:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)asISO8601Date
{
  v3 = [(CKKSSQLResult *)self stringValue];

  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSISO8601DateFormatter);
    v5 = [(CKKSSQLResult *)self stringValue];
    id v6 = [v4 dateFromString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)asNSNumberInteger
{
  v3 = [(CKKSSQLResult *)self stringValue];

  if (v3)
  {
    id v4 = [(CKKSSQLResult *)self stringValue];
    v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 integerValue]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)asNSInteger
{
  v2 = [(CKKSSQLResult *)self stringValue];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (BOOL)asBOOL
{
  v2 = [(CKKSSQLResult *)self stringValue];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)init:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSSQLResult;
  id v6 = [(CKKSSQLResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stringValue, a3);
  }

  return v7;
}

@end