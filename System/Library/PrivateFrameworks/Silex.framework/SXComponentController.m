@interface SXComponentController
- (BOOL)isPresented;
- (BOOL)isPresenting;
- (CGRect)renderBounds;
- (NSHashTable)observers;
- (NSMutableArray)nestedComponentViews;
- (NSMutableArray)sortedComponentViews;
- (NSMutableDictionary)mappedComponentViews;
- (SXComponentController)initWithViewport:(id)a3 DOMObjectProvider:(id)a4;
- (SXComponentHosting)host;
- (SXComponentViewEngine)componentViewEngine;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXLayoutBlueprint)presentedBlueprint;
- (SXPresentationAttributes)presentationAttributes;
- (SXViewport)viewport;
- (id)componentViewForIdentifier:(id)a3;
- (id)componentViewForPoint:(CGPoint)a3;
- (id)componentViewForPoint:(CGPoint)a3 inComponents:(id)a4;
- (id)componentViewsForRole:(int)a3;
- (id)componentViewsForRole:(int)a3 forLayoutBlueprint:(id)a4;
- (id)componentsInRect:(CGRect)a3;
- (id)presentComponentBlueprint:(id)a3 inHost:(id)a4 columnLayout:(id)a5;
- (void)addObserver:(id)a3;
- (void)assistiveTechnologyStatusDidChange;
- (void)fadeComponent:(id)a3 completion:(id)a4;
- (void)integrateBlueprint:(id)a3 withCompletion:(id)a4;
- (void)presentBlueprint:(id)a3 forParentComponentView:(id)a4 inHost:(id)a5;
- (void)presentComponentsInBlueprint:(id)a3;
- (void)provideInfosLayoutTo:(id)a3;
- (void)removeComponentsInLayoutBlueprint:(id)a3 removedFromLayoutBlueprint:(id)a4;
- (void)removeObserver:(id)a3;
- (void)renderContentsIfNeededForComponents:(id)a3;
- (void)setComponentViewEngine:(id)a3;
- (void)setHost:(id)a3;
- (void)setIsPresenting:(BOOL)a3;
- (void)setMappedComponentViews:(id)a3;
- (void)setNestedComponentViews:(id)a3;
- (void)setSortedComponentViews:(id)a3;
- (void)updatePresentationStateForNestedComponentView:(id)a3 presentationState:(int64_t)a4;
- (void)updatePresentationStateForNestedComponentViews:(id)a3 presentationState:(int64_t)a4;
- (void)updateVisibilityStatesForComponentViews:(id)a3;
- (void)updateVisibilityStatesForComponentViews:(id)a3 parentComponent:(id)a4 withOffset:(CGPoint)a5;
- (void)updateVisibilityStatesForComponentViews:(id)a3 toState:(int64_t)a4;
- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4;
- (void)viewport:(id)a3 boundsDidChangeFromBounds:(CGRect)a4;
- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4;
@end

@implementation SXComponentController

- (SXComponentController)initWithViewport:(id)a3 DOMObjectProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SXComponentController;
  v9 = [(SXComponentController *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewport, a3);
    objc_storeStrong((id *)&v10->_DOMObjectProvider, a4);
    uint64_t v11 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    mappedComponentViews = v10->_mappedComponentViews;
    v10->_mappedComponentViews = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF980] array];
    sortedComponentViews = v10->_sortedComponentViews;
    v10->_sortedComponentViews = (NSMutableArray *)v15;

    uint64_t v17 = [MEMORY[0x263EFF980] array];
    nestedComponentViews = v10->_nestedComponentViews;
    v10->_nestedComponentViews = (NSMutableArray *)v17;

    [(SXViewport *)v10->_viewport addViewportChangeListener:v10 forOptions:14];
  }

  return v10;
}

