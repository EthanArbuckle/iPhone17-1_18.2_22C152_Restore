@interface Account
- (Account)init;
- (BOOL)hasSameRelevantInfoAs:(id)a3;
- (BOOL)isActive;
- (BOOL)isValid;
- (BOOL)supportsMultipleActiveAccounts;
- (NSString)uniqueId;
- (NSString)uuid;
- (void)setIsActive:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation Account

- (Account)init
{
  v6.receiver = self;
  v6.super_class = (Class)Account;
  v2 = [(Account *)&v6 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    v4 = [v3 UUIDString];
    [(Account *)v2 setUuid:v4];
  }
  return v2;
}

- (BOOL)supportsMultipleActiveAccounts
{
  return 0;
}

- (NSString)uniqueId
{
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)hasSameRelevantInfoAs:(id)a3
{
  id v5 = a3;
  if (v5 && [v5 isMemberOfClass:objc_opt_class()])
  {
    objc_super v6 = [v5 uniqueId];
    if (v6 || ([v5 uniqueId], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = [v5 uniqueId];
      v8 = [(Account *)self uniqueId];
      unsigned __int8 v9 = [v7 isEqualToString:v8];

      if (v6)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      unsigned __int8 v9 = 1;
    }

    goto LABEL_10;
  }
  unsigned __int8 v9 = 0;
LABEL_11:

  return v9;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
}

@end