@interface PFAITocConfigDrawablePlacement
+ (void)cacheDrawable:(id)a3 readerState:(id)a4;
- (void)addFloatingDrawable:(id)a3 withState:(id)a4;
- (void)mapNonChildPlacementModeWithState:(id)a3;
- (void)mapNonChildResults:(id)a3 withState:(id)a4;
@end

@implementation PFAITocConfigDrawablePlacement

- (void)addFloatingDrawable:(id)a3 withState:(id)a4
{
  id v5 = [a4 thNodeBody];

  [v5 addFloatingInfo:a3];
}

- (void)mapNonChildPlacementModeWithState:(id)a3
{
  self->super.mMode = 1;
}

- (void)mapNonChildResults:(id)a3 withState:(id)a4
{
  if (self->super.mMode == 1)
  {
    id v6 = [a4 pageInfo];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = (char *)[a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(a3);
          }
          uint64_t v11 = TSUProtocolCast();
          if (v11)
          {
            uint64_t v12 = v11;
            [v6 addFloatingDrawable:v11 insertContext:0];
            +[PFAITocConfigDrawablePlacement cacheDrawable:v12 readerState:a4];
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = (char *)[a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

+ (void)cacheDrawable:(id)a3 readerState:(id)a4
{
  id v5 = [a4 pageDrawableList];

  [v5 addObject:a3];
}

@end