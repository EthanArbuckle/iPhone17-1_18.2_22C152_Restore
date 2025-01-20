@interface IPAImageTransform
+ (id)compositeTransforms:(id)a3;
+ (id)identityTransformForGeometry:(id)a3;
- (BOOL)canAlignToPixelsExactly;
- (IPAImageTransform)init;
- (IPAImageTransform)initWithInputGeometry:(id)a3 intrinsicGeometry:(id)a4;
- (id)description;
- (id)inputGeometry;
- (id)intrinsicGeometry;
- (id)inverseTransform;
@end

@implementation IPAImageTransform

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intrinsicGeometry, 0);
  objc_storeStrong((id *)&self->_inputGeometry, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@.%p inputGeometry:%@ intrinsicGeometry:%@>", v5, self, self->_inputGeometry, self->_intrinsicGeometry];

  return v6;
}

- (BOOL)canAlignToPixelsExactly
{
  return 0;
}

- (id)inverseTransform
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  id result = (id)_PFAssertFailHandler();
  __break(1u);
  return result;
}

- (id)intrinsicGeometry
{
  return self->_intrinsicGeometry;
}

- (id)inputGeometry
{
  return self->_inputGeometry;
}

- (IPAImageTransform)initWithInputGeometry:(id)a3 intrinsicGeometry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)IPAImageTransform;
    v10 = [(IPAImageTransform *)&v13 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_inputGeometry, a3);
      objc_storeStrong((id *)&v11->_intrinsicGeometry, a4);
    }

    return v11;
  }
  else
  {
    id result = (IPAImageTransform *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (IPAImageTransform)init
{
  id result = (IPAImageTransform *)_PFAssertFailHandler();
  __break(1u);
  return result;
}

+ (id)compositeTransforms:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [[IPAImageTransformSequence alloc] initWithTransforms:v3];

    return v4;
  }
  else
  {
    id result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

+ (id)identityTransformForGeometry:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [(IPAImageTransform *)[IPAImageIdentityTransform alloc] initWithInputGeometry:v3 intrinsicGeometry:v3];

    return v4;
  }
  else
  {
    id result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

@end