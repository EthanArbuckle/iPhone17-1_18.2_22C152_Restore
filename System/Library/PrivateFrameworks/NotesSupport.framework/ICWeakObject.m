@interface ICWeakObject
- (BOOL)isEqual:(id)a3;
- (ICWeakObject)initWithObject:(id)a3;
- (id)description;
- (id)object;
- (unint64_t)cachedHash;
- (void)setCachedHash:(unint64_t)a3;
@end

@implementation ICWeakObject

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (ICWeakObject)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICWeakObject;
  v5 = [(ICWeakObject *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_object, v4);
    v6->_cachedHash = (unint64_t)v4;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [(ICWeakObject *)self object];
    v7 = [v5 object];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICWeakObject;
  id v4 = [(ICWeakObject *)&v8 description];
  id v5 = [(ICWeakObject *)self object];
  v6 = [v3 stringWithFormat:@"%@(%@)", v4, v5];

  return v6;
}

- (void)setCachedHash:(unint64_t)a3
{
  self->_cachedHash = a3;
}

- (void).cxx_destruct
{
}

@end