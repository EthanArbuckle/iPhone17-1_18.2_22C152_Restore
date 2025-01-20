@interface PXImageLayerGainMapOrderInAction
- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5;
@end

@implementation PXImageLayerGainMapOrderInAction

- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [&unk_1F02D4DB0 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(&unk_1F02D4DB0);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        v12 = [MEMORY[0x1E4F39C08] animation];
        [v12 setDelegate:self];
        v13 = [v6 superlayer];
        [v12 setSourceLayer:v13];

        [v12 setKeyPath:v11];
        [v12 setDuration:INFINITY];
        v14 = [v11 stringByAppendingString:@"Animation"];
        [v6 addAnimation:v12 forKey:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [&unk_1F02D4DB0 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }
  v15 = [MEMORY[0x1E4F39C00] animation];
  [v15 setDelegate:self];
  v16 = [v6 superlayer];
  [v15 setSourceLayer:v16];

  [v15 setUsesNormalizedCoordinates:1];
  [v15 setAppliesScale:0];
  [v15 setAppliesRotation:0];
  [v15 setDuration:INFINITY];
  v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.5, 0.5);
  v23 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  [v15 setSourcePoints:v18];

  [v6 addAnimation:v15 forKey:@"positionAnimation"];
}

@end