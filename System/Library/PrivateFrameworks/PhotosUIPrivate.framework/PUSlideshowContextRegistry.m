@interface PUSlideshowContextRegistry
- (BOOL)addDisplayContext:(id)a3;
- (BOOL)removeDisplayContext:(id)a3;
- (NSArray)displayContexts;
- (NSMutableArray)_displayContexts;
- (PUSlideshowContextRegistry)init;
- (PUSlideshowDisplayContext)currentDisplayContext;
- (void)_setDisplayContexts:(id)a3;
@end

@implementation PUSlideshowContextRegistry

- (void).cxx_destruct
{
}

- (void)_setDisplayContexts:(id)a3
{
}

- (NSMutableArray)_displayContexts
{
  return self->__displayContexts;
}

- (NSArray)displayContexts
{
  v2 = [(PUSlideshowContextRegistry *)self _displayContexts];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (PUSlideshowDisplayContext)currentDisplayContext
{
  v2 = [(PUSlideshowContextRegistry *)self _displayContexts];
  v3 = [v2 lastObject];

  return (PUSlideshowDisplayContext *)v3;
}

- (BOOL)removeDisplayContext:(id)a3
{
  id v4 = a3;
  v5 = [(PUSlideshowContextRegistry *)self displayContexts];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = [(PUSlideshowContextRegistry *)self _displayContexts];
    [v7 removeObject:v4];
  }
  return v6;
}

- (BOOL)addDisplayContext:(id)a3
{
  id v4 = a3;
  v5 = [(PUSlideshowContextRegistry *)self _displayContexts];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    v7 = [(PUSlideshowContextRegistry *)self _displayContexts];
    [v7 addObject:v4];
  }
  return v6 ^ 1;
}

- (PUSlideshowContextRegistry)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowContextRegistry;
  v2 = [(PUSlideshowContextRegistry *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    [(PUSlideshowContextRegistry *)v2 _setDisplayContexts:v3];
  }
  return v2;
}

@end