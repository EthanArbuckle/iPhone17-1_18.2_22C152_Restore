@interface PCSAccountManager
- (NSString)dsid;
- (PCSAccountManager)initWithDSID:(id)a3;
- (unint64_t)accountStatus;
- (void)setDsid:(id)a3;
@end

@implementation PCSAccountManager

- (PCSAccountManager)initWithDSID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PCSAccountManager;
  v6 = [(PCSAccountManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dsid, a3);
    v8 = v7;
  }

  return v7;
}

- (unint64_t)accountStatus
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PCSAccountManager *)self dsid];
  BOOL v4 = PCSCurrentPersonaMatchesDSID(v3);

  if (v4)
  {
    v12 = kPCSSetupDSID[0];
    id v5 = [(PCSAccountManager *)self dsid];
    v13[0] = v5;
    CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

    v11 = 0;
    CFTypeRef v7 = PCSIdentitySetCreate(v6, 0, &v11);
    if (v7)
    {
      v8 = v7;
      unint64_t IsICDP = PCSIdentitySetIsICDP((uint64_t)v7, 0);
    }
    else
    {
      v8 = v11;
      if (!v11)
      {
        unint64_t IsICDP = 1;
        goto LABEL_8;
      }
      v11 = 0;
      unint64_t IsICDP = 1;
    }
    CFRelease(v8);
LABEL_8:

    return IsICDP;
  }
  return 2;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end