@interface UINavigationController(SUAdditions)
- (id)firstViewController;
- (uint64_t)indexOfViewController:()SUAdditions;
- (void)invalidate;
@end

@implementation UINavigationController(SUAdditions)

- (id)firstViewController
{
  v1 = [a1 viewControllers];
  if ([v1 count])
  {
    v2 = [v1 objectAtIndex:0];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)indexOfViewController:()SUAdditions
{
  id v4 = a3;
  v5 = [a1 viewControllers];
  if (v4)
  {
    do
    {
      v6 = v4;
      uint64_t v7 = [v5 indexOfObjectIdenticalTo:v4];
      id v4 = [v4 parentViewController];
    }
    while (v7 == 0x7FFFFFFFFFFFFFFFLL && v4);
  }
  else
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v1 = [a1 viewControllers];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          [v6 invalidate];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

@end