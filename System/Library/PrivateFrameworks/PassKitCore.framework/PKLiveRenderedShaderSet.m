@interface PKLiveRenderedShaderSet
+ (BOOL)supportsSecureCoding;
- (NSString)fragmentEntryPointShader;
- (NSString)geometryEntryPointShader;
- (NSString)lightingModelEntryPointShader;
- (NSString)surfaceEntryPointShader;
- (PKLiveRenderedShaderSet)initWithCoder:(id)a3;
- (PKLiveRenderedShaderSet)initWithDataAccessor:(id)a3 suffix:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKLiveRenderedShaderSet

- (PKLiveRenderedShaderSet)initWithDataAccessor:(id)a3 suffix:(id)a4
{
  v45[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)PKLiveRenderedShaderSet;
  v8 = [(PKLiveRenderedShaderSet *)&v44 init];
  if (v8)
  {
    context = (void *)MEMORY[0x192FDC630]();
    if (v7)
    {
      v9 = [@"geometry" stringByAppendingString:v7];
    }
    else
    {
      v9 = @"geometry";
    }
    v10 = v9;
    v11 = [[PKBundleResourceDescriptor alloc] initWithName:v9 extension:@"metal"];
    if (v7)
    {
      v12 = [@"lighting" stringByAppendingString:v7];
    }
    else
    {
      v12 = @"lighting";
    }
    v40 = v10;
    v39 = v12;
    v13 = [[PKBundleResourceDescriptor alloc] initWithName:v12 extension:@"metal"];
    if (v7)
    {
      v14 = [@"surface" stringByAppendingString:v7];
    }
    else
    {
      v14 = @"surface";
    }
    v15 = v14;
    v43 = v6;
    v16 = [[PKBundleResourceDescriptor alloc] initWithName:v14 extension:@"metal"];
    id v42 = v7;
    if (v7)
    {
      v17 = [@"fragment" stringByAppendingString:v7];
    }
    else
    {
      v17 = @"fragment";
    }
    v18 = v17;
    v19 = [[PKBundleResourceDescriptor alloc] initWithName:v17 extension:@"metal"];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    v45[0] = v11;
    v45[1] = v13;
    v45[2] = v16;
    v45[3] = v19;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
    [v20 setWithArray:v21];
    v22 = v13;
    v24 = v23 = v11;
    v25 = [v43 dataForBundleResources:v24];

    if ([v25 count])
    {
      v26 = [v25 objectForKeyedSubscript:v23];
      if (v26)
      {
        uint64_t v27 = [[NSString alloc] initWithData:v26 encoding:1];
        geometryEntryPointShader = v8->_geometryEntryPointShader;
        v8->_geometryEntryPointShader = (NSString *)v27;
      }
      else
      {
        geometryEntryPointShader = v8->_geometryEntryPointShader;
        v8->_geometryEntryPointShader = 0;
      }

      v29 = [v25 objectForKeyedSubscript:v22];

      if (v29)
      {
        uint64_t v30 = [[NSString alloc] initWithData:v29 encoding:1];
        lightingModelEntryPointShader = v8->_lightingModelEntryPointShader;
        v8->_lightingModelEntryPointShader = (NSString *)v30;
      }
      else
      {
        lightingModelEntryPointShader = v8->_lightingModelEntryPointShader;
        v8->_lightingModelEntryPointShader = 0;
      }

      v32 = [v25 objectForKeyedSubscript:v16];

      if (v32)
      {
        uint64_t v33 = [[NSString alloc] initWithData:v32 encoding:1];
        surfaceEntryPointShader = v8->_surfaceEntryPointShader;
        v8->_surfaceEntryPointShader = (NSString *)v33;
      }
      else
      {
        surfaceEntryPointShader = v8->_surfaceEntryPointShader;
        v8->_surfaceEntryPointShader = 0;
      }

      v35 = [v25 objectForKeyedSubscript:v19];

      if (v35)
      {
        uint64_t v36 = [[NSString alloc] initWithData:v35 encoding:1];
        fragmentEntryPointShader = v8->_fragmentEntryPointShader;
        v8->_fragmentEntryPointShader = (NSString *)v36;
      }
      else
      {
        fragmentEntryPointShader = v8->_fragmentEntryPointShader;
        v8->_fragmentEntryPointShader = 0;
      }
    }
    id v7 = v42;
    id v6 = v43;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  geometryEntryPointShader = self->_geometryEntryPointShader;
  id v5 = a3;
  [v5 encodeObject:geometryEntryPointShader forKey:@"geometry"];
  [v5 encodeObject:self->_lightingModelEntryPointShader forKey:@"lighting"];
  [v5 encodeObject:self->_surfaceEntryPointShader forKey:@"surface"];
  [v5 encodeObject:self->_fragmentEntryPointShader forKey:@"fragment"];
}

- (PKLiveRenderedShaderSet)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x192FDC630]();
  v16.receiver = self;
  v16.super_class = (Class)PKLiveRenderedShaderSet;
  id v6 = [(PKLiveRenderedShaderSet *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geometry"];
    geometryEntryPointShader = v6->_geometryEntryPointShader;
    v6->_geometryEntryPointShader = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lighting"];
    lightingModelEntryPointShader = v6->_lightingModelEntryPointShader;
    v6->_lightingModelEntryPointShader = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"surface"];
    surfaceEntryPointShader = v6->_surfaceEntryPointShader;
    v6->_surfaceEntryPointShader = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fragment"];
    fragmentEntryPointShader = v6->_fragmentEntryPointShader;
    v6->_fragmentEntryPointShader = (NSString *)v13;
  }

  return v6;
}

- (NSString)geometryEntryPointShader
{
  return self->_geometryEntryPointShader;
}

- (NSString)surfaceEntryPointShader
{
  return self->_surfaceEntryPointShader;
}

- (NSString)lightingModelEntryPointShader
{
  return self->_lightingModelEntryPointShader;
}

- (NSString)fragmentEntryPointShader
{
  return self->_fragmentEntryPointShader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentEntryPointShader, 0);
  objc_storeStrong((id *)&self->_lightingModelEntryPointShader, 0);
  objc_storeStrong((id *)&self->_surfaceEntryPointShader, 0);
  objc_storeStrong((id *)&self->_geometryEntryPointShader, 0);
}

@end