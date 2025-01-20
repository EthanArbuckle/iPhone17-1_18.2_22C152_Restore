@interface TUIVStack
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight;
- (BOOL)valignEnabled;
- (CGSize)computedSize;
- (NSArray)children;
- (TUIGuide)guideBottom;
- (TUIGuide)guideTop;
- (TUIGuideLayoutController)guideLayoutController;
- (TUILayout)layout;
- (TUIVStack)initWithLayout:(id)a3 children:(id)a4;
- (double)containingHeight;
- (double)flexedHeight;
- (double)width;
- (void)computeLayoutWithOffset:(CGPoint)a3;
- (void)dealloc;
- (void)guideLayoutController:(id)a3 changedPhase:(unint64_t)a4;
- (void)setContainingHeight:(double)a3;
- (void)setFlexedHeight:(double)a3;
- (void)setGuideBottom:(id)a3;
- (void)setGuideLayoutController:(id)a3;
- (void)setGuideTop:(id)a3;
- (void)setSpecifiedHeight:(id *)a3;
- (void)setValignEnabled:(BOOL)a3;
- (void)setWidth:(double)a3;
@end

@implementation TUIVStack

- (TUIVStack)initWithLayout:(id)a3 children:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIVStack;
  v8 = [(TUIVStack *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_layout, v6);
    v10 = (NSArray *)[v7 copy];
    children = v9->_children;
    v9->_children = v10;

    v9->_flexedHeight = NAN;
    *(_OWORD *)&v9->_specifiedHeight.value = TUILengthNull;
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_guideLayoutController);
  [WeakRetained removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TUIVStack;
  [(TUIVStack *)&v4 dealloc];
}

- (void)setGuideLayoutController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_guideLayoutController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_guideLayoutController);
    [v6 removeObserver:self];

    id v7 = objc_storeWeak((id *)&self->_guideLayoutController, obj);
    [obj addObserver:self];

    v5 = obj;
  }
}

- (void)guideLayoutController:(id)a3 changedPhase:(unint64_t)a4
{
  id v11 = a3;
  if (self->_guideTop)
  {
    guideBottom = self->_guideBottom;
    if (guideBottom)
    {
      if (a4 == 1)
      {
        [(TUIGuide *)guideBottom guideOffset];
        double v8 = v7;
        [(TUIGuide *)self->_guideTop guideOffset];
        if (v8 - v9 == self->_computedSize.width) {
          goto LABEL_8;
        }
      }
      else if (a4)
      {
        goto LABEL_8;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
      [WeakRetained invalidateLayout];
    }
  }
LABEL_8:
}

- (void)computeLayoutWithOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double width = self->_width;
  location = (id *)&self->_layout;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v78 = self;
  double v7 = [(TUIVStack *)self children];
  id v8 = [v7 countByEnumeratingWithState:&v94 objects:v101 count:16];
  if (!v8)
  {
    id v81 = 0;
    goto LABEL_44;
  }
  id v81 = 0;
  uint64_t v9 = *(void *)v95;
  double v10 = 0.0;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v95 != v9) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v94 + 1) + 8 * i);
      [WeakRetained flexedWidth];
      [v12 setFlexedWidth:];
      [v12 setFlexedHeight:NAN];
      [v12 setContainingWidth:width];
      [v12 validateLayout];
      [v12 computedTransformedSize];
      double v14 = v13;
      id v15 = [v12 computedHeight];
      uint64_t v17 = v16;
      v18 = v7;
      if ((v16 & 0x8000000000000) != 0
        || ([v12 box],
            v19 = objc_claimAutoreleasedReturnValue(),
            BOOL v20 = [v19 vcompressed] == 0,
            v19,
            !v20))
      {
        if (!v81) {
          id v81 = +[TUIFlexibleLayoutController newHeightController];
        }
        v21 = [v12 box];
        [v81 addLayout:v12 length:v15 compressed:v17 [v21 vcompressed]];
      }
      double v10 = v10 + v14;
      double v7 = v18;
    }
    id v8 = [v18 countByEnumeratingWithState:&v94 objects:v101 count:16];
  }
  while (v8);

  if (!v81)
  {
    id v81 = 0;
    goto LABEL_46;
  }
  [(TUIVStack *)v78 specifiedHeight];
  if ((v22 & 0x7000000000000uLL) <= 0x2000000000000) {
    [(TUIVStack *)v78 flexedHeight];
  }
  v23 = [(TUIVStack *)v78 specifiedHeight];
  uint64_t v25 = v24;
  [(TUIVStack *)v78 specifiedHeight];
  if ((v26 & 0x7000000000000uLL) < 0x2000000000001
    || ([(TUIVStack *)v78 specifiedHeight], (v27 & 0x7000000000000) == 0x4000000000000))
  {
    [(TUIVStack *)v78 flexedHeight];
    [(TUIVStack *)v78 flexedHeight];
    if (v28 <= -3.40282347e38)
    {
      uint64_t v30 = 4286578687;
    }
    else
    {
      if (v28 < 3.40282347e38)
      {
        *(float *)&unsigned int v29 = v28;
        v23 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v29 | 0x7FC0000000000000);
LABEL_26:
        uint64_t v25 = 2143289344;
        goto LABEL_27;
      }
      uint64_t v30 = 2139095039;
    }
    v23 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v30 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
    goto LABEL_26;
  }
