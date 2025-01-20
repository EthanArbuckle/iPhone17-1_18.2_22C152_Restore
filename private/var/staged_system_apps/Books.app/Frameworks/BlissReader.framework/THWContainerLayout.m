@interface THWContainerLayout
- (BOOL)allowsConnections;
- (BOOL)hasAlpha;
- (BOOL)isHTMLWrap;
- (BOOL)supportsInspectorPositioning;
- (CGRect)boundsInfluencingExteriorWrap;
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
- (void)updateChildrenFromInfo;
@end

@implementation THWContainerLayout

- (void)dealloc
{
  self->mCachedWrapPolygon = 0;
  self->mCachedWrapPath = 0;

  self->mCachedExternalWrapPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWContainerLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (id)childrenForLayout
{
  id v3 = [(THWContainerLayout *)self childInfosForLayout];
  id result = [(THWContainerLayout *)self additionalLayouts];
  if (v3 && result)
  {
    return [v3 arrayByAddingObjectsFromArray:result];
  }
  else
  {
    if (result) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (!v5) {
      return v3;
    }
  }
  return result;
}

- (void)updateChildrenFromInfo
{
  id v3 = [(THWContainerLayout *)self childrenForLayout];
  id v4 = [(THWContainerLayout *)self children];
  if (v4 && (id v5 = [v3 count], v5 == objc_msgSend(v4, "count")))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v3);
          }
          id v10 = *(id *)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          uint64_t v11 = TSUDynamicCast();
          id v12 = [v4 objectAtIndex:0];
          if (v11)
          {
            if (v12 != (id)v11) {
              goto LABEL_15;
            }
          }
          else if ([v12 info] != v10)
          {
            goto LABEL_15;
          }
        }
        id v7 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }
  }
  else
  {
LABEL_15:
    id v21 = v4;
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
    id v14 = [(THWContainerLayout *)self layoutController];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = (char *)[v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v3);
          }
          objc_opt_class();
          id v19 = (id)TSUDynamicCast();
          if (!v19)
          {
            v20 = (void *)TSUProtocolCast();
            id v19 = [v14 layoutForInfo:v20 childOfLayout:self];
            if (!v19)
            {
              id v19 = objc_msgSend(objc_alloc((Class)objc_msgSend(v20, "layoutClass")), "initWithInfo:", v20);
              [(THWContainerLayout *)self childLayoutCreated:v19];
              if (!v19) {
                continue;
              }
            }
          }
          [v13 addObject:v19];
        }
        v16 = (char *)[v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }
    [(THWContainerLayout *)self setChildren:v13];

    [(THWContainerLayout *)self invalidate];
    id v4 = v21;
  }

  [self.children makeObjectsPerformSelector:@"updateChildrenFromInfo"];
}

- (id)additionalLayouts
{
  return +[NSArray array];
}

- (id)i_exteriorTextWrap
{
  [(THWContainerLayout *)self info];
  id v2 = [(id)TSUProtocolCast() adornmentInfo];

  return [v2 exteriorTextWrap];
}

- (CGRect)boundsInfluencingExteriorWrap
{
  [(THWContainerLayout *)self frameInRoot];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  id v11 = [(THWContainerLayout *)self i_exteriorTextWrap];
  if (v11)
  {
    [v11 margin];
    if (v12 > 0.0)
    {
      CGFloat v13 = -v12;
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      CGRect v19 = CGRectInset(v18, v13, v13);
      CGFloat x = v19.origin.x;
      CGFloat y = v19.origin.y;
      CGFloat width = v19.size.width;
      CGFloat height = v19.size.height;
    }
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)i_computeWrapPath
{
  [self geometry].size;
  TSDRectWithSize();

  return +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
}

- (id)i_wrapPath
{
  id result = self->mCachedWrapPath;
  if (!result)
  {
    id result = [(THWContainerLayout *)self i_computeWrapPath];
    self->mCachedWrapPath = (TSDBezierPath *)result;
  }
  return result;
}

- (id)i_externalWrapPath
{
  id result = self->mCachedExternalWrapPath;
  if (!result)
  {
    id result = +[TSDBezierPath exteriorOfBezierPath:[(THWContainerLayout *)self i_wrapPath]];
    self->mCachedExternalWrapPath = (TSDBezierPath *)result;
  }
  return result;
}

- (id)wrapPolygon
{
  id result = self->mCachedWrapPolygon;
  if (!result)
  {
    id v4 = [(THWContainerLayout *)self i_wrapPath];
    id v5 = [(THWContainerLayout *)self i_exteriorTextWrap];
    if (v5 && (id v6 = v5, [v5 margin], v7 > 0.0))
    {
      if ((uint64_t)[(TSDBezierPath *)v4 elementCount] >= 1001)
      {
        [self geometry].size
        TSDRectWithSize();
        id v4 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
      }
      [v6 margin];
      id v8 = -[TSDBezierPath bezierPathByOffsettingPath:joinStyle:withThreshold:](v4, "bezierPathByOffsettingPath:joinStyle:withThreshold:", 1);
    }
    else
    {
      id v8 = [(TSDBezierPath *)v4 copy];
    }
    double v9 = v8;
    [(THWContainerLayout *)self transformInRoot];
    [v9 transformUsingAffineTransform:v11];
    id v10 = (TSDWrapPolygon *)[objc_alloc((Class)TSDWrapPolygon) initWithPath:v9];
    self->mCachedWrapPolygon = v10;
    [(TSDWrapPolygon *)v10 setIntersectsSelf:0];
    id result = self->mCachedWrapPolygon;
    if (!result)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWContainerLayout wrapPolygon]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWContainerLayout.m") lineNumber:232 description:@"invalid nil value for '%s'", "mCachedWrapPolygon"];
      return self->mCachedWrapPolygon;
    }
  }
  return result;
}