- (void)integrateBlueprint:(id)a3 withCompletion:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  [(SXComponentController *)self setIsPresenting:1];
  v9 = [(SXComponentController *)self nestedComponentViews];
  v10 = (void *)[v9 copy];

  [(SXComponentController *)self removeComponentsInLayoutBlueprint:self->_presentedBlueprint removedFromLayoutBlueprint:v7];
  uint64_t v11 = [(SXComponentController *)self host];
  [(SXComponentController *)self presentBlueprint:v7 forParentComponentView:0 inHost:v11];

  objc_storeStrong((id *)&self->_presentedBlueprint, a3);
  [(SXComponentController *)self presentComponentsInBlueprint:v7];
  self->_isPresented = 1;
  v12 = [(SXComponentController *)self viewport];
  uint64_t v13 = [v12 appearState];

  if (v13)
  {
    v14 = [(SXComponentController *)self componentViews];
    [(SXComponentController *)self updateVisibilityStatesForComponentViews:v14];
  }
  uint64_t v15 = [(SXComponentController *)self presentationAttributes];
  int v16 = [v15 fadeInComponents];

  uint64_t v17 = [(SXComponentController *)self nestedComponentViews];
  v18 = v17;
  if (v16)
  {
    v33 = v8;
    v19 = (void *)[v17 mutableCopy];

    [v19 removeObjectsInArray:v10];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v25 visibilityState] == 1)
          {
            v38[0] = MEMORY[0x263EF8330];
            v38[1] = 3221225472;
            v38[2] = __59__SXComponentController_integrateBlueprint_withCompletion___block_invoke;
            v38[3] = &unk_264651158;
            v38[4] = self;
            v38[5] = v25;
            [(SXComponentController *)self fadeComponent:v25 completion:v38];
          }
          else
          {
            [(SXComponentController *)self updatePresentationStateForNestedComponentView:v25 presentationState:2];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v22);
    }

    id v8 = v33;
  }
  else
  {
    [(SXComponentController *)self updatePresentationStateForNestedComponentViews:v17 presentationState:2];
  }
  v26 = [(SXComponentController *)self flattenedComponentViews];
  [(SXComponentController *)self renderContentsIfNeededForComponents:v26];

  [(SXComponentController *)self setIsPresenting:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v27 = [(SXComponentController *)self observers];
  v28 = (void *)[v27 copy];

  uint64_t v29 = [v28 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(v28);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * j) componentControllerDidPresent:self];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v30);
  }

  v8[2](v8);
}

uint64_t __59__SXComponentController_integrateBlueprint_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePresentationStateForNestedComponentViews:*(void *)(a1 + 40) presentationState:2];
}

- (void)presentBlueprint:(id)a3 forParentComponentView:(id)a4 inHost:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v22 = a4;
  id v9 = a5;
  v24 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [v8 componentIdentifiers];
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = [v8 componentBlueprintForComponentIdentifier:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        uint64_t v15 = [v8 layoutOptions];
        int v16 = [v15 columnLayout];
        uint64_t v17 = [(SXComponentController *)self presentComponentBlueprint:v14 inHost:v9 columnLayout:v16];

        if ([v14 hasValidLayout])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v17;
            v19 = [v14 layoutBlueprint];
            [(SXComponentController *)self presentBlueprint:v19 forParentComponentView:v18 inHost:v18];
          }
        }
        if (v17) {
          [v24 addObject:v17];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  if (v22)
  {
    id v20 = v24;
    [v22 setComponentViews:v24];
  }
  else
  {
    uint64_t v21 = self;
    id v20 = v24;
    [(SXComponentController *)v21 setNestedComponentViews:v24];
  }
}

- (void)fadeComponent:(id)a3 completion:(id)a4
{
  v5 = (void *)MEMORY[0x263F15760];
  id v6 = a4;
  id v7 = a3;
  id v11 = [v5 animationWithKeyPath:@"opacity"];
  [v11 setFromValue:&unk_26D593DD0];
  id v8 = NSNumber;
  [v7 alpha];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  [v11 setToValue:v9];

  [v11 setDuration:0.3];
  [MEMORY[0x263F158F8] setCompletionBlock:v6];

  uint64_t v10 = [v7 layer];

  [v10 addAnimation:v11 forKey:@"opacity"];
}

