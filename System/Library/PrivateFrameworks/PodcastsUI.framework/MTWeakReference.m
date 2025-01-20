@interface MTWeakReference
- (MTWeakReference)initWithObject:(id)a3;
- (id)object;
- (void)setObject:(id)a3;
@end

@implementation MTWeakReference

- (MTWeakReference)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTWeakReference;
  v5 = [(MTWeakReference *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MTWeakReference *)v5 setObject:v4];
  }

  return v6;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end