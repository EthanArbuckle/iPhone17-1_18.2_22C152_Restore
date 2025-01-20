@interface SXLayoutBlueprint
- (BOOL)isComplete;
- (BOOL)isUpdating;
- (CGSize)blueprintSize;
- (NSMutableArray)orderedComponentIdentifiers;
- (NSMutableDictionary)blueprint;
- (NSMutableDictionary)flattenedBlueprint;
- (NSMutableSet)invalidatedComponents;
- (NSOrderedSet)snapLines;
- (SXComponentBlueprintFactory)componentBlueprintFactory;
- (SXComponentDependencyResolver)dependencySolver;
- (SXLayoutBlueprint)initWithLayoutOptions:(id)a3 componentBlueprintFactory:(id)a4 unitConverterFactory:(id)a5;
- (SXLayoutBlueprint)parentLayoutBlueprint;
- (SXLayoutBlueprint)rootLayoutBlueprint;
- (SXLayoutOptions)layoutOptions;
- (SXUnitConverterFactory)unitConverterFactory;
- (id)componentBlueprintForComponentIdentifier:(id)a3;
- (id)componentBlueprintForComponentIdentifier:(id)a3 includeChildren:(BOOL)a4;
- (id)componentIdentifiers;
- (id)componentsInRect:(CGRect)a3;
- (id)containerComponentIdentifierContainingComponentWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)layoutDescriptionForBlueprint:(id)a3 depth:(unint64_t)a4;
- (id)snapLinesIncludingChildren:(BOOL)a3;
- (void)endUpdates;
- (void)invalidateBlueprint;
- (void)invalidateBlueprintPosition;
- (void)invalidateDependentsOfComponentNode:(id)a3 forDependencyResolver:(id)a4;
- (void)invalidateDependentsOfInvalidatedComponents;
- (void)invalidatePositionForComponentWithIdentifier:(id)a3;
- (void)invalidateSizeForComponentWithIdentifier:(id)a3;
- (void)invalidateSizeForComponentWithIdentifier:(id)a3 suggestedSize:(CGSize)a4;
- (void)invalidateState:(id)a3 forComponentWithIdentifier:(id)a4;
- (void)registerLayout:(id)a3 sizer:(id)a4 forComponent:(id)a5;
- (void)registerLayout:(id)a3 sizer:(id)a4 forComponent:(id)a5 atIndex:(unint64_t)a6;
- (void)setBlueprint:(id)a3;
- (void)setBlueprintSize:(CGSize)a3;
- (void)setDependencySolver:(id)a3;
- (void)setFlattenedBlueprint:(id)a3;
- (void)setInvalidatedComponents:(id)a3;
- (void)setOrderedComponentIdentifiers:(id)a3;
- (void)setParentLayoutBlueprint:(id)a3;
- (void)setSnapLines:(id)a3;
- (void)setUpdating:(BOOL)a3;
- (void)startUpdatesForWidth:(double)a3;
- (void)storeComponentsFromBlueprint:(id)a3 inDictionary:(id)a4;
- (void)unregisterLayout:(id)a3;
- (void)updatePosition:(CGPoint)a3 forComponentWithIdentifier:(id)a4;
- (void)updateSize:(CGSize)a3 forComponentWithIdentifier:(id)a4;
@end

@implementation SXLayoutBlueprint

- (SXLayoutBlueprint)initWithLayoutOptions:(id)a3 componentBlueprintFactory:(id)a4 unitConverterFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SXLayoutBlueprint;
  v12 = [(SXLayoutBlueprint *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layoutOptions, a3);
    objc_storeStrong((id *)&v13->_componentBlueprintFactory, a4);
    objc_storeStrong((id *)&v13->_unitConverterFactory, a5);
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    blueprint = v13->_blueprint;
    v13->_blueprint = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF980] array];
    orderedComponentIdentifiers = v13->_orderedComponentIdentifiers;
    v13->_orderedComponentIdentifiers = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9C0] set];
    invalidatedComponents = v13->_invalidatedComponents;
    v13->_invalidatedComponents = (NSMutableSet *)v18;
  }
  return v13;
}

