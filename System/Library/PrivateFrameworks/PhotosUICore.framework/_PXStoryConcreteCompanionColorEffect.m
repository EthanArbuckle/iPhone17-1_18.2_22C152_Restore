@interface _PXStoryConcreteCompanionColorEffect
- (PXGColorLookupCube)colorLookupCube;
- (_PXStoryConcreteCompanionColorEffect)initWithColorLookupCube:(id)a3;
- (id)createMetalTextureWithDevice:(id)a3;
@end

@implementation _PXStoryConcreteCompanionColorEffect

- (void).cxx_destruct
{
}

- (PXGColorLookupCube)colorLookupCube
{
  return self->_colorLookupCube;
}

- (id)createMetalTextureWithDevice:(id)a3
{
  v4 = [off_1E5DA6978 privateContextWithDevice:a3];
  v5 = [(_PXStoryConcreteCompanionColorEffect *)self colorLookupCube];
  v6 = [v5 createTextureWithContext:v4];

  return v6;
}

- (_PXStoryConcreteCompanionColorEffect)initWithColorLookupCube:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryConcreteCompanionColorEffect;
  v6 = [(_PXStoryConcreteCompanionColorEffect *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_colorLookupCube, a3);
  }

  return v7;
}

@end