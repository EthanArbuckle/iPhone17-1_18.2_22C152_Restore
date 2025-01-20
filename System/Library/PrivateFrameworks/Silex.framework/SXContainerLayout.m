@interface SXContainerLayout
- (BOOL)allowsConnections;
- (BOOL)hasAlpha;
- (BOOL)isHTMLWrap;
- (BOOL)supportsInspectorPositioning;
- (CGRect)boundsInfluencingExteriorWrap;
- (NSMutableArray)oldchildLayouts;
- (id)additionalLayouts;
- (id)childrenForLayout;
- (id)i_computeWrapPath;
- (id)i_exteriorTextWrap;
- (id)i_externalWrapPath;
- (id)i_wrapPath;
- (id)wrapPolygon;
- (int)wrapDirection;
- (int)wrapFitType;
- (int)wrapType;
- (void)dealloc;
- (void)dragBy:(CGPoint)a3;
- (void)i_invalidateWrap;
- (void)invalidate;
- (void)invalidateExteriorWrap;
- (void)invalidateParentForWrap;
- (void)parentDidChange;
- (void)processChangedProperty:(int)a3;
- (void)setGeometry:(id)a3;
- (void)setOldchildLayouts:(id)a3;
- (void)updateChildrenFromInfo;
@end

@implementation SXContainerLayout

- (void)dealloc
{
  mCachedWrapPolygon = self->mCachedWrapPolygon;
  self->mCachedWrapPolygon = 0;

  mCachedWrapPath = self->mCachedWrapPath;
  self->mCachedWrapPath = 0;

  mCachedExternalWrapPath = self->mCachedExternalWrapPath;
  self->mCachedExternalWrapPath = 0;

  v6.receiver = self;
  v6.super_class = (Class)SXContainerLayout;
  [(TSDLayout *)&v6 dealloc];
}

- (id)childrenForLayout
{
  v3 = [(TSDContainerLayout *)self childInfosForLayout];
  v4 = [(SXContainerLayout *)self additionalLayouts];
  id v5 = v3;
  objc_super v6 = v5;
  if (v5 && v4)
  {
    id v7 = [v5 arrayByAddingObjectsFromArray:v4];
  }
  else
  {
    id v7 = v5;
    if (!v5)
    {
      id v7 = 0;
      if (v4) {
        id v7 = v4;
      }
    }
  }

  return v7;
}

