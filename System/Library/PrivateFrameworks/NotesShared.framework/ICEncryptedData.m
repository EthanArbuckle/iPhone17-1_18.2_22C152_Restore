@interface ICEncryptedData
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (ICEncryptedData)initWithData:(id)a3 tag:(id)a4 initializationVector:(id)a5;
- (ICEncryptedData)initWithData:(id)a3 tag:(id)a4 initializationVector:(id)a5 fallbackTag:(id)a6 fallbackInitializationVector:(id)a7;
- (NSData)data;
- (NSData)fallbackInitializationVector;
- (NSData)fallbackTag;
- (NSData)initializationVector;
- (NSData)tag;
- (id)description;
- (unint64_t)hash;
@end

@implementation ICEncryptedData

- (ICEncryptedData)initWithData:(id)a3 tag:(id)a4 initializationVector:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICEncryptedData;
  v11 = [(ICEncryptedData *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    data = v11->_data;
    v11->_data = (NSData *)v12;

    uint64_t v14 = [v9 copy];
    tag = v11->_tag;
    v11->_tag = (NSData *)v14;

    uint64_t v16 = [v10 copy];
    initializationVector = v11->_initializationVector;
    v11->_initializationVector = (NSData *)v16;
  }
  return v11;
}

- (ICEncryptedData)initWithData:(id)a3 tag:(id)a4 initializationVector:(id)a5 fallbackTag:(id)a6 fallbackInitializationVector:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)ICEncryptedData;
  v17 = [(ICEncryptedData *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    data = v17->_data;
    v17->_data = (NSData *)v18;

    uint64_t v20 = [v13 copy];
    tag = v17->_tag;
    v17->_tag = (NSData *)v20;

    uint64_t v22 = [v14 copy];
    initializationVector = v17->_initializationVector;
    v17->_initializationVector = (NSData *)v22;

    uint64_t v24 = [v15 copy];
    fallbackTag = v17->_fallbackTag;
    v17->_fallbackTag = (NSData *)v24;

    uint64_t v26 = [v16 copy];
    fallbackInitializationVector = v17->_fallbackInitializationVector;
    v17->_fallbackInitializationVector = (NSData *)v26;
  }
  return v17;
}