- (id)presentComponentBlueprint:(id)a3 inHost:(id)a4 columnLayout:(id)a5
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SXComponentController *)self mappedComponentViews];
  uint64_t v12 = [v8 component];
  uint64_t v13 = [v12 identifier];
  v14 = [v11 objectForKey:v13];

  if ([v8 hasValidLayout] && (objc_msgSend(v8, "isHidden") & 1) == 0)
  {
    if (!v14)
    {
      uint64_t v15 = [(SXComponentController *)self componentViewEngine];
      int v16 = [v8 component];
      v14 = [v15 componentViewForComponent:v16];

      if (v14)
      {
        [v14 setComponentHost:v9];
        uint64_t v17 = [v8 parentLayoutBlueprint];
        id v18 = [v17 componentIdentifiers];
        v19 = [v8 component];
        id v20 = [v19 identifier];
        objc_msgSend(v14, "setComponentIndex:", objc_msgSend(v18, "indexOfObject:", v20));

        uint64_t v21 = [(SXComponentController *)self mappedComponentViews];
        id v22 = [v8 component];
        uint64_t v23 = [v22 identifier];
        [v21 setObject:v14 forKey:v23];

        v24 = [(SXComponentController *)self sortedComponentViews];
        [v24 addObject:v14];
      }
      [v14 configure];
    }
    uint64_t v25 = [v14 component];
    if (!v25) {
      goto LABEL_9;
    }
    long long v26 = (void *)v25;
    long long v27 = [v14 component];
    long long v28 = [v8 component];
    char v29 = [v27 isEqual:v28];

    if ((v29 & 1) == 0)
    {
LABEL_9:
      uint64_t v30 = [v8 component];
      [v14 loadComponent:v30];
    }
    [v8 absoluteFrame];
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    long long v39 = [(SXComponentController *)self viewport];
    [v39 contentFrame];
    CGFloat MinY = CGRectGetMinY(v128);
    v129.origin.double x = v32;
    v129.origin.double y = v34;
    v129.size.double width = v36;
    v129.size.double height = v38;
    CGRect v130 = CGRectOffset(v129, 0.0, MinY);
    double x = v130.origin.x;
    double y = v130.origin.y;
    double width = v130.size.width;
    double height = v130.size.height;

    [v8 componentViewFrame];
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    v53 = [v8 parentLayoutBlueprint];
    v54 = [v8 rootLayoutBlueprint];

    if (v53 == v54)
    {
      [v8 componentViewFrame];
      CGFloat v56 = v55;
      CGFloat v58 = v57;
      CGFloat v60 = v59;
      CGFloat v62 = v61;
      v63 = [(SXComponentController *)self viewport];
      [v63 contentFrame];
      CGFloat v64 = CGRectGetMinY(v131);
      v132.origin.double x = v56;
      v132.origin.double y = v58;
      v132.size.double width = v60;
      v132.size.double height = v62;
      CGRect v133 = CGRectOffset(v132, 0.0, v64);
      double v118 = v133.origin.y;
      double v119 = v133.origin.x;
      double v116 = v133.size.height;
      double v117 = v133.size.width;
    }
    else
    {
      double v116 = v52;
      double v117 = v50;
      double v118 = v48;
      double v119 = v46;
    }
    id v120 = v9;
    [v14 absoluteFrame];
    BOOL v67 = y == v66 && x == v65;
    [v8 contentFrame];
    CGFloat v69 = v68;
    CGFloat v71 = v70;
    CGFloat v73 = v72;
    CGFloat v75 = v74;
    [v14 contentFrame];
    v135.origin.double x = v76;
    v135.origin.double y = v77;
    v135.size.double width = v78;
    v135.size.double height = v79;
    v134.origin.double x = v69;
    v134.origin.double y = v71;
    v134.size.double width = v73;
    v134.size.double height = v75;
    BOOL v80 = !CGRectEqualToRect(v134, v135);
    v81 = [v8 componentState];
    v82 = [v81 identifier];
    v83 = [v14 state];
    v84 = [v83 identifier];
    int v85 = [v82 isEqualToString:v84];

    v86 = [v8 componentState];
    [v14 setState:v86];

    objc_msgSend(v14, "setAbsoluteFrame:", x, y, width, height);
    [v8 layoutMargins];
    objc_msgSend(v14, "setComponentLayoutMargins:");
    [v8 contentViewFrame];
    double v88 = v87;
    double v90 = v89;
    double v92 = v91;
    double v94 = v93;
    v95 = [v14 contentView];
    objc_msgSend(v95, "setFrame:", v88, v90, v92, v94);

    [v8 contentFrame];
    objc_msgSend(v14, "setContentFrame:");
    [v8 backgroundViewFrame];
    objc_msgSend(v14, "setBackgroundViewFrame:");
    [v8 backgroundViewFrame];
    double v97 = v96;
    double v99 = v98;
    double v101 = v100;
    double v103 = v102;
    v104 = [v14 backgroundView];
    objc_msgSend(v104, "setFrame:", v97, v99, v101, v103);

    [v8 borderInsets];
    objc_msgSend(v14, "setBorderInsets:");
    if ([v14 requiresThoroughFrameCalculations]) {
      objc_msgSend(v14, "setFrameUsingCenterAndBounds:", v119, v118, v117, v116);
    }
    else {
      objc_msgSend(v14, "setFrame:", v119, v118, v117, v116);
    }
    [v14 setDocumentColumnLayout:v10];
    uint64_t v105 = 0x10000;
    if (v85) {
      uint64_t v105 = 0;
    }
    uint64_t v106 = 256;
    if (v67) {
      uint64_t v106 = 0;
    }
    [v14 setPresentationChanges:v106 | v80 | v105];
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    v107 = [v8 infoFromLayouting];
    uint64_t v108 = [v107 countByEnumeratingWithState:&v121 objects:v125 count:16];
    if (v108)
    {
      uint64_t v109 = v108;
      uint64_t v110 = *(void *)v122;
      do
      {
        for (uint64_t i = 0; i != v109; ++i)
        {
          if (*(void *)v122 != v110) {
            objc_enumerationMutation(v107);
          }
          uint64_t v112 = *(void *)(*((void *)&v121 + 1) + 8 * i);
          v113 = [v8 infoFromLayouting];
          v114 = [v113 objectForKeyedSubscript:v112];

          [v14 receivedInfo:v114 fromLayoutingPhaseWithIdentifier:v112];
        }
        uint64_t v109 = [v107 countByEnumeratingWithState:&v121 objects:v125 count:16];
      }
      while (v109);
    }

    id v9 = v120;
  }

  return v14;
}

