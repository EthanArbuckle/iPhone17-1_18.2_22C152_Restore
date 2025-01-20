@interface _WrapperForNonBSXPCCodingConformingClass
+ (BOOL)supportsBSXPCSecureCoding;
- (NSObject)object;
- (_WrapperForNonBSXPCCodingConformingClass)initWithBSXPCCoder:(id)a3;
- (_WrapperForNonBSXPCCodingConformingClass)initWithObject:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation _WrapperForNonBSXPCCodingConformingClass

- (_WrapperForNonBSXPCCodingConformingClass)initWithObject:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_WrapperForNonBSXPCCodingConformingClass;
  v5 = [(_WrapperForNonBSXPCCodingConformingClass *)&v8 init];
  object = v5->_object;
  v5->_object = v4;

  return v5;
}

- (_WrapperForNonBSXPCCodingConformingClass)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"className"];
  v6 = [v4 decodeObjectOfClass:NSClassFromString(v5) forKey:@"wrappedObject"];

  v7 = [(_WrapperForNonBSXPCCodingConformingClass *)self initWithObject:v6];
  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_WrapperForNonBSXPCCodingConformingClass *)self object];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 encodeObject:v7 forKey:@"className"];

  id v8 = [(_WrapperForNonBSXPCCodingConformingClass *)self object];
  [v4 encodeObject:v8 forKey:@"wrappedObject"];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSObject)object
{
  return self->_object;
}

- (void).cxx_destruct
{
}

@end