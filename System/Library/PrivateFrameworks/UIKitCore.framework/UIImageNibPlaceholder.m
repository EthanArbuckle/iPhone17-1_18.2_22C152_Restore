@interface UIImageNibPlaceholder
- (NSString)resourceCatalogName;
- (UIImageNibPlaceholder)initWithCoder:(id)a3;
- (UIImageNibPlaceholder)initWithContentsOfFile:(id)a3 andRuntimeResourceName:(id)a4;
- (UIImageNibPlaceholder)initWithData:(id)a3 andRuntimeResourceName:(id)a4;
- (UIImageNibPlaceholder)initWithRuntimeSystemSymbolResourceName:(id)a3;
- (UIImageSymbolConfiguration)resourceSymbolImageConfiguration;
- (double)variableValue;
- (id)_initWithOtherImage:(id)a3;
- (int64_t)resourceRenderingMode;
- (void)_commonInit;
- (void)encodeWithCoder:(id)a3;
- (void)setResourceCatalogName:(id)a3;
- (void)setResourceRenderingMode:(int64_t)a3;
- (void)setResourceSymbolImageConfiguration:(id)a3;
- (void)setVariableValue:(double)a3;
@end

@implementation UIImageNibPlaceholder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceCatalogName, 0);
  objc_storeStrong((id *)&self->_resourceSymbolImageConfiguration, 0);
  objc_storeStrong((id *)&self->systemSymbolResourceName, 0);
  objc_storeStrong((id *)&self->runtimeResourceName, 0);
}

- (UIImageNibPlaceholder)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = UIResourceBundleForNIBBeingDecodedWithCoder(v4);
  uint64_t v6 = [v4 decodeObjectForKey:@"UISystemSymbolResourceName"];
  v7 = [v4 decodeObjectForKey:@"UIResourceCatalogName"];
  v8 = v7;
  if (!v6)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  if ([v7 length]
    || (+[UIImage systemImageNamed:v6],
        (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v8 isEqualToString:@"private"])
    {
      v9 = +[UIImage _systemImageNamed:v6];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:
  if ([v4 containsValueForKey:@"UIImageVariableValue"])
  {
    [v4 decodeDoubleForKey:@"UIImageVariableValue"];
    uint64_t v10 = objc_msgSend(v9, "_imageWithVariableValue:");

    v9 = (void *)v10;
  }
  v11 = [v4 decodeObjectForKey:@"UIResourceName"];
  if (v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B50] mainBundle];
    if (v5 == (void *)v12)
    {
      v14 = _UIKitGetApplicationAssetManager();
      v13 = v5;
    }
    else
    {
      v13 = (void *)v12;
      v14 = +[_UIAssetManager assetManagerForBundle:v5];
    }
  }
  else
  {
    v14 = _UIKitGetApplicationAssetManager();
  }
  v36 = v4;
  if (v9)
  {
    v15 = v9;
  }
  else
  {
    v15 = [v14 imageNamed:v11];
    if (!v15)
    {
      _UIImageAtPath(v11, v5, 0, 0);
      v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        [v4 decodeFloatForKey:@"UIImageWidth"];
        size_t v32 = (uint64_t)v16;
        [v4 decodeFloatForKey:@"UIImageHeight"];
        uint64_t height = (uint64_t)v17;
        v18 = [v5 bundleIdentifier];
        NSLog(&cfstr_CouldNotLoadTh.isa, v11, v18);

        size_t v19 = (4 * v32);
        space = CGColorSpaceCreateDeviceRGB();
        v33 = malloc_type_calloc(v19 * height, 1uLL, 0x64B17EC7uLL);
        v20 = CGBitmapContextCreate(v33, v32, height, 8uLL, v19, space, 2u);
        heighta = CGBitmapContextCreateImage(v20);
        CGContextRelease(v20);
        CGColorSpaceRelease(space);
        v15 = [[UIImage alloc] initWithCGImage:heighta];
        CGImageRelease(heighta);
        free(v33);
        if (!v15)
        {
          v24 = v5;
          v25 = (void *)v6;
          v26 = v8;
          v27 = self;
          goto LABEL_26;
        }
      }
    }
  }
  uint64_t v21 = [v4 decodeIntegerForKey:@"UIRenderingMode"];
  if (v21)
  {
    uint64_t v22 = [(UIImage *)v15 imageWithRenderingMode:v21];

    v15 = (UIImage *)v22;
  }
  v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UISymbolImageConfiguration"];
  v24 = v5;
  v25 = (void *)v6;
  v26 = v8;
  v27 = self;
  if (v23)
  {
    uint64_t v28 = [(UIImage *)v15 imageByApplyingSymbolConfiguration:v23];

    v15 = (UIImage *)v28;
  }