- (void)presentComponentsInBlueprint:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v19 = a3;
  obuint64_t j = [v19 componentIdentifiers];
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        id v9 = [v19 componentBlueprintForComponentIdentifier:*(void *)(*((void *)&v20 + 1) + 8 * v8)];
        id v10 = [(SXComponentController *)self mappedComponentViews];
        id v11 = [v9 component];
        uint64_t v12 = [v11 identifier];
        uint64_t v13 = [v10 objectForKey:v12];

        [v13 setPresentationState:1];
        unint64_t v4 = v4 & 0xFFFFFFFFFF000000 | [v13 presentationChanges] & 0xFFFFFF;
        [v13 willPresentComponentWithChanges:v4];
        if (([v13 allowHierarchyRemoval] & 1) == 0)
        {
          v14 = [v13 superview];

          if (!v14)
          {
            uint64_t v15 = [v13 componentHost];
            [v15 addComponentView:v13];
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v16 = [v9 layoutBlueprint];
          [(SXComponentController *)self presentComponentsInBlueprint:v16];
        }
        unint64_t v3 = v3 & 0xFFFFFFFFFF000000 | [v13 presentationChanges] & 0xFFFFFF;
        [v13 presentComponentWithChanges:v3];
        [v13 setPresentationChanges:0];

        ++v8;
      }
      while (v7 != v8);
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
}

