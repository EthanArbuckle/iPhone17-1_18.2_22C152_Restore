@interface _UIImageCacheKey
+ (id)keyWithName:(id)a3 configuration:(id)a4;
+ (id)keyWithName:(id)a3 configuration:(id)a4 bundle:(id)a5;
+ (id)keyWithSystemName:(id)a3 private:(BOOL)a4 configuration:(id)a5;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _UIImageCacheKey

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIImageCacheKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        v7 = v6;
        if (((*(unsigned char *)&v6->_flags ^ *(unsigned char *)&self->_flags) & 3) != 0)
        {
          LOBYTE(v8) = 0;
LABEL_26:

          goto LABEL_27;
        }
        name = v6->_name;
        v10 = self->_name;
        v11 = name;
        if (v10 == v11)
        {
        }
        else
        {
          v12 = v11;
          LOBYTE(v8) = 0;
          if (!v10 || !v11) {
            goto LABEL_25;
          }
          BOOL v8 = [(UIImageConfiguration *)v10 isEqual:v11];

          if (!v8) {
            goto LABEL_26;
          }
        }
        configuration = v7->_configuration;
        v10 = self->_configuration;
        v14 = configuration;
        if (v10 == v14)
        {

LABEL_20:
          bundle = self->_bundle;
          v16 = v7->_bundle;
          v10 = bundle;
          v17 = v16;
          v12 = v17;
          if (v10 == v17)
          {
            LOBYTE(v8) = 1;
          }
          else
          {
            LOBYTE(v8) = 0;
            if (v10 && v17) {
              LOBYTE(v8) = [(UIImageConfiguration *)v10 isEqual:v17];
            }
          }
          goto LABEL_25;
        }
        v12 = v14;
        LOBYTE(v8) = 0;
        if (v10 && v14)
        {
          BOOL v8 = [(UIImageConfiguration *)v10 isEqual:v14];

          if (!v8) {
            goto LABEL_26;
          }
          goto LABEL_20;
        }
LABEL_25:

        goto LABEL_26;
      }
    }
    LOBYTE(v8) = 0;
  }
LABEL_27:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (unint64_t)hash
{
  uint64_t v3 = *(unsigned char *)&self->_flags & 3;
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  unint64_t v5 = [(UIImageConfiguration *)self->_configuration hash];
  return v4 ^ v5 ^ [(NSBundle *)self->_bundle hash];
}

+ (id)keyWithName:(id)a3 configuration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [v6 copy];

  v9 = *(void **)(v7 + 8);
  *(void *)(v7 + 8) = v8;

  v10 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v5;
  id v11 = v5;

  v12 = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = 0;

  *(unsigned char *)(v7 + 32) &= 0xFCu;
  return (id)v7;
}

+ (id)keyWithName:(id)a3 configuration:(id)a4 bundle:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = [v9 copy];

  v12 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v11;

  v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v7;
  id v14 = v7;

  v15 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v8;

  *(unsigned char *)(v10 + 32) &= 0xFCu;
  return (id)v10;
}

+ (id)keyWithSystemName:(id)a3 private:(BOOL)a4 configuration:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = [v8 copy];

  uint64_t v11 = *(void **)(v9 + 8);
  *(void *)(v9 + 8) = v10;

  v12 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v7;
  id v13 = v7;

  id v14 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = 0;

  if (v5) {
    char v15 = 3;
  }
  else {
    char v15 = 1;
  }
  *(unsigned char *)(v9 + 32) = *(unsigned char *)(v9 + 32) & 0xFC | v15;
  return (id)v9;
}

- (id)description
{
  configuration = self->_configuration;
  if (!configuration) {
    configuration = (UIImageConfiguration *)@"nil";
  }
  if (*(unsigned char *)&self->_flags)
  {
    [NSString stringWithFormat:@"systemImage(\"%@\", %@)", self->_name, configuration, v6];
  }
  else
  {
    bundle = self->_bundle;
    if (!bundle) {
      bundle = (NSBundle *)@"nil";
    }
    [NSString stringWithFormat:@"image(\"%@\", %@, %@)", self->_name, configuration, bundle];
  NSUInteger v4 = };
  return v4;
}

@end