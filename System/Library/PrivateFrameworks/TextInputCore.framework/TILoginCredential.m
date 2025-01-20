@interface TILoginCredential
- (BOOL)isEqual:(id)a3;
- (NSString)password;
- (NSString)site;
- (NSString)username;
- (TILoginCredential)initWithUsername:(id)a3 password:(id)a4 site:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation TILoginCredential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_site, 0);
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

- (NSString)site
{
  return self->_site;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)username
{
  return self->_username;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = [(TILoginCredential *)self username];
  [v3 appendFormat:@"; username = %@", v4];

  v5 = [(TILoginCredential *)self password];
  [v3 appendFormat:@"; password = %@", v5];

  v6 = [(TILoginCredential *)self site];
  [v3 appendFormat:@"; site = %@", v6];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [(TILoginCredential *)self username];
    uint64_t v7 = [v5 username];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(TILoginCredential *)self username];
      v10 = [(TILoginCredential *)self username];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(TILoginCredential *)self password];
    uint64_t v14 = [v5 password];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(TILoginCredential *)self password];
      v17 = [(TILoginCredential *)self password];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(TILoginCredential *)self site];
    v20 = [v5 site];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(TILoginCredential *)self site];
      v22 = [(TILoginCredential *)self site];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_username copy];
    v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = [(NSString *)self->_password copy];
    v8 = (void *)v4[2];
    v4[2] = v7;

    uint64_t v9 = [(NSString *)self->_site copy];
    v10 = (void *)v4[3];
    v4[3] = v9;
  }
  return v4;
}

- (TILoginCredential)initWithUsername:(id)a3 password:(id)a4 site:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TILoginCredential;
  char v12 = [(TILoginCredential *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_username, a3);
    objc_storeStrong((id *)&v13->_password, a4);
    objc_storeStrong((id *)&v13->_site, a5);
  }

  return v13;
}

@end