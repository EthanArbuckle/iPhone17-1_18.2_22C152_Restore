@interface TRIMASpecVer
+ (id)specVerWithSpecifier:(id)a3 version:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpecVer:(id)a3;
- (NSString)specifier;
- (NSString)version;
- (TRIMASpecVer)initWithSpecifier:(id)a3 version:(id)a4;
- (id)copyWithReplacementSpecifier:(id)a3;
- (id)copyWithReplacementVersion:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIMASpecVer

- (TRIMASpecVer)initWithSpecifier:(id)a3 version:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 3190, @"Invalid parameter not satisfying: %@", @"specifier != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 3191, @"Invalid parameter not satisfying: %@", @"version != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIMASpecVer;
  v11 = [(TRIMASpecVer *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_specifier, a3);
    objc_storeStrong((id *)&v12->_version, a4);
  }

  return v12;
}

+ (id)specVerWithSpecifier:(id)a3 version:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithSpecifier:v7 version:v6];

  return v8;
}

- (id)copyWithReplacementSpecifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSpecifier:v4 version:self->_version];

  return v5;
}

- (id)copyWithReplacementVersion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSpecifier:self->_specifier version:v4];

  return v5;
}

- (BOOL)isEqualToSpecVer:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_specifier != 0;
  id v7 = [v4 specifier];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  specifier = self->_specifier;
  if (specifier)
  {
    v10 = [v5 specifier];
    int v11 = [(NSString *)specifier isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_version != 0;
  v13 = [v5 version];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    version = self->_version;
    if (version)
    {
      objc_super v16 = [v5 version];
      char v17 = [(NSString *)version isEqual:v16];
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIMASpecVer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIMASpecVer *)self isEqualToSpecVer:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_specifier hash];
  return [(NSString *)self->_version hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIMASpecVer | specifier:%@ version:%@>", self->_specifier, self->_version];
  return v2;
}

- (NSString)specifier
{
  return self->_specifier;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end