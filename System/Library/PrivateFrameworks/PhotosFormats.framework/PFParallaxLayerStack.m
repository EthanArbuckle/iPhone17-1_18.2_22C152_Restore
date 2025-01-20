@interface PFParallaxLayerStack
- (BOOL)depthEnabled;
- (BOOL)hasBackfillLayers;
- (BOOL)hasDebugLayers;
- (BOOL)hasInactiveLayers;
- (BOOL)hasMainLayers;
- (BOOL)mayContainBakedHeadroom;
- (BOOL)parallaxDisabled;
- (BOOL)settlingEffectEnabled;
- (CGSize)size;
- (NSArray)layers;
- (NSDictionary)layerMap;
- (PFParallaxImageLayer)backgroundBackfillLayer;
- (PFParallaxImageLayer)backgroundLayer;
- (PFParallaxImageLayer)foregroundBackfillLayer;
- (PFParallaxImageLayer)foregroundLayer;
- (PFParallaxImageLayer)inactiveBackgroundLayer;
- (PFParallaxImageLayer)inactiveForegroundLayer;
- (PFParallaxLayerStack)initWithLayers:(id)a3 layout:(id)a4 depthEnabled:(BOOL)a5 parallaxDisabled:(BOOL)a6 clockAreaLuminance:(double)a7 settlingEffectEnabled:(BOOL)a8;
- (PFParallaxVideoLayer)settlingEffectLayer;
- (PFPosterOrientedLayout)layout;
- (double)clockAreaLuminance;
- (id)_resizeLayers:(id)a3 oldImageSize:(CGSize)a4 newImageSize:(CGSize)a5;
- (id)description;
- (id)layerStackByRemovingLayersWithIdentifiers:(id)a3;
- (id)layerStackByRemovingLayersWithOptions:(unint64_t)a3;
- (id)layerStackByUpdatingClockAreaLuminance:(double)a3;
- (id)layerStackByUpdatingClockLayerOrder:(id)a3;
- (id)layerStackByUpdatingDepthEnabled:(BOOL)a3;
- (id)layerStackByUpdatingInactiveFrame:(CGRect)a3;
- (id)layerStackByUpdatingLayers:(id)a3 imageSize:(CGSize)a4;
- (id)layerStackByUpdatingLayout:(id)a3;
- (id)layerStackByUpdatingParallaxDisabled:(BOOL)a3;
- (id)layerStackByUpdatingSettlingEffectEnabled:(BOOL)a3;
- (id)layerStackByUpdatingVisibleFrame:(CGRect)a3;
- (id)layerWithIdentifier:(id)a3;
- (void)markMayContainBakedHeadroom;
- (void)setLayerMap:(id)a3;
@end

@implementation PFParallaxLayerStack

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerMap, 0);
  objc_storeStrong((id *)&self->_layout, 0);

  objc_storeStrong((id *)&self->_layers, 0);
}

- (void)setLayerMap:(id)a3
{
}

- (NSDictionary)layerMap
{
  return self->_layerMap;
}

- (BOOL)mayContainBakedHeadroom
{
  return self->_mayContainBakedHeadroom;
}

- (BOOL)parallaxDisabled
{
  return self->_parallaxDisabled;
}

- (BOOL)settlingEffectEnabled
{
  return self->_settlingEffectEnabled;
}

- (BOOL)depthEnabled
{
  return self->_depthEnabled;
}

- (double)clockAreaLuminance
{
  return self->_clockAreaLuminance;
}

- (PFPosterOrientedLayout)layout
{
  return self->_layout;
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)markMayContainBakedHeadroom
{
  self->_mayContainBakedHeadroom = 1;
}

- (BOOL)hasDebugLayers
{
  v2 = [(PFParallaxLayerStack *)self layers];
  char v3 = PFExists();

  return v3;
}

uint64_t __38__PFParallaxLayerStack_hasDebugLayers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 hasPrefix:@"debug"];

  return v3;
}

- (BOOL)hasBackfillLayers
{
  v2 = [(PFParallaxLayerStack *)self layers];
  char v3 = PFExists();

  return v3;
}

uint64_t __41__PFParallaxLayerStack_hasBackfillLayers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 hasSuffix:@"backfill"];

  return v3;
}

- (BOOL)hasInactiveLayers
{
  v2 = [(PFParallaxLayerStack *)self layers];
  char v3 = PFExists();

  return v3;
}

uint64_t __41__PFParallaxLayerStack_hasInactiveLayers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 hasPrefix:@"inactive"];

  return v3;
}

