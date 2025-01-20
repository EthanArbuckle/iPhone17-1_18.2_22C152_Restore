@interface TUIHBoxLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)modifiedSpecifiedWidthForChild:(SEL)a3;
- (BOOL)isVerticallyAligningChildren;
- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4;
- (TUIHBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (id)defaultGuideSpecForLayout:(id)a3 edge:(unint64_t)a4;
- (id)guideForLayout:(id)a3 spec:(id)a4;
- (id)guideLayoutControllerForLayout:(id)a3;
- (id)guideProviderForLayout:(id)a3;
- (unint64_t)visibleBoundsGeneration;
- (void)_updateDynamicLayouts;
- (void)appendLayoutsWithSpecifiedWidthModifiedToArray:(id)a3;
- (void)appendVisibleBoundsObservers:(id)a3 axis:(unint64_t)a4 offset:(double)a5;
- (void)computeLayout;
- (void)onChildInvalidate:(id)a3;
- (void)onChildrenUpdated;
- (void)onContainingWidthChange;
- (void)onDesdendantSpecifiedWidthModifiedDidChange;
- (void)onDesdendantSpecifiedWidthModifiedDidChangeForChild:(id)a3;
@end

@implementation TUIHBoxLayout

- (TUIHBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)TUIHBoxLayout;
  v11 = [(TUILayout *)&v24 initWithModel:v8 parent:v9 controller:v10];
  v12 = v11;
  if (v11)
  {
    [(TUILayout *)v11 specifiedWidth];
    if ((v13 & 0x6000000000000) == 0x2000000000000) {
      [(TUILayout *)v12 setSpecifiedWidthComputeInherited:1];
    }
    v14 = [(TUILayout *)v12 box];
    v15 = (char *)[v14 layoutMode];

    if (v15 != (unsigned char *)&def_141F14 + 1)
    {
      v18 = [(TUILayout *)v12 box];
      v19 = (char *)[v18 layoutMode];

      if (v19 == (unsigned char *)&def_141F14 + 2)
      {
        char v20 = *(unsigned char *)&v12->_flags | 2;
      }
      else
      {
        v21 = [(TUILayout *)v12 box];
        v22 = (char *)[v21 layoutMode];

        if (v22 != (unsigned char *)&def_141F14 + 3) {
          goto LABEL_11;
        }
        char v20 = *(unsigned char *)&v12->_flags | 6;
      }
      *(unsigned char *)&v12->_flags = v20;
      goto LABEL_11;
    }
    v16 = objc_alloc_init(TUIGuideLayoutController);
    guideLayoutController = v12->_guideLayoutController;
    v12->_guideLayoutController = v16;
  }
LABEL_11:

  return v12;
}

- (id)guideLayoutControllerForLayout:(id)a3
{
  return self->_guideLayoutController;
}

- (id)guideForLayout:(id)a3 spec:(id)a4
{
  v4 = [(TUIGuideLayoutController *)self->_guideLayoutController guideForSpec:a4];

  return v4;
}

- (id)guideProviderForLayout:(id)a3
{
  if (!self->_guideLayoutController) {
    self = 0;
  }
  return self;
}

- (id)defaultGuideSpecForLayout:(id)a3 edge:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2
    && [v5 shouldUseDefaultGuideForLayout:v5 edge:a4])
  {
    v7 = +[TUIGuideSpec unbound];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (self->_guideLayoutController)
  {
    id v8 = [v6 layoutAncestor];
    unsigned __int8 v9 = v8 == self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUIHBoxLayout;
    unsigned __int8 v9 = [(TUILayout *)&v11 shouldUseDefaultGuideForLayout:v6 edge:a4];
  }

  return v9;
}

