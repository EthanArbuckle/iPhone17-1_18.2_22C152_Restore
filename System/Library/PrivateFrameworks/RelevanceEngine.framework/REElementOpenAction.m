@interface REElementOpenAction
- (BOOL)isEqual:(id)a3;
- (NSString)applicationID;
- (NSURL)url;
- (REElementOpenAction)init;
- (REElementOpenAction)initWithCoder:(id)a3;
- (REElementOpenAction)initWithURL:(id)a3 applicationID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_performWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REElementOpenAction

- (REElementOpenAction)init
{
  return [(REElementOpenAction *)self initWithURL:0 applicationID:0];
}

- (REElementOpenAction)initWithURL:(id)a3 applicationID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REElementOpenAction;
  v9 = [(REElementOpenAction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_applicationID, a4);
  }

  return v10;
}

- (REElementOpenAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REElementOpenAction;
  v5 = [(REElementAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"applicationID"];
    applicationID = v5->_applicationID;
    v5->_applicationID = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REElementOpenAction;
  id v4 = a3;
  [(REElementAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, @"url", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_applicationID forKey:@"applicationID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REElementOpenAction;
  id v4 = (id *)[(REElementOpenAction *)&v6 copy];
  objc_storeStrong(v4 + 3, self->_url);
  objc_storeStrong(v4 + 4, self->_applicationID);
  return v4;
}

- (void)_performWithContext:(id)a3
{
  uint64_t v4 = [(REElementOpenAction *)self url];
  if (v4)
  {
    objc_super v5 = (void *)v4;
    objc_super v6 = [(REElementOpenAction *)self applicationID];

    if (v6)
    {
      id v7 = [(REElementOpenAction *)self url];
      uint64_t v8 = [(REElementOpenAction *)self applicationID];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __43__REElementOpenAction__performWithContext___block_invoke;
      v9[3] = &unk_2644BCB70;
      v9[4] = self;
      RELaunchApp(v7, v8, v9);
    }
  }
}

uint64_t __43__REElementOpenAction__performWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _didFinish:a2 == 0];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)REElementOpenAction;
  v3 = [(REElementOpenAction *)&v6 description];
  uint64_t v4 = [v3 stringByAppendingFormat:@" url=%@, applicationId=%@", self->_url, self->_applicationID];

  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_url hash];
  return [(NSString *)self->_applicationID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (id *)v4;
    url = self->_url;
    id v7 = (NSURL *)v5[3];
    if (url == v7)
    {
    }
    else
    {
      uint64_t v8 = v7;
      v9 = url;
      int v10 = [(NSURL *)v9 isEqual:v8];

      if (!v10)
      {
        char v11 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    applicationID = self->_applicationID;
    v13 = (NSString *)v5[4];
    v14 = applicationID;
    v15 = v14;
    if (v14 == v13) {
      char v11 = 1;
    }
    else {
      char v11 = [(NSString *)v14 isEqual:v13];
    }

    goto LABEL_11;
  }
  char v11 = 0;
LABEL_12:

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end