- (BOOL)isHTMLWrap
{
  id v2 = [(THWContainerLayout *)self i_exteriorTextWrap];
  if (v2)
  {
    LOBYTE(v2) = [v2 isHTMLWrap];
  }
  return (char)v2;
}

- (int)wrapType
{
  id v2 = [(THWContainerLayout *)self i_exteriorTextWrap];
  if (v2)
  {
    LODWORD(v2) = [v2 type];
  }
  return (int)v2;
}

- (int)wrapDirection
{
  id v2 = [(THWContainerLayout *)self i_exteriorTextWrap];
  if (!v2) {
    return 2;
  }

  return [v2 direction];
}

- (int)wrapFitType
{
  id v2 = [(THWContainerLayout *)self i_exteriorTextWrap];
  if (v2)
  {
    LODWORD(v2) = [v2 fitType];
  }
  return (int)v2;
}

- (BOOL)hasAlpha
{
  return 0;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)THWContainerLayout;
  [(THWContainerLayout *)&v3 invalidate];
  [(THWContainerLayout *)self invalidateParentForWrap];
}

- (void)invalidateExteriorWrap
{
  self->mCachedWrapPolygon = 0;
  self->mCachedWrapPath = 0;

  self->mCachedExternalWrapPath = 0;
}

- (void)dragBy:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWContainerLayout;
  -[THWContainerLayout dragBy:](&v4, "dragBy:", a3.x, a3.y);
  [(THWContainerLayout *)self invalidateParentForWrap];
}

- (void)setGeometry:(id)a3
{
  id v5 = [(THWContainerLayout *)self geometry];
  if (!v5)
  {
    if (!self->mCachedWrapPolygon) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  id v6 = v5;
  if (([v5 isEqual:a3] & 1) != 0 || !self->mCachedWrapPolygon) {
    goto LABEL_11;
  }
  if ([v6 differsInMoreThanTranslationFrom:a3])
  {
LABEL_8:
    [(THWContainerLayout *)self invalidateExteriorWrap];
    goto LABEL_11;
  }
  if (a3)
  {
    [a3 transform];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
  }
  [v6 transform:CGPointZero.y, v7, CGPointZero.x, CGPointZero.y];
  TSDSubtractPoints();
  mCachedWrapPolygon = self->mCachedWrapPolygon;
  CGAffineTransformMakeTranslation(&v12, v9, v10);
  [(TSDWrapPolygon *)mCachedWrapPolygon transformUsingAffineTransform:&v12];
LABEL_11:
  v11.receiver = self;
  v11.super_class = (Class)THWContainerLayout;
  [(THWContainerLayout *)&v11 setGeometry:a3];
}

- (void)processChangedProperty:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWContainerLayout;
  -[THWContainerLayout processChangedProperty:](&v5, "processChangedProperty:");
  if (a3 == 521) {
    [(THWContainerLayout *)self invalidateExteriorWrap];
  }
}

- (void)parentDidChange
{
  [(THWContainerLayout *)self invalidateExteriorWrap];
  v3.receiver = self;
  v3.super_class = (Class)THWContainerLayout;
  [(THWContainerLayout *)&v3 parentDidChange];
}

- (BOOL)allowsConnections
{
  return 1;
}

- (void)i_invalidateWrap
{
  id v3 = [(THWContainerLayout *)self parent];
  if (v3)
  {
    id v4 = v3;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v4 = [v4 parent];
      if (!v4) {
        return;
      }
    }
    [v4 wrappableChildInvalidated:self];
  }
}

- (void)invalidateParentForWrap
{
  if ([(THWContainerLayout *)self isBeingManipulated])
  {
    [(THWContainerLayout *)self i_invalidateWrap];
  }
}

- (BOOL)supportsInspectorPositioning
{
  if (objc_msgSend(-[THWContainerLayout info](self, "info"), "isAnchoredToText")
    && (objc_msgSend(-[THWContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap"), "isHTMLWrap") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [self info].isInlineWithText ^ 1;
  }
}

@end