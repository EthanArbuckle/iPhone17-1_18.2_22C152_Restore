@interface PKSECredentialAddress
- (BOOL)isEqual:(id)a3;
- (NSString)appletIdentifier;
- (NSString)mostSpecificIdentifier;
- (NSString)subcredentialIdentifier;
- (PKSECredentialAddress)init;
- (PKSECredentialAddress)initWithType:(unint64_t)a3 identifier:(id)a4;
- (id)addressByAppendingType:(unint64_t)a3 identifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)firstIdentifierOfType:(unint64_t)a3;
- (id)shortDescription;
- (unint64_t)hash;
- (unint64_t)mostSpecificType;
- (void)_tail;
- (void)appendType:(unint64_t)a3 identifier:(id)a4;
@end

@implementation PKSECredentialAddress

- (PKSECredentialAddress)init
{
  return 0;
}

- (PKSECredentialAddress)initWithType:(unint64_t)a3 identifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKSECredentialAddress;
  v8 = [(PKSECredentialAddress *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_identifier, a4);
  }

  return v9;
}

- (id)addressByAppendingType:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[(PKSECredentialAddress *)self copy];
  v8 = [[PKSECredentialAddress alloc] initWithType:a3 identifier:v6];

  v9 = -[PKSECredentialAddress _tail](v7);
  v10 = (void *)v9[1];
  v9[1] = v8;

  return v7;
}

- (void)_tail
{
  if (a1)
  {
    id v1 = a1;
    v2 = v1;
    v3 = (void *)*((void *)v1 + 1);
    if (v3)
    {
      do
      {
        v4 = v3;

        v3 = (void *)v4[1];
        v2 = v4;
      }
      while (v3);
    }
    else
    {
      v4 = v1;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)appendType:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = [[PKSECredentialAddress alloc] initWithType:a3 identifier:v6];

  v9 = -[PKSECredentialAddress _tail](self);
  v8 = (void *)v9[1];
  v9[1] = v7;
}

- (id)firstIdentifierOfType:(unint64_t)a3
{
  v4 = self;
  if (v4)
  {
    v5 = v4;
    while (v5->_type != a3)
    {
      id v6 = v5->_next;

      v5 = v6;
      if (!v6) {
        goto LABEL_5;
      }
    }
    id v7 = v5->_identifier;
  }
  else
  {
LABEL_5:
    id v7 = 0;
  }
  return v7;
}

- (NSString)appletIdentifier
{
  return (NSString *)[(PKSECredentialAddress *)self firstIdentifierOfType:0];
}

- (NSString)subcredentialIdentifier
{
  return (NSString *)[(PKSECredentialAddress *)self firstIdentifierOfType:1];
}

- (NSString)mostSpecificIdentifier
{
  -[PKSECredentialAddress _tail](self);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = (NSString *)v2[2];

  return v3;
}

- (unint64_t)mostSpecificType
{
  v2 = -[PKSECredentialAddress _tail](self);
  unint64_t v3 = v2[3];

  return v3;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = [(PKSECredentialAddress *)self shortDescription];
  [v3 appendFormat:@"address: '%@'; ", v4];

  [v3 appendFormat:@">"];
  return v3;
}

- (id)shortDescription
{
  unint64_t type = self->_type;
  v4 = @"Subcredential";
  if (type != 1) {
    v4 = 0;
  }
  if (type) {
    v5 = v4;
  }
  else {
    v5 = @"Applet";
  }
  id v6 = [NSString alloc];
  identifier = self->_identifier;
  v8 = [(PKSECredentialAddress *)self->_next shortDescription];
  v9 = (void *)[v6 initWithFormat:@"(%@: %@) -> %@", v5, identifier, v8];

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  next = self->_next;
  if (next) {
    unint64_t v5 = [(PKSECredentialAddress *)next hash] - v5 + 32 * v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      id v6 = (void *)v5[2];
      id v7 = self->_identifier;
      v8 = v6;
      if (v7 == v8)
      {
      }
      else
      {
        v9 = v8;
        if (!v7 || !v8)
        {

          goto LABEL_15;
        }
        BOOL v10 = [(NSString *)v7 isEqualToString:v8];

        if (!v10) {
          goto LABEL_15;
        }
      }
      if (self->_type == v5[3])
      {
        next = self->_next;
        v13 = (PKSECredentialAddress *)v5[1];
        if (next && v13) {
          BOOL v11 = -[PKSECredentialAddress isEqual:](next, "isEqual:");
        }
        else {
          BOOL v11 = next == v13;
        }
        goto LABEL_16;
      }
LABEL_15:
      BOOL v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
  }
  BOOL v11 = 0;
LABEL_17:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = +[PKSECredentialAddress allocWithZone:](PKSECredentialAddress, "allocWithZone:");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_unint64_t type = self->_type;
  v8 = [(PKSECredentialAddress *)self->_next copyWithZone:a3];
  next = v5->_next;
  v5->_next = v8;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_next, 0);
}

@end