- (BOOL)hasMainLayers
{
  v2 = [(PFParallaxLayerStack *)self layers];
  char v3 = PFExists();

  return v3;
}

uint64_t __37__PFParallaxLayerStack_hasMainLayers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isForeground]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isBackground];
  }

  return v3;
}

- (id)layerWithIdentifier:(id)a3
{
  return [(NSDictionary *)self->_layerMap objectForKeyedSubscript:a3];
}

- (PFParallaxImageLayer)foregroundBackfillLayer
{
  return (PFParallaxImageLayer *)[(PFParallaxLayerStack *)self layerWithIdentifier:@"foreground-backfill"];
}

- (PFParallaxImageLayer)backgroundBackfillLayer
{
  return (PFParallaxImageLayer *)[(PFParallaxLayerStack *)self layerWithIdentifier:@"background-backfill"];
}

- (PFParallaxImageLayer)inactiveForegroundLayer
{
  return (PFParallaxImageLayer *)[(PFParallaxLayerStack *)self layerWithIdentifier:@"inactive-foreground"];
}

- (PFParallaxImageLayer)inactiveBackgroundLayer
{
  return (PFParallaxImageLayer *)[(PFParallaxLayerStack *)self layerWithIdentifier:@"inactive-background"];
}

- (PFParallaxVideoLayer)settlingEffectLayer
{
  return (PFParallaxVideoLayer *)[(PFParallaxLayerStack *)self layerWithIdentifier:@"settling-video"];
}

- (PFParallaxImageLayer)foregroundLayer
{
  return (PFParallaxImageLayer *)[(PFParallaxLayerStack *)self layerWithIdentifier:@"foreground"];
}

- (PFParallaxImageLayer)backgroundLayer
{
  return (PFParallaxImageLayer *)[(PFParallaxLayerStack *)self layerWithIdentifier:@"background"];
}

- (CGSize)size
{
  id v2 = [(PFParallaxLayerStack *)self layout];
  [v2 imageSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(PFParallaxLayerStack *)self size];
  uint64_t v6 = v5;
  [(PFParallaxLayerStack *)self size];
  uint64_t v8 = v7;
  BOOL v9 = [(PFParallaxLayerStack *)self depthEnabled];
  uint64_t v10 = [(PFParallaxLayerStack *)self parallaxDisabled] ^ 1;
  BOOL v11 = [(PFParallaxLayerStack *)self settlingEffectEnabled];
  v12 = [(PFParallaxLayerStack *)self layers];
  v13 = [(PFParallaxLayerStack *)self layout];
  v14 = [v3 stringWithFormat:@"<%@:%p %0.0fx%0.0f depth:%d parallax:%d settling:%d layers:%@ layout:%@>", v4, self, v6, v8, v9, v10, v11, v12, v13];

  return v14;
}

- (PFParallaxLayerStack)initWithLayers:(id)a3 layout:(id)a4 depthEnabled:(BOOL)a5 parallaxDisabled:(BOOL)a6 clockAreaLuminance:(double)a7 settlingEffectEnabled:(BOOL)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v13 = (PFPosterOrientedLayout *)a4;
  v35.receiver = self;
  v35.super_class = (Class)PFParallaxLayerStack;
  v14 = [(PFParallaxLayerStack *)&v35 init];
  uint64_t v15 = [v12 copy];
  layers = v14->_layers;
  v14->_layers = (NSArray *)v15;

  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v24 = [v23 identifier];
        [v17 setObject:v23 forKeyedSubscript:v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v20);
  }

  uint64_t v25 = [v17 copy];
  layerMap = v14->_layerMap;
  v14->_layerMap = (NSDictionary *)v25;

  layout = v14->_layout;
  v14->_layout = v13;

  v14->_depthEnabled = a5;
  v14->_parallaxDisabled = a6;
  v14->_clockAreaLuminance = a7;
  v14->_settlingEffectEnabled = a8;

  return v14;
}

- (id)layerStackByRemovingLayersWithIdentifiers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = (void *)[(NSDictionary *)self->_layerMap mutableCopy];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "removeObjectForKey:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    uint64_t v11 = [v5 count];
    if (v11 == [(NSDictionary *)self->_layerMap count])
    {
      id v12 = self;
    }
    else
    {
      v13 = [PFParallaxLayerStack alloc];
      v14 = [v5 allValues];
      uint64_t v15 = [(PFParallaxLayerStack *)self layout];
      BOOL v16 = [(PFParallaxLayerStack *)self depthEnabled];
      BOOL v17 = [(PFParallaxLayerStack *)self parallaxDisabled];
      [(PFParallaxLayerStack *)self clockAreaLuminance];
      id v12 = [(PFParallaxLayerStack *)v13 initWithLayers:v14 layout:v15 depthEnabled:v16 parallaxDisabled:v17 clockAreaLuminance:[(PFParallaxLayerStack *)self settlingEffectEnabled] settlingEffectEnabled:v18];
    }
  }
  else
  {
    id v12 = self;
  }

  return v12;
}