- (void)removeComponentsInLayoutBlueprint:(id)a3 removedFromLayoutBlueprint:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    id v9 = [v6 componentIdentifiers];
    [v8 addObjectsFromArray:v9];

    id v10 = [v7 componentIdentifiers];
    [v8 addObjectsFromArray:v10];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = v8;
    uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v13 = [v6 componentBlueprintForComponentIdentifier:v12];
          v14 = [v7 componentBlueprintForComponentIdentifier:v12];
          uint64_t v15 = v14;
          if (!v14 || [v14 isHidden])
          {
            [(SXComponentController *)self mappedComponentViews];
            id v16 = v7;
            v18 = id v17 = v6;
            id v19 = [v18 objectForKey:v12];

            [v19 discardContents];
            [v19 setPresentationState:0];
            [v19 setVisibilityState:2];
            long long v20 = [v19 componentHost];
            [v20 removeComponentView:v19];

            long long v21 = [(SXComponentController *)self mappedComponentViews];
            [v21 removeObjectForKey:v12];

            id v6 = v17;
            id v7 = v16;
            long long v22 = [(SXComponentController *)self sortedComponentViews];
            [v22 removeObject:v19];

            long long v23 = [(SXComponentController *)self nestedComponentViews];
            [v23 removeObject:v19];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v24 = [v13 layoutBlueprint];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v25 = [v15 layoutBlueprint];
            }
            else
            {
              uint64_t v25 = 0;
            }
            [(SXComponentController *)self removeComponentsInLayoutBlueprint:v24 removedFromLayoutBlueprint:v25];
          }
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v28);
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SXComponentController *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SXComponentController *)self observers];
  [v5 removeObject:v4];
}

- (id)componentsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(SXComponentController *)self presentedBlueprint];
  uint64_t v8 = objc_msgSend(v7, "componentsInRect:", x, y, width, height);

  return v8;
}

- (id)componentViewForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(SXComponentController *)self componentViews];
  id v7 = -[SXComponentController componentViewForPoint:inComponents:](self, "componentViewForPoint:inComponents:", v6, x, y);

  return v7;
}

- (id)componentViewForPoint:(CGPoint)a3 inComponents:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v13 visibilityState] == 1)
        {
          [v13 absoluteFrame];
          v27.double x = x;
          v27.double y = y;
          if (CGRectContainsPoint(v28, v27))
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            id v15 = v13;
            id v16 = v15;
            if (isKindOfClass)
            {
              id v17 = [v15 componentViews];
              uint64_t v18 = -[SXComponentController componentViewForPoint:inComponents:](self, "componentViewForPoint:inComponents:", v17, x, y);

              if (v18)
              {
                id v10 = v16;
                id v16 = (void *)v18;
              }
              else
              {
                id v10 = v16;
                id v16 = v10;
              }
            }

            id v10 = v16;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)componentViewsForRole:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(SXComponentController *)self presentedBlueprint];
  id v6 = [(SXComponentController *)self componentViewsForRole:v3 forLayoutBlueprint:v5];

  return v6;
}

- (id)componentViewsForRole:(int)a3 forLayoutBlueprint:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "array", *(void *)&a3, a4);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(SXComponentController *)self flattenedComponentViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v12 classification];
        int v14 = [(id)objc_opt_class() role];

        if (v14 == a3) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)componentViewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SXComponentController *)self mappedComponentViews];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)provideInfosLayoutTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(SXComponentController *)self flattenedComponentViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) provideInfosLayoutTo:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 appearState];
  if (a4 && !v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [(SXComponentController *)self flattenedComponentViews];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v13 visibilityState] != 1) {
            [v13 discardContents];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    int v14 = [(SXComponentController *)self flattenedComponentViews];
    [(SXComponentController *)self updateVisibilityStatesForComponentViews:v14 toState:2];
    goto LABEL_15;
  }
  if ([v6 appearState])
  {
    int v14 = [(SXComponentController *)self componentViews];
    [(SXComponentController *)self renderContentsIfNeededForComponents:v14];
LABEL_15:
  }
  if (!a4 && [v6 appearState])
  {
    uint64_t v15 = [(SXComponentController *)self componentViews];
    [(SXComponentController *)self updateVisibilityStatesForComponentViews:v15];
  }
}

- (void)viewport:(id)a3 boundsDidChangeFromBounds:(CGRect)a4
{
  id v5 = [(SXComponentController *)self flattenedComponentViews];
  [(SXComponentController *)self renderContentsIfNeededForComponents:v5];
}

