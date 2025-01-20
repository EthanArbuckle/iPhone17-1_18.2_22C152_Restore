@interface SWDatastore
+ (SWDatastore)emptyDatastore;
- (BOOL)isEqual:(id)a3;
- (NSString)JSONString;
- (SWDatastore)initWithJSONString:(id)a3;
@end

@implementation SWDatastore

+ (SWDatastore)emptyDatastore
{
  v2 = (void *)[objc_alloc((Class)a1) initWithJSONString:@"{}"];
  return (SWDatastore *)v2;
}

- (SWDatastore)initWithJSONString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWDatastore;
  v5 = [(SWDatastore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    JSONString = v5->_JSONString;
    v5->_JSONString = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SWDatastore *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    char v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    JSONString = self->_JSONString;
    v7 = [(SWDatastore *)v5 JSONString];
    char v8 = [(NSString *)JSONString isEqualToString:v7];
  }
  else
  {
LABEL_5:
    char v8 = 0;
  }
LABEL_7:

  return v8;
}

- (NSString)JSONString
{
  return self->_JSONString;
}

- (void).cxx_destruct
{
}

@end