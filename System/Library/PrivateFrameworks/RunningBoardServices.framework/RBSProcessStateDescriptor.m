@interface RBSProcessStateDescriptor
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)descriptor;
- (BOOL)isEqual:(id)a3;
- (NSArray)endowmentNamespaces;
- (NSString)debugDescription;
- (NSString)description;
- (RBSProcessStateDescriptor)init;
- (RBSProcessStateDescriptor)initWithRBSXPCCoder:(id)a3;
- (id)_endowmentNamespaces;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)values;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)filterState:(id)a3;
- (void)setEndowmentNamespaces:(id)a3;
- (void)setValues:(unint64_t)a3;
@end

@implementation RBSProcessStateDescriptor

- (void)filterState:(id)a3
{
  id v4 = a3;
  v5 = v4;
  unint64_t values = self->_values;
  if (values)
  {
    if ((values & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    [v4 setTaskState:0];
    [v5 setDebugState:0];
    if ((values & 4) != 0)
    {
LABEL_3:
      if ((values & 0x8000) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      if ([(NSSet *)self->_endowmentNamespaces count]
        && ([v5 endowmentNamespaces],
            v7 = objc_claimAutoreleasedReturnValue(),
            v7,
            v7))
      {
        v8 = (void *)[(NSSet *)self->_endowmentNamespaces mutableCopy];
        v9 = [v5 endowmentNamespaces];
        [v8 intersectSet:v9];

        if ([v8 count]) {
          v10 = v8;
        }
        else {
          v10 = 0;
        }
        [v5 setEndowmentNamespaces:v10];

        if ((values & 2) == 0) {
          goto LABEL_19;
        }
      }
      else
      {
        [v5 setEndowmentNamespaces:0];
        if ((values & 2) == 0) {
          goto LABEL_19;
        }
      }
LABEL_5:
      if ((values & 8) != 0) {
        goto LABEL_6;
      }
      goto LABEL_20;
    }
  }
  [v5 setTerminationResistance:0];
  if ((values & 0x8000) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  if ((values & 2) != 0) {
    goto LABEL_5;
  }
LABEL_19:
  [v5 setTags:0];
  if ((values & 8) != 0)
  {
LABEL_6:
    if ((values & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v5 setLegacyAssertions:0];
  if ((values & 0x10) != 0)
  {
LABEL_7:
    if ((values & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v5 setPrimitiveAssertions:0];
  if ((values & 0x20) == 0)
  {
LABEL_26:
    [v5 setEndowmentInfos:0];
    goto LABEL_27;
  }
LABEL_22:
  if (![(NSSet *)self->_endowmentNamespaces count]) {
    goto LABEL_26;
  }
  v11 = [v5 endowmentInfos];

  if (!v11) {
    goto LABEL_26;
  }
  v12 = (void *)[(NSSet *)self->_endowmentNamespaces mutableCopy];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  id v27 = [MEMORY[0x1E4F1CA80] set];
  v13 = [v5 endowmentInfos];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __41__RBSProcessStateDescriptor_filterState___block_invoke;
  v19 = &unk_1E57418D8;
  id v14 = v12;
  id v20 = v14;
  v21 = &v22;
  [v13 enumerateObjectsUsingBlock:&v16];

  if (objc_msgSend((id)v23[5], "count", v16, v17, v18, v19)) {
    uint64_t v15 = v23[5];
  }
  else {
    uint64_t v15 = 0;
  }
  [v5 setEndowmentInfos:v15];

  _Block_object_dispose(&v22, 8);
LABEL_27:
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessStateDescriptor)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RBSProcessStateDescriptor *)self init];
  if (v5)
  {
    v5->_unint64_t values = [v4 decodeUInt64ForKey:@"_values"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"_endowmentNamespaces"];
    endowmentNamespaces = v5->_endowmentNamespaces;
    v5->_endowmentNamespaces = (NSSet *)v7;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (unint64_t)values
{
  return self->_values;
}

- (id)_endowmentNamespaces
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NSString)debugDescription
{
  id v4 = [NSString alloc];
  v5 = [(id)objc_opt_class() description];
  unint64_t values = self->_values;
  if ([(NSSet *)self->_endowmentNamespaces count]) {
    uint64_t v7 = @" namespaces:[";
  }
  else {
    uint64_t v7 = &stru_1EE2E2768;
  }
  NSUInteger v8 = [(NSSet *)self->_endowmentNamespaces count];
  if (v8)
  {
    v2 = [(NSSet *)self->_endowmentNamespaces allObjects];
    v9 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    v9 = &stru_1EE2E2768;
  }
  NSUInteger v10 = [(NSSet *)self->_endowmentNamespaces count];
  v11 = @"]";
  if (!v10) {
    v11 = &stru_1EE2E2768;
  }
  v12 = (void *)[v4 initWithFormat:@"<%@| values:%llx%@%@%@>", v5, values, v7, v9, v11];
  if (v8)
  {
  }
  return (NSString *)v12;
}

- (void)setEndowmentNamespaces:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
    self->_endowmentNamespaces = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    self->_endowmentNamespaces = 0;
  }
  MEMORY[0x1F41817F8]();
}

- (void)setValues:(unint64_t)a3
{
  self->_unint64_t values = a3;
}

+ (id)descriptor
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[RBSProcessStateDescriptor allocWithZone:a3] init];
  v4->_unint64_t values = self->_values;
  uint64_t v5 = [(NSSet *)self->_endowmentNamespaces copy];
  endowmentNamespaces = v4->_endowmentNamespaces;
  v4->_endowmentNamespaces = (NSSet *)v5;

  return v4;
}

- (RBSProcessStateDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)RBSProcessStateDescriptor;
  result = [(RBSProcessStateDescriptor *)&v3 init];
  if (result) {
    result->_unint64_t values = 1;
  }
  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  unint64_t values = self->_values;
  id v5 = a3;
  [v5 encodeUInt64:values forKey:@"_values"];
  id v6 = [(RBSProcessStateDescriptor *)self endowmentNamespaces];
  [v5 encodeObject:v6 forKey:@"_endowmentNamespaces"];
}

- (NSArray)endowmentNamespaces
{
  return [(NSSet *)self->_endowmentNamespaces allObjects];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  id v5 = (void *)[v3 initWithFormat:@"<%@| values:%llx>", v4, self->_values];

  return (NSString *)v5;
}

void __41__RBSProcessStateDescriptor_filterState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = v3;
  id v5 = [v3 endowmentNamespace];
  id v6 = [v4 setWithObject:v5];

  if ([*(id *)(a1 + 32) intersectsSet:v6]) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessStateDescriptor *)a3;
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_14;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    NSUInteger v8 = v7;
    if (self->_values != v7->_values) {
      goto LABEL_11;
    }
    endowmentNamespaces = self->_endowmentNamespaces;
    CFSetRef v10 = (const __CFSet *)v7->_endowmentNamespaces;
    if (endowmentNamespaces == (NSSet *)v10)
    {
      char v6 = 1;
      goto LABEL_13;
    }
    char v6 = 0;
    if (!endowmentNamespaces || !v10) {
      goto LABEL_13;
    }
    CFIndex Count = CFSetGetCount((CFSetRef)endowmentNamespaces);
    if (Count == CFSetGetCount(v10)) {
      char v6 = [(NSSet *)endowmentNamespaces isEqualToSet:v10];
    }
    else {
LABEL_11:
    }
      char v6 = 0;
LABEL_13:

    goto LABEL_14;
  }
  char v6 = 0;
LABEL_14:

  return v6;
}

@end