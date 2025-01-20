@interface TUIVBoxLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight;
- (BOOL)groupedContainingIsGrouped;
- (BOOL)isHorizontallyAligningChildren;
- (NSArray)vstacks;
- (TUIVBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (UIEdgeInsets)groupedContainingInsets;
- (double)computedHeightAbovePivot;
- (id)guideProviderForLayout:(id)a3;
- (unint64_t)groupedContainingContentMode;
- (unint64_t)groupedContainingInsetsMode;
- (unint64_t)visibleBoundsGeneration;
- (void)_buildVStacks;
- (void)_updateDynamicLayouts;
- (void)appendVisibleBoundsObservers:(id)a3 axis:(unint64_t)a4 offset:(double)a5;
- (void)computeLayout;
- (void)onChildInvalidate:(id)a3;
- (void)onChildTransformedSizeDidChange:(id)a3;
- (void)onChildrenUpdated;
- (void)updateGuides;
@end

@implementation TUIVBoxLayout

- (TUIVBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUIVBoxLayout;
  v11 = [(TUILayout *)&v15 initWithModel:v8 parent:v9 controller:v10];
  v12 = v11;
  if (v11)
  {
    [(TUILayout *)v11 specifiedWidth];
    if ((v13 & 0x6000000000000) == 0x2000000000000) {
      [(TUILayout *)v12 setSpecifiedWidthComputeInherited:1];
    }
  }

  return v12;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  __p = 0;
  v34 = 0;
  v35 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v3 = [(TUILayout *)self children];
  id v4 = [v3 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v30;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = [*(id *)(*((void *)&v29 + 1) + 8 * i) validatedIntrinsicWidthConsideringSpecified];
        id v9 = v7;
        uint64_t v10 = v8;
        v11 = v34;
        if (v34 >= v35)
        {
          uint64_t v13 = (v34 - (unsigned char *)__p) >> 4;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60) {
            sub_4484();
          }
          uint64_t v15 = v35 - (unsigned char *)__p;
          if ((v35 - (unsigned char *)__p) >> 3 > v14) {
            unint64_t v14 = v15 >> 3;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v16 = v14;
          }
          if (v16) {
            v17 = (char *)sub_21C3C((uint64_t)&v35, v16);
          }
          else {
            v17 = 0;
          }
          v18 = &v17[16 * v13];
          *(void *)v18 = v9;
          *((void *)v18 + 1) = v10;
          v20 = (char *)__p;
          v19 = v34;
          v21 = v18;
          if (v34 != __p)
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
          v34 = v18 + 16;
          v35 = &v17[16 * v16];
          if (v19) {
            operator delete(v19);
          }
        }
        else
        {
          *(void *)v34 = v7;
          *((void *)v11 + 1) = v8;
          v12 = v11 + 16;
        }
        v34 = v12;
      }
      id v4 = [v3 countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v4);
  }

  uint64_t v22 = TUILengthCombine((float *)__p, (v34 - (unsigned char *)__p) >> 4);
  double v24 = fmin(fmax(*(float *)&v22, *((float *)&v22 + 1)), v23);
  if (v24 <= -3.40282347e38)
  {
    uint64_t v27 = 4286578687;
  }
  else
  {
    if (v24 < 3.40282347e38)
    {
      *(float *)&unsigned int v25 = v24;
      v26 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v25 | 0x7FC0000000000000);
      goto LABEL_30;
    }
    uint64_t v27 = 2139095039;
  }
  v26 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v27 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
