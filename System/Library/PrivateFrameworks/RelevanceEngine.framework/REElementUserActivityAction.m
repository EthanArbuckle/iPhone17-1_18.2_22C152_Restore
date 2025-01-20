@interface REElementUserActivityAction
- (BOOL)isEqual:(id)a3;
- (NSString)applicationID;
- (NSUserActivity)userActivity;
- (REElementUserActivityAction)initWithUserActivity:(id)a3 applicationID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_performWithContext:(id)a3;
@end

@implementation REElementUserActivityAction

- (REElementUserActivityAction)initWithUserActivity:(id)a3 applicationID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REElementUserActivityAction;
  v9 = [(REElementUserActivityAction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userActivity, a3);
    objc_storeStrong((id *)&v10->_applicationID, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REElementUserActivityAction;
  v4 = (id *)[(REElementUserActivityAction *)&v6 copy];
  objc_storeStrong(v4 + 3, self->_userActivity);
  objc_storeStrong(v4 + 4, self->_applicationID);
  return v4;
}

- (void)_performWithContext:(id)a3
{
  userActivity = self->_userActivity;
  if (userActivity)
  {
    applicationID = self->_applicationID;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__REElementUserActivityAction__performWithContext___block_invoke;
    v6[3] = &unk_2644BCB70;
    v6[4] = self;
    REOpenUserActivity(userActivity, applicationID, v6);
  }
}

uint64_t __51__REElementUserActivityAction__performWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a2 == 0;
  [*(id *)(a1 + 32) _didFinish:v3];
  v4 = *(void **)(a1 + 32);
  return [v4 _submitMetricsWithSuccess:v3];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)REElementUserActivityAction;
  BOOL v3 = [(REElementUserActivityAction *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" userActivity=%@, applicationId=%@", self->_userActivity, self->_applicationID];

  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUserActivity *)self->_userActivity hash];
  return [(NSString *)self->_applicationID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    userActivity = self->_userActivity;
    id v7 = (NSUserActivity *)v5[3];
    if (userActivity == v7)
    {
    }
    else
    {
      id v8 = v7;
      v9 = userActivity;
      int v10 = [(NSUserActivity *)v9 isEqual:v8];

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

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end