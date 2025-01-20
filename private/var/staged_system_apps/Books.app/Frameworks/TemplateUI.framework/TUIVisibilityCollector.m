@interface TUIVisibilityCollector
- (BOOL)_computeVisible;
- (BOOL)q_updateVisible:(BOOL)a3;
- (CGSize)q_visibleBoundsSize;
- (NSObject)identifier;
- (TUIVisibilityCollector)initWithController:(id)a3 provider:(id)a4 identifier:(id)a5;
- (TUIVisibilityCollector)parent;
- (TUIVisibilityProviding)provider;
- (double)_now;
- (id)children;
- (id)q_computeChangeNodeForTracker:(id)a3 anyChange:(BOOL *)a4 rootVisibleSize:(CGSize)a5 needsUpdate:(BOOL)a6 needUpdateSet:(id)a7;
- (void)_addChild:(id)a3;
- (void)_removeChild:(id)a3;
- (void)becameHiddenAtTime:(double)a3;
- (void)becameVisibleAtTime:(double)a3;
- (void)q_updateVisibleBounds:(CGRect)a3;
- (void)setParent:(id)a3;
- (void)setProvider:(id)a3;
- (void)teardown;
- (void)teardownAtTime:(double)a3;
- (void)updateSections;
- (void)updateSectionsAtTime:(double)a3;
- (void)updateVisible;
- (void)updateVisibleAtTime:(double)a3;
- (void)updateVisibleBounds;
- (void)updateVisibleBoundsAtTime:(double)a3;
@end

@implementation TUIVisibilityCollector

- (TUIVisibilityCollector)initWithController:(id)a3 provider:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUIVisibilityCollector;
  v11 = [(TUIVisibilityCollector *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_controller, v8);
    objc_storeWeak((id *)&v12->_provider, v9);
    objc_storeStrong((id *)&v12->_identifier, a5);
    *((unsigned char *)v12 + 88) &= 0xF0u;
    CGSize size = CGRectNull.size;
    v12->_q_visibleBounds.origin = CGRectNull.origin;
    v12->_q_visibleBounds.CGSize size = size;
    uint64_t v14 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:512];
    q_trackerStateMap = v12->_q_trackerStateMap;
    v12->_q_trackerStateMap = (NSMapTable *)v14;
  }
  return v12;
}

- (id)children
{
  id v2 = [(NSMutableArray *)self->_currentChildren copy];

  return v2;
}

- (void)updateSections
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  double v3 = sub_1A768();

  [(TUIVisibilityCollector *)self updateSectionsAtTime:v3];
}

- (void)updateSectionsAtTime:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v6 = [WeakRetained visibilityProviderSections];
  id v7 = [v6 copy];

  id v8 = objc_loadWeakRetained((id *)&self->_controller);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1AE60;
  v10[3] = &unk_251828;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 queueUpdateForCollector:self time:v10 block:a3];
}

- (void)updateVisibleBounds
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  double v3 = sub_1A768();

  [(TUIVisibilityCollector *)self updateVisibleBoundsAtTime:v3];
}

- (void)updateVisibleBoundsAtTime:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  if ([WeakRetained visibilityProviderIsScrolling])
  {
    double v6 = a3 - self->_lastScrollUpdate;

    if (v6 <= 0.1) {
      return;
    }
  }
  else
  {
  }
  self->_lastScrollUpdate = a3;
  id v7 = objc_loadWeakRetained((id *)&self->_controller);
  [v7 queueVisibleBoundsUpdateForCollector:self time:a3];
}

- (void)teardown
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  double v3 = sub_1A768();

  [(TUIVisibilityCollector *)self teardownAtTime:v3];
}

- (void)teardownAtTime:(double)a3
{
  p_controller = &self->_controller;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1B088;
  v9[3] = &unk_251990;
  v9[4] = self;
  [WeakRetained queueUpdateForCollector:self time:v9 block:a3];

  id v7 = [(TUIVisibilityCollector *)self parent];
  [v7 _removeChild:self];

  id v8 = objc_loadWeakRetained((id *)p_controller);
  [v8 removeCollector:self];
}