LABEL_30:
  if (__p)
  {
    v34 = (char *)__p;
    operator delete(__p);
  }
  return v26;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  __p = 0;
  long long v29 = 0;
  long long v30 = 0;
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
        id v7 = [*(id *)(*((void *)&v24 + 1) + 8 * i) validatedIntrinsicHeightConsideringSpecified];
        id v9 = v7;
        uint64_t v10 = v8;
        v11 = v29;
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
          v20 = (char *)__p;
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
          long long v29 = v18 + 16;
          long long v30 = &v17[16 * v16];
          if (v19) {
            operator delete(v19);
          }
        }
        else
        {
          *(void *)long long v29 = v7;
          *((void *)v11 + 1) = v8;
          v12 = v11 + 16;
        }
        long long v29 = v12;
      }
      id v4 = [v3 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v4);
  }

  uint64_t v22 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthSum((unint64_t)__p, (v29 - (unsigned char *)__p) >> 4);
  if (__p)
  {
    long long v29 = (char *)__p;
    operator delete(__p);
  }
  return v22;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  __p = 0;
  long long v29 = 0;
  long long v30 = 0;
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
        id v7 = [*(id *)(*((void *)&v24 + 1) + 8 * i) computedHeight];
        id v9 = v7;
        uint64_t v10 = v8;
        v11 = v29;
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
          v20 = (char *)__p;
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
          long long v29 = v18 + 16;
          long long v30 = &v17[16 * v16];
          if (v19) {
            operator delete(v19);
          }
        }
        else
        {
          *(void *)long long v29 = v7;
          *((void *)v11 + 1) = v8;
          v12 = v11 + 16;
        }
        long long v29 = v12;
      }
      id v4 = [v3 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v4);
  }

  uint64_t v22 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthSum((unint64_t)__p, (v29 - (unsigned char *)__p) >> 4);
  if (__p)
  {
    long long v29 = (char *)__p;
    operator delete(__p);
  }
  return v22;
}

- (BOOL)isHorizontallyAligningChildren
{
  return 1;
}

- (void)_buildVStacks
{
  if (!self->_vstacks)
  {
    uint64_t v33 = 128;
    v37 = objc_opt_new();
    v3 = [(TUILayout *)self guideProvider];
    uint64_t v4 = [v3 guideLayoutControllerForLayout:self];

    v36 = (void *)v4;
    if (v4)
    {
      uint64_t v5 = objc_opt_new();
      v6 = [(TUILayout *)self guideTop];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = [(TUILayout *)self children];
      id v7 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v39;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v39 != v8) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            v11 = [v10 guideTop:v33];
            if (v11)
            {
              BOOL v12 = [v5 count] == 0;

              if (!v12)
              {
                uint64_t v13 = [[TUIVStack alloc] initWithLayout:self children:v5];
                [(TUIVStack *)v13 setGuideTop:v6];
                unint64_t v14 = [v10 guideTop];
                [(TUIVStack *)v13 setGuideBottom:v14];

                [(TUIVStack *)v13 setGuideLayoutController:v36];
                uint64_t v15 = [v10 guideTop];

                [v5 removeAllObjects];
                [v37 addObject:v13];

                v6 = (void *)v15;
              }
            }
            [v5 addObject:v10];
            unint64_t v16 = [v10 guideBottom];
            BOOL v17 = v16 == 0;

            if (!v17)
            {
              v18 = [[TUIVStack alloc] initWithLayout:self children:v5];
              [(TUIVStack *)v18 setGuideTop:v6];
              v19 = [v10 guideBottom];
              [(TUIVStack *)v18 setGuideBottom:v19];

              [(TUIVStack *)v18 setGuideLayoutController:v36];
              uint64_t v20 = [v10 guideBottom];

              [v5 removeAllObjects];
              [v37 addObject:v18];

              v6 = (void *)v20;
            }
          }
          id v7 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v7);
      }

      if ([v5 count])
      {
        v21 = [[TUIVStack alloc] initWithLayout:self children:v5];
        [(TUIVStack *)v21 setGuideTop:v6];
        uint64_t v22 = [(TUILayout *)self guideBottom];
        [(TUIVStack *)v21 setGuideBottom:v22];

        [(TUIVStack *)v21 setGuideLayoutController:v36];
        [v37 addObject:v21];
      }
    }
    else
    {
      float v23 = [TUIVStack alloc];
      long long v24 = [(TUILayout *)self children];
      long long v25 = [(TUIVStack *)v23 initWithLayout:self children:v24];

      long long v26 = [(TUILayout *)self guideProvider];
      long long v27 = [v26 guideLayoutControllerForLayout:self];
      [(TUIVStack *)v25 setGuideLayoutController:v27];

      [v37 addObject:v25];
    }
    v28 = [v37 copy];
    long long v29 = *(Class *)((char *)&self->super.super.isa + v34);
    *(Class *)((char *)&self->super.super.isa + v34) = v28;

    if ([*(id *)((char *)&self->super.super.isa + v34) count] == (char *)&def_141F14 + 1)
    {
      long long v30 = [*(id *)((char *)&self->super.super.isa + v34) firstObject];
      long long v31 = [(TUILayout *)self specifiedHeight];
      [v30 setSpecifiedHeight:v31, v32];
      [v30 setValignEnabled:1];
    }
  }
}

