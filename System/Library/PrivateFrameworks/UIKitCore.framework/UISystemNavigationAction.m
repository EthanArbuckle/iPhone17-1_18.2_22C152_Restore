@interface UISystemNavigationAction
- (BOOL)sendResponseForDestination:(unint64_t)a3;
- (NSArray)destinations;
- (UISystemNavigationAction)initWithDestinationContexts:(id)a3 forResponseOnQueue:(id)a4 withHandler:(id)a5;
- (UISystemNavigationAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (id)URLForDestination:(unint64_t)a3;
- (id)_destinationContextForResponseDestination:(unint64_t)a3;
- (id)bundleIdForDestination:(unint64_t)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)sceneIdentifierForDestination:(unint64_t)a3;
- (id)titleForDestination:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)UIActionType;
@end

@implementation UISystemNavigationAction

- (UISystemNavigationAction)initWithDestinationContexts:(id)a3 forResponseOnQueue:(id)a4 withHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v26 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = [v9 allKeys];
    char v12 = [v11 containsObject:&unk_1ED3F41A0];

    if ((v12 & 1) == 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"UISystemNavigationAction.m", 23, @"Invalid parameter not satisfying: %@", @"!destinationsToContexts || [[destinationsToContexts allKeys] containsObject:@(UISystemNavigationActionResponseDestinationPrimary)]" object file lineNumber description];
    }
  }
  v14 = self;
  id v15 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v9;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v22 = [v16 objectForKey:v21];
        if ([v21 integerValue] == 1) {
          uint64_t v23 = 2;
        }
        else {
          uint64_t v23 = 1;
        }
        [v15 setObject:v22 forSetting:v23];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  v27.receiver = v14;
  v27.super_class = (Class)UISystemNavigationAction;
  v24 = [(UISystemNavigationAction *)&v27 initWithInfo:v15 timeout:v26 forResponseOnQueue:v10 withHandler:0.0];

  return v24;
}

- (UISystemNavigationAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return -[UISystemNavigationAction initWithDestinationContexts:forResponseOnQueue:withHandler:](self, "initWithDestinationContexts:forResponseOnQueue:withHandler:", 0, a5, a6, a4);
}

- (NSArray)destinations
{
  destinations = self->_destinations;
  if (!destinations)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [(UISystemNavigationAction *)self info];
    v6 = [v5 allSettings];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__UISystemNavigationAction_destinations__block_invoke;
    v11[3] = &unk_1E52EF020;
    v7 = v4;
    char v12 = v7;
    [v6 enumerateRangesUsingBlock:v11];

    v8 = self->_destinations;
    self->_destinations = v7;
    id v9 = v7;

    destinations = self->_destinations;
  }
  return destinations;
}

void __40__UISystemNavigationAction_destinations__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 < a2 + a3)
  {
    uint64_t v3 = a3;
    unint64_t v5 = a2 - 2;
    do
    {
      v6 = *(void **)(a1 + 32);
      v7 = [NSNumber numberWithUnsignedInteger:v5 == 0];
      [v6 addObject:v7];

      ++v5;
      --v3;
    }
    while (v3);
  }
}

- (id)titleForDestination:(unint64_t)a3
{
  uint64_t v3 = [(UISystemNavigationAction *)self _destinationContextForResponseDestination:a3];
  v4 = [v3 title];

  return v4;
}

- (id)bundleIdForDestination:(unint64_t)a3
{
  uint64_t v3 = [(UISystemNavigationAction *)self _destinationContextForResponseDestination:a3];
  v4 = [v3 bundleId];

  return v4;
}

- (id)URLForDestination:(unint64_t)a3
{
  uint64_t v3 = [(UISystemNavigationAction *)self _destinationContextForResponseDestination:a3];
  v4 = [v3 URL];

  return v4;
}

- (id)sceneIdentifierForDestination:(unint64_t)a3
{
  uint64_t v3 = [(UISystemNavigationAction *)self _destinationContextForResponseDestination:a3];
  v4 = [v3 sceneIdentifier];

  return v4;
}

- (BOOL)sendResponseForDestination:(unint64_t)a3
{
  unint64_t v5 = -[UISystemNavigationAction _destinationContextForResponseDestination:](self, "_destinationContextForResponseDestination:");

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    v7 = v6;
    if (a3 == 1) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    [v6 setObject:MEMORY[0x1E4F1CC38] forSetting:v8];
    id v9 = [MEMORY[0x1E4F4F678] responseWithInfo:v7];
    [(UISystemNavigationAction *)self sendResponse:v9];
  }
  return v5 != 0;
}

- (id)_destinationContextForResponseDestination:(unint64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  v4 = [(UISystemNavigationAction *)self info];
  unint64_t v5 = [v4 objectForSetting:v3];

  return v5;
}

- (int64_t)UIActionType
{
  return 16;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  uint64_t v3 = @"secondaryDestinationContext";
  if (a3 != 2) {
    uint64_t v3 = 0;
  }
  if (a3 == 1) {
    return @"primaryDestinationContext";
  }
  else {
    return v3;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  unint64_t v5 = -[UISystemNavigationAction _destinationContextForResponseDestination:](self, "_destinationContextForResponseDestination:", a5, a4);
  id v6 = [v5 description];

  return v6;
}

- (void).cxx_destruct
{
}

@end