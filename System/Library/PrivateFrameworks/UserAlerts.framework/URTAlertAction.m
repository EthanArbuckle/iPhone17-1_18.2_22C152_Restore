@interface URTAlertAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithTitle:(id)a3 handler:(id)a4;
- (NSString)title;
- (URTAlertAction)initWithCoder:(id)a3;
- (URTAlertAction)initWithTitle:(id)a3 handler:(id)a4;
- (id)handler;
- (void)encodeWithCoder:(id)a3;
@end

@implementation URTAlertAction

+ (id)actionWithTitle:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithTitle:v7 handler:v6];

  return v8;
}

- (URTAlertAction)initWithTitle:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)URTAlertAction;
  v9 = [(URTAlertAction *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    uint64_t v11 = MEMORY[0x22A64BD90](v8);
    id handler = v10->_handler;
    v10->_id handler = (id)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (URTAlertAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)URTAlertAction;
  v5 = [(URTAlertAction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URTAlertActionTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(URTAlertAction *)self title];
  [v4 encodeObject:v5 forKey:@"URTAlertActionTitleKey"];
}

- (NSString)title
{
  return self->_title;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end