@interface PLFullSizeRenderVideoVirtualResource
- (PLFullSizeRenderVideoVirtualResource)initWithAsset:(id)a3;
- (unint64_t)cplType;
@end

@implementation PLFullSizeRenderVideoVirtualResource

- (unint64_t)cplType
{
  return 16;
}

- (PLFullSizeRenderVideoVirtualResource)initWithAsset:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLFullSizeRenderVideoVirtualResource;
  v5 = [(PLVirtualResource *)&v10 initWithAsset:v4 resourceType:1 version:2 recipeID:0x20000];
  if (v5)
  {
    -[PLVirtualResource setUnorientedWidth:](v5, "setUnorientedWidth:", [v4 width]);
    -[PLVirtualResource setUnorientedHeight:](v5, "setUnorientedHeight:", [v4 height]);
    v6 = +[PLResourceRecipe recipeFromID:0x20000];
    v7 = [v6 uti];
    [(PLVirtualResource *)v5 setUniformTypeIdentifier:v7];

    v8 = [v6 codecFourCharCodeName];
    [(PLVirtualResource *)v5 setCodecFourCharCodeName:v8];
  }
  return v5;
}

@end