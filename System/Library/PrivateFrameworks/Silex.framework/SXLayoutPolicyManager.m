@interface SXLayoutPolicyManager
- (BOOL)shouldPerformLayoutWithLayoutOptionsDiff:(unint64_t)a3;
- (SXDocumentProviding)documentProvider;
- (SXHintsConfigurationOptionProvider)hintsConfigurationOptionProvider;
- (SXLayoutPolicyManager)initWithDocumentProvider:(id)a3 hintsConfigurationOptionProvider:(id)a4;
@end

@implementation SXLayoutPolicyManager

- (SXLayoutPolicyManager)initWithDocumentProvider:(id)a3 hintsConfigurationOptionProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXLayoutPolicyManager;
  v9 = [(SXLayoutPolicyManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentProvider, a3);
    objc_storeStrong((id *)&v10->_hintsConfigurationOptionProvider, a4);
  }

  return v10;
}

- (BOOL)shouldPerformLayoutWithLayoutOptionsDiff:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    if (a3 == 0xFFFF
      || (a3 & 0x87) != 0
      || ([(SXHintsConfigurationOptionProvider *)self->_hintsConfigurationOptionProvider hints],
          v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = [v5 ignoreConditionHints],
          v5,
          (v6 & 1) != 0))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      id v8 = [(SXLayoutPolicyManager *)self documentProvider];
      v9 = [v8 document];
      v10 = [v9 hints];
      v11 = [v10 conditions];

      if ((v3 & 0x100) != 0
        || ((v3 & 8) != 0 ? (BOOL v12 = [v11 subscriptionStatus] != 0) : (BOOL v12 = 0),
            (v3 & 0x10) != 0 ? (BOOL v13 = [v11 subscriptionStatus] != 0) : (BOOL v13 = 0),
            v12
         || v13
         || (v3 & 0x200) != 0 && [v11 horizontalSizeClass]
         || (v3 & 0x400) != 0 && [v11 verticalSizeClass]
         || (v3 & 0x40) != 0 && [v11 testing]
         || (v3 & 0x20) != 0 && [v11 viewLocation]
         || (v3 & 0x800) != 0 && [v11 newsletter]
         || (v3 & 0x2000) != 0 && [v11 subscriptionActivationEligibility]))
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        unint64_t v3 = (v3 >> 14) & 1;
      }
    }
  }
  return v3;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXHintsConfigurationOptionProvider)hintsConfigurationOptionProvider
{
  return self->_hintsConfigurationOptionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintsConfigurationOptionProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
}

@end