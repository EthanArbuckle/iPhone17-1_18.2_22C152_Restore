@interface PSWeakReference
+ (PSWeakReference)weakReferenceWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PSWeakReference)initWithObject:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)object;
- (unint64_t)hash;
@end

@implementation PSWeakReference

+ (PSWeakReference)weakReferenceWithObject:(id)a3
{
  id v3 = a3;
  v4 = [[PSWeakReference alloc] initWithObject:v3];

  return v4;
}

- (PSWeakReference)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PSWeakReference;
  v5 = [(PSWeakReference *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_location, v4);
  }

  return v6;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_location);
  return WeakRetained;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(PSWeakReference *)self object];
  v6 = (void *)[v4 initWithObject:v5];

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PSWeakReference;
  v5 = -[PSWeakReference forwardingTargetForSelector:](&v8, sel_forwardingTargetForSelector_);
  if (!v5)
  {
    v5 = [(PSWeakReference *)self object];
    Name = sel_getName(a3);
    NSLog(&cfstr_WarningPsweakr.isa, Name, v5);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(PSWeakReference *)self object];
  if (v5 == v4) {
    char v6 = 1;
  }
  else {
    char v6 = [v4 isEqual:v5];
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(PSWeakReference *)self object];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void).cxx_destruct
{
}

@end