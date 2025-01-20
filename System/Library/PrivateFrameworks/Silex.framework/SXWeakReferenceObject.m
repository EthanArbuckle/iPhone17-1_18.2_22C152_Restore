@interface SXWeakReferenceObject
+ (id)withObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SXWeakReferenceObject)initWithObject:(id)a3;
- (id)description;
- (id)object;
- (unint64_t)hash;
@end

@implementation SXWeakReferenceObject

+ (id)withObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithObject:v3];

  return v4;
}

- (SXWeakReferenceObject)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SXWeakReferenceObject;
  v5 = [(SXWeakReferenceObject *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_object, v4);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(SXWeakReferenceObject *)self object];
    if (v5)
    {
    }
    else
    {
      v7 = [v4 object];

      if (!v7)
      {
        char v6 = 1;
        goto LABEL_7;
      }
    }
    objc_super v8 = [(SXWeakReferenceObject *)self object];
    v9 = [v4 object];
    char v6 = [v8 isEqual:v9];
  }
  else
  {
    char v6 = 0;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  v2 = [(SXWeakReferenceObject *)self object];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(SXWeakReferenceObject *)self object];
  id v4 = [v2 stringWithFormat:@"<Weak: %@>", v3];

  return v4;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end