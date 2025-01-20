@interface PUAirPlayContentRegistry
- (BOOL)isContentProviderRegistered:(id)a3;
- (BOOL)isCurrentContentProvider:(id)a3;
- (NSPointerArray)_contentProviders;
- (PHAirPlayControllerContentProvider)currentContentProvider;
- (PUAirPlayContentRegistry)init;
- (UIViewController)_cachedCurrentContent;
- (id)contentForController:(id)a3;
- (unint64_t)_indexOfContentProvider:(id)a3;
- (unint64_t)lastContentProviderPtr;
- (void)_invalidateCurrentContent;
- (void)_setCachedCurrentContent:(id)a3;
- (void)_setContentProviders:(id)a3;
- (void)addContentProvider:(id)a3;
- (void)clearContent;
- (void)removeContentProvider:(id)a3;
- (void)setLastContentProviderPtr:(unint64_t)a3;
@end

@implementation PUAirPlayContentRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedCurrentContent, 0);
  objc_storeStrong((id *)&self->__contentProviders, 0);
}

- (void)setLastContentProviderPtr:(unint64_t)a3
{
  self->_lastContentProviderPtr = a3;
}

- (unint64_t)lastContentProviderPtr
{
  return self->_lastContentProviderPtr;
}

- (void)_setCachedCurrentContent:(id)a3
{
}

- (UIViewController)_cachedCurrentContent
{
  return self->__cachedCurrentContent;
}

- (void)_setContentProviders:(id)a3
{
}

- (NSPointerArray)_contentProviders
{
  return self->__contentProviders;
}

- (void)clearContent
{
}

- (id)contentForController:(id)a3
{
  id v4 = a3;
  v5 = [(PUAirPlayContentRegistry *)self _cachedCurrentContent];
  if (!v5)
  {
    v6 = [(PUAirPlayContentRegistry *)self currentContentProvider];
    v5 = [v6 contentViewControllerForAirPlayController:v4];
    [(PUAirPlayContentRegistry *)self _setCachedCurrentContent:v5];
  }
  return v5;
}

- (BOOL)isCurrentContentProvider:(id)a3
{
  return [(PUAirPlayContentRegistry *)self lastContentProviderPtr] == (void)a3;
}

- (PHAirPlayControllerContentProvider)currentContentProvider
{
  v3 = [(PUAirPlayContentRegistry *)self _contentProviders];
  uint64_t v4 = [v3 count];
  if (v4 - 1 < 0)
  {
LABEL_7:
    v8 = 0;
  }
  else
  {
    uint64_t v5 = v4;
    while (1)
    {
      uint64_t v6 = [v3 pointerAtIndex:--v5];
      if (v6) {
        break;
      }
      v7 = PXAssertGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_error_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "An AirPlay content provider deallocated without deregistering as a provider.", v10, 2u);
      }

      if (v5 <= 0) {
        goto LABEL_7;
      }
    }
    v8 = (void *)v6;
  }
  if ((void *)[(PUAirPlayContentRegistry *)self lastContentProviderPtr] != v8)
  {
    [(PUAirPlayContentRegistry *)self setLastContentProviderPtr:v8];
    [(PUAirPlayContentRegistry *)self _invalidateCurrentContent];
  }

  return (PHAirPlayControllerContentProvider *)v8;
}

- (void)_invalidateCurrentContent
{
}

- (unint64_t)_indexOfContentProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUAirPlayContentRegistry *)self _contentProviders];
  uint64_t v6 = [v5 allObjects];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PUAirPlayContentRegistry__indexOfContentProvider___block_invoke;
  v10[3] = &unk_1E5F22F48;
  id v11 = v4;
  id v7 = v4;
  unint64_t v8 = [v6 indexOfObjectWithOptions:2 passingTest:v10];

  return v8;
}

BOOL __52__PUAirPlayContentRegistry__indexOfContentProvider___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  BOOL result = *(void *)(a1 + 32) == a2;
  *a4 = result;
  return result;
}

- (void)removeContentProvider:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(PUAirPlayContentRegistry *)self _indexOfContentProvider:v7];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    if ([(PUAirPlayContentRegistry *)self isCurrentContentProvider:v7]) {
      [(PUAirPlayContentRegistry *)self _invalidateCurrentContent];
    }
    uint64_t v6 = [(PUAirPlayContentRegistry *)self _contentProviders];
    [v6 removePointerAtIndex:v5];
  }
  MEMORY[0x1F4181820]();
}

- (BOOL)isContentProviderRegistered:(id)a3
{
  return [(PUAirPlayContentRegistry *)self _indexOfContentProvider:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)addContentProvider:(id)a3
{
  id v5 = a3;
  if (-[PUAirPlayContentRegistry _indexOfContentProvider:](self, "_indexOfContentProvider:") == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = [(PUAirPlayContentRegistry *)self _contentProviders];
    [v4 addPointer:v5];

    [(PUAirPlayContentRegistry *)self _invalidateCurrentContent];
  }
}

- (PUAirPlayContentRegistry)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUAirPlayContentRegistry;
  v2 = [(PUAirPlayContentRegistry *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    [(PUAirPlayContentRegistry *)v2 _setContentProviders:v3];
  }
  return v2;
}

@end