- (void)registerLayout:(id)a3 sizer:(id)a4 forComponent:(id)a5 atIndex:(unint64_t)a6
{
  componentBlueprintFactory = self->_componentBlueprintFactory;
  id v11 = a5;
  id v17 = [(SXComponentBlueprintFactory *)componentBlueprintFactory componentBlueprintForComponent:v11 layout:a3 sizer:a4];
  [v17 setParentLayoutBlueprint:self];
  blueprint = self->_blueprint;
  v13 = [v11 identifier];
  [(NSMutableDictionary *)blueprint setObject:v17 forKey:v13];

  unint64_t v14 = [(NSMutableArray *)self->_orderedComponentIdentifiers count];
  orderedComponentIdentifiers = self->_orderedComponentIdentifiers;
  uint64_t v16 = [v11 identifier];

  if (v14 <= a6) {
    [(NSMutableArray *)orderedComponentIdentifiers addObject:v16];
  }
  else {
    [(NSMutableArray *)orderedComponentIdentifiers insertObject:v16 atIndex:a6];
  }
}

- (void)registerLayout:(id)a3 sizer:(id)a4 forComponent:(id)a5
{
}

- (void)unregisterLayout:(id)a3
{
  blueprint = self->_blueprint;
  id v5 = a3;
  v6 = [v5 component];
  v7 = [v6 identifier];
  [(NSMutableDictionary *)blueprint removeObjectForKey:v7];

  orderedComponentIdentifiers = self->_orderedComponentIdentifiers;
  id v10 = [v5 component];

  id v9 = [v10 identifier];
  [(NSMutableArray *)orderedComponentIdentifiers removeObject:v9];
}

- (void)invalidatePositionForComponentWithIdentifier:(id)a3
{
  id v6 = a3;
  v4 = -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:includeChildren:](self, "componentBlueprintForComponentIdentifier:includeChildren:");
  id v5 = v4;
  if (v4)
  {
    self->_isComplete = 0;
    [v4 invalidatePosition];
    [(NSMutableSet *)self->_invalidatedComponents addObject:v6];
  }
}

