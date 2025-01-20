@interface RMUIKeyValueDetailViewModel
+ (BOOL)supportsSecureCoding;
- (NSString)title;
- (NSString)value;
- (NSString)viewID;
- (RMUIKeyValueDetailViewModel)init;
- (RMUIKeyValueDetailViewModel)initWithCoder:(id)a3;
- (RMUIKeyValueDetailViewModel)initWithTitle:(id)a3 value:(id)a4;
- (void)clearModel;
- (void)encodeWithCoder:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation RMUIKeyValueDetailViewModel

- (RMUIKeyValueDetailViewModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)RMUIKeyValueDetailViewModel;
  v2 = [(RMUIKeyValueDetailViewModel *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    viewID = v2->_viewID;
    v2->_viewID = (NSString *)v4;
  }
  return v2;
}

- (RMUIKeyValueDetailViewModel)initWithTitle:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(RMUIKeyValueDetailViewModel *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (void)clearModel
{
  [(RMUIKeyValueDetailViewModel *)self setTitle:0];

  [(RMUIKeyValueDetailViewModel *)self setValue:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RMUIKeyValueDetailViewModel *)self viewID];
  [v4 encodeObject:v5 forKey:@"viewID"];

  v6 = [(RMUIKeyValueDetailViewModel *)self title];
  [v4 encodeObject:v6 forKey:@"title"];

  id v7 = [(RMUIKeyValueDetailViewModel *)self value];
  [v4 encodeObject:v7 forKey:@"value"];
}

- (RMUIKeyValueDetailViewModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RMUIKeyValueDetailViewModel;
  v5 = [(RMUIKeyValueDetailViewModel *)&v16 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"viewID"];
    viewID = v5->_viewID;
    v5->_viewID = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v13;
  }
  return v5;
}

- (NSString)viewID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_viewID, 0);
}

@end