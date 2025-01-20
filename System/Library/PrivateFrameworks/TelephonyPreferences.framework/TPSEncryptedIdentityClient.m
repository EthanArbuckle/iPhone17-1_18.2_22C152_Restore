@interface TPSEncryptedIdentityClient
- (id)encryptedIdentityInfoForSubscriptionContext:(id)a3 type:(int64_t)a4;
- (id)encryptedIdentityInfoForSubscriptionContext:(id)a3 type:(int64_t)a4 error:(id *)a5;
@end

@implementation TPSEncryptedIdentityClient

- (id)encryptedIdentityInfoForSubscriptionContext:(id)a3 type:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v13 = 0;
  v7 = [(TPSEncryptedIdentityClient *)self encryptedIdentityInfoForSubscriptionContext:v6 type:a4 error:&v13];
  id v8 = v13;
  v9 = [v8 domain];

  if (v9)
  {
    v10 = TPSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "tps_stringWithTPSEncryptedIdentityType:", a4);
      *(_DWORD *)buf = 138412802;
      v15 = v12;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl(&dword_1E4DD4000, v10, OS_LOG_TYPE_ERROR, "Retrieving encrypted identity information of type %@ for subscription context %@ failed with error %@.", buf, 0x20u);
    }
  }

  return v7;
}

- (id)encryptedIdentityInfoForSubscriptionContext:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(TPSTelephonyController *)self telephonyClient];
  v10 = objc_msgSend(NSString, "tps_ctStringWithTPSEncryptedIdentityType:", a4);
  v11 = [v9 context:v8 getEncryptedIdentity:v10 error:a5];

  return v11;
}

@end