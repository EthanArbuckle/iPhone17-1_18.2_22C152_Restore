@interface TUIHFadeLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- (double)computedHeightAbovePivot;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (void)computeLayout;
- (void)onChildrenUpdated;
@end

@implementation TUIHFadeLayout

- (void)onChildrenUpdated
{
  v7.receiver = self;
  v7.super_class = (Class)TUIHFadeLayout;
  [(TUILayout *)&v7 onChildrenUpdated];
  content = self->_content;
  self->_content = 0;

  decorator = self->_decorator;
  self->_decorator = 0;

  v5 = [(TUILayout *)self children];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_39680;
  v6[3] = &unk_252858;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  content = self->_content;
  if (content)
  {
    uint64_t v5 = [(TUILayout *)content validatedIntrinsicWidth];
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0x7FC000007FC00000;
    uint64_t v7 = 0x200007FC00000;
  }
  v8 = [(TUILayout *)self box];
  [v8 padding];
  if (v9 <= -3.40282347e38)
  {
    uint64_t v12 = 0x7FC00000FF7FFFFFLL;
  }
  else
  {
    BOOL v10 = v9 < 3.40282347e38;
    float v11 = v9;
    if (v10) {
      uint64_t v12 = LODWORD(v11) | 0x7FC0000000000000;
    }
    else {
      uint64_t v12 = 0x7FC000007F7FFFFFLL;
    }
  }

  decorator = self->_decorator;
  if (decorator)
  {
    uint64_t v14 = [(TUILayout *)decorator validatedIntrinsicWidth];
  }
  else
  {
    uint64_t v14 = 0x7FC000007FC00000;
    uint64_t v15 = 0x200007FC00000;
  }
  v17[0] = v5;
  v17[1] = v7;
  v17[2] = v12;
  v17[3] = 0x1700007FC00000;
  v17[4] = v14;
  v17[5] = v15;
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthSum((unint64_t)v17, 3);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  content = self->_content;
  if (content) {
    return [(TUILayout *)content validatedIntrinsicHeight];
  }
  else {
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
  }
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  [(TUILayout *)self containingHeight];
  double v6 = v5;
  [(TUILayout *)self->_content setContainingWidth:v4];
  [(TUILayout *)self->_content setContainingHeight:v6];
  [(TUILayout *)self->_content validateLayout];
  [(TUILayout *)self->_decorator setContainingWidth:v4];
  [(TUILayout *)self->_decorator setContainingHeight:v6];
  [(TUILayout *)self->_decorator validateLayout];
  __p = 0;
  v31 = 0;
  v32 = 0;
  content = self->_content;
  double v9 = (char *)sub_39FA0((uint64_t)&v32, 1uLL);
  BOOL v10 = &v9[8 * v8];
  *(void *)double v9 = content;
  float v11 = v9 + 8;
  v13 = (char *)__p;
  uint64_t v12 = v31;
  uint64_t v14 = v9;
  if (v31 != __p)
  {
    do
    {
      uint64_t v15 = *((void *)v12 - 1);
      v12 -= 8;
      *((void *)v14 - 1) = v15;
      v14 -= 8;
    }
    while (v12 != v13);
    uint64_t v12 = (char *)__p;
  }
  __p = v14;
  v31 = v9 + 8;
  v32 = &v9[8 * v8];
  if (v12)
  {
    operator delete(v12);
    BOOL v10 = v32;
  }
  v31 = v9 + 8;
  decorator = self->_decorator;
  if (v11 >= v10)
  {
    uint64_t v18 = (v11 - (unsigned char *)__p) >> 3;
    if ((unint64_t)(v18 + 1) >> 61) {
      sub_4484();
    }
    uint64_t v19 = v10 - (unsigned char *)__p;
    uint64_t v20 = v19 >> 2;
    if (v19 >> 2 <= (unint64_t)(v18 + 1)) {
      uint64_t v20 = v18 + 1;
    }
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v20;
    }
    if (v21) {
      v22 = (char *)sub_39FA0((uint64_t)&v32, v21);
    }
    else {
      v22 = 0;
    }
    v23 = (TUILayout **)&v22[8 * v18];
    v24 = &v22[8 * v21];
    *v23 = decorator;
    v17 = (char *)(v23 + 1);
    v26 = (char *)__p;
    v25 = v31;
    if (v31 != __p)
    {
      do
      {
        v27 = (TUILayout *)*((void *)v25 - 1);
        v25 -= 8;
        *--v23 = v27;
      }
      while (v25 != v26);
      v25 = (char *)__p;
    }
    __p = v23;
    v31 = v17;
    v32 = v24;
    if (v25) {
      operator delete(v25);
    }
  }
  else
  {
    *((void *)v9 + 1) = decorator;
    v17 = v9 + 16;
  }
  v31 = v17;
  v29[0] = __p;
  v29[1] = v17;
  double v28 = sub_39B10((uint64_t)v29);
  *(void *)&self->_heightAbovePivot = v29[2];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v28);
  if (__p)
  {
    v31 = (char *)__p;
    operator delete(__p);
  }
}

- (double)computedHeightAbovePivot
{
  return self->_heightAbovePivot;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  if (a3 < 4)
  {
    v37 = 0;
  }
  else
  {
    uint64_t v7 = [(TUILayout *)self model];
    [v6 contentsScale];
    double v9 = v8;
    BOOL v10 = [v6 renderModelForLayout:self->_content kind:6];
    [(TUILayout *)self->_content erasableInsetsForContentsScale:v9];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = [v6 renderModelForLayout:self->_decorator kind:6];
    double v39 = v16;
    double v40 = v14;
    double v41 = v12;
    uint64_t v20 = [v7 identifier];
    [(TUILayout *)self computedNaturalSize];
    double v23 = TUISizeRoundedForScale(v21, v22, v9);
    double v25 = v24;
    [(TUILayout *)self->_content computedOrigin];
    double v27 = v26;
    double v29 = v28;
    [(TUILayout *)self->_decorator computedOrigin];
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    [v7 padding];
    uint64_t v35 = v34;
    [v7 gradientWidth];
    v37 = +[TUIOverlayFadeView renderModelWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:](TUIOverlayFadeView, "renderModelWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:", v20, v10, v19, [(TUILayout *)self computedLayoutDirection], v23, v25, v27, v29, v41, v40, v39, v18, v31, v33, v35, v36);
  }
  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorator, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end