- (BOOL)_computeVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  unsigned __int8 v4 = [WeakRetained visibilityProviderIsVisible];

  p_parent = &self->_parent;
  id v6 = objc_loadWeakRetained((id *)&self->_parent);
  if (v6)
  {
    id v7 = v6;
    id v8 = objc_loadWeakRetained((id *)p_parent);
    unsigned __int8 v9 = [v8 _computeVisible];

    v4 &= v9;
  }
  return v4;
}

- (void)becameVisibleAtTime:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained queueUpdateVisible:1 forCollector:self time:a3];
}

- (void)becameHiddenAtTime:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained queueUpdateVisible:0 forCollector:self time:a3];
}

- (void)updateVisible
{
  double v3 = sub_1A768();

  [(TUIVisibilityCollector *)self updateVisibleAtTime:v3];
}

- (void)updateVisibleAtTime:(double)a3
{
  if ([(TUIVisibilityCollector *)self _computeVisible])
  {
    [(TUIVisibilityCollector *)self becameVisibleAtTime:a3];
  }
  else
  {
    [(TUIVisibilityCollector *)self becameHiddenAtTime:a3];
  }
}

- (void)_addChild:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    currentChildren = self->_currentChildren;
    if (!currentChildren)
    {
      id v6 = (NSMutableArray *)objc_opt_new();
      id v7 = self->_currentChildren;
      self->_currentChildren = v6;

      currentChildren = self->_currentChildren;
    }
    [(NSMutableArray *)currentChildren addObject:v4];
    [v4 setParent:self];
    id v8 = [(NSMutableArray *)self->_currentChildren copy];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1B394;
    v11[3] = &unk_251828;
    v11[4] = self;
    id v12 = v8;
    id v10 = v8;
    [WeakRetained queueUpdateWithBlock:v11];
  }
}

- (void)_removeChild:(id)a3
{
  if (a3)
  {
    currentChildren = self->_currentChildren;
    id v5 = a3;
    [(NSMutableArray *)currentChildren removeObjectIdenticalTo:v5];
    [v5 setParent:0];

    id v6 = [(NSMutableArray *)self->_currentChildren copy];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1B484;
    v9[3] = &unk_251828;
    v9[4] = self;
    id v10 = v6;
    id v8 = v6;
    [WeakRetained queueUpdateWithBlock:v9];
  }
}

- (double)_now
{
  id v2 = +[NSDate date];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (void)q_updateVisibleBounds:(CGRect)a3
{
  self->_q_visibleBounds = a3;
  *((unsigned char *)self + 88) |= 1u;
}

- (BOOL)q_updateVisible:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 88);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 88) = v3 & 0xFB | v4;
  }
  return ((v3 & 4) == 0) ^ a3 ^ 1;
}

