@interface SecureChannelAction
+ (BOOL)supportsSecureCoding;
- (NSString)message;
- (NSString)title;
- (NSURL)url;
- (SecureChannelAction)initWithCoder:(id)a3;
- (SecureChannelAction)initWithURL:(id)a3 title:(id)a4 message:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation SecureChannelAction

- (SecureChannelAction)initWithURL:(id)a3 title:(id)a4 message:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SecureChannelAction;
  v12 = [(SecureChannelAction *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_message, a5);
  }

  return v13;
}

- (void)performWithCompletionHandler:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_message forKey:@"message"];
}

- (SecureChannelAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SecureChannelAction;
  id v5 = [(SecureChannelAction *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v10;
  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end