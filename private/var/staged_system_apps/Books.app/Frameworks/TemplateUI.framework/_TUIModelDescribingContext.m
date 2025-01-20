@interface _TUIModelDescribingContext
- (TUIPackage)package;
- (_TUIModelDescribingContext)initWithPackage:(id)a3;
@end

@implementation _TUIModelDescribingContext

- (_TUIModelDescribingContext)initWithPackage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIModelDescribingContext;
  v6 = [(_TUIModelDescribingContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_package, a3);
  }

  return v7;
}

- (TUIPackage)package
{
  return self->_package;
}

- (void).cxx_destruct
{
}

@end