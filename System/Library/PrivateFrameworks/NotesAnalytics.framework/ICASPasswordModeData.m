@interface ICASPasswordModeData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASEndMode)endMode;
- (ICASPasswordModeData)initWithPwdModeChangeContextPath:(id)a3 startMode:(id)a4 endMode:(id)a5;
- (ICASPwdModeChangeContextPath)pwdModeChangeContextPath;
- (ICASStartMode)startMode;
- (id)toDict;
@end

@implementation ICASPasswordModeData

- (ICASPasswordModeData)initWithPwdModeChangeContextPath:(id)a3 startMode:(id)a4 endMode:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASPasswordModeData;
  v12 = [(ICASPasswordModeData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pwdModeChangeContextPath, a3);
    objc_storeStrong((id *)&v13->_startMode, a4);
    objc_storeStrong((id *)&v13->_endMode, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"PasswordModeData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"pwdModeChangeContextPath";
  v3 = [(ICASPasswordModeData *)self pwdModeChangeContextPath];
  if (v3)
  {
    uint64_t v4 = [(ICASPasswordModeData *)self pwdModeChangeContextPath];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"startMode";
  v6 = [(ICASPasswordModeData *)self startMode];
  if (v6)
  {
    uint64_t v7 = [(ICASPasswordModeData *)self startMode];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"endMode";
  id v9 = [(ICASPasswordModeData *)self endMode];
  if (v9)
  {
    uint64_t v10 = [(ICASPasswordModeData *)self endMode];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (ICASPwdModeChangeContextPath)pwdModeChangeContextPath
{
  return self->_pwdModeChangeContextPath;
}

- (ICASStartMode)startMode
{
  return self->_startMode;
}

- (ICASEndMode)endMode
{
  return self->_endMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endMode, 0);
  objc_storeStrong((id *)&self->_startMode, 0);
  objc_storeStrong((id *)&self->_pwdModeChangeContextPath, 0);
}

@end