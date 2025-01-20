@interface MSDGetAccountSettingsRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSDictionary)existingAccounts;
- (id)getPostData;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setExistingAccounts:(id)a3;
@end

@implementation MSDGetAccountSettingsRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)MSDGetAccountSettingsRequest;
  if (![(MSDCommandServerRequest *)&v6 isValid]) {
    return 0;
  }
  v3 = [(MSDGetAccountSettingsRequest *)self existingAccounts];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)getPostData
{
  v8[0] = @"UniqueDeviceID";
  v3 = [(MSDCommandServerRequest *)self deviceUDID];
  v8[1] = @"ExistingAccounts";
  v9[0] = v3;
  BOOL v4 = [(MSDGetAccountSettingsRequest *)self existingAccounts];
  v9[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  objc_super v6 = [v5 convertToNSData];

  return v6;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class();
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MSDGetAccountSettingsRequest;
  v7 = [(MSDServerRequest *)&v22 parseResponseForError:v6 andPayload:a4];
  v8 = [v7 error];

  if (!v8)
  {
    v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(MSDServerRequest *)self getName];
      v11 = [v7 data];
      *(_DWORD *)buf = 138543618;
      v24 = v10;
      __int16 v25 = 2114;
      v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: data from server: %{public}@", buf, 0x16u);
    }
    uint64_t v12 = [v7 data];
    if (v12
      && (v13 = (void *)v12,
          [v7 data],
          v14 = objc_claimAutoreleasedReturnValue(),
          id v15 = [v14 length],
          v14,
          v13,
          v15))
    {
      v16 = [v7 data];
      v17 = +[NSDictionary dictionaryFromJsonData:v16];

      if (!v17)
      {
        v18 = sub_100068600();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1000CCAF0(self, v18);
        }

        id v21 = v6;
        sub_1000C3140(&v21, 3727744512, @"Unexpected server response.");
        v17 = v6;
        id v6 = v21;
        goto LABEL_12;
      }
    }
    else
    {
      v17 = +[NSDictionary dictionary];
    }
    [v7 setAccountSettings:v17];
LABEL_12:
  }
  v19 = [v7 error];

  if (!v19) {
    [v7 setError:v6];
  }

  return v7;
}

- (NSDictionary)existingAccounts
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExistingAccounts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end