- (void)invalidateSizeForComponentWithIdentifier:(id)a3
{
  id v4 = a3;
  id v9 = [(SXLayoutBlueprint *)self componentBlueprintForComponentIdentifier:v4 includeChildren:1];
  id v5 = [v9 componentState];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  v8 = v7;

  -[SXLayoutBlueprint invalidateSizeForComponentWithIdentifier:suggestedSize:](self, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v4, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (void)invalidateState:(id)a3 forComponentWithIdentifier:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  id v7 = [(SXLayoutBlueprint *)self componentBlueprintForComponentIdentifier:v11 includeChildren:1];
  v8 = [v7 componentState];
  [v7 setComponentState:v6];
  id v9 = [v7 componentSizer];
  int v10 = [v9 requiresSizeChangeForStateChange:v6 fromState:v8];

  if (v10) {
    -[SXLayoutBlueprint invalidateSizeForComponentWithIdentifier:suggestedSize:](self, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v11, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
}

- (void)invalidateSizeForComponentWithIdentifier:(id)a3 suggestedSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v7 = -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:includeChildren:](self, "componentBlueprintForComponentIdentifier:includeChildren:");
  v8 = v7;
  if (v7)
  {
    self->_isComplete = 0;
    objc_msgSend(v7, "setSuggestedSizeAfterInvalidation:", width, height);
    [v8 invalidateSize];
    id v9 = [v8 parentLayoutBlueprint];
    int v10 = [v9 parentLayoutBlueprint];

    if (v10)
    {
      id v11 = [v8 component];
      v12 = [v11 identifier];
      v13 = [v10 containerComponentIdentifierContainingComponentWithIdentifier:v12];

      [v10 invalidateSizeForComponentWithIdentifier:v13];
    }
    [(NSMutableSet *)self->_invalidatedComponents addObject:v14];
  }
}

- (void)invalidateDependentsOfInvalidatedComponents
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = (void *)[(NSMutableSet *)self->_invalidatedComponents copy];
  [(NSMutableSet *)self->_invalidatedComponents removeAllObjects];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v10 = -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:](self, "componentBlueprintForComponentIdentifier:", v9, (void)v16);
        id v11 = [v10 parentLayoutBlueprint];
        v12 = [v11 dependencySolver];

        if (([v10 hasValidSize] & 1) == 0)
        {
          v13 = -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:]((uint64_t)v12, v9, 2);
          [(SXLayoutBlueprint *)self invalidateDependentsOfComponentNode:v13 forDependencyResolver:v12];
        }
        if (([v10 hasValidPosition] & 1) == 0)
        {
          id v14 = -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:]((uint64_t)v12, v9, 1);
          [(SXLayoutBlueprint *)self invalidateDependentsOfComponentNode:v14 forDependencyResolver:v12];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [v10 layoutBlueprint];
          [v15 invalidateDependentsOfInvalidatedComponents];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)invalidateDependentsOfComponentNode:(id)a3 forDependencyResolver:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
  v8 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v25 = v5;
  id v9 = -[SXComponentDependencyResolver componentNodesDependentOnComponentNode:]((uint64_t)v6, v5);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "addObject:", *(void *)(*((void *)&v31 + 1) + 8 * i), v25);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v11);
  }

  uint64_t v14 = [v8 anyObject];
  if (v14)
  {
    v15 = (void *)v14;
    do
    {
      long long v16 = -[SXFullscreenCaption text]((uint64_t)v15);
      long long v17 = [(SXLayoutBlueprint *)self componentBlueprintForComponentIdentifier:v16];

      if (-[SXFullscreenCaption caption]((uint64_t)v15) == 1)
      {
        [v17 invalidatePosition];
      }
      else if (-[SXFullscreenCaption caption]((uint64_t)v15) == 2)
      {
        [v17 invalidateSize];
      }
      objc_msgSend(v7, "addObject:", v15, v25);
      [v8 removeObject:v15];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v18 = -[SXComponentDependencyResolver componentNodesDependentOnComponentNode:]((uint64_t)v6, v15);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * j);
            if (([v7 containsObject:v23] & 1) == 0) {
              [v8 addObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v20);
      }

      uint64_t v24 = [v8 anyObject];

      v15 = (void *)v24;
    }
    while (v24);
  }
}

- (void)invalidateBlueprint
{
  self->_isComplete = 0;
}

void __40__SXLayoutBlueprint_invalidateBlueprint__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 invalidateLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v4 layoutBlueprint];
    [v3 invalidateBlueprint];
  }
}

- (void)invalidateBlueprintPosition
{
  self->_isComplete = 0;
}

uint64_t __48__SXLayoutBlueprint_invalidateBlueprintPosition__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidatePosition];
}

- (void)updateSize:(CGSize)a3 forComponentWithIdentifier:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(SXLayoutBlueprint *)self componentBlueprintForComponentIdentifier:a4];
  objc_msgSend(v6, "updateSize:", round(width), round(height));
}

- (void)updatePosition:(CGPoint)a3 forComponentWithIdentifier:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(SXLayoutBlueprint *)self componentBlueprintForComponentIdentifier:a4];
  objc_msgSend(v6, "updatePosition:", round(x), round(y));
}

- (id)componentBlueprintForComponentIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_blueprint objectForKey:a3];
}

