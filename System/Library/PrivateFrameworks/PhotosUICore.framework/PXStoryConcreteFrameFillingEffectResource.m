@interface PXStoryConcreteFrameFillingEffectResource
- (BOOL)isEqual:(id)a3;
- (BOOL)px_storyResourceUseSmartColor;
- (PXDisplayAsset)px_storyResourceDisplayAsset;
- (PXStoryConcreteFrameFillingEffectResource)init;
- (PXStoryConcreteFrameFillingEffectResource)initWithDisplayAsset:(id)a3 useSmartColor:(BOOL)a4;
- (PXStoryConcreteFrameFillingEffectResource)initWithIdentifier:(id)a3 kind:(int64_t)a4;
- (unint64_t)hash;
@end

@implementation PXStoryConcreteFrameFillingEffectResource

- (void).cxx_destruct
{
}

- (BOOL)px_storyResourceUseSmartColor
{
  return self->_useSmartColor;
}

- (PXDisplayAsset)px_storyResourceDisplayAsset
{
  return self->_displayAsset;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PXStoryConcreteFrameFillingEffectResource *)self px_storyResourceUseSmartColor];
  v4 = [(PXStoryConcreteFrameFillingEffectResource *)self px_storyResourceDisplayAsset];
  unint64_t v5 = v3 | (2 * [v4 hash]);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXStoryConcreteFrameFillingEffectResource *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      v6 = [(PXStoryConcreteFrameFillingEffectResource *)self px_storyResourceDisplayAsset];
      v7 = [(PXStoryConcreteFrameFillingEffectResource *)v5 px_storyResourceDisplayAsset];
      if ([v6 isEqual:v7])
      {
        BOOL v8 = [(PXStoryConcreteFrameFillingEffectResource *)self px_storyResourceUseSmartColor];
        BOOL v9 = v8 ^ [(PXStoryConcreteFrameFillingEffectResource *)v5 px_storyResourceUseSmartColor] ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (PXStoryConcreteFrameFillingEffectResource)initWithDisplayAsset:(id)a3 useSmartColor:(BOOL)a4
{
  id v7 = a3;
  BOOL v8 = [v7 uuid];
  v11.receiver = self;
  v11.super_class = (Class)PXStoryConcreteFrameFillingEffectResource;
  BOOL v9 = [(PXStoryConcreteResource *)&v11 initWithIdentifier:v8 kind:5];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayAsset, a3);
    v9->_useSmartColor = a4;
  }

  return v9;
}

- (PXStoryConcreteFrameFillingEffectResource)initWithIdentifier:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteResources.m", 199, @"%s is not available as initializer", "-[PXStoryConcreteFrameFillingEffectResource initWithIdentifier:kind:]");

  abort();
}

- (PXStoryConcreteFrameFillingEffectResource)init
{
  return [(PXStoryConcreteFrameFillingEffectResource *)self initWithDisplayAsset:0 useSmartColor:0];
}

@end