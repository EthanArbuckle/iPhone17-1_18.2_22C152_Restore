@interface NFTrustObject
+ (BOOL)supportsSecureCoding;
+ (id)allowedXPCClasses;
- (NFTrustObject)initWithCoder:(id)a3;
- (id)allowedXPCClasses;
- (id)description;
- (id)dictionaryRepresentation;
@end

@implementation NFTrustObject

+ (id)allowedXPCClasses
{
  if (_MergedGlobals_1 != -1) {
    dispatch_once(&_MergedGlobals_1, &__block_literal_global_6);
  }
  v2 = (void *)qword_1E9449150;
  return v2;
}

uint64_t __34__NFTrustObject_allowedXPCClasses__block_invoke()
{
  id v19 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v19, "initWithObjects:", v18, v17, v16, v15, v14, v13, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(),
          0);
  uint64_t v11 = qword_1E9449150;
  qword_1E9449150 = v10;
  return MEMORY[0x1F41817F8](v10, v11);
}

- (id)allowedXPCClasses
{
  return +[NFTrustObject allowedXPCClasses];
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = objc_opt_new();
  Superclass = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(Superclass);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    while (1)
    {
      unsigned int outCount = 0;
      cls = Superclass;
      uint64_t v9 = class_copyPropertyList(Superclass, &outCount);
      if (outCount) {
        break;
      }
LABEL_13:
      free(v9);
      Superclass = class_getSuperclass(cls);
      uint64_t v15 = NSStringFromClass(Superclass);
      uint64_t v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      char v18 = [v15 isEqualToString:v17];

      if (v18) {
        goto LABEL_14;
      }
    }
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", property_getName(v9[v10]));
      if (([v11 hasPrefix:@"trustObjectInternal"] & 1) == 0) {
        break;
      }
LABEL_12:

      if (++v10 >= (unint64_t)outCount) {
        goto LABEL_13;
      }
    }
    v12 = [(NFTrustObject *)self valueForKey:v11];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [v3 setObject:v12 forKeyedSubscript:v11];
        goto LABEL_11;
      }
      uint64_t v13 = [v12 dictionaryRepresentation];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v14 = (void *)v13;
    [v3 setObject:v13 forKeyedSubscript:v11];

LABEL_11:
    goto LABEL_12;
  }
LABEL_14:
  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NFTrustObject *)self dictionaryRepresentation];
  uint64_t v7 = (void *)[v3 initWithFormat:@"%@ : %@", v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustObject)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFTrustObject;
  return [(NFTrustObject *)&v4 init];
}

@end