- (id)componentBlueprintForComponentIdentifier:(id)a3 includeChildren:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(NSMutableDictionary *)self->_flattenedBlueprint count])
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_flattenedBlueprint objectForKey:v6];
  }
  else if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_blueprint objectForKey:v6];
    if (!v7 && v4)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v9 = self->_orderedComponentIdentifiers;
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:includeChildren:](self, "componentBlueprintForComponentIdentifier:includeChildren:", *(void *)(*((void *)&v16 + 1) + 8 * i), 0, (void)v16);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [v14 layoutBlueprint];
              uint64_t v7 = [v15 componentBlueprintForComponentIdentifier:v6 includeChildren:1];

              if (v7)
              {

                goto LABEL_21;
              }
            }
          }
          uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      uint64_t v7 = 0;
LABEL_21:
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)containerComponentIdentifierContainingComponentWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v16 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_orderedComponentIdentifiers;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:](self, "componentBlueprintForComponentIdentifier:", *(void *)(*((void *)&v18 + 1) + 8 * i), v16);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          uint64_t v10 = [v9 layoutBlueprint];
          uint64_t v11 = [v10 componentIdentifiers];
          char v12 = [v11 containsObject:v16];

          if (v12)
          {
            uint64_t v14 = [v9 component];
            v13 = [v14 identifier];

            goto LABEL_13;
          }
        }
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)componentIdentifiers
{
  return self->_orderedComponentIdentifiers;
}

- (id)componentsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v72 = *MEMORY[0x263EF8340];
  v8 = [MEMORY[0x263EFF9C0] set];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v9 = self->_orderedComponentIdentifiers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v67 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [(SXLayoutBlueprint *)self componentBlueprintForComponentIdentifier:*(void *)(*((void *)&v66 + 1) + 8 * i)];
        [v8 addObject:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v11);
  }

  v15 = [MEMORY[0x263EFF9C0] set];
  rect.size = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v16 = (void *)[v8 copy];
  uint64_t v17 = [v16 countByEnumeratingWithState:&rect.size objects:v70 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v63;
    long long v20 = off_26464F000;
    double v59 = x;
    double v60 = y;
    v57 = v15;
    v58 = v8;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v63 != v19) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*(void *)&rect.size.height + 8 * v21);
        [v22 frame];
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        v74.origin.CGFloat x = x;
        v74.origin.CGFloat y = y;
        v74.size.CGFloat width = width;
        v74.size.CGFloat height = height;
        if (CGRectGetWidth(v74) <= 0.0) {
          goto LABEL_20;
        }
        v75.origin.CGFloat x = v24;
        v75.origin.CGFloat y = v26;
        v75.size.CGFloat width = v28;
        v75.size.CGFloat height = v30;
        v82.origin.CGFloat x = x;
        v82.origin.CGFloat y = y;
        v82.size.CGFloat width = width;
        v82.size.CGFloat height = height;
        if (!CGRectIntersectsRect(v75, v82))
        {
LABEL_20:
          [v15 addObject:v22];
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_21;
        }
        id v31 = v22;
        [v31 frame];
        CGFloat v33 = v32;
        CGFloat v61 = v34;
        rect.origin.CGFloat x = v32;
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        v76.origin.CGFloat x = x;
        v76.origin.CGFloat y = y;
        v76.size.CGFloat width = width;
        v76.size.CGFloat height = height;
        double MinX = CGRectGetMinX(v76);
        v77.origin.CGFloat x = v33;
        v77.origin.CGFloat y = v36;
        v77.size.CGFloat width = v38;
        v77.size.CGFloat height = v61;
        rect.origin.CGFloat y = MinX - CGRectGetMinX(v77);
        v78.origin.CGFloat x = x;
        v78.origin.CGFloat y = y;
        v78.size.CGFloat width = width;
        v78.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v78);
        v79.origin.CGFloat x = rect.origin.x;
        v79.origin.CGFloat y = v36;
        v79.size.CGFloat width = v38;
        v79.size.CGFloat height = v61;
        double v41 = MinY - CGRectGetMinY(v79);
        v80.origin.CGFloat x = x;
        v80.origin.CGFloat y = y;
        v80.size.CGFloat width = width;
        v80.size.CGFloat height = height;
        double v42 = CGRectGetWidth(v80);
        v81.origin.CGFloat x = x;
        v81.origin.CGFloat y = y;
        v81.size.CGFloat width = width;
        v81.size.CGFloat height = height;
        double v43 = CGRectGetHeight(v81);
        v44 = [v31 layoutBlueprint];
        v45 = objc_msgSend(v44, "componentsInRect:", rect.origin.y, v41, v42, v43);
        [v8 unionSet:v45];

        v46 = [v31 component];
        uint64_t v47 = objc_opt_class();
        if (v47 == objc_opt_class())
        {
        }
        else
        {
          v48 = [v31 component];
          v49 = v16;
          uint64_t v50 = objc_opt_class();
          v51 = v20;
          uint64_t v52 = v19;
          uint64_t v53 = objc_opt_class();

          BOOL v54 = v50 == v53;
          uint64_t v19 = v52;
          long long v20 = v51;
          id v16 = v49;
          v15 = v57;
          v8 = v58;
          if (!v54) {
            goto LABEL_25;
          }
        }
        [v15 addObject:v31];
