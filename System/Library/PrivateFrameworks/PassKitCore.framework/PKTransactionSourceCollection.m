@interface PKTransactionSourceCollection
- (BOOL)isEqual:(id)a3;
- (NSSet)transactionSources;
- (PKTransactionSourceCollection)initWithTransactionSource:(id)a3;
- (PKTransactionSourceCollection)initWithTransactionSources:(id)a3;
- (id)account;
- (id)description;
- (id)paymentPass;
- (id)transactionSourceForTransactionSourceIdentifier:(id)a3;
- (id)transactionSourceIdentifiers;
- (id)transactionSourcesForType:(unint64_t)a3;
- (unint64_t)hash;
@end

@implementation PKTransactionSourceCollection

- (PKTransactionSourceCollection)initWithTransactionSources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSourceCollection;
  v6 = [(PKTransactionSourceCollection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transactionSources, a3);
  }

  return v7;
}

- (PKTransactionSourceCollection)initWithTransactionSource:(id)a3
{
  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  id v5 = [(PKTransactionSourceCollection *)self initWithTransactionSources:v4];

  return v5;
}

- (id)transactionSourceIdentifiers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_transactionSources;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "transactionSourceIdentifiers", (void)v12);
        [v3 unionSet:v9];
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];
  return v10;
}

- (id)paymentPass
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_transactionSources;
  id v3 = (void *)[(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "paymentPass", (void)v9);

        if (v7)
        {
          id v3 = [v6 paymentPass];
          goto LABEL_11;
        }
      }
      id v3 = (void *)[(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)account
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_transactionSources;
  id v3 = (void *)[(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "account", (void)v9);

        if (v7)
        {
          id v3 = [v6 account];
          goto LABEL_11;
        }
      }
      id v3 = (void *)[(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)transactionSourceForTransactionSourceIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = self->_transactionSources;
    id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          long long v10 = objc_msgSend(v9, "transactionSourceIdentifiers", (void)v13);
          int v11 = [v10 containsObject:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)transactionSourcesForType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_transactionSources;
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "type", (void)v14) == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = (void *)[v5 copy];
  return v12;
}

- (id)description
{
  return [(NSSet *)self->_transactionSources description];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    transactionSources = self->_transactionSources;
    id v6 = (NSSet *)v4[1];
    if (transactionSources && v6) {
      char v7 = -[NSSet isEqual:](transactionSources, "isEqual:");
    }
    else {
      char v7 = transactionSources == v6;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_transactionSources];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSSet)transactionSources
{
  return self->_transactionSources;
}

- (void).cxx_destruct
{
}

@end