LABEL_26:
  v29 = v15;

  return v29;
}

- (void)_commonInit
{
  self->_variableValue = INFINITY;
}

- (UIImageNibPlaceholder)initWithContentsOfFile:(id)a3 andRuntimeResourceName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIImageNibPlaceholder;
  v7 = [(UIImage *)&v12 initWithContentsOfFile:a3];
  v8 = v7;
  if (v7)
  {
    [(UIImageNibPlaceholder *)v7 _commonInit];
    uint64_t v9 = [v6 copy];
    runtimeResourceName = v8->runtimeResourceName;
    v8->runtimeResourceName = (NSString *)v9;
  }
  return v8;
}

- (UIImageNibPlaceholder)initWithData:(id)a3 andRuntimeResourceName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIImageNibPlaceholder;
  v7 = [(UIImage *)&v12 initWithData:a3];
  v8 = v7;
  if (v7)
  {
    [(UIImageNibPlaceholder *)v7 _commonInit];
    uint64_t v9 = [v6 copy];
    runtimeResourceName = v8->runtimeResourceName;
    v8->runtimeResourceName = (NSString *)v9;
  }
  return v8;
}

- (UIImageNibPlaceholder)initWithRuntimeSystemSymbolResourceName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIImageNibPlaceholder;
  v5 = [(UIImage *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    [(UIImageNibPlaceholder *)v5 _commonInit];
    uint64_t v7 = [v4 copy];
    systemSymbolResourceName = v6->systemSymbolResourceName;
    v6->systemSymbolResourceName = (NSString *)v7;

    uint64_t v9 = [v4 copy];
    runtimeResourceName = v6->runtimeResourceName;
    v6->runtimeResourceName = (NSString *)v9;
  }
  return v6;
}

- (id)_initWithOtherImage:(id)a3
{
  id v4 = (id *)a3;
  v16.receiver = self;
  v16.super_class = (Class)UIImageNibPlaceholder;
  v5 = [(UIImage *)&v16 _initWithOtherImage:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 _commonInit];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v4[18] copy];
      v8 = (void *)v6[18];
      v6[18] = v7;

      uint64_t v9 = [v4[19] copy];
      uint64_t v10 = (void *)v6[19];
      v6[19] = v9;

      v6[20] = v4[20];
      uint64_t v11 = [v4[21] copy];
      objc_super v12 = (void *)v6[21];
      v6[21] = v11;

      uint64_t v13 = [v4[22] copy];
      v14 = (void *)v6[22];
      v6[22] = v13;

      v6[23] = v4[23];
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [(UIImage *)self size];
  *(float *)&double v4 = v4;
  [v8 encodeFloat:@"UIImageWidth" forKey:v4];
  [(UIImage *)self size];
  *(float *)&double v6 = v5;
  [v8 encodeFloat:@"UIImageHeight" forKey:v6];
  [v8 encodeObject:self->runtimeResourceName forKey:@"UIResourceName"];
  [v8 encodeObject:self->systemSymbolResourceName forKey:@"UISystemSymbolResourceName"];
  if (self->_variableValue != INFINITY) {
    objc_msgSend(v8, "encodeDouble:forKey:", @"UIImageVariableValue");
  }
  int64_t resourceRenderingMode = self->_resourceRenderingMode;
  if (resourceRenderingMode) {
    [v8 encodeInteger:resourceRenderingMode forKey:@"UIRenderingMode"];
  }
  [v8 encodeObject:self->_resourceSymbolImageConfiguration forKey:@"UISymbolImageConfiguration"];
  [v8 encodeObject:self->_resourceCatalogName forKey:@"UIResourceCatalogName"];
}

- (int64_t)resourceRenderingMode
{
  return self->_resourceRenderingMode;
}

- (void)setResourceRenderingMode:(int64_t)a3
{
  self->_int64_t resourceRenderingMode = a3;
}

- (UIImageSymbolConfiguration)resourceSymbolImageConfiguration
{
  return self->_resourceSymbolImageConfiguration;
}

- (void)setResourceSymbolImageConfiguration:(id)a3
{
}

- (NSString)resourceCatalogName
{
  return self->_resourceCatalogName;
}

- (void)setResourceCatalogName:(id)a3
{
}

- (double)variableValue
{
  return self->_variableValue;
}

- (void)setVariableValue:(double)a3
{
  self->_variableValue = a3;
}

@end