@interface TRIFactorNamespaceRecord
+ (id)factorRecordWithFactorName:(id)a3 namespaceName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFactorRecord:(id)a3;
- (NSString)factorName;
- (NSString)namespaceName;
- (TRIFactorNamespaceRecord)initWithFactorName:(id)a3 namespaceName:(id)a4;
- (id)copyWithReplacementFactorName:(id)a3;
- (id)copyWithReplacementNamespaceName:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIFactorNamespaceRecord

- (TRIFactorNamespaceRecord)initWithFactorName:(id)a3 namespaceName:(id)a4
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
    [v14 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4875, @"Invalid parameter not satisfying: %@", @"factorName != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4876, @"Invalid parameter not satisfying: %@", @"namespaceName != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIFactorNamespaceRecord;
  v11 = [(TRIFactorNamespaceRecord *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_factorName, a3);
    objc_storeStrong((id *)&v12->_namespaceName, a4);
  }

  return v12;
}

+ (id)factorRecordWithFactorName:(id)a3 namespaceName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithFactorName:v7 namespaceName:v6];

  return v8;
}

- (id)copyWithReplacementFactorName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorName:v4 namespaceName:self->_namespaceName];

  return v5;
}

- (id)copyWithReplacementNamespaceName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorName:self->_factorName namespaceName:v4];

  return v5;
}

- (BOOL)isEqualToFactorRecord:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_factorName != 0;
  id v7 = [v4 factorName];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  factorName = self->_factorName;
  if (factorName)
  {
    v10 = [v5 factorName];
    int v11 = [(NSString *)factorName isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_namespaceName != 0;
  v13 = [v5 namespaceName];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    namespaceName = self->_namespaceName;
    if (namespaceName)
    {
      objc_super v16 = [v5 namespaceName];
      char v17 = [(NSString *)namespaceName isEqual:v16];
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
  id v4 = (TRIFactorNamespaceRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIFactorNamespaceRecord *)self isEqualToFactorRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_factorName hash];
  return [(NSString *)self->_namespaceName hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIFactorNamespaceRecord | factorName:%@ namespaceName:%@>", self->_factorName, self->_namespaceName];
  return v2;
}

- (NSString)factorName
{
  return self->_factorName;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_factorName, 0);
}

@end