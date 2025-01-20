@interface ODDDiagram
- (NSArray)equivalentDrawables;
- (ODDDiagram)init;
- (id)colorTransform;
- (id)description;
- (id)documentPoint;
- (id)styleDefinition;
- (void)setDocumentPoint:(id)a3;
- (void)setEquivalentDrawables:(id)a3;
- (void)setParentTextListStyle:(id)a3;
@end

@implementation ODDDiagram

- (ODDDiagram)init
{
  v2 = [(OADDrawable *)self initWithPropertiesClass:objc_opt_class()];
  if (v2)
  {
    v3 = objc_alloc_init(ODDColorTransform);
    mColorTransform = v2->mColorTransform;
    v2->mColorTransform = v3;

    v5 = objc_alloc_init(ODDStyleDefinition);
    mStyleDefinition = v2->mStyleDefinition;
    v2->mStyleDefinition = v5;
  }
  return v2;
}

- (id)styleDefinition
{
  return self->mStyleDefinition;
}

- (id)colorTransform
{
  return self->mColorTransform;
}

- (void)setDocumentPoint:(id)a3
{
}

- (void)setParentTextListStyle:(id)a3
{
}

- (id)documentPoint
{
  return self->mDocumentPoint;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)ODDDiagram;
  v2 = [(OADDrawable *)&v4 description];
  return v2;
}

- (NSArray)equivalentDrawables
{
  return self->mEquivalentDrawables;
}

- (void)setEquivalentDrawables:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEquivalentDrawables, 0);
  objc_storeStrong((id *)&self->mStyleDefinition, 0);
  objc_storeStrong((id *)&self->mColorTransform, 0);
  objc_storeStrong((id *)&self->mDocumentPoint, 0);
}

@end