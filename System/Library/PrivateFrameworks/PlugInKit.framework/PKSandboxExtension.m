@interface PKSandboxExtension
- (BOOL)isEqual:(id)a3;
- (NSString)token;
- (PKSandboxExtension)initWithExtension:(id)a3 provider:(id)a4;
- (PKSandboxProvider)provider;
- (int64_t)handle;
- (void)consume;
- (void)dealloc;
- (void)expel;
- (void)setHandle:(int64_t)a3;
@end

@implementation PKSandboxExtension

- (PKSandboxExtension)initWithExtension:(id)a3 provider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSandboxExtension;
  v9 = [(PKSandboxExtension *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_token, a3);
    v10->_handle = -1;
    objc_storeStrong((id *)&v10->_provider, a4);
  }

  return v10;
}

- (void)dealloc
{
  [(PKSandboxExtension *)self expel];
  v3.receiver = self;
  v3.super_class = (Class)PKSandboxExtension;
  [(PKSandboxExtension *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(PKSandboxExtension *)self token];
    v6 = [v4 token];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)consume
{
  if ([(PKSandboxExtension *)self handle] == -1)
  {
    objc_super v3 = [(PKSandboxExtension *)self provider];
    id v4 = [(PKSandboxExtension *)self token];
    -[PKSandboxExtension setHandle:](self, "setHandle:", objc_msgSend(v3, "sandbox_extension_consume:", objc_msgSend(v4, "UTF8String")));

    int64_t v5 = [(PKSandboxExtension *)self handle];
    v6 = pklog_handle_for_category(4);
    char v7 = v6;
    if (v5 == -1)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1B38D5458(v7);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      sub_1B38D54E4(self);
    }
  }
}

- (void)expel
{
  if ([(PKSandboxExtension *)self handle] != -1)
  {
    objc_super v3 = [(PKSandboxExtension *)self provider];
    int v4 = objc_msgSend(v3, "sandbox_extension_release:", -[PKSandboxExtension handle](self, "handle"));

    int64_t v5 = pklog_handle_for_category(4);
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1B38D55C4(self, v6);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      sub_1B38D5554(self);
    }

    [(PKSandboxExtension *)self setHandle:-1];
  }
}

- (int64_t)handle
{
  return self->_handle;
}

- (void)setHandle:(int64_t)a3
{
  self->_handle = a3;
}

- (NSString)token
{
  return self->_token;
}

- (PKSandboxProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end