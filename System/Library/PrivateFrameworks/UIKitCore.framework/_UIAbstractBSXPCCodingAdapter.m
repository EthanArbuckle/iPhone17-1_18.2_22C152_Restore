@interface _UIAbstractBSXPCCodingAdapter
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)adapterWithObject:(id)a3;
- (_UIAbstractBSXPCCodingAdapter)initWithBSXPCCoder:(id)a3;
- (_UIAbstractBSXPCCodingAdapter)initWithBSXPCCoder:(id)a3 clazz:(Class)a4;
- (_UIAbstractBSXPCCodingAdapter)initWithBSXPCCoder:(id)a3 collectionOfClass:(Class)a4 containingClass:(Class)a5;
- (_UIAbstractBSXPCCodingAdapter)initWithObject:(id)a3;
- (id)object;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation _UIAbstractBSXPCCodingAdapter

+ (id)adapterWithObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithObject:v4];

  return v5;
}

- (_UIAbstractBSXPCCodingAdapter)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIAbstractBSXPCCodingAdapter;
  v6 = [(_UIAbstractBSXPCCodingAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (_UIAbstractBSXPCCodingAdapter)initWithBSXPCCoder:(id)a3
{
  id v3 = a3;
  objc_exception_throw(0);
}

- (_UIAbstractBSXPCCodingAdapter)initWithBSXPCCoder:(id)a3 clazz:(Class)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIAbstractBSXPCCodingAdapter;
  v7 = [(_UIAbstractBSXPCCodingAdapter *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 decodeObjectOfClass:a4 forKey:@"key"];
    id object = v7->_object;
    v7->_id object = (id)v8;
  }
  return v7;
}

- (_UIAbstractBSXPCCodingAdapter)initWithBSXPCCoder:(id)a3 collectionOfClass:(Class)a4 containingClass:(Class)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIAbstractBSXPCCodingAdapter;
  objc_super v9 = [(_UIAbstractBSXPCCodingAdapter *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 decodeCollectionOfClass:a4 containingClass:a5 forKey:@"key"];
    id object = v9->_object;
    v9->_id object = (id)v10;
  }
  return v9;
}

- (id)object
{
  return self->_object;
}

- (void).cxx_destruct
{
}

@end