- (void)updateGuides
{
  v4.receiver = self;
  v4.super_class = (Class)TUIVBoxLayout;
  [(TUILayout *)&v4 updateGuides];
  vstacks = self->_vstacks;
  self->_vstacks = 0;
}

- (void)onChildTransformedSizeDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIVBoxLayout;
  [(TUILayout *)&v5 onChildTransformedSizeDidChange:v4];
  [(TUILayout *)self setFlexedHeight:NAN];
}

- (void)computeLayout
{
  v2 = self;
  [(TUIVBoxLayout *)self _buildVStacks];
  [(TUILayout *)v2 computeWidth];
  double v4 = v3;
  v43 = v2;
  if ((char *)[(NSArray *)v2->_vstacks count] == (char *)&def_141F14 + 1)
  {
    [(TUILayout *)v2 flexedHeight];
    double v6 = v5;
    id v7 = [(NSArray *)v2->_vstacks objectAtIndexedSubscript:0];
    [v7 setFlexedHeight:v6];

    [(TUILayout *)v43 containingHeight];
    double v9 = v8;
    uint64_t v10 = [(NSArray *)v43->_vstacks objectAtIndexedSubscript:0];
    [v10 setContainingHeight:v9];

    v2 = v43;
  }
  v11 = [(TUILayout *)v2 guideProvider];
  BOOL v12 = [v11 guideLayoutControllerForLayout:v43];

  uint64_t v13 = (char *)[v12 layoutPhase];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  unint64_t v14 = v43->_vstacks;
  id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v45;
    BOOL v17 = v13 == (unsigned char *)&def_141F14 + 1 && v12 != 0;
    if (v13) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = v12 != 0;
    }
    double v19 = 0.0;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v14);
        }
        v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        [v21 setWidth:v4];
        if (v17)
        {
          [v21 computedSize];
          double v23 = v22;
          long long v24 = [v21 guideTop];
          if (v24)
          {
            long long v25 = [v21 guideBottom];
            BOOL v26 = v25 == 0;

            double v27 = v23;
            if (!v26)
            {
              v28 = [v21 guideBottom:v23];
              [v28 guideOffset];
              double v30 = v29;
              long long v31 = [v21 guideTop];
              [v31 guideOffset];
              double v33 = v32;

              double v27 = fmax(v30 - v33, 0.0);
            }
          }
          else
          {
            double v27 = v23;
          }
          if (v23 != v27) {
            [v21 setFlexedHeight:];
          }
        }
        [v21 computeLayoutWithOffset:0.0 v19];
        [v21 computedSize];
        double v35 = v34;
        if (v18)
        {
          v36 = [v21 guideTop];
          if (v36)
          {
            v37 = [v21 guideBottom];
            BOOL v38 = v37 == 0;

            if (!v38)
            {
              long long v39 = [v21 guideTop];
              long long v40 = [v21 guideBottom];
              id v41 = [v21 computedHeight];
              [v12 addEdgeFrom:v39 to:v40 length:v41];
            }
          }
        }
        double v19 = v19 + v35;
      }
      id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v15);
  }
  else
  {
    double v19 = 0.0;
  }

  if (v43->_dynamicLayouts) {
    [(TUIVBoxLayout *)v43 _updateDynamicLayouts];
  }
  -[TUILayout setComputedNaturalSize:](v43, "setComputedNaturalSize:", v4, v19);
  *(unsigned char *)&v43->_flags |= 1u;
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
      double v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) updateSummariesFromChildren:(void)v6];
        double v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (double)computedHeightAbovePivot
{
  v15.receiver = self;
  v15.super_class = (Class)TUIVBoxLayout;
  [(TUILayout *)&v15 computedHeightAbovePivot];
  double v4 = v3;
  double v5 = [(TUILayout *)self controller];
  long long v6 = [(TUILayout *)self box];
  long long v7 = [v6 pivotChild];
  long long v8 = [v5 layoutForModel:v7];

  if (v8)
  {
    long long v9 = [(TUILayout *)self children];
    id v10 = [v9 indexOfObjectIdenticalTo:v8];

    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v8 computedHeightAbovePivot];
      double v12 = v11;
      [v8 computedFrame];
      double v4 = v12 + v13;
    }
  }

  return v4;
}

