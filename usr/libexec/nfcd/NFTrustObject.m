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
  if (qword_100347458 != -1) {
    dispatch_once(&qword_100347458, &stru_100304D98);
  }
  v2 = (void *)qword_100347460;

  return v2;
}

- (id)allowedXPCClasses
{
  return +[NFTrustObject allowedXPCClasses];
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  Superclass = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(Superclass);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  unsigned __int8 v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    while (1)
    {
      unsigned int outCount = 0;
      cls = Superclass;
      v9 = class_copyPropertyList(Superclass, &outCount);
      if (outCount) {
        break;
      }
LABEL_13:
      free(v9);
      Superclass = class_getSuperclass(cls);
      v15 = NSStringFromClass(Superclass);
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      unsigned __int8 v18 = [v15 isEqualToString:v17];

      if (v18) {
        goto LABEL_14;
      }
    }
    uint64_t v10 = 0;
    while (1)
    {
      id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%s", property_getName(v9[v10])];
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
      uint64_t v13 = +[NSNull null];
    }
    v14 = (void *)v13;
    [v3 setObject:v13 forKeyedSubscript:v11];

LABEL_11:
    goto LABEL_12;
  }
LABEL_14:

  return v3;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NFTrustObject *)self dictionaryRepresentation];
  id v7 = [v3 initWithFormat:@"%@ : %@", v5, v6];

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