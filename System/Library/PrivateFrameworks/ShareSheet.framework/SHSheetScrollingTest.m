@interface SHSheetScrollingTest
+ (BOOL)supportsBSXPCSecureCoding;
- (NSString)name;
- (SHSheetScrollingTest)initWithBSXPCCoder:(id)a3;
- (SHSheetScrollingTest)initWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (int64_t)type;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation SHSheetScrollingTest

- (SHSheetScrollingTest)initWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SHSheetScrollingTest;
  v10 = [(SHSheetScrollingTest *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_type = a4;
    uint64_t v13 = [v9 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v13;
  }
  return v10;
}

- (SHSheetScrollingTest)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"type"];

  v7 = [(SHSheetScrollingTest *)self initWithName:v5 type:v6 completionHandler:0];
  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(SHSheetScrollingTest *)self name];
  [v5 encodeObject:v4 forKey:@"name"];

  objc_msgSend(v5, "encodeInt64:forKey:", -[SHSheetScrollingTest type](self, "type"), @"type");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end