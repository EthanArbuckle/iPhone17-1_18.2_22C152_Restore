@interface RMUIInteractiveProfileErrorViewModel
+ (BOOL)supportsSecureCoding;
- (NSError)error;
- (NSString)message;
- (NSString)okText;
- (NSString)title;
- (RMUIInteractiveProfileErrorViewModel)initWithCoder:(id)a3;
- (RMUIInteractiveProfileErrorViewModel)initWithError:(id)a3 isActivating:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOkText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RMUIInteractiveProfileErrorViewModel

- (RMUIInteractiveProfileErrorViewModel)initWithError:(id)a3 isActivating:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RMUIInteractiveProfileErrorViewModel;
  v7 = [(RMUIInteractiveProfileErrorViewModel *)&v13 init];
  if (v7)
  {
    if (v4) {
      v8 = @"RMUI_PROFILE_ACTIVATE_ERROR_TITLE";
    }
    else {
      v8 = @"RMUI_PROFILE_DEACTIVATE_ERROR_TITLE";
    }
    v9 = +[RMUILocalizable string:v8];
    [(RMUIInteractiveProfileErrorViewModel *)v7 setTitle:v9];

    v10 = [v6 localizedDescription];
    [(RMUIInteractiveProfileErrorViewModel *)v7 setMessage:v10];

    v11 = +[RMUILocalizable string:@"RMUI_PROFILE_ERROR_OK"];
    [(RMUIInteractiveProfileErrorViewModel *)v7 setOkText:v11];

    [(RMUIInteractiveProfileErrorViewModel *)v7 setError:v6];
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RMUIInteractiveProfileErrorViewModel *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  id v6 = [(RMUIInteractiveProfileErrorViewModel *)self message];
  [v4 encodeObject:v6 forKey:@"message"];

  v7 = [(RMUIInteractiveProfileErrorViewModel *)self okText];
  [v4 encodeObject:v7 forKey:@"okText"];

  id v8 = [(RMUIInteractiveProfileErrorViewModel *)self error];
  [v4 encodeObject:v8 forKey:@"error"];
}

- (RMUIInteractiveProfileErrorViewModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RMUIInteractiveProfileErrorViewModel;
  v5 = [(RMUIInteractiveProfileErrorViewModel *)&v19 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"okText"];
    okText = v5->_okText;
    v5->_okText = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v16;
  }
  return v5;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessage:(id)a3
{
}

- (NSString)okText
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOkText:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_okText, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end