- (id)layerStackByRemovingLayersWithOptions:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    char v4 = a3;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = [(PFParallaxLayerStack *)self layers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v7) {
      goto LABEL_27;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v11 isForeground])
        {
          if ((v4 & 1) == 0) {
            goto LABEL_13;
          }
LABEL_12:
          v13 = [v11 identifier];
          [v5 addObject:v13];

          goto LABEL_13;
        }
        char v12 = [v11 isBackground];
        if (v4 & 1) != 0 && (v12) {
          goto LABEL_12;
        }
LABEL_13:
        int v14 = [v11 isBackfill];
        if ((v4 & 2) != 0 && v14)
        {
          uint64_t v15 = [v11 identifier];
          [v5 addObject:v15];
        }
        int v16 = [v11 isDebug];
        if ((v4 & 0x10) != 0 && v16)
        {
          BOOL v17 = [v11 identifier];
          [v5 addObject:v17];
        }
        int v18 = [v11 isInactive];
        if ((v4 & 4) != 0 && v18)
        {
          uint64_t v19 = [v11 identifier];
          [v5 addObject:v19];
        }
        int v20 = [v11 isSettlingEffect];
        if ((v4 & 0x40) != 0 && v20)
        {
          long long v21 = [v11 identifier];
          [v5 addObject:v21];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v8)
      {
LABEL_27:

        long long v22 = [(PFParallaxLayerStack *)self layerStackByRemovingLayersWithIdentifiers:v5];

        goto LABEL_29;
      }
    }
  }
  long long v22 = self;
LABEL_29:

  return v22;
}

- (id)layerStackByUpdatingLayers:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if ([v7 count])
  {
    uint64_t v8 = PFMap(v7, &__block_literal_global_93);
    uint64_t v9 = [(PFParallaxLayerStack *)self layerMap];
    uint64_t v10 = (void *)[v9 mutableCopy];

    [v10 removeObjectsForKeys:v8];
    uint64_t v11 = [v10 allValues];
    char v12 = [(PFParallaxLayerStack *)self layout];
    [v12 imageSize];
    if (v13 <= width)
    {
      double v16 = width;
      double v18 = height;
    }
    else
    {
      int v14 = [(PFParallaxLayerStack *)self layout];
      [v14 imageSize];
      double v16 = v15;
      double v18 = v17;
    }
    int v20 = [(PFParallaxLayerStack *)self layout];
    [v20 imageSize];
    long long v21 = -[PFParallaxLayerStack _resizeLayers:oldImageSize:newImageSize:](self, "_resizeLayers:oldImageSize:newImageSize:", v11);

    uint64_t v22 = -[PFParallaxLayerStack _resizeLayers:oldImageSize:newImageSize:](self, "_resizeLayers:oldImageSize:newImageSize:", v7, width, height, v16, v18);

    long long v23 = [(PFParallaxLayerStack *)self layout];
    long long v24 = objc_msgSend(v23, "layoutByUpdatingImageSize:", v16, v18);

    long long v25 = [v21 arrayByAddingObjectsFromArray:v22];
    long long v26 = [PFParallaxLayerStack alloc];
    BOOL v27 = [(PFParallaxLayerStack *)self depthEnabled];
    BOOL v28 = [(PFParallaxLayerStack *)self parallaxDisabled];
    [(PFParallaxLayerStack *)self clockAreaLuminance];
    uint64_t v19 = [(PFParallaxLayerStack *)v26 initWithLayers:v25 layout:v24 depthEnabled:v27 parallaxDisabled:v28 clockAreaLuminance:[(PFParallaxLayerStack *)self settlingEffectEnabled] settlingEffectEnabled:v29];

    id v7 = (id)v22;
  }
  else
  {
    uint64_t v19 = self;
  }

  return v19;
}

