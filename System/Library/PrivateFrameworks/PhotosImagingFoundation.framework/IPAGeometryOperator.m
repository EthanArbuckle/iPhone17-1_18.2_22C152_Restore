@interface IPAGeometryOperator
- (IPAGeometryOperator)init;
- (IPAGeometryOperator)initWithIdentifier:(id)a3;
- (id)identifier;
- (id)transformForGeometry:(id)a3;
@end

@implementation IPAGeometryOperator

- (void).cxx_destruct
{
}

- (id)transformForGeometry:(id)a3
{
  id v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  id result = (id)_PFAssertFailHandler();
  __break(1u);
  return result;
}

- (id)identifier
{
  return self->_identifer;
}

- (IPAGeometryOperator)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)IPAGeometryOperator;
    v6 = [(IPAGeometryOperator *)&v9 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_identifer, a3);
    }

    return v7;
  }
  else
  {
    id result = (IPAGeometryOperator *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (IPAGeometryOperator)init
{
  id result = (IPAGeometryOperator *)_PFAssertFailHandler();
  __break(1u);
  return result;
}

@end