- (CGRect)renderBounds
{
  uint64_t v3 = [(SXComponentController *)self viewport];
  if ([v3 appearState] == 2) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }

  id v5 = [(SXComponentController *)self viewport];
  [v5 bounds];
  double v7 = v6;

  uint64_t v8 = [(SXComponentController *)self viewport];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  double v13 = -(v12 * v4);
  double v14 = v7 - v10;
  double v15 = v10 + v12 * v4 * 2.0;
  double v16 = v12 + v10 * 2.0;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)renderContentsIfNeededForComponents:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SXComponentController *)self renderBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        objc_msgSend(v18, "absoluteFrame", (void)v32);
        v40.origin.double x = v19;
        v40.origin.double y = v20;
        v40.size.double width = v21;
        v40.size.double height = v22;
        v39.origin.double x = v6;
        v39.origin.double y = v8;
        v39.size.double width = v10;
        v39.size.double height = v12;
        BOOL v23 = CGRectIntersectsRect(v39, v40);
        if (!v23 && ([v18 allowHierarchyRemoval] & 1) != 0)
        {
LABEL_10:
          uint64_t v25 = [v18 superview];
          if (v25)
          {
            long long v26 = (void *)v25;
            int v27 = [v18 allowHierarchyRemoval];

            if (v27)
            {
              CGRect v28 = [v18 componentHost];
              [v28 removeComponentView:v18];
            }
          }
          continue;
        }
        v24 = [v18 superview];

        if (v24)
        {
          if (!v23) {
            goto LABEL_10;
          }
        }
        else
        {
          long long v29 = [v18 componentHost];
          [v29 addComponentView:v18];

          CGFloat v36 = v18;
          long long v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
          [(SXComponentController *)self updateVisibilityStatesForComponentViews:v30];

          if (!v23) {
            continue;
          }
        }
        long long v31 = [v18 superview];

        if (v31) {
          [v18 renderContentsIfNeeded];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v15);
  }
}

- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4
{
  double v5 = [(SXComponentController *)self viewport];
  uint64_t v6 = [v5 appearState];

  if (v6)
  {
    id v7 = [(SXComponentController *)self componentViews];
    [(SXComponentController *)self updateVisibilityStatesForComponentViews:v7];
  }
}

- (void)updateVisibilityStatesForComponentViews:(id)a3 toState:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setVisibilityState:a4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)updateVisibilityStatesForComponentViews:(id)a3
{
}

- (void)updateVisibilityStatesForComponentViews:(id)a3 parentComponent:(id)a4 withOffset:(CGPoint)a5
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([(SXComponentController *)self isPresented])
  {
    uint64_t v9 = [(SXComponentController *)self viewport];
    [v9 dynamicBounds];
    CGFloat v61 = v11;
    CGFloat v62 = v10;
    double v13 = v12;
    double v15 = v14;

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v64;
      BOOL v21 = a5.y != 1.79769313e308 && v8 != 0;
      BOOL v60 = v21;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v64 != v19) {
            objc_enumerationMutation(v16);
          }
          BOOL v23 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          v24 = [v23 superview];

          if (v24)
          {
            if (([v23 requiresThoroughFrameCalculations] & 1) != 0
              || (([v23 absoluteFrame], v26 < v13)
               || ([v23 absoluteFrame], v27 > v13 + v15))
              && (([v23 absoluteFrame],
                   double v29 = v28,
                   [v23 absoluteFrame],
                   double v25 = v29 + v30,
                   v29 + v30 <= v13)
               || (objc_msgSend(v23, "absoluteFrame", v25), v31 > v13)))
            {
              if (objc_msgSend(v23, "requiresThoroughFrameCalculations", v25))
              {
                [v23 frame];
                double v33 = v32;
                double v35 = v34;
                double v37 = v36;
                double v39 = v38;
                CGRect v40 = [v8 contentView];
                long long v41 = [v23 superview];

                if (v40 == v41)
                {
                  double v44 = a5.x + v33;
                  double v46 = a5.y + v35;
                }
                else
                {
                  if (v60)
                  {
                    long long v42 = [v23 superview];
                    objc_msgSend(v8, "convertRect:fromView:", v42, v33, v35, v37, v39);
                    double v44 = v43;
                    double v46 = v45;
                    double v37 = v47;
                    double v39 = v48;
                  }
                  else
                  {
                    long long v42 = [(SXComponentController *)self viewport];
                    double v50 = [v23 superview];
                    objc_msgSend(v42, "convertRect:fromView:", v50, v33, v35, v37, v39);
                    double v44 = v51;
                    double v46 = v52;
                    double v37 = v53;
                    double v39 = v54;
                  }
                }
                objc_msgSend(v23, "setPresentationFrame:", v44, v46, v37, v39);
                v69.origin.double x = v44;
                v69.origin.double y = v46;
                v69.size.double width = v37;
                v69.size.double height = v39;
                CGFloat MinY = CGRectGetMinY(v69);
                v70.origin.double x = v44;
                v70.origin.double y = v46;
                v70.size.double width = v37;
                v70.size.double height = v39;
                CGFloat Width = CGRectGetWidth(v70);
                v71.origin.double x = v44;
                v71.origin.double y = v46;
                v71.size.double width = v37;
                v71.size.double height = v39;
                v73.size.double height = CGRectGetHeight(v71);
                v73.origin.double x = 0.0;
                v72.size.double width = v61;
                v72.origin.double x = v62;
                v72.origin.double y = v13;
                v72.size.double height = v15;
                v73.origin.double y = MinY;
                v73.size.double width = Width;
                if (CGRectIntersectsRect(v72, v73)) {
                  uint64_t v49 = 1;
                }
                else {
                  uint64_t v49 = 2;
                }
              }
              else
              {
                uint64_t v49 = 2;
              }
            }
            else
            {
              uint64_t v49 = 1;
            }
            if (v49 != [v23 visibilityState]) {
              [v23 setVisibilityState:v49];
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v57 = v23;
              CGFloat v58 = [v57 componentViews];
              [v57 absoluteFrame];
              -[SXComponentController updateVisibilityStatesForComponentViews:parentComponent:withOffset:](self, "updateVisibilityStatesForComponentViews:parentComponent:withOffset:", v58, v57);
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v63 objects:v67 count:16];
      }
      while (v18);
    }
  }
}

