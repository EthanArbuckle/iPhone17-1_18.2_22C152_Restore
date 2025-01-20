@interface _UIChildRemoteContentRegistry
- (BOOL)parentSettingsAvailable;
- (FBSSceneSettings)parentSettings;
- (NSSet)childScenes;
- (NSSet)childViewServices;
- (NSString)debugDescription;
- (_UIChildRemoteContentRegistry)initWithParentScene:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)addChildScene:(id)a3;
- (void)addChildViewService:(id)a3;
- (void)executeWhenParentSettingsAreAvailable:(id)a3 forChildScene:(id)a4;
- (void)removeChildScene:(id)a3;
- (void)removeChildViewService:(id)a3;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation _UIChildRemoteContentRegistry

- (void)addChildScene:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  childScenes = self->_childScenes;
  if (!childScenes)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_childScenes;
    self->_childScenes = v6;

    childScenes = self->_childScenes;
  }
  [(NSHashTable *)childScenes addObject:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  [v4 setParentScene:WeakRetained];

  v9 = *(id *)(__UILogGetCategoryCachedImpl("_UIChildRemoteContentRegistry", addChildScene____s_category)+ 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(_UIChildRemoteContentRegistry *)self succinctDescription];
    id v11 = v4;
    if (v11)
    {
      v12 = NSString;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [v12 stringWithFormat:@"<%@: %p>", v14, v11];
    }
    else
    {
      v15 = @"(nil)";
    }

    *(_DWORD *)buf = 138412546;
    v19 = v10;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "%@ Registry is now tracking child scene %@", buf, 0x16u);
  }
  if (![(_UIChildRemoteContentRegistry *)self parentSettingsAvailable])
  {
    id v16 = objc_loadWeakRetained((id *)&self->_parentScene);
    [v16 removeObserver:self];

    id v17 = objc_loadWeakRetained((id *)&self->_parentScene);
    [v17 addObserver:self];
  }
}

- (BOOL)parentSettingsAvailable
{
  v2 = [(_UIChildRemoteContentRegistry *)self parentSettings];
  v3 = [v2 displayConfiguration];
  BOOL v4 = v3 != 0;

  return v4;
}

- (FBSSceneSettings)parentSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  v3 = [WeakRetained settings];

  return (FBSSceneSettings *)v3;
}

- (void)removeChildScene:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 parentScene];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  int v7 = [v5 isEqual:WeakRetained];

  if (v7) {
    [v4 setParentScene:0];
  }
  [(NSHashTable *)self->_childScenes removeObject:v4];
  v8 = *(id *)(__UILogGetCategoryCachedImpl("_UIChildRemoteContentRegistry", &removeChildScene____s_category)+ 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(_UIChildRemoteContentRegistry *)self succinctDescription];
    id v10 = v4;
    if (v10)
    {
      id v11 = NSString;
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = [v11 stringWithFormat:@"<%@: %p>", v13, v10];
    }
    else
    {
      v14 = @"(nil)";
    }

    *(_DWORD *)buf = 138412546;
    v19 = v9;
    __int16 v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%@ Registry is no longer tracking child scene %@", buf, 0x16u);
  }
  enqueuedSettingsAvailabilityBlocks = self->_enqueuedSettingsAvailabilityBlocks;
  id v16 = [v4 identityToken];
  id v17 = [v16 stringRepresentation];
  [(NSMutableDictionary *)enqueuedSettingsAvailabilityBlocks removeObjectForKey:v17];
}

