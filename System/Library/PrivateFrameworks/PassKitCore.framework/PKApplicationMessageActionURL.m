@interface PKApplicationMessageActionURL
+ (BOOL)supportsSecureCoding;
+ (id)createWithSensitiveURL:(id)a3;
+ (id)createWithURL:(id)a3;
- (NSURL)url;
- (PKApplicationMessageActionURL)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationMessageActionURL

+ (id)createWithURL:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = +[PKApplicationMessageAction _createForType:]((uint64_t)PKApplicationMessageAction, 0);
  uint64_t v5 = [v3 copy];

  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

+ (id)createWithSensitiveURL:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = +[PKApplicationMessageAction _createForType:]((uint64_t)PKApplicationMessageAction, 1);
  uint64_t v5 = [v3 copy];

  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageActionURL)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplicationMessageActionURL;
  uint64_t v5 = [(PKApplicationMessageAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageActionURL;
  id v4 = a3;
  [(PKApplicationMessageAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, @"url", v5.receiver, v5.super_class);
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end