- (void)assistiveTechnologyStatusDidChange
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(SXComponentController *)self flattenedComponentViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) assistiveTechnologyStatusDidChange];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id v8 = [(SXComponentController *)self flattenedComponentViews];
  [(SXComponentController *)self renderContentsIfNeededForComponents:v8];
}

- (void)updatePresentationStateForNestedComponentViews:(id)a3 presentationState:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SXComponentController *)self updatePresentationStateForNestedComponentView:*(void *)(*((void *)&v11 + 1) + 8 * v10++) presentationState:a4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)updatePresentationStateForNestedComponentView:(id)a3 presentationState:(int64_t)a4
{
  id v7 = a3;
  [v7 setPresentationState:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v7 componentViews];
    [(SXComponentController *)self updatePresentationStateForNestedComponentViews:v6 presentationState:a4];
  }
}

- (SXLayoutBlueprint)presentedBlueprint
{
  return self->_presentedBlueprint;
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (SXComponentViewEngine)componentViewEngine
{
  return self->_componentViewEngine;
}

- (void)setComponentViewEngine:(id)a3
{
}

- (SXComponentHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  return (SXComponentHosting *)WeakRetained;
}

- (void)setHost:(id)a3
{
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSMutableDictionary)mappedComponentViews
{
  return self->_mappedComponentViews;
}

- (void)setMappedComponentViews:(id)a3
{
}

- (NSMutableArray)sortedComponentViews
{
  return self->_sortedComponentViews;
}

- (void)setSortedComponentViews:(id)a3
{
}

- (NSMutableArray)nestedComponentViews
{
  return self->_nestedComponentViews;
}

- (void)setNestedComponentViews:(id)a3
{
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (SXPresentationAttributes)presentationAttributes
{
  return self->_presentationAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationAttributes, 0);
  objc_storeStrong((id *)&self->_nestedComponentViews, 0);
  objc_storeStrong((id *)&self->_sortedComponentViews, 0);
  objc_storeStrong((id *)&self->_mappedComponentViews, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_componentViewEngine, 0);
  objc_storeStrong((id *)&self->_flattenedComponentViews, 0);
  objc_storeStrong((id *)&self->_presentedBlueprint, 0);
}

@end