- (BOOL)isVerticallyAligningChildren
{
  return 1;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  __p = 0;
  v29 = 0;
  v30 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = [(TUILayout *)self children];
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v25;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = [*(id *)(*((void *)&v24 + 1) + 8 * i) validatedIntrinsicWidthConsideringSpecified];
        id v9 = v7;
        uint64_t v10 = v8;
        objc_super v11 = v29;
        if (v29 >= v30)
        {
          uint64_t v13 = (v29 - (unsigned char *)__p) >> 4;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60) {
            sub_4484();
          }
          uint64_t v15 = v30 - (unsigned char *)__p;
          if ((v30 - (unsigned char *)__p) >> 3 > v14) {
            unint64_t v14 = v15 >> 3;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v16 = v14;
          }
          if (v16) {
            v17 = (char *)sub_21C3C((uint64_t)&v30, v16);
          }
          else {
            v17 = 0;
          }
          v18 = &v17[16 * v13];
          *(void *)v18 = v9;
          *((void *)v18 + 1) = v10;
          char v20 = (char *)__p;
          v19 = v29;
          v21 = v18;
          if (v29 != __p)
          {
            do
            {
              *((_OWORD *)v21 - 1) = *((_OWORD *)v19 - 1);
              v21 -= 16;
              v19 -= 16;
            }
            while (v19 != v20);
            v19 = (char *)__p;
          }
          v12 = v18 + 16;
          __p = v21;
          v29 = v18 + 16;
          v30 = &v17[16 * v16];
          if (v19) {
            operator delete(v19);
          }
        }
        else
        {
          *(void *)v29 = v7;
          *((void *)v11 + 1) = v8;
          v12 = v11 + 16;
        }
        v29 = v12;
      }
      id v4 = [v3 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v4);
  }

  v22 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthSum((unint64_t)__p, (v29 - (unsigned char *)__p) >> 4);
  if (__p)
  {
    v29 = (char *)__p;
    operator delete(__p);
  }
  return v22;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  __p = 0;
  v29 = 0;
  v30 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = [(TUILayout *)self children];
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v25;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = [*(id *)(*((void *)&v24 + 1) + 8 * i) computedWidth];
        id v9 = v7;
        uint64_t v10 = v8;
        objc_super v11 = v29;
        if (v29 >= v30)
        {
          uint64_t v13 = (v29 - (unsigned char *)__p) >> 4;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60) {
            sub_4484();
          }
          uint64_t v15 = v30 - (unsigned char *)__p;
          if ((v30 - (unsigned char *)__p) >> 3 > v14) {
            unint64_t v14 = v15 >> 3;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v16 = v14;
          }
          if (v16) {
            v17 = (char *)sub_21C3C((uint64_t)&v30, v16);
          }
          else {
            v17 = 0;
          }
          v18 = &v17[16 * v13];
          *(void *)v18 = v9;
          *((void *)v18 + 1) = v10;
          char v20 = (char *)__p;
          v19 = v29;
          v21 = v18;
          if (v29 != __p)
          {
            do
            {
              *((_OWORD *)v21 - 1) = *((_OWORD *)v19 - 1);
              v21 -= 16;
              v19 -= 16;
            }
            while (v19 != v20);
            v19 = (char *)__p;
          }
          v12 = v18 + 16;
          __p = v21;
          v29 = v18 + 16;
          v30 = &v17[16 * v16];
          if (v19) {
            operator delete(v19);
          }
        }
        else
        {
          *(void *)v29 = v7;
          *((void *)v11 + 1) = v8;
          v12 = v11 + 16;
        }
        v29 = v12;
      }
      id v4 = [v3 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v4);
  }

  v22 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthSum((unint64_t)__p, (v29 - (unsigned char *)__p) >> 4);
  if (__p)
  {
    v29 = (char *)__p;
    operator delete(__p);
  }
  return v22;
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  uint64_t v5 = [(TUILayout *)self specifiedHeight];
  id v7 = v5;
  uint64_t v9 = v8;
  if ((v8 & 0x8000000000000) != 0)
  {
    LODWORD(v6) = v5;
    [(TUILayout *)self computeHeight];
    double v10 = v11;
  }
  else
  {
    double v10 = NAN;
  }
  v12 = [TUIHStack alloc];
  uint64_t v13 = [(TUILayout *)self children];
  unint64_t v16 = [(TUIHStack *)v12 initWithLayout:self children:v13];

  [(TUIHStack *)v16 setComputedWidth:v4];
  [(TUIHStack *)v16 setComputedHeight:v10];
  [(TUILayout *)self containingWidth];
  -[TUIHStack setContainingMaxWidth:](v16, "setContainingMaxWidth:");
  unint64_t v14 = [(TUILayout *)self specifiedWidth];
  -[TUIHStack setSpecifiedWidth:](v16, "setSpecifiedWidth:", v14, v15);
  -[TUIHStack setSpecifiedHeight:](v16, "setSpecifiedHeight:", v7, v9);
  [(TUIHStack *)v16 setGuideLayoutController:self->_guideLayoutController];
  [(TUIHStack *)v16 setPrefersEqualWidth:(*(unsigned char *)&self->_flags >> 1) & 1];
  [(TUIHStack *)v16 setUseStrictEqualWidth:(*(unsigned char *)&self->_flags >> 2) & 1];
  [(TUIHStack *)v16 computeLayout];
  if (self->_dynamicLayouts) {
    [(TUIHBoxLayout *)self _updateDynamicLayouts];
  }
  [(TUIHStack *)v16 layoutSize];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");
  *(unsigned char *)&self->_flags |= 1u;
}

