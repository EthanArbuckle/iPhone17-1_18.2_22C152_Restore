@interface PRPosterAmbientEnvironmentImpl
- (BOOL)isAmbientPresented;
- (BOOL)isDisplayStyleRedMode;
- (PRPosterAmbientEnvironmentImpl)initWithTraitCollection:(id)a3;
- (UITraitCollection)traitCollection;
- (void)setTraitCollection:(id)a3;
@end

@implementation PRPosterAmbientEnvironmentImpl

- (PRPosterAmbientEnvironmentImpl)initWithTraitCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterAmbientEnvironmentImpl;
  v6 = [(PRPosterAmbientEnvironmentImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_traitCollection, a3);
  }

  return v7;
}

- (BOOL)isAmbientPresented
{
  return [(UITraitCollection *)self->_traitCollection isAmbientPresented];
}

- (BOOL)isDisplayStyleRedMode
{
  uint64_t v2 = [(UITraitCollection *)self->_traitCollection ambientDisplayStyle];
  return MEMORY[0x1F41081C0](v2);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end