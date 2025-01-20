@interface _REMCKIdentifierAccountIdentifierPair
- (BOOL)isEqual:(id)a3;
- (NSString)accountIdentifier;
- (NSString)ckIdentifier;
- (_REMCKIdentifierAccountIdentifierPair)initWithCkIdentifier:(id)a3 accountIdentifier:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation _REMCKIdentifierAccountIdentifierPair

- (_REMCKIdentifierAccountIdentifierPair)initWithCkIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
    goto LABEL_9;
  }
  v13 = +[REMLog cloudkit];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    sub_100755DE8(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  if (!v9)
  {
LABEL_9:
    v21 = +[REMLog cloudkit];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_100755D70(v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }
LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)_REMCKIdentifierAccountIdentifierPair;
  v10 = [(_REMCKIdentifierAccountIdentifierPair *)&v29 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_ckIdentifier, a3);
    objc_storeStrong((id *)&v11->_accountIdentifier, a4);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REMCKIdentifierAccountIdentifierPair *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(_REMCKIdentifierAccountIdentifierPair *)self ckIdentifier];
      uint64_t v8 = [(_REMCKIdentifierAccountIdentifierPair *)v6 ckIdentifier];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(_REMCKIdentifierAccountIdentifierPair *)self ckIdentifier];
        v11 = [(_REMCKIdentifierAccountIdentifierPair *)v6 ckIdentifier];
        unsigned int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      uint64_t v14 = [(_REMCKIdentifierAccountIdentifierPair *)self accountIdentifier];
      uint64_t v15 = [(_REMCKIdentifierAccountIdentifierPair *)v6 accountIdentifier];
      if (v14 == (void *)v15)
      {
        unsigned __int8 v13 = 1;
        uint64_t v16 = v14;
      }
      else
      {
        uint64_t v16 = (void *)v15;
        uint64_t v17 = [(_REMCKIdentifierAccountIdentifierPair *)self accountIdentifier];
        uint64_t v18 = [(_REMCKIdentifierAccountIdentifierPair *)v6 accountIdentifier];
        unsigned __int8 v13 = [v17 isEqual:v18];
      }
      goto LABEL_12;
    }
LABEL_5:
    unsigned __int8 v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  unsigned __int8 v13 = 1;
LABEL_13:

  return v13;
}

- (unint64_t)hash
{
  v3 = [(_REMCKIdentifierAccountIdentifierPair *)self ckIdentifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(_REMCKIdentifierAccountIdentifierPair *)self accountIdentifier];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = [(_REMCKIdentifierAccountIdentifierPair *)self ckIdentifier];
  unint64_t v4 = [(_REMCKIdentifierAccountIdentifierPair *)self accountIdentifier];
  v5 = +[NSString stringWithFormat:@"(ckIdentifier: %@, accountIdentifier: %@)", v3, v4];

  return v5;
}

- (NSString)ckIdentifier
{
  return self->_ckIdentifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_ckIdentifier, 0);
}

@end