uint64_t __71__PFParallaxLayerStack_Updating__layerStackByUpdatingLayers_imageSize___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)_resizeLayers:(id)a3 oldImageSize:(CGSize)a4 newImageSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  id v9 = a3;
  uint64_t v10 = v9;
  if (v8 == width && v7 == height)
  {
    id v12 = v9;
  }
  else
  {
    long long v16 = *MEMORY[0x1E4F1DAD8];
    long long v19 = v16;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__PFParallaxLayerStack_Updating___resizeLayers_oldImageSize_newImageSize___block_invoke;
    v15[3] = &__block_descriptor_96_e42___PFParallaxLayer_16__0__PFParallaxLayer_8l;
    double v17 = v8;
    double v18 = v7;
    double v20 = width;
    double v21 = height;
    PFMap(v9, v15);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v13 = v12;

  return v13;
}

id __74__PFParallaxLayerStack_Updating___resizeLayers_oldImageSize_newImageSize___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  double v8 = a1[6];
  double v7 = a1[7];
  double v10 = v9 - a1[4];
  double v11 = 0.0;
  double v12 = 0.0;
  if (v8 != 0.0)
  {
    double v10 = v10 / v8;
    double v12 = v5 / v8;
  }
  double v13 = v4 - a1[5];
  if (v7 != 0.0)
  {
    double v13 = v13 / v7;
    double v11 = v6 / v7;
  }
  int v14 = objc_msgSend(v3, "layerByUpdatingFrame:", a1[8] + v10 * a1[10], a1[9] + v13 * a1[11], v12 * a1[10], v11 * a1[11]);

  return v14;
}

- (id)layerStackByUpdatingLayout:(id)a3
{
  id v4 = a3;
  double v5 = [(PFParallaxLayerStack *)self layers];
  double v6 = [(PFParallaxLayerStack *)self layout];
  [v6 imageSize];
  double v8 = v7;
  double v10 = v9;
  [v4 imageSize];
  double v12 = v11;
  double v14 = v13;

  if (v8 != v12 || v10 != v14)
  {
    [v4 imageSize];
    double v17 = v16;
    double v18 = [(PFParallaxLayerStack *)self layout];
    [v18 imageSize];
    double v20 = v19;

    if (v17 >= v20)
    {
      double v21 = [(PFParallaxLayerStack *)self layers];
      uint64_t v22 = [(PFParallaxLayerStack *)self layout];
      [v22 imageSize];
      double v24 = v23;
      double v26 = v25;
      [v4 imageSize];
      uint64_t v29 = -[PFParallaxLayerStack _resizeLayers:oldImageSize:newImageSize:](self, "_resizeLayers:oldImageSize:newImageSize:", v21, v24, v26, v27, v28);

      double v5 = (void *)v29;
    }
    else
    {
      double v21 = [(PFParallaxLayerStack *)self layout];
      [v21 imageSize];
      objc_msgSend(v4, "layoutByUpdatingImageSize:");
      uint64_t v22 = v4;
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = [PFParallaxLayerStack alloc];
  BOOL v31 = [(PFParallaxLayerStack *)self depthEnabled];
  BOOL v32 = [(PFParallaxLayerStack *)self parallaxDisabled];
  [(PFParallaxLayerStack *)self clockAreaLuminance];
  long long v34 = [(PFParallaxLayerStack *)v30 initWithLayers:v5 layout:v4 depthEnabled:v31 parallaxDisabled:v32 clockAreaLuminance:[(PFParallaxLayerStack *)self settlingEffectEnabled] settlingEffectEnabled:v33];

  return v34;
}

- (id)layerStackByUpdatingClockAreaLuminance:(double)a3
{
  double v5 = [PFParallaxLayerStack alloc];
  double v6 = [(PFParallaxLayerStack *)self layers];
  double v7 = [(PFParallaxLayerStack *)self layout];
  double v8 = [(PFParallaxLayerStack *)v5 initWithLayers:v6 layout:v7 depthEnabled:[(PFParallaxLayerStack *)self depthEnabled] parallaxDisabled:[(PFParallaxLayerStack *)self parallaxDisabled] clockAreaLuminance:[(PFParallaxLayerStack *)self settlingEffectEnabled] settlingEffectEnabled:a3];

  return v8;
}

- (id)layerStackByUpdatingParallaxDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PFParallaxLayerStack *)self parallaxDisabled] == a3)
  {
    double v10 = self;
  }
  else
  {
    double v5 = [PFParallaxLayerStack alloc];
    double v6 = [(PFParallaxLayerStack *)self layers];
    double v7 = [(PFParallaxLayerStack *)self layout];
    BOOL v8 = [(PFParallaxLayerStack *)self depthEnabled];
    [(PFParallaxLayerStack *)self clockAreaLuminance];
    double v10 = [(PFParallaxLayerStack *)v5 initWithLayers:v6 layout:v7 depthEnabled:v8 parallaxDisabled:v3 clockAreaLuminance:[(PFParallaxLayerStack *)self settlingEffectEnabled] settlingEffectEnabled:v9];
  }

  return v10;
}

