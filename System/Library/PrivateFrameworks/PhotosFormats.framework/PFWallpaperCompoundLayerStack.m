@interface PFWallpaperCompoundLayerStack
- (CGSize)size;
- (PFParallaxLayerStack)landscapeLayerStack;
- (PFParallaxLayerStack)portraitLayerStack;
- (PFPosterLayout)layout;
- (PFWallpaperCompoundLayerStack)initWithPortraitLayerStack:(id)a3 landscapeLayerStack:(id)a4;
- (id)backgroundBackfillLayer;
- (id)compoundLayerStackByUpdatingParallaxDisabled:(BOOL)a3;
- (id)compoundLayerStackByUpdatingPortraitDepthEnabled:(BOOL)a3 landscapeDepthEnabled:(BOOL)a4;
- (id)compoundLayerStackByUpdatingSettlingEffectEnabled:(BOOL)a3;
@end

@implementation PFWallpaperCompoundLayerStack

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeLayerStack, 0);

  objc_storeStrong((id *)&self->_portraitLayerStack, 0);
}

- (PFParallaxLayerStack)landscapeLayerStack
{
  return self->_landscapeLayerStack;
}

- (PFParallaxLayerStack)portraitLayerStack
{
  return self->_portraitLayerStack;
}

- (PFPosterLayout)layout
{
  v3 = [PFPosterLayout alloc];
  v4 = [(PFParallaxLayerStack *)self->_portraitLayerStack layout];
  v5 = [(PFParallaxLayerStack *)self->_landscapeLayerStack layout];
  v6 = [(PFPosterLayout *)v3 initWithPortraitLayout:v4 landscapeLayout:v5];

  return v6;
}

- (id)compoundLayerStackByUpdatingSettlingEffectEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PFWallpaperCompoundLayerStack *)self portraitLayerStack];
  v6 = [v5 layerStackByUpdatingSettlingEffectEnabled:v3];

  v7 = [(PFWallpaperCompoundLayerStack *)self landscapeLayerStack];
  v8 = [v7 layerStackByUpdatingSettlingEffectEnabled:v3];

  v9 = [[PFWallpaperCompoundLayerStack alloc] initWithPortraitLayerStack:v6 landscapeLayerStack:v8];

  return v9;
}

- (id)compoundLayerStackByUpdatingParallaxDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [PFWallpaperCompoundLayerStack alloc];
  v6 = [(PFWallpaperCompoundLayerStack *)self portraitLayerStack];
  v7 = [v6 layerStackByUpdatingParallaxDisabled:v3];
  v8 = [(PFWallpaperCompoundLayerStack *)self landscapeLayerStack];
  v9 = [v8 layerStackByUpdatingParallaxDisabled:v3];
  v10 = [(PFWallpaperCompoundLayerStack *)v5 initWithPortraitLayerStack:v7 landscapeLayerStack:v9];

  return v10;
}

- (id)compoundLayerStackByUpdatingPortraitDepthEnabled:(BOOL)a3 landscapeDepthEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [PFWallpaperCompoundLayerStack alloc];
  v8 = [(PFWallpaperCompoundLayerStack *)self portraitLayerStack];
  v9 = [v8 layerStackByUpdatingDepthEnabled:v5];
  v10 = [(PFWallpaperCompoundLayerStack *)self landscapeLayerStack];
  v11 = [v10 layerStackByUpdatingDepthEnabled:v4];
  v12 = [(PFWallpaperCompoundLayerStack *)v7 initWithPortraitLayerStack:v9 landscapeLayerStack:v11];

  return v12;
}

- (CGSize)size
{
  [(PFParallaxLayerStack *)self->_portraitLayerStack size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)backgroundBackfillLayer
{
  return [(PFParallaxLayerStack *)self->_portraitLayerStack layerWithIdentifier:@"background-backfill"];
}

- (PFWallpaperCompoundLayerStack)initWithPortraitLayerStack:(id)a3 landscapeLayerStack:(id)a4
{
  v6 = (PFParallaxLayerStack *)a3;
  v7 = (PFParallaxLayerStack *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PFWallpaperCompoundLayerStack;
  v8 = [(PFWallpaperCompoundLayerStack *)&v13 init];
  portraitLayerStack = v8->_portraitLayerStack;
  v8->_portraitLayerStack = v6;
  v10 = v6;

  landscapeLayerStack = v8->_landscapeLayerStack;
  v8->_landscapeLayerStack = v7;

  return v8;
}

@end