- (id)description
{
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = (void *)MEMORY[0x1E4F28ED0];
  id v8 = [(ICEncryptedData *)self fallbackTag];
  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    v2 = [(ICEncryptedData *)self fallbackInitializationVector];
    BOOL v9 = v2 != 0;
  }
  id v10 = [v7 numberWithInt:v9];
  v11 = [v4 stringWithFormat:@"<%@: %p, hasFallback: %@>", v6, self, v10];

  if (!v8) {
  return v11;
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = ICDynamicCast();

    v6 = [v5 data];
    v7 = [(ICEncryptedData *)self data];
    id v8 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v6) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v6;
    }
    uint64_t v10 = v9;
    if (v8 == v7) {
      v11 = 0;
    }
    else {
      v11 = v7;
    }
    unint64_t v12 = v11;
    if (v10 | v12)
    {
      id v13 = (void *)v12;
      if (v10) {
        BOOL v14 = v12 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        LOBYTE(v15) = 0;
LABEL_70:

LABEL_71:
        return v15;
      }
      LODWORD(v15) = [(id)v10 isEqual:v12];

      if (!v15) {
        goto LABEL_71;
      }
    }
    uint64_t v10 = [v5 tag];
    id v13 = [(ICEncryptedData *)self tag];
    if (v8 == (void *)v10) {
      id v16 = 0;
    }
    else {
      id v16 = (void *)v10;
    }
    uint64_t v17 = v16;
    if (v8 == v13) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v13;
    }
    unint64_t v19 = v18;
    if (v17 | v19)
    {
      uint64_t v20 = (void *)v19;
      if (v17) {
        BOOL v21 = v19 == 0;
      }
      else {
        BOOL v21 = 1;
      }
      if (v21)
      {
        LOBYTE(v15) = 0;
LABEL_69:

        goto LABEL_70;
      }
      LODWORD(v15) = [(id)v17 isEqual:v19];

      if (!v15) {
        goto LABEL_70;
      }
    }
    v48 = v7;
    uint64_t v17 = [v5 initializationVector];
    uint64_t v20 = [(ICEncryptedData *)self initializationVector];
    if (v8 == (void *)v17) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = (void *)v17;
    }
    unint64_t v15 = v22;
    if (v8 == v20) {
      v23 = 0;
    }
    else {
      v23 = v20;
    }
    unint64_t v24 = v23;
    if (v15 | v24)
    {
      v25 = (void *)v24;
      uint64_t v26 = (void *)v15;
      LOBYTE(v15) = 0;
      if (!v26 || !v24)
      {
        v47 = v26;
LABEL_67:

LABEL_68:
        v7 = v48;
        goto LABEL_69;
      }
      v27 = v26;
      int v46 = [v26 isEqual:v24];

      if (!v46)
      {
        LOBYTE(v15) = 0;
        goto LABEL_68;
      }
    }
    v45 = v6;
    uint64_t v28 = [v5 fallbackTag];
    v25 = [(ICEncryptedData *)self fallbackTag];
    v47 = (void *)v28;
    if (v8 == (void *)v28) {
      objc_super v29 = 0;
    }
    else {
      objc_super v29 = (void *)v28;
    }
    unint64_t v15 = v29;
    if (v8 == v25) {
      v30 = 0;
    }
    else {
      v30 = v25;
    }
    unint64_t v31 = v30;
    if (v15 | v31)
    {
      v32 = (void *)v31;
      v33 = (void *)v15;
      LOBYTE(v15) = 0;
      if (!v33 || !v31)
      {
        v44 = v33;
LABEL_65:

LABEL_66:
        v6 = v45;
        goto LABEL_67;
      }
      v34 = v33;
      LODWORD(v43) = [v33 isEqual:v31];

      if (!v43)
      {
        LOBYTE(v15) = 0;
        goto LABEL_66;
      }
    }
    uint64_t v35 = objc_msgSend(v5, "fallbackInitializationVector", v43);
    v32 = [(ICEncryptedData *)self fallbackInitializationVector];
    v44 = (void *)v35;
    if (v8 == (void *)v35) {
      v36 = 0;
    }
    else {
      v36 = (void *)v35;
    }
    id v37 = v36;
    BOOL v14 = v8 == v32;
    unint64_t v38 = (unint64_t)v37;
    if (v14) {
      v39 = 0;
    }
    else {
      v39 = v32;
    }
    unint64_t v40 = v39;
    v41 = (void *)v40;
    if (v38 | v40)
    {
      LOBYTE(v15) = 0;
      if (v38 && v40) {
        LOBYTE(v15) = objc_msgSend((id)v38, "isEqual:", v40, v44);
      }
    }
    else
    {
      LOBYTE(v15) = 1;
    }

    goto LABEL_65;
  }
  LOBYTE(v15) = 1;
  return v15;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    id v4 = [(ICEncryptedData *)self data];
    uint64_t v5 = [v4 hash];
    v6 = [(ICEncryptedData *)self tag];
    uint64_t v7 = [v6 hash];
    LOBYTE(v8) = v7;
    if (!v7)
    {
      BOOL v9 = [MEMORY[0x1E4F1CA98] null];
      uint64_t v8 = [v9 hash];
    }
    v25 = [(ICEncryptedData *)self initializationVector];
    if (![v25 hash])
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      [v10 hash];
    }
    v11 = [(ICEncryptedData *)self fallbackTag];
    if (![v11 hash])
    {
      unint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v12 hash];
    }
    id v13 = [(ICEncryptedData *)self fallbackInitializationVector];
    if (![v13 hash])
    {
      [MEMORY[0x1E4F1CA98] null];
      uint64_t v24 = v5;
      BOOL v21 = v6;
      v23 = uint64_t v22 = v4;
      [v23 hash];

      id v4 = v22;
      v6 = v21;
      uint64_t v5 = v24;
    }
    self->_hash = ICHashWithHashKeys(v5, v14, v15, v16, v17, v18, v19, v20, v8);

    return self->_hash;
  }
  return result;
}

- (BOOL)isValid
{
  v3 = [(ICEncryptedData *)self data];
  id v4 = (void *)[v3 length];

  if (v4)
  {
    uint64_t v5 = [(ICEncryptedData *)self tag];
    uint64_t v6 = [v5 length];
    if (v6
      && ([(ICEncryptedData *)self initializationVector],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v4 length]))
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v8 = [(ICEncryptedData *)self fallbackTag];
      if ([v8 length])
      {
        BOOL v9 = [(ICEncryptedData *)self fallbackInitializationVector];
        BOOL v7 = [v9 length] != 0;
      }
      else
      {
        BOOL v7 = 0;
      }

      if (!v6) {
        goto LABEL_11;
      }
    }

LABEL_11:
    return v7;
  }
  return 0;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)tag
{
  return self->_tag;
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (NSData)fallbackTag
{
  return self->_fallbackTag;
}

- (NSData)fallbackInitializationVector
{
  return self->_fallbackInitializationVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackInitializationVector, 0);
  objc_storeStrong((id *)&self->_fallbackTag, 0);
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end