- (id)succinctDescription
{
  v2 = [(_UIChildRemoteContentRegistry *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = objc_loadWeakRetained((id *)&self->_parentScene);
  if (v4)
  {
    v5 = NSString;
    v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    v8 = [v5 stringWithFormat:@"<%@: %p>", v7, v4];
  }
  else
  {
    v8 = @"(nil)";
  }

  id v9 = (id)[v3 appendObject:v8 withName:@"parentScene"];
  id v10 = (id)objc_msgSend(v3, "appendInt:withName:", -[NSHashTable count](self->_childScenes, "count"), @"childScenes");
  id v11 = (id)objc_msgSend(v3, "appendInt:withName:", -[NSHashTable count](self->_childViewServices, "count"), @"childViewServices");
  return v3;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(NSHashTable *)self->_childViewServices allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        v12 = [v5 settingsDiff];
        [v11 _parentSceneDidUpdateWithDiff:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  enqueuedSettingsAvailabilityBlocks = self->_enqueuedSettingsAvailabilityBlocks;
  if (enqueuedSettingsAvailabilityBlocks)
  {
    v14 = [(NSMutableDictionary *)enqueuedSettingsAvailabilityBlocks allValues];
    [v14 enumerateObjectsUsingBlock:&__block_literal_global_646];

    v15 = self->_enqueuedSettingsAvailabilityBlocks;
    self->_enqueuedSettingsAvailabilityBlocks = 0;
  }
}

- (_UIChildRemoteContentRegistry)initWithParentScene:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIChildRemoteContentRegistry.m", 29, @"Invalid parameter not satisfying: %@", @"parentScene" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIChildRemoteContentRegistry;
  v6 = [(_UIChildRemoteContentRegistry *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = objc_storeWeak((id *)&v6->_parentScene, v5);
    [v5 addObserver:v7];
  }
  return v7;
}

- (NSSet)childScenes
{
  return [(NSHashTable *)self->_childScenes setRepresentation];
}

- (void)addChildViewService:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  childViewServices = self->_childViewServices;
  if (!childViewServices)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_childViewServices;
    self->_childViewServices = v6;

    childViewServices = self->_childViewServices;
  }
  [(NSHashTable *)childViewServices addObject:v4];
  id v8 = *(id *)(__UILogGetCategoryCachedImpl("_UIChildRemoteContentRegistry", &addChildViewService____s_category)+ 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(_UIChildRemoteContentRegistry *)self succinctDescription];
    id v10 = v4;
    if (v10)
    {
      objc_super v11 = NSString;
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = [v11 stringWithFormat:@"<%@: %p>", v13, v10];
    }
    else
    {
      v14 = @"(nil)";
    }

    *(_DWORD *)buf = 138412546;
    long long v18 = v9;
    __int16 v19 = 2112;
    __int16 v20 = v14;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%@ Registry is now tracking child view service %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  long long v16 = [WeakRetained settings];
  [v4 _movedToParentSceneWithSettings:v16];
}

- (void)removeChildViewService:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSHashTable *)self->_childViewServices removeObject:v4];
  id v5 = *(id *)(__UILogGetCategoryCachedImpl("_UIChildRemoteContentRegistry", removeChildViewService____s_category)+ 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(_UIChildRemoteContentRegistry *)self succinctDescription];
    id v7 = v4;
    if (v7)
    {
      id v8 = NSString;
      uint64_t v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      objc_super v11 = [v8 stringWithFormat:@"<%@: %p>", v10, v7];
    }
    else
    {
      objc_super v11 = @"(nil)";
    }

    *(_DWORD *)buf = 138412546;
    v13 = v6;
    __int16 v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%@ Registry is no longer tracking child view service %@", buf, 0x16u);
  }
}

- (NSSet)childViewServices
{
  return [(NSHashTable *)self->_childViewServices setRepresentation];
}

- (void)executeWhenParentSettingsAreAvailable:(id)a3 forChildScene:(id)a4
{
  id aBlock = a3;
  id v7 = a4;
  if ([(_UIChildRemoteContentRegistry *)self parentSettingsAvailable])
  {
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_UIChildRemoteContentRegistry.m" lineNumber:115 description:@"Unable to enqueue a parent scene setting availability block when parent scene settings are currently available"];
  }
  if (![(NSHashTable *)self->_childScenes containsObject:v7])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UIChildRemoteContentRegistry.m" lineNumber:116 description:@"Unable to enqueue a parent scene availability block for a child that is not being tracked by this registry"];
  }
  enqueuedSettingsAvailabilityBlocks = self->_enqueuedSettingsAvailabilityBlocks;
  if (!enqueuedSettingsAvailabilityBlocks)
  {
    uint64_t v9 = (NSMutableDictionary *)objc_opt_new();
    id v10 = self->_enqueuedSettingsAvailabilityBlocks;
    self->_enqueuedSettingsAvailabilityBlocks = v9;

    enqueuedSettingsAvailabilityBlocks = self->_enqueuedSettingsAvailabilityBlocks;
  }
  objc_super v11 = _Block_copy(aBlock);
  v12 = [v7 identityToken];
  v13 = [v12 stringRepresentation];
  [(NSMutableDictionary *)enqueuedSettingsAvailabilityBlocks setValue:v11 forKey:v13];
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIChildRemoteContentRegistry *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIChildRemoteContentRegistry *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIChildRemoteContentRegistry *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  id v7 = objc_loadWeakRetained((id *)&self->_parentScene);
  if (v7)
  {
    id v8 = NSString;
    uint64_t v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    objc_super v11 = [v8 stringWithFormat:@"<%@: %p>", v10, v7];
  }
  else
  {
    objc_super v11 = @"(nil)";
  }

  id v12 = (id)[v6 appendObject:v11 withName:@"parentScene"];
  if ([(NSHashTable *)self->_childScenes count] || [(NSHashTable *)self->_childViewServices count])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71___UIChildRemoteContentRegistry_descriptionBuilderWithMultilinePrefix___block_invoke;
    v16[3] = &unk_1E52D9F98;
    id v17 = v6;
    long long v18 = self;
    id v13 = (id)[v17 modifyBody:v16];
  }
  else
  {
    id v15 = (id)[v6 appendObject:@"none" withName:@"children"];
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enqueuedSettingsAvailabilityBlocks, 0);
  objc_storeStrong((id *)&self->_childViewServices, 0);
  objc_storeStrong((id *)&self->_childScenes, 0);
  objc_destroyWeak((id *)&self->_parentScene);
}

@end