@interface _UIPhysicalButtonConfigurationHostSceneComponent
- (NSString)debugDescription;
- (NSString)description;
- (void)_evaluateProxyInteractionEligibilityForFinalAttempt:(uint64_t)a1;
- (void)_installProxyInteractionIfPossibleForHostingController:(uint64_t)a1;
- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5;
- (void)_physicalButtonProxyInteraction:(id)a3 didReceiveBSAction:(id)a4;
- (void)appendDescriptionToStream:(id)a3;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
- (void)sceneWillActivate:(id)a3;
- (void)setScene:(id)a3;
@end

@implementation _UIPhysicalButtonConfigurationHostSceneComponent

- (void)setScene:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonConfigurationHostSceneComponent;
  [(FBSSceneComponent *)&v4 setScene:a3];
  *(unsigned char *)&self->_flags |= 3u;
}

- (void)_installProxyInteractionIfPossibleForHostingController:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && v3 && (*(unsigned char *)(a1 + 24) & 2) != 0)
  {
    id v6 = v3;
    objc_super v4 = [v3 sceneView];
    v5 = v4;
    if (v4 && *(void *)(a1 + 40)) {
      objc_msgSend(v4, "addInteraction:");
    }

    id v3 = v6;
  }
}

- (void)_evaluateProxyInteractionEligibilityForFinalAttempt:(uint64_t)a1
{
  if (a1 && (*(unsigned char *)(a1 + 24) & 1) != 0)
  {
    objc_super v4 = [(id)a1 hostScene];
    id v8 = [v4 _uiHostingController];

    if (v8 || a2)
    {
      *(unsigned char *)(a1 + 24) &= ~1u;
      *(unsigned char *)(a1 + 24) = *(unsigned char *)(a1 + 24) & 0xFD | (2 * (v8 != 0));
    }
    -[_UIPhysicalButtonConfigurationHostSceneComponent _installProxyInteractionIfPossibleForHostingController:](a1, v8);
    if ((*(unsigned char *)(a1 + 24) & 2) == 0)
    {
      v5 = [*(id *)(a1 + 40) view];
      [v5 removeInteraction:*(void *)(a1 + 40)];

      id v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;

      v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
  }
}

- (void)sceneWillActivate:(id)a3
{
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v9 = [v7 settingsDiff];
    int v10 = [v9 containsProperty:sel_physicalButtonConfigurations];

    if (v10)
    {
      -[_UIPhysicalButtonConfigurationHostSceneComponent _evaluateProxyInteractionEligibilityForFinalAttempt:]((uint64_t)self, 0);
      v11 = [v8 settings];
      v12 = [v11 physicalButtonConfigurations];

      p_clientPhysicalButtonConfigurations = &self->_clientPhysicalButtonConfigurations;
      v14 = self->_clientPhysicalButtonConfigurations;
      v15 = v12;
      v16 = v15;
      if (v14 == v15)
      {
        int v17 = 1;
      }
      else
      {
        int v17 = 0;
        if (v15 && v14) {
          int v17 = [(_UIPhysicalButtonConfigurationSet *)v14 isEqual:v15];
        }
      }

      v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_MergedGlobals_3_0) + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = NSString;
        v20 = self;
        v21 = v18;
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        v24 = [v19 stringWithFormat:@"<%@: %p>", v23, v20];

        id v25 = v24;
        v26 = [(_UIPhysicalButtonConfigurationSet *)v16 succinctDescription];
        *(_DWORD *)buf = 138543874;
        v44 = v24;
        __int16 v45 = 1026;
        int v46 = v17 ^ 1;
        __int16 v47 = 2114;
        *(void *)v48 = v26;
        _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "Received resolved configurations update from client: self: %{public}@; didChange: %{public}d; configurations: %{public}@",
          buf,
          0x1Cu);

        p_clientPhysicalButtonConfigurations = &self->_clientPhysicalButtonConfigurations;
      }
      if ((v17 & 1) == 0)
      {
        v27 = *p_clientPhysicalButtonConfigurations;
        objc_storeStrong((id *)p_clientPhysicalButtonConfigurations, v12);
        unsigned int v28 = _UIPBIProxyOwnerActionsForState(self->_proxyPhysicalButtonInteraction, v27, *p_clientPhysicalButtonConfigurations);
        v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &qword_1EB25CB08) + 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v42 = p_clientPhysicalButtonConfigurations;
          v30 = NSString;
          v31 = self;
          log = v29;
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v34 = v33 = v27;
          v35 = [v30 stringWithFormat:@"<%@: %p>", v34, v31];

          v27 = v33;
          *(_DWORD *)buf = 138544386;
          v44 = v35;
          __int16 v45 = 1026;
          int v46 = v28 & 1;
          __int16 v47 = 1026;
          *(_DWORD *)v48 = HIBYTE(v28) & 1;
          *(_WORD *)&v48[4] = 1026;
          *(_DWORD *)&v48[6] = HIWORD(v28) & 1;
          __int16 v49 = 1026;
          int v50 = (v28 >> 8) & 1;
          _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_DEFAULT, "Actions for resolved configurations update from client: %{public}@; shouldCreate: %{public}d; shouldDisable:"
            " %{public}d; shouldEnable: %{public}d; shouldUpdate: %{public}d",
            buf,
            0x24u);

          p_clientPhysicalButtonConfigurations = v42;
        }
        if ((v28 & 0x1000000) != 0) {
          [(_UIPhysicalButtonInteraction *)self->_proxyPhysicalButtonInteraction _setEnabled:0];
        }
        if ((v28 & 0x101) != 0)
        {
          v36 = -[_UIPhysicalButtonConfigurationSet _nsSetRepresentation](*p_clientPhysicalButtonConfigurations);
          if (v28)
          {
            v37 = (_UIPhysicalButtonProxyInteraction *)-[_UIPhysicalButtonProxyInteraction initWithConfigurations:proxyDelegate:]([_UIPhysicalButtonProxyInteraction alloc], (uint64_t)v36, self);
            proxyPhysicalButtonInteraction = self->_proxyPhysicalButtonInteraction;
            self->_proxyPhysicalButtonInteraction = v37;

            v39 = [(FBSSceneComponent *)self hostScene];
            v40 = [v39 _uiHostingController];
            -[_UIPhysicalButtonConfigurationHostSceneComponent _installProxyInteractionIfPossibleForHostingController:]((uint64_t)self, v40);
          }
          else if ((v28 & 0x100) != 0)
          {
            [(_UIPhysicalButtonInteraction *)self->_proxyPhysicalButtonInteraction _setConfigurations:v36];
          }
        }
        if ((v28 & 0x10000) != 0) {
          [(_UIPhysicalButtonInteraction *)self->_proxyPhysicalButtonInteraction _setEnabled:1];
        }
      }
    }
  }
}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F28B00];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 currentHandler];
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPhysicalButtonConfigurationHostSceneComponent.m", 184, @"Unexpected request to handle a non-proxy action: self: %@; interaction: %@; action: %@",
    self,
    v10,
    v9);
}