LABEL_27:
  [v81 computeWithMeasured:v23 desired:v25];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v31 = [v81 layouts];
  id v32 = [v31 countByEnumeratingWithState:&v90 objects:v100 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v91;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v91 != v33) {
          objc_enumerationMutation(v31);
        }
        v35 = *(void **)(*((void *)&v90 + 1) + 8 * (void)j);
        [v81 adjustedLengthForLayout:v35];
        [v35 setFlexedHeight:];
        [v35 validateLayout];
      }
      id v32 = [v31 countByEnumeratingWithState:&v90 objects:v100 count:16];
    }
    while (v32);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  double v7 = [(TUIVStack *)v78 children];
  id v36 = [v7 countByEnumeratingWithState:&v86 objects:v99 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v87;
    double v10 = 0.0;
    do
    {
      for (k = 0; k != v36; k = (char *)k + 1)
      {
        if (*(void *)v87 != v37) {
          objc_enumerationMutation(v7);
        }
        v39 = *(void **)(*((void *)&v86 + 1) + 8 * (void)k);
        if (([v39 hidden] & 1) == 0)
        {
          [v39 computedTransformedSize];
          double v10 = v10 + v40;
        }
      }
      id v36 = [v7 countByEnumeratingWithState:&v86 objects:v99 count:16];
    }
    while (v36);
    goto LABEL_45;
  }
LABEL_44:
  double v10 = 0.0;
LABEL_45:

