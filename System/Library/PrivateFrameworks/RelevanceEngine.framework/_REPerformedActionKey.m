@interface _REPerformedActionKey
+ (id)keyForBundleIdentifier:(id)a3 identifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (REDonatedActionIdentifierProviding)identifier;
- (id)description;
- (unint64_t)hash;
@end

@implementation _REPerformedActionKey

+ (id)keyForBundleIdentifier:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[2];
  v7[2] = v5;
  id v9 = v5;

  v10 = (void *)v7[1];
  v7[1] = v6;

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(REDonatedActionIdentifierProviding *)self->_identifier hash];
  return [(NSString *)self->_bundleIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REPerformedActionKey *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      bundleIdentifier = self->_bundleIdentifier;
      v7 = v5->_bundleIdentifier;
      if (bundleIdentifier == v7)
      {
      }
      else
      {
        v8 = v7;
        id v9 = bundleIdentifier;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      identifier = self->_identifier;
      v13 = v5->_identifier;
      v14 = identifier;
      v15 = v14;
      if (v14 == v13) {
        char v11 = 1;
      }
      else {
        char v11 = [(REDonatedActionIdentifierProviding *)v14 isEqual:v13];
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%p: %@> bundleIdentifier=%@, identifier=%@", self, objc_opt_class(), self->_bundleIdentifier, self->_identifier];
}

- (REDonatedActionIdentifierProviding)identifier
{
  return self->_identifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end