- (CGSize)q_visibleBoundsSize
{
  double width = self->_q_visibleBounds.size.width;
  double height = self->_q_visibleBounds.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)q_computeChangeNodeForTracker:(id)a3 anyChange:(BOOL *)a4 rootVisibleSize:(CGSize)a5 needsUpdate:(BOOL)a6 needUpdateSet:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  id v13 = a3;
  id v86 = a7;
  if ((*((unsigned char *)self + 88) & 1) == 0)
  {
    uint64_t v14 = 0;
    goto LABEL_93;
  }
  if (a6) {
    unsigned int v85 = 1;
  }
  else {
    unsigned int v85 = [v86 containsObject:self];
  }
  v15 = [(NSMapTable *)self->_q_trackerStateMap objectForKey:v13];
  if (!v15)
  {
    v15 = objc_alloc_init(_TUIVisibilityState);
    [(NSMapTable *)self->_q_trackerStateMap setObject:v15 forKey:v13];
    unsigned int v85 = 1;
    if (!v15)
    {
      v18 = 0;
      objc_super v17 = 0;
LABEL_9:
      v20 = +[NSMutableSet set];
      uint64_t v21 = objc_opt_new();
      v22 = (void *)v21;
      if ((*((unsigned char *)self + 88) & 4) != 0 && (*((unsigned char *)self + 88) & 8) == 0 && width > 0.0 && height > 0.0)
      {
        v83 = v15;
        v23 = (void *)v21;
        v78 = v17;
        v80 = v18;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        v24 = self->_q_sections;
        id v25 = [(NSArray *)v24 countByEnumeratingWithState:&v102 objects:v108 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v103;
          do
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v103 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v102 + 1) + 8 * i);
              [v29 frame];
              CGFloat x = v109.origin.x;
              CGFloat y = v109.origin.y;
              CGFloat v32 = v109.size.width;
              CGFloat v33 = v109.size.height;
              if (!CGRectIsEmpty(v109))
              {
                v110.origin.CGFloat x = x;
                v110.origin.CGFloat y = y;
                v110.size.double width = v32;
                v110.size.double height = v33;
                if (CGRectIntersectsRect(self->_q_visibleBounds, v110))
                {
                  [v29 frame];
                  v95[0] = _NSConcreteStackBlock;
                  v95[1] = 3221225472;
                  v95[2] = sub_1BC70;
                  v95[3] = &unk_251C10;
                  uint64_t v98 = v34;
                  uint64_t v99 = v35;
                  v95[4] = self;
                  double v100 = width;
                  double v101 = height;
                  id v96 = v20;
                  id v97 = v23;
                  [v13 enumerateAttributesInSection:v29 block:v95];
                }
              }
            }
            id v26 = [(NSArray *)v24 countByEnumeratingWithState:&v102 objects:v108 count:16];
          }
          while (v26);
        }

        objc_super v17 = v78;
        v18 = v80;
        v22 = v23;
        v15 = v83;
      }
      if ([v20 count]) {
        v82 = (NSSet *)[v20 copy];
      }
      else {
        v82 = 0;
      }

      if ([v22 count]) {
        v36 = (NSDictionary *)[v22 copy];
      }
      else {
        v36 = 0;
      }

      uint64_t v19 = 1;
      v18 = v36;
      goto LABEL_31;
    }
  }
  unsigned int v16 = v85;
  objc_super v17 = v15->_visible;
  v18 = v15->_attributesMap;
  LOBYTE(v85) = 0;
  uint64_t v19 = 0;
  v82 = v17;
  if (v16) {
    goto LABEL_9;
  }
