@interface WFChooseFromMenuItemSynonym
- (BOOL)isEqual:(id)a3;
- (NSUUID)identity;
- (WFChooseFromMenuItemSynonym)initWithIdentity:(id)a3 synonym:(id)a4;
- (WFVariableString)synonym;
- (unint64_t)hash;
@end

@implementation WFChooseFromMenuItemSynonym

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonym, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (WFVariableString)synonym
{
  return self->_synonym;
}

- (NSUUID)identity
{
  return self->_identity;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  identity = self->_identity;
  v8 = [v6 identity];
  v9 = identity;
  v10 = v8;
  v11 = v10;
  if (v9 == (NSUUID *)v10)
  {

LABEL_12:
    synonym = self->_synonym;
    v14 = [v6 synonym];
    v15 = synonym;
    v16 = v14;
    v9 = v16;
    if (v15 == (WFVariableString *)v16)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v15 && v16) {
        LOBYTE(v12) = [(WFVariableString *)v15 isEqual:v16];
      }
    }

    goto LABEL_19;
  }
  LOBYTE(v12) = 0;
  if (v9 && v10)
  {
    int v12 = [(NSUUID *)v9 isEqual:v10];

    if (!v12) {
      goto LABEL_20;
    }
    goto LABEL_12;
  }
  v15 = v10;
LABEL_19:

LABEL_20:
  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identity hash];
  return [(WFVariableString *)self->_synonym hash] ^ v3;
}

- (WFChooseFromMenuItemSynonym)initWithIdentity:(id)a3 synonym:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFChooseFromMenuItemSynonym;
  v9 = [(WFChooseFromMenuItemSynonym *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_synonym, a4);
    v11 = v10;
  }

  return v10;
}

@end