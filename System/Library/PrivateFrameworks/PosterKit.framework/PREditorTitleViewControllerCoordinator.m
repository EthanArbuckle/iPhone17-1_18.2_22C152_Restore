@interface PREditorTitleViewControllerCoordinator
+ (Class)titleViewControllerClassForRole:(id)a3;
- (CSCachingVibrancyTransitionProvider)cachingProvider;
- (NSMutableDictionary)titleViewControllersForLook;
- (NSString)role;
- (PREditingLook)transitionInProgressLook;
- (PREditorTitleViewControllerCoordinator)initWithRole:(id)a3;
- (id)beginInteractiveTransitionForStartingLook:(id)a3 toBaseFont:(id)a4 vibrancyConfiguration:(id)a5;
- (id)cachingVibrancyProviderForLook:(id)a3;
- (id)titleViewControllerForLook:(id)a3;
- (void)enumerateTimeViewControllersUsingBlock:(id)a3;
- (void)invalidateInteractiveTransition;
- (void)prepareInteractiveTransitionForStartingLook:(id)a3;
- (void)reloadData;
- (void)setCachingProvider:(id)a3;
- (void)setTitleViewControllersForLook:(id)a3;
- (void)setTransitionInProgressLook:(id)a3;
- (void)updateLookWithIdentifier:(id)a3 withLook:(id)a4;
@end

@implementation PREditorTitleViewControllerCoordinator

+ (Class)titleViewControllerClassForRole:(id)a3
{
  [a3 isEqual:@"PRPosterRoleIncomingCall"];
  v3 = objc_opt_class();
  return (Class)v3;
}

- (PREditorTitleViewControllerCoordinator)initWithRole:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PREditorTitleViewControllerCoordinator;
  v6 = [(PREditorTitleViewControllerCoordinator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_role, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    titleViewControllersForLook = v7->_titleViewControllersForLook;
    v7->_titleViewControllersForLook = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (id)titleViewControllerForLook:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_titleViewControllersForLook objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init((Class)[(id)objc_opt_class() titleViewControllerClassForRole:self->_role]);
    [(NSMutableDictionary *)self->_titleViewControllersForLook setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (void)enumerateTimeViewControllersUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_titleViewControllersForLook;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[PREditorTitleViewControllerCoordinator titleViewControllerForLook:](self, "titleViewControllerForLook:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        if (v10) {
          v4[2](v4, v10);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)updateLookWithIdentifier:(id)a3 withLook:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = self->_titleViewControllersForLook;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v8);
      }
      long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
      long long v14 = objc_msgSend(v13, "identifier", (void)v18);
      char v15 = [v14 isEqualToString:v6];

      if (v15) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v16 = v13;

    if (!v16) {
      goto LABEL_13;
    }
    v17 = [(NSMutableDictionary *)self->_titleViewControllersForLook objectForKeyedSubscript:v16];
    [(NSMutableDictionary *)self->_titleViewControllersForLook setObject:0 forKeyedSubscript:v16];
    [(NSMutableDictionary *)self->_titleViewControllersForLook setObject:v17 forKeyedSubscript:v7];

    uint64_t v8 = v16;
  }
LABEL_12:

LABEL_13:
}

- (void)prepareInteractiveTransitionForStartingLook:(id)a3
{
  id v8 = a3;
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_titleViewControllersForLook, "objectForKeyedSubscript:");
  if (v5)
  {
    objc_storeStrong((id *)&self->_transitionInProgressLook, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (CSCachingVibrancyTransitionProvider *)objc_alloc_init(MEMORY[0x1E4F5E4A0]);
      cachingProvider = self->_cachingProvider;
      self->_cachingProvider = v6;
    }
  }
}

- (id)beginInteractiveTransitionForStartingLook:(id)a3 toBaseFont:(id)a4 vibrancyConfiguration:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NSMutableDictionary *)self->_titleViewControllersForLook objectForKeyedSubscript:a3];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 beginInteractiveTransitionToBaseFont:v8 vibrancyConfiguration:v9 cachingVibrancyTransitionProvider:self->_cachingProvider];
      uint64_t v12 = [[PREditorTitleViewControllerCSTransitionWrapper alloc] initWithCSTransitioning:v11];
    }
    else
    {
      uint64_t v12 = [v10 beginInteractiveTransitionToVibrancyConfiguration:v9];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)invalidateInteractiveTransition
{
  cachingProvider = self->_cachingProvider;
  self->_cachingProvider = 0;

  transitionInProgressLook = self->_transitionInProgressLook;
  self->_transitionInProgressLook = 0;
}

- (id)cachingVibrancyProviderForLook:(id)a3
{
  if (self->_transitionInProgressLook == a3) {
    v3 = self->_cachingProvider;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (void)reloadData
{
}

- (NSString)role
{
  return self->_role;
}

- (NSMutableDictionary)titleViewControllersForLook
{
  return self->_titleViewControllersForLook;
}

- (void)setTitleViewControllersForLook:(id)a3
{
}

- (CSCachingVibrancyTransitionProvider)cachingProvider
{
  return self->_cachingProvider;
}

- (void)setCachingProvider:(id)a3
{
}

- (PREditingLook)transitionInProgressLook
{
  return self->_transitionInProgressLook;
}

- (void)setTransitionInProgressLook:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionInProgressLook, 0);
  objc_storeStrong((id *)&self->_cachingProvider, 0);
  objc_storeStrong((id *)&self->_titleViewControllersForLook, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end