LABEL_31:
  v81 = v18;
  v84 = v15;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v37 = self->_q_children;
  id v38 = [(NSArray *)v37 countByEnumeratingWithState:&v91 objects:v107 count:16];
  if (v38)
  {
    id v39 = v38;
    v40 = 0;
    uint64_t v41 = *(void *)v92;
    do
    {
      for (j = 0; j != v39; j = (char *)j + 1)
      {
        if (*(void *)v92 != v41) {
          objc_enumerationMutation(v37);
        }
        v43 = *(void **)(*((void *)&v91 + 1) + 8 * (void)j);
        id v44 = [v43 q_computeChangeNodeForTracker:v13 anyChange:a4 rootVisibleSize:v19 needsUpdate:v86 needUpdateSet:width, height];
        uint64_t v45 = [v43 identifier];
        v46 = (void *)v45;
        if (v44) {
          BOOL v47 = v45 == 0;
        }
        else {
          BOOL v47 = 1;
        }
        if (!v47)
        {
          if (!v40) {
            v40 = objc_opt_new();
          }
          [v40 setObject:v44 forKeyedSubscript:v46];
        }
      }
      id v39 = [(NSArray *)v37 countByEnumeratingWithState:&v91 objects:v107 count:16];
    }
    while (v39);
  }
  else
  {
    v40 = 0;
  }

  if (v85)
  {
    visible = 0;
    v48 = v84;
  }
  else
  {
    v48 = v84;
    visible = v84->_visible;
  }
  v50 = v81;
  v51 = v82;
  if (v82 == visible)
  {
    unint64_t v55 = 0;
    v56 = 0;
  }
  else
  {
    if (v82)
    {
      id v52 = [(NSSet *)v82 mutableCopy];
      v53 = v52;
      if (v85) {
        v54 = 0;
      }
      else {
        v54 = v48->_visible;
      }
      [v52 minusSet:v54];
      if ([v53 count]) {
        unint64_t v55 = (unint64_t)[v53 copy];
      }
      else {
        unint64_t v55 = 0;
      }
      if ((v85 & 1) != 0 || !v48->_visible)
      {
        unint64_t v58 = 0;
      }
      else
      {
        unint64_t v59 = v55;
        if (v85) {
          v60 = 0;
        }
        else {
          v60 = v48->_visible;
        }
        id v61 = [(NSSet *)v60 mutableCopy];
        [v61 minusSet:v82];
        if ([v61 count]) {
          unint64_t v58 = (unint64_t)[v61 copy];
        }
        else {
          unint64_t v58 = 0;
        }

        unint64_t v55 = v59;
      }
    }
    else
    {
      if (v85) {
        v57 = 0;
      }
      else {
        v57 = v48->_visible;
      }
      unint64_t v58 = v57;
      unint64_t v55 = 0;
    }
    id v79 = (id)v58;
    if (v55 | v58) {
      *a4 = 1;
    }
    v56 = (void *)v58;
    if ([(id)v58 count])
    {
      if (v81) {
        id v63 = [(NSDictionary *)v81 mutableCopy];
      }
      else {
        id v63 = (id)objc_opt_new();
      }
      v64 = v63;
      unint64_t v77 = v55;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v65 = (id)v58;
      id v66 = [v65 countByEnumeratingWithState:&v87 objects:v106 count:16];
      if (v66)
      {
        id v67 = v66;
        uint64_t v68 = *(void *)v88;
        do
        {
          v69 = 0;
          do
          {
            if (*(void *)v88 != v68) {
              objc_enumerationMutation(v65);
            }
            uint64_t v70 = *(void *)(*((void *)&v87 + 1) + 8 * (void)v69);
            if (v85) {
              attributesMap = 0;
            }
            else {
              attributesMap = v84->_attributesMap;
            }
            v72 = attributesMap;
            v73 = [(NSDictionary *)v72 objectForKeyedSubscript:v70];
            [v64 setObject:v73 forKeyedSubscript:v70];

            v69 = (char *)v69 + 1;
          }
          while (v67 != v69);
          id v74 = [v65 countByEnumeratingWithState:&v87 objects:v106 count:16];
          id v67 = v74;
        }
        while (v74);
      }

      v50 = (NSDictionary *)[v64 copy];
      v51 = v82;
      v48 = v84;
      unint64_t v55 = v77;
      v56 = v79;
    }
    if ((v85 & 1) == 0)
    {
      objc_setProperty_nonatomic_copy(v48, v62, v51, 8);
      objc_setProperty_nonatomic_copy(v48, v75, v50, 16);
    }
  }
  uint64_t v14 = [[TUIVisibilityChangeNode alloc] initWithIdentifiers:v51 added:v55 removed:v56 identifierNodeMap:v40 attributesMap:v50];

LABEL_93:
  return v14;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (TUIVisibilityProviding)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (TUIVisibilityProviding *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (TUIVisibilityCollector)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (TUIVisibilityCollector *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_q_trackerStateMap, 0);
  objc_storeStrong((id *)&self->_q_sections, 0);
  objc_storeStrong((id *)&self->_q_children, 0);
  objc_storeStrong((id *)&self->_currentChildren, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end