LABEL_46:
  LODWORD(v41) = [(TUIVStack *)v78 specifiedHeight];
  double v42 = COERCE_FLOAT([(TUIVStack *)v78 specifiedHeight]);
  [(TUIVStack *)v78 specifiedHeight];
  LODWORD(v44) = v43;
  [(TUIVStack *)v78 specifiedHeight];
  double v46 = fmin(v42, v45);
  LODWORD(v47) = (unint64_t)[(TUIVStack *)v78 specifiedHeight] >> 32;
  double v48 = fmax(v46, COERCE_FLOAT((unint64_t)[(TUIVStack *)v78 specifiedHeight] >> 32));
  [(TUIVStack *)v78 flexedHeight];
  [(TUIVStack *)v78 flexedHeight];
  double v50 = fmax(v48, v49);
  [(TUIVStack *)v78 specifiedHeight];
  if ((v51 & 0x7000000000000) == 0x4000000000000)
  {
    [(TUIVStack *)v78 flexedHeight];
    [(TUIVStack *)v78 flexedHeight];
    double v50 = v52;
  }
  id v53 = objc_loadWeakRetained((id *)&v78->_guideLayoutController);
  if (v53)
  {

    double v54 = 0.0;
  }
  else
  {
    id v55 = objc_loadWeakRetained(location);
    v56 = [v55 layoutAncestor];
    unsigned __int8 v57 = [v56 isVerticallyAligningChildren];

    double v54 = 0.0;
    if ((v57 & 1) == 0)
    {
      id v58 = objc_loadWeakRetained(location);
      v59 = [v58 box];
      v60 = (int *)[v59 valign];

      if (v60 == (int *)((char *)&def_141F14 + 1) || v60 == (int *)((char *)&def_141F14 + 3))
      {
        double v54 = v50 - v10;
      }
      else if (v60 == &dword_4)
      {
        double v54 = (v50 - v10) * 0.5;
      }
    }
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v61 = [(TUIVStack *)v78 children];
  id v62 = [v61 countByEnumeratingWithState:&v82 objects:v98 count:16];
  if (v62)
  {
    uint64_t v63 = *(void *)v83;
    do
    {
      for (m = 0; m != v62; m = (char *)m + 1)
      {
        if (*(void *)v83 != v63) {
          objc_enumerationMutation(v61);
        }
        v65 = *(void **)(*((void *)&v82 + 1) + 8 * (void)m);
        if (([v65 hidden] & 1) == 0)
        {
          id v66 = objc_loadWeakRetained(location);
          v67 = (char *)[v66 computedLayoutDirection];

          v68 = [v65 box];
          v69 = (char *)[v68 halign];

          if ((unint64_t)v69 < 2)
          {
            if (v67 == (unsigned char *)&def_141F14 + 2)
            {
              [v65 computedTransformedSize];
              double v73 = v72;
              [v65 computedLeadingEdge];
              double v70 = width - v73 + v74;
            }
            else
            {
              [v65 computedLeadingEdge];
LABEL_71:
              double v70 = -v71;
            }
          }
          else if (v69 == (unsigned char *)&def_141F14 + 2)
          {
            [v65 computedHorizontalCenter];
            double v70 = -(v75 - width * 0.5);
          }
          else
          {
            double v70 = 0.0;
            if (v69 == (unsigned char *)&def_141F14 + 3)
            {
              if (v67 == (unsigned char *)&def_141F14 + 2)
              {
                [v65 computedTrailingEdge];
                goto LABEL_71;
              }
              [v65 computedTrailingEdge];
              double v70 = width - v76;
            }
          }
          [v65 setComputedOrigin:x + v70, y + v54];
          [v65 computedTransformedSize];
          double v54 = v54 + v77;
          continue;
        }
      }
      id v62 = [v61 countByEnumeratingWithState:&v82 objects:v98 count:16];
    }
    while (v62);
  }

  *(double *)&v78->_specifiedHeight._flags = width;
  v78->_computedSize.double width = v50;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedHeight
{
  __p = 0;
  unsigned int v29 = 0;
  uint64_t v30 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = [(TUIVStack *)self children];
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
        id v11 = v29;
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
            uint64_t v17 = (char *)sub_21C3C((uint64_t)&v30, v16);
          }
          else {
            uint64_t v17 = 0;
          }
          v18 = &v17[16 * v13];
          *(void *)v18 = v9;
          *((void *)v18 + 1) = v10;
          BOOL v20 = (char *)__p;
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
          unsigned int v29 = v18 + 16;
          uint64_t v30 = &v17[16 * v16];
          if (v19) {
            operator delete(v19);
          }
        }
        else
        {
          *(void *)unsigned int v29 = v7;
          *((void *)v11 + 1) = v8;
          v12 = v11 + 16;
        }
        unsigned int v29 = v12;
      }
      id v4 = [v3 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v4);
  }

  uint64_t v22 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthSum((unint64_t)__p, (v29 - (unsigned char *)__p) >> 4);
  if (__p)
  {
    unsigned int v29 = (char *)__p;
    operator delete(__p);
  }
  return v22;
}

- (TUILayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);

  return (TUILayout *)WeakRetained;
}

- (NSArray)children
{
  return self->_children;
}

- (TUIGuideLayoutController)guideLayoutController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_guideLayoutController);

  return (TUIGuideLayoutController *)WeakRetained;
}

- (TUIGuide)guideTop
{
  return self->_guideTop;
}

- (void)setGuideTop:(id)a3
{
}

- (TUIGuide)guideBottom
{
  return self->_guideBottom;
}

- (void)setGuideBottom:(id)a3
{
}

- (BOOL)valignEnabled
{
  return self->_valignEnabled;
}

- (void)setValignEnabled:(BOOL)a3
{
  self->_valignEnabled = a3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_specifiedHeight.value;
}

- (void)setSpecifiedHeight:(id *)a3
{
  *(void *)&self->_specifiedHeight.value = a3;
  *(void *)&self->_specifiedHeight.madouble x = v3;
}

- (double)containingHeight
{
  return self->_containingHeight;
}

- (void)setContainingHeight:(double)a3
{
  self->_containingHeight = a3;
}

- (double)flexedHeight
{
  return self->_flexedHeight;
}

- (void)setFlexedHeight:(double)a3
{
  self->_flexedHeight = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_double width = a3;
}

- (CGSize)computedSize
{
  double v2 = *(double *)&self->_specifiedHeight._flags;
  double width = self->_computedSize.width;
  result.height = width;
  result.double width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideBottom, 0);
  objc_storeStrong((id *)&self->_guideTop, 0);
  objc_destroyWeak((id *)&self->_guideLayoutController);
  objc_storeStrong((id *)&self->_children, 0);

  objc_destroyWeak((id *)&self->_layout);
}

@end