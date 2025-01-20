@interface SXContainerComponentBlueprint
- (SXLayoutBlueprint)layoutBlueprint;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLayoutBlueprint:(id)a3;
- (void)setParentLayoutBlueprint:(id)a3;
@end

@implementation SXContainerComponentBlueprint

- (void)setParentLayoutBlueprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXContainerComponentBlueprint;
  id v4 = a3;
  [(SXComponentBlueprint *)&v6 setParentLayoutBlueprint:v4];
  v5 = [(SXContainerComponentBlueprint *)self layoutBlueprint];
  [v5 setParentLayoutBlueprint:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SXContainerComponentBlueprint;
  v5 = -[SXComponentBlueprint copyWithZone:](&v10, sel_copyWithZone_);
  objc_super v6 = [(SXContainerComponentBlueprint *)self layoutBlueprint];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = (void *)v5[48];
  v5[48] = v7;

  return v5;
}

- (SXLayoutBlueprint)layoutBlueprint
{
  return self->_layoutBlueprint;
}

- (void)setLayoutBlueprint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end