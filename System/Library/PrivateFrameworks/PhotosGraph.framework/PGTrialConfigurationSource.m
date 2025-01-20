@interface PGTrialConfigurationSource
- (PGTrialConfigurationSource)initWithTrialSession:(id)a3 namespaceType:(unsigned __int16)a4;
- (PGTrialSession)trialSession;
- (id)objectForKey:(id)a3;
- (unsigned)namespaceType;
- (void)setNamespaceType:(unsigned __int16)a3;
- (void)setTrialSession:(id)a3;
@end

@implementation PGTrialConfigurationSource

- (void).cxx_destruct
{
}

- (void)setNamespaceType:(unsigned __int16)a3
{
  self->_namespaceType = a3;
}

- (unsigned)namespaceType
{
  return self->_namespaceType;
}

- (void)setTrialSession:(id)a3
{
}

- (PGTrialSession)trialSession
{
  return self->_trialSession;
}

- (id)objectForKey:(id)a3
{
  v3 = [(PGTrialSession *)self->_trialSession levelForFactorName:a3 withNamespaceType:self->_namespaceType];
  v4 = [v3 object];

  return v4;
}

- (PGTrialConfigurationSource)initWithTrialSession:(id)a3 namespaceType:(unsigned __int16)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGTrialConfigurationSource;
  v8 = [(PGTrialConfigurationSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_trialSession, a3);
    v9->_namespaceType = a4;
  }

  return v9;
}

@end