- (void)updateChildrenFromInfo
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = [(SXContainerLayout *)self childrenForLayout];
  v26 = [(TSDAbstractLayout *)self children];
  if (!v26) {
    goto LABEL_17;
  }
  uint64_t v4 = [v3 count];
  if (v4 != [v26 count]) {
    goto LABEL_17;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        v11 = TSUDynamicCast();
        v12 = [v26 objectAtIndex:0];
        v13 = v12;
        if (v11)
        {
          if (v12 != v11)
          {

LABEL_16:
LABEL_17:
            id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
            v15 = [(TSDLayout *)self layoutController];
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            v25 = v3;
            id v16 = v3;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (!v17) {
              goto LABEL_29;
            }
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v28;
            while (2)
            {
              uint64_t v20 = 0;
LABEL_20:
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              objc_opt_class();
              v21 = TSUDynamicCast();
              if (v21) {
                goto LABEL_26;
              }
              v22 = TSUProtocolCast();
              uint64_t v23 = [v15 layoutForInfo:v22 childOfLayout:self];
              if (v23)
              {
                v21 = (void *)v23;

                goto LABEL_26;
              }
              v21 = objc_msgSend(objc_alloc((Class)objc_msgSend(v22, "layoutClass")), "initWithInfo:", v22);
              [(SXContainerLayout *)self childLayoutCreated:v21];

              if (v21)
              {
LABEL_26:
                objc_msgSend(v5, "addObject:", v21, v25);
              }
              if (v18 == ++v20)
              {
                uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
                if (!v18)
                {
LABEL_29:

                  [(TSDAbstractLayout *)self setChildren:v5];
                  [(SXContainerLayout *)self invalidate];

                  v3 = v25;
                  goto LABEL_30;
                }
                continue;
              }
              goto LABEL_20;
            }
          }
        }
        else
        {
          v14 = [v12 info];

          if (v14 != v10) {
            goto LABEL_16;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }
LABEL_30:

  v24 = [(TSDAbstractLayout *)self children];
  [v24 makeObjectsPerformSelector:sel_updateChildrenFromInfo];
}

- (id)additionalLayouts
{
  return (id)[MEMORY[0x263EFF8C0] array];
}

- (id)i_exteriorTextWrap
{
  return 0;
}

- (CGRect)boundsInfluencingExteriorWrap
{
  [(TSDAbstractLayout *)self frameInRoot];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  v11 = [(SXContainerLayout *)self i_exteriorTextWrap];
  v12 = v11;
  if (v11)
  {
    [v11 margin];
    if (v13 > 0.0)
    {
      CGFloat v14 = -v13;
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      CGRect v20 = CGRectInset(v19, v14, v14);
      CGFloat x = v20.origin.x;
      CGFloat y = v20.origin.y;
      CGFloat width = v20.size.width;
      CGFloat height = v20.size.height;
    }
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)i_computeWrapPath
{
  v2 = (void *)MEMORY[0x263F7C690];
  double v3 = [(TSDAbstractLayout *)self geometry];
  [v3 size];
  TSDRectWithSize();
  uint64_t v4 = objc_msgSend(v2, "bezierPathWithRect:");

  return v4;
}

- (id)i_wrapPath
{
  mCachedWrapPath = self->mCachedWrapPath;
  if (!mCachedWrapPath)
  {
    uint64_t v4 = [(SXContainerLayout *)self i_computeWrapPath];
    double v5 = self->mCachedWrapPath;
    self->mCachedWrapPath = v4;

    mCachedWrapPath = self->mCachedWrapPath;
  }
  return mCachedWrapPath;
}

- (id)i_externalWrapPath
{
  mCachedExternalWrapPath = self->mCachedExternalWrapPath;
  if (!mCachedExternalWrapPath)
  {
    uint64_t v4 = (void *)MEMORY[0x263F7C690];
    double v5 = [(SXContainerLayout *)self i_wrapPath];
    uint64_t v6 = [v4 exteriorOfBezierPath:v5];
    double v7 = self->mCachedExternalWrapPath;
    self->mCachedExternalWrapPath = v6;

    mCachedExternalWrapPath = self->mCachedExternalWrapPath;
  }
  return mCachedExternalWrapPath;
}

- (id)wrapPolygon
{
  mCachedWrapPolygon = self->mCachedWrapPolygon;
  if (!mCachedWrapPolygon)
  {
    uint64_t v4 = [(SXContainerLayout *)self i_wrapPath];
    double v5 = [(SXContainerLayout *)self i_exteriorTextWrap];
    uint64_t v6 = v5;
    if (v5 && ([v5 margin], v7 > 0.0))
    {
      if ([v4 elementCount] >= 1001)
      {
        uint64_t v8 = (void *)MEMORY[0x263F7C690];
        double v9 = [(TSDAbstractLayout *)self geometry];
        [v9 size];
        TSDRectWithSize();
        uint64_t v10 = objc_msgSend(v8, "bezierPathWithRect:");

        uint64_t v4 = (void *)v10;
      }
      [v6 margin];
      uint64_t v11 = objc_msgSend(v4, "bezierPathByOffsettingPath:joinStyle:withThreshold:", 1);
    }
    else
    {
      uint64_t v11 = [v4 copy];
    }
    v12 = (void *)v11;

    [(TSDAbstractLayout *)self transformInRoot];
    [v12 transformUsingAffineTransform:v19];
    double v13 = (TSDWrapPolygon *)[objc_alloc(MEMORY[0x263F7C6F0]) initWithPath:v12];
    CGFloat v14 = self->mCachedWrapPolygon;
    self->mCachedWrapPolygon = v13;

    [(TSDWrapPolygon *)self->mCachedWrapPolygon setIntersectsSelf:0];
    mCachedWrapPolygon = self->mCachedWrapPolygon;
    if (!mCachedWrapPolygon)
    {
      double v15 = [MEMORY[0x263F7C7F0] currentHandler];
      double v16 = [NSString stringWithUTF8String:"-[SXContainerLayout wrapPolygon]"];
      double v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXContainerLayout.m"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 225, @"invalid nil value for '%s'", "mCachedWrapPolygon");

      mCachedWrapPolygon = self->mCachedWrapPolygon;
    }
  }
  return mCachedWrapPolygon;
}

- (BOOL)isHTMLWrap
{
  v2 = [(SXContainerLayout *)self i_exteriorTextWrap];
  double v3 = v2;
  if (v2) {
    char v4 = [v2 isHTMLWrap];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (int)wrapType
{
  v2 = [(SXContainerLayout *)self i_exteriorTextWrap];
  double v3 = v2;
  if (v2) {
    int v4 = [v2 type];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)wrapDirection
{
  v2 = [(SXContainerLayout *)self i_exteriorTextWrap];
  double v3 = v2;
  if (v2) {
    int v4 = [v2 direction];
  }
  else {
    int v4 = 2;
  }

  return v4;
}

- (int)wrapFitType
{
  v2 = [(SXContainerLayout *)self i_exteriorTextWrap];
  double v3 = v2;
  if (v2) {
    int v4 = [v2 fitType];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAlpha
{
  return 0;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)SXContainerLayout;
  [(TSDLayout *)&v3 invalidate];
  [(SXContainerLayout *)self invalidateParentForWrap];
}

- (void)invalidateExteriorWrap
{
  mCachedWrapPolygon = self->mCachedWrapPolygon;
  self->mCachedWrapPolygon = 0;

  mCachedWrapPath = self->mCachedWrapPath;
  self->mCachedWrapPath = 0;

  mCachedExternalWrapPath = self->mCachedExternalWrapPath;
  self->mCachedExternalWrapPath = 0;
}

- (void)dragBy:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SXContainerLayout;
  -[TSDLayout dragBy:](&v4, sel_dragBy_, a3.x, a3.y);
  [(SXContainerLayout *)self invalidateParentForWrap];
}

- (void)setGeometry:(id)a3
{
  id v4 = a3;
  double v5 = [(TSDAbstractLayout *)self geometry];
  uint64_t v6 = v5;
  if (!v5)
  {
    if (!self->mCachedWrapPolygon) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if (([v5 isEqual:v4] & 1) != 0 || !self->mCachedWrapPolygon) {
    goto LABEL_11;
  }
  if ([v6 differsInMoreThanTranslationFrom:v4])
  {
LABEL_8:
    [(SXContainerLayout *)self invalidateExteriorWrap];
    goto LABEL_11;
  }
  if (v4)
  {
    [v4 transform];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
  }
  objc_msgSend(v6, "transform", *(void *)(MEMORY[0x263F00148] + 8), v7, *MEMORY[0x263F00148], *(void *)(MEMORY[0x263F00148] + 8));
  TSDSubtractPoints();
  mCachedWrapPolygon = self->mCachedWrapPolygon;
  CGAffineTransformMakeTranslation(&v12, v9, v10);
  [(TSDWrapPolygon *)mCachedWrapPolygon transformUsingAffineTransform:&v12];
LABEL_11:
  v11.receiver = self;
  v11.super_class = (Class)SXContainerLayout;
  [(TSDAbstractLayout *)&v11 setGeometry:v4];
}

- (void)processChangedProperty:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXContainerLayout;
  -[TSDLayout processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 521) {
    [(SXContainerLayout *)self invalidateExteriorWrap];
  }
}

- (void)parentDidChange
{
  [(SXContainerLayout *)self invalidateExteriorWrap];
  v3.receiver = self;
  v3.super_class = (Class)SXContainerLayout;
  [(TSDLayout *)&v3 parentDidChange];
}

- (BOOL)allowsConnections
{
  return 1;
}

- (void)i_invalidateWrap
{
  uint64_t v3 = [(TSDAbstractLayout *)self parent];
  if (v3)
  {
    while (1)
    {
      id v5 = (id)v3;
      if (objc_opt_respondsToSelector()) {
        break;
      }
      uint64_t v4 = [v5 parent];

      uint64_t v3 = v4;
      if (!v4) {
        return;
      }
    }
    [v5 wrappableChildInvalidated:self];
  }
}

- (void)invalidateParentForWrap
{
  if ([(TSDLayout *)self isBeingManipulated])
  {
    [(SXContainerLayout *)self i_invalidateWrap];
  }
}

- (BOOL)supportsInspectorPositioning
{
  uint64_t v4 = [(TSDLayout *)self info];
  int v5 = [v4 isAnchoredToText];
  if (v5)
  {
    v2 = [(SXContainerLayout *)self i_exteriorTextWrap];
    if ([v2 isHTMLWrap])
    {
      LOBYTE(v6) = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  uint64_t v7 = [(TSDLayout *)self info];
  int v6 = [v7 isInlineWithText] ^ 1;

  if (v5) {
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (NSMutableArray)oldchildLayouts
{
  return self->_oldchildLayouts;
}

- (void)setOldchildLayouts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldchildLayouts, 0);
  objc_storeStrong((id *)&self->mCachedExternalWrapPath, 0);
  objc_storeStrong((id *)&self->mCachedWrapPath, 0);
  objc_storeStrong((id *)&self->mCachedWrapPolygon, 0);
}

@end