- (void)onChildInvalidate:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIVBoxLayout;
  [(TUILayout *)&v5 onChildInvalidate:v4];
  [v4 setFlexedWidth:NAN];
}

- (void)onChildrenUpdated
{
  v19.receiver = self;
  v19.super_class = (Class)TUIVBoxLayout;
  [(TUILayout *)&v19 onChildrenUpdated];
  [(TUILayout *)self invalidateIntrinsicSize];
  vstacks = self->_vstacks;
  self->_vstacks = 0;

  id v4 = objc_opt_new();
  uint64_t v5 = objc_opt_class();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v6 = [(TUILayout *)self containers];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_class() == v5) {
          double v11 = v10;
        }
        else {
          double v11 = 0;
        }
        id v12 = v11;
        if (v12) {
          [v4 addObject:v12];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }

  id v13 = [v4 count];
  if (v13) {
    id v14 = [v4 copy];
  }
  else {
    id v14 = 0;
  }
  objc_storeStrong((id *)&self->_dynamicLayouts, v14);
  if (v13) {
}
  }

- (void)appendVisibleBoundsObservers:(id)a3 axis:(unint64_t)a4 offset:(double)a5
{
  id v8 = a3;
  if (a4 == 2)
  {
    uint64_t v17 = 2;
    if (*(unsigned char *)&self->_flags)
    {
      *(unsigned char *)&self->_flags &= ~1u;
      ++self->_visibleBoundsGeneration;
    }
    long long v18 = objc_opt_new();
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
            long long v15 = [v14 dynamicArrayWindowingBox];
            if (v15)
            {
              id v16 = +[TUIVisibleBoundsObserver newVerticalWithWindow:v15 layout:self offset:a5];
              [v8 addObject:v16];
            }
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    a4 = 2;
  }
  v19.receiver = self;
  v19.super_class = (Class)TUIVBoxLayout;
  -[TUILayout appendVisibleBoundsObservers:axis:offset:](&v19, "appendVisibleBoundsObservers:axis:offset:", v8, a4, a5, v17);
}

- (id)guideProviderForLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUILayout *)self layoutAncestor];
  long long v6 = [v5 guideProviderForLayout:v4];

  return v6;
}

- (BOOL)groupedContainingIsGrouped
{
  v2 = [(TUILayout *)self box];
  unsigned __int8 v3 = [v2 grouped];

  return v3;
}

- (UIEdgeInsets)groupedContainingInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)groupedContainingInsetsMode
{
  return 0;
}

- (unint64_t)groupedContainingContentMode
{
  return 0;
}

- (unint64_t)visibleBoundsGeneration
{
  return self->_visibleBoundsGeneration;
}

- (NSArray)vstacks
{
  return self->_vstacks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vstacks, 0);

  objc_storeStrong((id *)&self->_dynamicLayouts, 0);
}

@end