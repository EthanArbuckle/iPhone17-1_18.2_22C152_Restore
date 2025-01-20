@interface SBElasticRouteDisplayContext
+ (id)routeContextWithName:(id)a3 glyphImage:(id)a4;
+ (id)routeContextWithName:(id)a3 valueTransformer:(id)a4 glyphPackage:(id)a5;
- (CCUICAPackageDescription)glyphPackage;
- (NSString)description;
- (NSString)localizedDisplayName;
- (UIImage)glyphImage;
- (id)_initWithName:(id)a3 glyphStateValueTransformer:(id)a4 glyphPackage:(id)a5 glyphImage:(id)a6;
- (id)glyphStateValueTransformer;
- (void)setGlyphImage:(id)a3;
- (void)setGlyphPackage:(id)a3;
- (void)setGlyphStateValueTransformer:(id)a3;
- (void)setLocalizedDisplayName:(id)a3;
@end

@implementation SBElasticRouteDisplayContext

+ (id)routeContextWithName:(id)a3 valueTransformer:(id)a4 glyphPackage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"SBElasticRouteDisplayContext.m", 27, @"Invalid parameter not satisfying: %@", @"glyphPackage" object file lineNumber description];
  }
  v12 = (void *)[objc_alloc((Class)a1) _initWithName:v9 glyphStateValueTransformer:v10 glyphPackage:v11 glyphImage:0];

  return v12;
}

+ (id)routeContextWithName:(id)a3 glyphImage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"SBElasticRouteDisplayContext.m", 34, @"Invalid parameter not satisfying: %@", @"glyphImage" object file lineNumber description];
  }
  id v9 = (void *)[objc_alloc((Class)a1) _initWithName:v7 glyphStateValueTransformer:0 glyphPackage:0 glyphImage:v8];

  return v9;
}

- (id)_initWithName:(id)a3 glyphStateValueTransformer:(id)a4 glyphPackage:(id)a5 glyphImage:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBElasticRouteDisplayContext.m", 43, @"Invalid parameter not satisfying: %@", @"localizedDisplayName" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)SBElasticRouteDisplayContext;
  v16 = [(SBElasticRouteDisplayContext *)&v22 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_localizedDisplayName, a3);
    uint64_t v18 = MEMORY[0x1D948C7A0](v13);
    id glyphStateValueTransformer = v17->_glyphStateValueTransformer;
    v17->_id glyphStateValueTransformer = (id)v18;

    objc_storeStrong((id *)&v17->_glyphPackage, a5);
    objc_storeStrong((id *)&v17->_glyphImage, a6);
  }

  return v17;
}

- (NSString)description
{
  v2 = @"glyphImage";
  if (self->_glyphPackage) {
    v2 = @"glyphPackage";
  }
  return (NSString *)[NSString stringWithFormat:@"SBElasticRouteDisplayContext with displayName: '%@', type: '%@'", self->_localizedDisplayName, v2];
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (id)glyphStateValueTransformer
{
  return self->_glyphStateValueTransformer;
}

- (void)setGlyphStateValueTransformer:(id)a3
{
}

- (CCUICAPackageDescription)glyphPackage
{
  return self->_glyphPackage;
}

- (void)setGlyphPackage:(id)a3
{
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (void)setGlyphImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphPackage, 0);
  objc_storeStrong(&self->_glyphStateValueTransformer, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end