LABEL_25:

        CGFloat x = v59;
        CGFloat y = v60;
LABEL_21:
        ++v21;
      }
      while (v18 != v21);
      uint64_t v55 = [v16 countByEnumeratingWithState:&rect.size objects:v70 count:16];
      uint64_t v18 = v55;
    }
    while (v55);
  }

  [v8 minusSet:v15];
  return v8;
}

- (void)startUpdatesForWidth:(double)a3
{
  self->_updating = 1;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  flattenedBlueprint = self->_flattenedBlueprint;
  self->_flattenedBlueprint = v5;

  self->_blueprintSize.CGFloat width = a3;
}

- (void)endUpdates
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  blueprint = self->_blueprint;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__SXLayoutBlueprint_endUpdates__block_invoke;
  v4[3] = &unk_264652DC0;
  v4[4] = self;
  v4[5] = &v5;
  v4[6] = &v9;
  [(NSMutableDictionary *)blueprint enumerateKeysAndObjectsUsingBlock:v4];
  self->_isComplete = *((unsigned char *)v6 + 24);
  *(void *)&self->_blueprintSize.CGFloat height = v10[3];
  [(SXLayoutBlueprint *)self storeComponentsFromBlueprint:self inDictionary:self->_flattenedBlueprint];
  self->_updating = 0;
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

void __31__SXLayoutBlueprint_endUpdates__block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v20 = a3;
  if ([v20 hasValidLayout])
  {
    [v20 frame];
    double MaxY = CGRectGetMaxY(v22);
    uint64_t v5 = [v20 component];
    uint64_t v6 = [v5 anchor];

    if ([v6 originAnchorPosition]) {
      uint64_t v7 = [v6 originAnchorPosition];
    }
    else {
      uint64_t v7 = [v6 targetAnchorPosition];
    }
    uint64_t v8 = v7;
    [v20 frame];
    if (CGRectGetHeight(v23) > 0.0 && (v8 != 2 || !v6))
    {
      uint64_t v9 = *(void **)(a1[4] + 40);
      [v20 frame];
      uint64_t v10 = [v9 createUnitConverterWithComponentWidth:*(void *)(a1[4] + 24) parentWidth:CGRectGetWidth(v24) layoutOptions:*(double *)(a1[4] + 96)];
      uint64_t v11 = [v20 componentLayout];
      uint64_t v12 = [v11 margin];
      uint64_t v13 = [v12 bottom];
      objc_msgSend(v10, "convertValueToPoints:", v13, v14);
      double MaxY = MaxY + v15;
    }
    uint64_t v16 = *(void *)(a1[6] + 8);
    double v17 = *(double *)(v16 + 24);
    if (v17 < MaxY) {
      double v17 = MaxY;
    }
    *(double *)(v16 + 24) = v17;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [v20 layoutBlueprint];
    char v19 = [v18 isComplete];

    if ((v19 & 1) == 0) {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    }
  }
}

