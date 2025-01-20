@interface VSImageElementHelper
- (VSImageElementHelper)init;
- (double)deviceScale;
- (id)bestMatchingKeyForScale:(double)a3 withSuffix:(id)a4 inKeysSet:(id)a5;
- (id)bestMatchingKeyForSrcset:(id)a3;
- (id)keysForScale:(double)a3 withSuffix:(id)a4;
- (id)matchingKeyForScale:(double)a3 withSuffix:(id)a4 inKeysSet:(id)a5;
- (int64_t)currentUserInterfaceStyle;
- (void)setCurrentUserInterfaceStyle:(int64_t)a3;
- (void)setDeviceScale:(double)a3;
@end

@implementation VSImageElementHelper

- (VSImageElementHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)VSImageElementHelper;
  v2 = [(VSImageElementHelper *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C920] mainScreen];
    [v3 scale];
    v2->_deviceScale = v4;

    v5 = [MEMORY[0x263F1CB00] currentTraitCollection];
    v2->_currentUserInterfaceStyle = [v5 userInterfaceStyle];
  }
  return v2;
}

- (id)bestMatchingKeyForSrcset:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v17 = v4;
  objc_super v7 = [v4 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = [v12 componentsSeparatedByString:@"-"];
        if ((unint64_t)[v13 count] <= 1) {
          v14 = v5;
        }
        else {
          v14 = v6;
        }
        [v14 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  if ([(VSImageElementHelper *)self currentUserInterfaceStyle] != 2
    || ([(VSImageElementHelper *)self deviceScale],
        -[VSImageElementHelper bestMatchingKeyForScale:withSuffix:inKeysSet:](self, "bestMatchingKeyForScale:withSuffix:inKeysSet:", @"-dark", v6), (v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    [(VSImageElementHelper *)self deviceScale];
    v15 = -[VSImageElementHelper bestMatchingKeyForScale:withSuffix:inKeysSet:](self, "bestMatchingKeyForScale:withSuffix:inKeysSet:", &stru_26F361E90, v5);
  }

  return v15;
}

- (id)bestMatchingKeyForScale:(double)a3 withSuffix:(id)a4 inKeysSet:(id)a5
{
  if (a3 <= 0.0)
  {
    v17 = 0;
  }
  else
  {
    uint64_t v19 = v12;
    uint64_t v20 = v11;
    uint64_t v21 = v8;
    uint64_t v22 = v7;
    uint64_t v23 = v6;
    uint64_t v24 = v5;
    uint64_t v25 = v9;
    double v15 = a3;
    do
    {
      v17 = -[VSImageElementHelper matchingKeyForScale:withSuffix:inKeysSet:](self, "matchingKeyForScale:withSuffix:inKeysSet:", a4, a5, v15, v19, v20, v21, v22, v23, v24, v25);
      if (v17) {
        break;
      }
      double v15 = v15 + -1.0;
    }
    while (v15 > 0.0);
  }
  return v17;
}

- (id)matchingKeyForScale:(double)a3 withSuffix:(id)a4 inKeysSet:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a5;
  [(VSImageElementHelper *)self keysForScale:a4 withSuffix:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = (id)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v13, (void)v15))
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)keysForScale:(double)a3 withSuffix:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x263EFF980];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  id v8 = [NSString stringWithFormat:@"%.0fx%@", *(void *)&a3, v6];

  [v7 addObject:v8];
  return v7;
}

- (double)deviceScale
{
  return self->_deviceScale;
}

- (void)setDeviceScale:(double)a3
{
  self->_deviceScale = a3;
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

@end