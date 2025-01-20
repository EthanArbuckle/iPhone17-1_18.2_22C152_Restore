@interface _UIWeakReference
+ (id)weakReferenceWrappingObject:(id)a3;
- (_UIWeakReference)initWithObject:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)object;
- (void)setObject:(id)a3;
@end

@implementation _UIWeakReference

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

+ (id)weakReferenceWrappingObject:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [[_UIWeakReference alloc] initWithObject:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (_UIWeakReference)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWeakReference;
  v5 = [(_UIWeakReference *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_object, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_UIWeakReference alloc];
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  v6 = [(_UIWeakReference *)v4 initWithObject:WeakRetained];

  return v6;
}

- (void)setObject:(id)a3
{
}

@end