- (void)storeComponentsFromBlueprint:(id)a3 inDictionary:(id)a4
{
  id v6 = a4;
  blueprint = self->_blueprint;
  id v8 = a3;
  [v6 addEntriesFromDictionary:blueprint];
  uint64_t v9 = [v8 blueprint];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__SXLayoutBlueprint_storeComponentsFromBlueprint_inDictionary___block_invoke;
  v11[3] = &unk_264652DE8;
  id v12 = v6;
  uint64_t v13 = self;
  id v10 = v6;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
}

void __63__SXLayoutBlueprint_storeComponentsFromBlueprint_inDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  [*(id *)(a1 + 32) setObject:v7 forKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [v7 layoutBlueprint];
    [v5 storeComponentsFromBlueprint:v6 inDictionary:*(void *)(a1 + 32)];
  }
}

- (id)snapLinesIncludingChildren:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v21 = (id)[(NSOrderedSet *)self->_snapLines mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = v4->_orderedComponentIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    uint64_t v9 = off_26464F000;
    CGRect v22 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:](v4, "componentBlueprintForComponentIdentifier:", *(void *)(*((void *)&v23 + 1) + 8 * i), v21);
        if (v3)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v12 = v3;
            uint64_t v13 = v5;
            uint64_t v14 = v9;
            id v15 = v11;
            uint64_t v16 = [v15 layoutBlueprint];
            double v17 = [v16 snapLines];

            if (v17)
            {
              uint64_t v18 = [v15 layoutBlueprint];
              char v19 = [v18 snapLinesIncludingChildren:1];
              [v21 unionOrderedSet:v19];
            }
            uint64_t v9 = v14;
            uint64_t v5 = v13;
            BOOL v3 = v12;
            uint64_t v4 = v22;
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  *(unsigned char *)(v4 + 8) = self->_isComplete;
  objc_storeStrong((id *)(v4 + 24), self->_layoutOptions);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);
  objc_storeWeak((id *)(v4 + 16), WeakRetained);

  uint64_t v6 = [(NSMutableArray *)self->_orderedComponentIdentifiers mutableCopy];
  uint64_t v7 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v6;

  *(unsigned char *)(v4 + 9) = self->_updating;
  *(CGSize *)(v4 + 96) = self->_blueprintSize;
  uint64_t v8 = [(NSMutableSet *)self->_invalidatedComponents mutableCopy];
  uint64_t v9 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v8;

  objc_storeStrong((id *)(v4 + 80), self->_dependencySolver);
  objc_storeStrong((id *)(v4 + 88), self->_snapLines);
  objc_storeStrong((id *)(v4 + 32), self->_componentBlueprintFactory);
  objc_storeStrong((id *)(v4 + 40), self->_unitConverterFactory);
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSMutableDictionary count](self->_blueprint, "count"));
  blueprint = self->_blueprint;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __34__SXLayoutBlueprint_copyWithZone___block_invoke;
  v19[3] = &unk_264652E10;
  BOOL v12 = (id)v4;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  [(NSMutableDictionary *)blueprint enumerateKeysAndObjectsUsingBlock:v19];
  uint64_t v14 = (void *)v12[6];
  v12[6] = v13;
  id v15 = v13;

  uint64_t v16 = v21;
  double v17 = v12;

  return v17;
}

void __34__SXLayoutBlueprint_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [v6 setParentLayoutBlueprint:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setObject:v6 forKey:v5];
}

