@interface ICTuple
- (BOOL)isEqual:(id)a3;
- (ICTuple)initWithFirstObject:(id)a3 secondObject:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)firstObject;
- (id)secondObject;
- (unint64_t)hash;
@end

@implementation ICTuple

- (ICTuple)initWithFirstObject:(id)a3 secondObject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICTuple;
  v9 = [(ICTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_firstObject, a3);
    objc_storeStrong(&v10->_secondObject, a4);
  }

  return v10;
}

- (id)secondObject
{
  return self->_secondObject;
}

- (id)firstObject
{
  return self->_firstObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_secondObject, 0);
  objc_storeStrong(&self->_firstObject, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICTuple *)self firstObject];
  id v7 = [(ICTuple *)self secondObject];
  id v8 = [v3 stringWithFormat:@"<%@: %p, firstObject: %@, secondObject: %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    uint64_t v5 = objc_opt_class();
    v6 = ICDynamicCast(v5, (uint64_t)v4);

    id v7 = [(ICTuple *)self firstObject];
    id v8 = [v6 firstObject];
    v9 = (void *)*MEMORY[0x263EFFD08];
    if ((void *)*MEMORY[0x263EFFD08] == v7) {
      v10 = 0;
    }
    else {
      v10 = v7;
    }
    uint64_t v11 = v10;
    if (v9 == v8) {
      objc_super v12 = 0;
    }
    else {
      objc_super v12 = v8;
    }
    unint64_t v13 = v12;
    if (v11 | v13)
    {
      v14 = (void *)v13;
      if (v11) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15)
      {
        char v16 = 0;
LABEL_32:

LABEL_33:
        return v16;
      }
      int v17 = [(id)v11 isEqual:v13];

      if (!v17)
      {
        char v16 = 0;
        goto LABEL_33;
      }
    }
    uint64_t v11 = [(ICTuple *)self secondObject];
    v14 = [v6 secondObject];
    if (v9 == (void *)v11) {
      v18 = 0;
    }
    else {
      v18 = (void *)v11;
    }
    unint64_t v19 = v18;
    if (v9 == v14) {
      v20 = 0;
    }
    else {
      v20 = v14;
    }
    unint64_t v21 = v20;
    v22 = (void *)v21;
    if (v19 | v21)
    {
      if (v19) {
        BOOL v23 = v21 == 0;
      }
      else {
        BOOL v23 = 1;
      }
      if (v23) {
        char v16 = 0;
      }
      else {
        char v16 = [(id)v19 isEqual:v21];
      }
    }
    else
    {
      char v16 = 1;
    }

    goto LABEL_32;
  }
  return 1;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    id v4 = [(ICTuple *)self firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = objc_opt_class();
      v6 = ICCheckedDynamicCast(v5, (uint64_t)v4);
      uint64_t v7 = ICHashWithArray(v6);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = objc_opt_class();
        v6 = ICCheckedDynamicCast(v8, (uint64_t)v4);
        uint64_t v7 = ICHashWithDictionary(v6);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = objc_opt_class();
          v6 = ICCheckedDynamicCast(v9, (uint64_t)v4);
          uint64_t v7 = ICHashWithSet(v6);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v10 = objc_opt_class();
            v6 = ICCheckedDynamicCast(v10, (uint64_t)v4);
            uint64_t v7 = ICHashWithOrderedSet(v6);
          }
          else
          {
            uint64_t v11 = [v4 hash];
            if (v11) {
              goto LABEL_13;
            }
            v6 = [MEMORY[0x263EFF9D0] null];
            uint64_t v7 = [v6 hash];
          }
        }
      }
    }
    uint64_t v11 = v7;

LABEL_13:
    id v12 = [(ICTuple *)self secondObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = objc_opt_class();
      v14 = ICCheckedDynamicCast(v13, (uint64_t)v12);
      char v15 = ICHashWithArray(v14);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = objc_opt_class();
        v14 = ICCheckedDynamicCast(v16, (uint64_t)v12);
        char v15 = ICHashWithDictionary(v14);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v17 = objc_opt_class();
          v14 = ICCheckedDynamicCast(v17, (uint64_t)v12);
          char v15 = ICHashWithSet(v14);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = objc_opt_class();
            v14 = ICCheckedDynamicCast(v18, (uint64_t)v12);
            char v15 = ICHashWithOrderedSet(v14);
          }
          else
          {
            uint64_t v19 = [v12 hash];
            char v20 = v19;
            if (v19)
            {
LABEL_24:

              self->_hash = ICHashWithHashKeys(v11, v21, v22, v23, v24, v25, v26, v27, v20);
              return self->_hash;
            }
            v14 = [MEMORY[0x263EFF9D0] null];
            char v15 = [v14 hash];
          }
        }
      }
    }
    char v20 = v15;

    goto LABEL_24;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ICTuple allocWithZone:a3];
  uint64_t v5 = [(ICTuple *)self firstObject];
  v6 = [(ICTuple *)self secondObject];
  uint64_t v7 = [(ICTuple *)v4 initWithFirstObject:v5 secondObject:v6];

  return v7;
}

@end