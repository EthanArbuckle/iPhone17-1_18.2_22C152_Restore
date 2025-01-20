@interface WLKDictionaryResponseProcessor
- (Class)objectClass;
- (NSString)dictionaryKeyPath;
- (id)processResponseData:(id)a3 error:(id *)a4;
- (id)processResponseData:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (void)setDictionaryKeyPath:(id)a3;
- (void)setObjectClass:(Class)a3;
@end

@implementation WLKDictionaryResponseProcessor

- (id)processResponseData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:a4 error:a5];
  }
  else
  {
    v9 = 0;
  }
  v10 = [(WLKDictionaryResponseProcessor *)self dictionaryKeyPath];
  v11 = [v10 componentsSeparatedByString:@"."];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [(WLKDictionaryResponseProcessor *)self objectClass];
    id v12 = 0;
    v21 = 0;
    if (v20) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  id v27 = v8;
  id v12 = v9;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v26 = v11;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    while (2)
    {
      uint64_t v17 = 0;
      v18 = v12;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v18, "objectForKey:", *(void *)(*((void *)&v28 + 1) + 8 * v17), v26);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {

          id v12 = 0;
          goto LABEL_17;
        }
        ++v17;
        v18 = v12;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  v22 = [(WLKDictionaryResponseProcessor *)self objectClass];
  if (!v22)
  {
    v11 = v26;
    id v8 = v27;
LABEL_23:
    id v24 = v12;
    id v12 = v24;
    goto LABEL_24;
  }
  v11 = v26;
  id v8 = v27;
  if (!v12
    || (v23 = v22,
        ![(objc_class *)v22 instancesRespondToSelector:sel_initWithDictionary_]))
  {
    v21 = 0;
    goto LABEL_25;
  }
  id v24 = (id)[[v23 alloc] initWithDictionary:v12];
LABEL_24:
  v21 = v24;
LABEL_25:

  return v21;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (NSString)dictionaryKeyPath
{
  return self->_dictionaryKeyPath;
}

- (id)processResponseData:(id)a3 error:(id *)a4
{
  return [(WLKDictionaryResponseProcessor *)self processResponseData:a3 options:0 error:a4];
}

- (void)setObjectClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectClass, 0);

  objc_storeStrong((id *)&self->_dictionaryKeyPath, 0);
}

- (void)setDictionaryKeyPath:(id)a3
{
}

@end