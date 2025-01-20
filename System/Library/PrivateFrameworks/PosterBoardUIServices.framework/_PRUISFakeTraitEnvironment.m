@interface _PRUISFakeTraitEnvironment
- (UITraitCollection)traitCollection;
- (_PRUISFakeTraitEnvironment)initWithTraitCollection:(id)a3;
@end

@implementation _PRUISFakeTraitEnvironment

- (_PRUISFakeTraitEnvironment)initWithTraitCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PRUISFakeTraitEnvironment;
  v6 = [(_PRUISFakeTraitEnvironment *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_traitCollection, a3);
  }

  return v7;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
}

@end