- (void)_physicalButtonProxyInteraction:(id)a3 didReceiveBSAction:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_physicalButtonProxyInteraction_didReceiveBSAction____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v11 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v12 = NSString;
        v13 = self;
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        v16 = [v12 stringWithFormat:@"<%@: %p>", v15, v13];
      }
      else
      {
        v16 = @"(nil)";
      }
      int v17 = v16;
      v18 = [v6 succinctDescription];
      *(_DWORD *)buf = 138412802;
      v20 = v16;
      __int16 v21 = 2112;
      v22 = v18;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Received proxy physicalButtonBSAction from interaction: self: %@; proxyInteraction: %@; physicalButtonBSAction: %@",
        buf,
        0x20u);
    }
  }
  id v9 = [(FBSSceneComponent *)self hostScene];
  id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  [v9 sendActions:v10];
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78___UIPhysicalButtonConfigurationHostSceneComponent_appendDescriptionToStream___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v5 = v4;
  id v10 = v5;
  id v11 = self;
  [v5 appendProem:self block:v9];
  if ([v5 hasDebugStyle])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78___UIPhysicalButtonConfigurationHostSceneComponent_appendDescriptionToStream___block_invoke_2;
    v6[3] = &unk_1E52D9F98;
    id v7 = v5;
    id v8 = self;
    [v7 appendBodySectionWithName:0 block:v6];
  }
}

- (NSString)debugDescription
{
  id v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] debugStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyPhysicalButtonInteraction, 0);
  objc_storeStrong((id *)&self->_clientPhysicalButtonConfigurations, 0);
}

@end