- (SXLayoutBlueprint)rootLayoutBlueprint
{
  p_parentLayoutBlueprint = &self->_parentLayoutBlueprint;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_parentLayoutBlueprint);
    id v6 = [v5 rootLayoutBlueprint];
  }
  else
  {
    id v6 = self;
  }
  return v6;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; isComplete: %d", -[SXLayoutBlueprint isComplete](self, "isComplete"));
  uint64_t v4 = [(SXLayoutBlueprint *)self componentIdentifiers];
  objc_msgSend(v3, "appendFormat:", @"; number of components: %lu", objc_msgSend(v4, "count"));

  id v5 = [(SXLayoutBlueprint *)self layoutOptions];
  [v3 appendFormat:@"; options: %@", v5];

  [v3 appendString:@">"];
  return v3;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v4 = [(SXLayoutBlueprint *)self description];
  id v5 = [(SXLayoutBlueprint *)self layoutDescriptionForBlueprint:self depth:0];
  id v6 = (void *)[v3 initWithFormat:@"%@\n%@", v4, v5];

  return v6;
}

- (id)layoutDescriptionForBlueprint:(id)a3 depth:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263F089D8] string];
  for (unint64_t i = 2 * a4; i; --i)
    [v6 appendString:@" "];
  id v25 = [MEMORY[0x263F089D8] string];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = [v5 blueprint];
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    unint64_t v22 = a4 + 1;
    uint64_t v11 = @"%@%@\n";
    BOOL v12 = off_26464F000;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = [v5 componentBlueprintForComponentIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * j)];
        objc_msgSend(v25, "appendFormat:", v11, v6, v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [v14 layoutBlueprint];
          [(SXLayoutBlueprint *)self layoutDescriptionForBlueprint:v15 depth:v22];
          uint64_t v16 = v6;
          id v17 = v5;
          uint64_t v18 = v11;
          v20 = char v19 = v12;
          [v25 appendString:v20];

          BOOL v12 = v19;
          uint64_t v11 = v18;
          id v5 = v17;
          id v6 = v16;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  return v25;
}

- (SXLayoutBlueprint)parentLayoutBlueprint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);
  return (SXLayoutBlueprint *)WeakRetained;
}

- (void)setParentLayoutBlueprint:(id)a3
{
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (CGSize)blueprintSize
{
  double width = self->_blueprintSize.width;
  double height = self->_blueprintSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBlueprintSize:(CGSize)a3
{
  self->_blueprintSize = a3;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (SXComponentBlueprintFactory)componentBlueprintFactory
{
  return self->_componentBlueprintFactory;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (NSMutableDictionary)blueprint
{
  return self->_blueprint;
}

- (void)setBlueprint:(id)a3
{
}

- (NSMutableDictionary)flattenedBlueprint
{
  return self->_flattenedBlueprint;
}

- (void)setFlattenedBlueprint:(id)a3
{
}

- (NSMutableArray)orderedComponentIdentifiers
{
  return self->_orderedComponentIdentifiers;
}

- (void)setOrderedComponentIdentifiers:(id)a3
{
}

- (BOOL)isUpdating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (NSMutableSet)invalidatedComponents
{
  return self->_invalidatedComponents;
}

- (void)setInvalidatedComponents:(id)a3
{
}

- (SXComponentDependencyResolver)dependencySolver
{
  return self->_dependencySolver;
}

- (void)setDependencySolver:(id)a3
{
}

- (NSOrderedSet)snapLines
{
  return self->_snapLines;
}

- (void)setSnapLines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapLines, 0);
  objc_storeStrong((id *)&self->_dependencySolver, 0);
  objc_storeStrong((id *)&self->_invalidatedComponents, 0);
  objc_storeStrong((id *)&self->_orderedComponentIdentifiers, 0);
  objc_storeStrong((id *)&self->_flattenedBlueprint, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_componentBlueprintFactory, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_destroyWeak((id *)&self->_parentLayoutBlueprint);
}

@end