- (void)_updateDynamicLayouts
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = self->_dynamicLayouts;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) updateSummariesFromChildren:(void)v6];
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)onChildInvalidate:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIHBoxLayout;
  [(TUILayout *)&v5 onChildInvalidate:v4];
  [v4 setFlexedWidth:NAN];
}

- (void)onDesdendantSpecifiedWidthModifiedDidChange
{
  id v3 = [(TUILayout *)self layoutAncestor];
  [v3 onDesdendantSpecifiedWidthModifiedDidChangeForChild:self];
}

- (void)onDesdendantSpecifiedWidthModifiedDidChangeForChild:(id)a3
{
}

- (void)appendLayoutsWithSpecifiedWidthModifiedToArray:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TUILayout *)self children];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_16E924;
  v7[3] = &unk_252858;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (void)onContainingWidthChange
{
  if ([(TUILayout *)self desdendantSpecifiedWidthModified])
  {
    id v3 = objc_opt_new();
    [(TUIHBoxLayout *)self appendLayoutsWithSpecifiedWidthModifiedToArray:v3];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        long long v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) onSpecifiedWidthChanged:(void)v8];
          long long v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)modifiedSpecifiedWidthForChild:(SEL)a3
{
  id v5 = [a4 box];
  id v6 = [v5 relativeWidth];
  uint64_t v8 = v7;

  long long v9 = self;
  [(TUILayout *)v9 containingWidth];
  long long v11 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthByScaling((uint64_t)v6, v8, v10);

  return v11;
}

- (void)onChildrenUpdated
{
  v30.receiver = self;
  v30.super_class = (Class)TUIHBoxLayout;
  [(TUILayout *)&v30 onChildrenUpdated];
  [(TUILayout *)self invalidateIntrinsicSize];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = [(TUILayout *)self children];
  char v4 = 0;
  id v5 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v9 = [v8 box];
        unsigned int v10 = [v9 hasRelativeWidth];

        if (v10)
        {
          char v4 = 1;
          [v8 setSpecifiedWidthModified:1];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v5);
  }

  [(TUILayout *)self updateDesdendantSpecifiedWidthModifiedWithFlag:v4 & 1];
  long long v11 = objc_opt_new();
  uint64_t v12 = objc_opt_class();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = [(TUILayout *)self containers];
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
        if (objc_opt_class() == v12) {
          v18 = v17;
        }
        else {
          v18 = 0;
        }
        id v19 = v18;
        if (v19) {
          [v11 addObject:v19];
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v14);
  }

  id v20 = [v11 count];
  if (v20) {
    id v21 = [v11 copy];
  }
  else {
    id v21 = 0;
  }
  objc_storeStrong((id *)&self->_dynamicLayouts, v21);
  if (v20) {
}
  }

- (void)appendVisibleBoundsObservers:(id)a3 axis:(unint64_t)a4 offset:(double)a5
{
  id v8 = a3;
  if (a4 == 1)
  {
    uint64_t v17 = 1;
    if (*(unsigned char *)&self->_flags)
    {
      *(unsigned char *)&self->_flags &= ~1u;
      ++self->_visibleBoundsGeneration;
    }
    v18 = objc_opt_new();
    long long v9 = [(TUILayout *)self model];
    [v9 appendLayoutChildrenToArray:v18];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v18;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v15 = [v14 dynamicArrayWindowingBox];
            if (v15)
            {
              id v16 = +[TUIVisibleBoundsObserver newHorizontalWithWindow:v15 layout:self offset:a5];
              [v8 addObject:v16];
            }
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    a4 = 1;
  }
  v19.receiver = self;
  v19.super_class = (Class)TUIHBoxLayout;
  -[TUILayout appendVisibleBoundsObservers:axis:offset:](&v19, "appendVisibleBoundsObservers:axis:offset:", v8, a4, a5, v17);
}

- (unint64_t)visibleBoundsGeneration
{
  return self->_visibleBoundsGeneration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLayoutController, 0);

  objc_storeStrong((id *)&self->_dynamicLayouts, 0);
}

@end