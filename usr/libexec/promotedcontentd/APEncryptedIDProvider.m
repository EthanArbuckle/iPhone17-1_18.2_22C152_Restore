@interface APEncryptedIDProvider
+ (id)provider;
- (APEncryptedID)currentEncryptedIDs;
- (APEncryptedID)oldEncryptedIDs;
- (APEncryptedIDProvider)init;
- (id)encryptedIDsForIDAccountPrivate:(id)a3;
- (void)_encryptIDs;
- (void)setCurrentEncryptedIDs:(id)a3;
- (void)setOldEncryptedIDs:(id)a3;
- (void)userAccountChanged;
@end

@implementation APEncryptedIDProvider

+ (id)provider
{
  if (qword_100289868 != -1) {
    dispatch_once(&qword_100289868, &stru_100235250);
  }
  v2 = (void *)qword_100289860;

  return v2;
}

- (APEncryptedIDProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)APEncryptedIDProvider;
  v2 = [(APEncryptedIDProvider *)&v5 init];
  v3 = v2;
  if (v2) {
    [(APEncryptedIDProvider *)v2 _encryptIDs];
  }
  return v3;
}

- (void)userAccountChanged
{
  v3 = [(APEncryptedIDProvider *)self currentEncryptedIDs];
  [(APEncryptedIDProvider *)self setOldEncryptedIDs:v3];

  [(APEncryptedIDProvider *)self _encryptIDs];
}

- (void)_encryptIDs
{
  v3 = +[APIDAccountProvider userAccount];
  if (!v3)
  {
    v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "User Account is nil", v6, 2u);
    }
  }
  objc_super v5 = [[APEncryptedID alloc] initWithIDAccountPrivate:v3];
  [(APEncryptedIDProvider *)self setCurrentEncryptedIDs:v5];
}

- (id)encryptedIDsForIDAccountPrivate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(APEncryptedIDProvider *)self currentEncryptedIDs];
  v6 = [v5 unencryptedIAdID];
  v7 = [v4 iAdID];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v9 = v5;
  }
  else
  {
    v10 = [(APEncryptedIDProvider *)self oldEncryptedIDs];
    v11 = v10;
    if (v10
      && ([v10 unencryptedIAdID],
          v12 = objc_claimAutoreleasedReturnValue(),
          [v4 iAdID],
          v13 = objc_claimAutoreleasedReturnValue(),
          unsigned int v14 = [v12 isEqual:v13],
          v13,
          v12,
          v14))
    {
      v9 = v11;
    }
    else
    {
      v9 = [[APEncryptedID alloc] initWithIDAccountPrivate:v4];
      v15 = [(APEncryptedIDProvider *)self oldEncryptedIDs];

      if (!v15) {
        [(APEncryptedIDProvider *)self setOldEncryptedIDs:v9];
      }
    }
  }

  return v9;
}

- (APEncryptedID)currentEncryptedIDs
{
  return (APEncryptedID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentEncryptedIDs:(id)a3
{
}

- (APEncryptedID)oldEncryptedIDs
{
  return (APEncryptedID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOldEncryptedIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldEncryptedIDs, 0);

  objc_storeStrong((id *)&self->_currentEncryptedIDs, 0);
}

@end