- (id)layerStackByUpdatingSettlingEffectEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PFParallaxLayerStack *)self settlingEffectEnabled] == a3)
  {
    double v10 = self;
  }
  else
  {
    double v5 = [PFParallaxLayerStack alloc];
    double v6 = [(PFParallaxLayerStack *)self layers];
    double v7 = [(PFParallaxLayerStack *)self layout];
    BOOL v8 = [(PFParallaxLayerStack *)self depthEnabled];
    BOOL v9 = [(PFParallaxLayerStack *)self parallaxDisabled];
    [(PFParallaxLayerStack *)self clockAreaLuminance];
    double v10 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:](v5, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v6, v7, v8, v9, v3);
  }

  return v10;
}

- (id)layerStackByUpdatingDepthEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PFParallaxLayerStack *)self depthEnabled] == a3)
  {
    double v10 = self;
  }
  else
  {
    double v5 = [PFParallaxLayerStack alloc];
    double v6 = [(PFParallaxLayerStack *)self layers];
    double v7 = [(PFParallaxLayerStack *)self layout];
    BOOL v8 = [(PFParallaxLayerStack *)self parallaxDisabled];
    [(PFParallaxLayerStack *)self clockAreaLuminance];
    double v10 = [(PFParallaxLayerStack *)v5 initWithLayers:v6 layout:v7 depthEnabled:v3 parallaxDisabled:v8 clockAreaLuminance:[(PFParallaxLayerStack *)self settlingEffectEnabled] settlingEffectEnabled:v9];
  }

  return v10;
}

- (id)layerStackByUpdatingClockLayerOrder:(id)a3
{
  id v4 = [(PFPosterOrientedLayout *)self->_layout layoutByUpdatingClockLayerOrder:a3];
  double v5 = [PFParallaxLayerStack alloc];
  double v6 = [(PFParallaxLayerStack *)self layers];
  BOOL v7 = [(PFParallaxLayerStack *)self depthEnabled];
  BOOL v8 = [(PFParallaxLayerStack *)self parallaxDisabled];
  [(PFParallaxLayerStack *)self clockAreaLuminance];
  double v10 = [(PFParallaxLayerStack *)v5 initWithLayers:v6 layout:v4 depthEnabled:v7 parallaxDisabled:v8 clockAreaLuminance:[(PFParallaxLayerStack *)self settlingEffectEnabled] settlingEffectEnabled:v9];

  return v10;
}

- (id)layerStackByUpdatingInactiveFrame:(CGRect)a3
{
  id v4 = -[PFPosterOrientedLayout layoutByUpdatingInactiveFrame:](self->_layout, "layoutByUpdatingInactiveFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = [PFParallaxLayerStack alloc];
  double v6 = [(PFParallaxLayerStack *)self layers];
  BOOL v7 = [(PFParallaxLayerStack *)self depthEnabled];
  BOOL v8 = [(PFParallaxLayerStack *)self parallaxDisabled];
  [(PFParallaxLayerStack *)self clockAreaLuminance];
  double v10 = [(PFParallaxLayerStack *)v5 initWithLayers:v6 layout:v4 depthEnabled:v7 parallaxDisabled:v8 clockAreaLuminance:[(PFParallaxLayerStack *)self settlingEffectEnabled] settlingEffectEnabled:v9];

  return v10;
}

- (id)layerStackByUpdatingVisibleFrame:(CGRect)a3
{
  id v4 = -[PFPosterOrientedLayout layoutByUpdatingVisibleFrame:](self->_layout, "layoutByUpdatingVisibleFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = [PFParallaxLayerStack alloc];
  double v6 = [(PFParallaxLayerStack *)self layers];
  BOOL v7 = [(PFParallaxLayerStack *)self depthEnabled];
  BOOL v8 = [(PFParallaxLayerStack *)self parallaxDisabled];
  [(PFParallaxLayerStack *)self clockAreaLuminance];
  double v10 = [(PFParallaxLayerStack *)v5 initWithLayers:v6 layout:v4 depthEnabled:v7 parallaxDisabled:v8 clockAreaLuminance:[(PFParallaxLayerStack *)self settlingEffectEnabled] settlingEffectEnabled:v9];

  return v10;
}

@end