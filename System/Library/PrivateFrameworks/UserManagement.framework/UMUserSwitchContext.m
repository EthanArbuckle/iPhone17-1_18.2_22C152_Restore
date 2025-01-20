@interface UMUserSwitchContext
+ (id)contextWithSetupData:(id)a3 shortLivedToken:(id)a4 secondaryActionRequired:(BOOL)a5;
- (BOOL)secondaryActionRequired;
- (NSData)setupData;
- (NSString)shortLivedToken;
- (id)description;
- (void)setSecondaryActionRequired:(BOOL)a3;
- (void)setSetupData:(id)a3;
- (void)setShortLivedToken:(id)a3;
@end

@implementation UMUserSwitchContext

+ (id)contextWithSetupData:(id)a3 shortLivedToken:(id)a4 secondaryActionRequired:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = (void **)objc_opt_new();
  v11 = v9;
  if (v9)
  {
    objc_msgSend_setSetupData_(v9, v10, (uint64_t)v7);
    objc_msgSend_setShortLivedToken_(v11, v12, (uint64_t)v8);
    objc_msgSend_setSecondaryActionRequired_(v11, v13, v5);
    if (sub_190C3F14C())
    {
      v16 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v14, v15);
      v18 = objc_msgSend_dictionaryForKey_(v16, v17, @"UMSwitchEnvironmentsByServicesForUser");
      objc_setProperty_nonatomic_copy(v11, v19, v18, 32);

      v20 = sub_190C3C3A4();
      v23 = objc_msgSend_description(v11[4], v21, v22);
      v30 = sub_190C3B80C((uint64_t)UMLogMessage, @"Environments by services: \n%@", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
      sub_190C3B464((uint64_t)v20, v30);
    }
  }

  return v11;
}

- (id)description
{
  v2 = sub_190C5C1D4((uint64_t *)self, a2);
  BOOL v5 = objc_msgSend_description(v2, v3, v4);

  return v5;
}

- (NSData)setupData
{
  return self->_setupData;
}

- (void)setSetupData:(id)a3
{
}

- (NSString)shortLivedToken
{
  return self->_shortLivedToken;
}

- (void)setShortLivedToken:(id)a3
{
}

- (BOOL)secondaryActionRequired
{
  return self->_secondaryActionRequired;
}

- (void)setSecondaryActionRequired:(BOOL)a3
{
  self->_secondaryActionRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentsByServices, 0);
  objc_storeStrong((id *)&self->_shortLivedToken, 0);
  objc_storeStrong((id *)&self->_setupData, 0);
}

@end