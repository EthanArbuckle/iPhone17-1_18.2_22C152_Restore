@interface UPContextualizerInput
- (UPContextualizerInput)initWithDomainResult:(id)a3 coreResult:(id)a4 modelIdentifier:(id)a5 query:(id)a6 dialogAct:(id)a7;
- (UPDialogAct)dialogAct;
- (UPModelIdentifier)modelIdentifier;
- (UPQuery)query;
- (UPResult)coreResult;
- (UPResult)domainResult;
@end

@implementation UPContextualizerInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogAct, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_coreResult, 0);
  objc_storeStrong((id *)&self->_domainResult, 0);
}

- (UPDialogAct)dialogAct
{
  return self->_dialogAct;
}

- (UPQuery)query
{
  return self->_query;
}

- (UPModelIdentifier)modelIdentifier
{
  return self->_modelIdentifier;
}

- (UPResult)coreResult
{
  return self->_coreResult;
}

- (UPResult)domainResult
{
  return self->_domainResult;
}

- (UPContextualizerInput)initWithDomainResult:(id)a3 coreResult:(id)a4 modelIdentifier:(id)a5 query:(id)a6 dialogAct:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)UPContextualizerInput;
  v17 = [(UPContextualizerInput *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domainResult, a3);
    objc_storeStrong((id *)&v18->_coreResult, a4);
    objc_storeStrong((id *)&v18->_modelIdentifier, a5);
    objc_storeStrong((id *)&v18->_query, a6);
    objc_storeStrong((id *)&v18->_dialogAct, a7);
  }

  return v18;
}

@end