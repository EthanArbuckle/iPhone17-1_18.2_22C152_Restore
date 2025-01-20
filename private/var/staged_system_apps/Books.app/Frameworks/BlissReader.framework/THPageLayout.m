@interface THPageLayout
- (BOOL)dependentsRelyOnSize;
- (BOOL)isCompactFlowPresentation;
- (BOOL)isExpanded;
- (BOOL)isReflowablePresentation;
- (BOOL)wantsNormalBodyLayouts;
- (CGPoint)originOfCharacterIndex:(unint64_t)a3;
- (CGRect)bodyRectForChildLayout:(id)a3;
- (Class)repClassOverride;
- (NSArray)bodyLayouts;
- (NSArray)floatingDrawableLayouts;
- (THPageController)pageController;
- (THPageLayout)initWithInfo:(id)a3;
- (THWWidgetLayoutDelegate)delegate;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)computeLayoutGeometry;
- (id)firstChildTarget;
- (id)firstTarget;
- (id)floatingDrawableInfos;
- (id)insertValidatedChildLayoutForInfo:(id)a3;
- (id)lastChildTarget;
- (id)lastTarget;
- (id)p_insertChildLayoutForInfo:(id)a3;
- (id)p_orderedChildInfos;
- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3;
- (unint64_t)pageIndex;
- (unint64_t)relativePageIndex;
- (void)addAttachmentLayout:(id)a3;
- (void)dealloc;
- (void)p_addLayoutsForInfos:(id)a3 toArray:(id)a4;
- (void)p_insertBodyAndValidatedFloatingLayouts;
- (void)setDelegate:(id)a3;
- (void)validate;
- (void)wasAddedToLayoutController:(id)a3;
- (void)willBeRemovedFromLayoutController:(id)a3;
@end

@implementation THPageLayout

- (THPageLayout)initWithInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THPageLayout;
  v3 = [(THPageLayout *)&v5 initWithInfo:a3];
  if (v3) {
    v3->mBodyLayouts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v3;
}

- (void)dealloc
{
  self->mBodyLayouts = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPageLayout;
  [(THPageLayout *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
}

- (BOOL)isExpanded
{
  delegate = self->_delegate;
  if (delegate) {
    LOBYTE(delegate) = [(THWWidgetLayoutDelegate *)delegate widgetLayoutMode:self] == 1;
  }
  return (char)delegate;
}

- (BOOL)isCompactFlowPresentation
{
  objc_super v3 = [(THPageLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  objc_super v3 = [(THPageLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (Class)repClassOverride
{
  if (objc_msgSend(objc_msgSend(objc_msgSend(-[THPageLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", 0, &OBJC_PROTOCOL___THPageLayerAndSubviewHostProvider))
  {
    return (Class)objc_opt_class();
  }
  else
  {
    id v4 = [(THPageLayout *)self info];
    return (Class)[v4 repClass];
  }
}

- (unint64_t)relativePageIndex
{
  id v2 = [(THPageLayout *)self info];

  return (unint64_t)[v2 relativePageIndexInParent];
}

- (THPageController)pageController
{
  objc_opt_class();
  [(THPageLayout *)self parent];
  objc_super v3 = (void *)TSUDynamicCast();
  objc_opt_class();
  [v3 info];
  id v4 = (void *)TSUDynamicCast();
  if (!v4) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THPageLayout pageController]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayout.mm"] lineNumber:108 description:@"invalid nil value for '%s'", "parentSection"];
  }

  return (THPageController *)[v4 pageController];
}

- (NSArray)bodyLayouts
{
  return +[NSArray arrayWithArray:self->mBodyLayouts];
}

- (CGRect)bodyRectForChildLayout:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(a3, "info"), "geometry");

  [v3 boundsBeforeRotation];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)floatingDrawableInfos
{
  id v2 = [(THPageLayout *)self info];

  return [v2 floatingDrawables];
}

- (NSArray)floatingDrawableLayouts
{
  id v3 = (NSArray *)+[NSMutableArray array];
  [(THPageLayout *)self p_addLayoutsForInfos:[(THPageLayout *)self floatingDrawableInfos] toArray:v3];
  return v3;
}

- (void)addAttachmentLayout:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "info"), "owningAttachment"))
  {
    double v5 = 0;
LABEL_3:
    [(THPageLayout *)self insertChild:a3 atIndex:v5];
    [a3 updateChildrenFromInfo];
    return;
  }
  id v6 = [[self info] drawablesZOrder];
  id v7 = [v6 zOrderOfDrawable:[a3 info]];
  id v8 = [(THPageLayout *)self children];
  v9 = (char *)[v8 count];
  if (v9)
  {
    v10 = v9;
    double v5 = 0;
    while (1)
    {
      id v11 = objc_msgSend(v6, "zOrderOfDrawable:", objc_msgSend(objc_msgSend(v8, "objectAtIndex:", v5), "info"));
      if (v7 < v11) {
        break;
      }
      if (v7 == v11) {
        return;
      }
      if (v10 == ++v5)
      {
        double v5 = v10;
        break;
      }
    }
    if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_3;
    }
  }
}

- (unint64_t)pageIndex
{
  id v2 = [(THPageLayout *)self info];

  return (unint64_t)[v2 relativePageIndexInParent];
}

- (void)wasAddedToLayoutController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THPageLayout;
  [(THPageLayout *)&v4 wasAddedToLayoutController:a3];
  [(THPageController *)[(THPageLayout *)self pageController] i_registerPageLayout:self];
}

- (void)willBeRemovedFromLayoutController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THPageLayout;
  [(THPageLayout *)&v4 willBeRemovedFromLayoutController:a3];
  [(THPageController *)[(THPageLayout *)self pageController] i_unregisterPageLayout:self];
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  if (![self floatingDrawableInfos].containsObject:[a3 info])return 0; {

  }
  return [(THPageLayout *)self bodyLayouts];
}

- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(THPageLayout *)self bodyLayouts];
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v8) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v17;
  unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      id v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) firstCharacterIndexOverlappingPageRect:x, y, width, height];
      if ((unint64_t)v13 >= v11) {
        unint64_t v14 = v11;
      }
      else {
        unint64_t v14 = (unint64_t)v13;
      }
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v14 = (unint64_t)v13;
      }
      if (v13 != (id)0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v11 = v14;
      }
    }
    id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v9);
  return v11;
}

- (CGPoint)originOfCharacterIndex:(unint64_t)a3
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v5 = [(THPageLayout *)self bodyLayouts];
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v12 columnRange];
        if ((unint64_t)v13 <= a3 && (unint64_t)v13 + v14 >= a3 + 1)
        {
          long long v19 = v12;
          goto LABEL_22;
        }
        if (v14) {
          id v8 = v12;
        }
        v9 |= v14 != 0;
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    if (v9)
    {
      if (a3)
      {
        --a3;
        id v16 = [v8 columnRange];
        if (a3 >= (unint64_t)v16 && a3 - (unint64_t)v16 < v17)
        {
          long long v19 = v8;
LABEL_22:
          [v19 pageOriginOfCharacterIndex:a3];
          goto LABEL_26;
        }
        goto LABEL_24;
      }
      if ([(NSArray *)[(THPageLayout *)self bodyLayouts] count]) {
LABEL_24:
      }
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayout originOfCharacterIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayout.mm") lineNumber:304 description:@"Couldn't find character on page"];
    }
  }
  double x = CGPointZero.x;
  double y = CGPointZero.y;
LABEL_26:
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)p_orderedChildInfos
{
  id v3 = [(THPageLayout *)self info];
  id v4 = [objc_alloc((Class)NSMutableSet) initWithArray:[self floatingDrawableInfos]];
  [v4 addObjectsFromArray:[v3 modelBodyInfos]];
  id v5 = [[[v3 drawablesZOrder] orderedDrawables:v4] mutableCopy];

  return v5;
}

- (void)p_insertBodyAndValidatedFloatingLayouts
{
  id v3 = [[self info] modelBodyInfos];
  id v4 = [(THPageLayout *)self p_orderedChildInfos];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ([v3 containsObject:v9])
        {
          if ([(THPageLayout *)self wantsNormalBodyLayouts]) {
            [(THPageLayout *)self p_insertChildLayoutForInfo:v9];
          }
        }
        else
        {
          [(THPageLayout *)self insertValidatedChildLayoutForInfo:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)validate
{
  v12.receiver = self;
  v12.super_class = (Class)THPageLayout;
  [(THPageLayout *)&v12 validate];
  if (!self->mChildLayoutsValid)
  {
    [(THPageLayout *)self setChildren:0];
    [(THPageLayout *)self p_insertBodyAndValidatedFloatingLayouts];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [(THPageLayout *)self bodyLayouts];
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [self layoutController].validateLayoutWithDependencies:*(void *)(*((void *)&v8 + 1) + 8 * i);
        }
        id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
      }
      while (v5);
    }
    self->mChildLayoutsValid = 1;
  }
}

- (id)computeLayoutGeometry
{
  id v3 = [(THPageLayout *)self i_layoutGeometryProvider];
  if (v3)
  {
    return [v3 layoutGeometryForLayout:self];
  }
  else
  {
    id v4 = [self info].relativePageIndexInParent;
    id v5 = [[self info] geometry];
    double y = CGRectZero.origin.y;
    [v5 size];
    double v8 = v7;
    double v10 = v9;
    -[THPageController pageOriginForRelativePageIndex:pageFrame:]([(THPageLayout *)self pageController], "pageOriginForRelativePageIndex:pageFrame:", v4, CGRectZero.origin.x, y, v7, v9);
    id v13 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v11, v12, v8, v10];
    return v13;
  }
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (id)p_insertChildLayoutForInfo:(id)a3
{
  id v5 = [[-[THPageLayout layoutController](self, "layoutController")] layoutForInfo:a3 childOfLayout:self];
  if (!v5)
  {
    id v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "layoutClass")), "initWithInfo:", a3);
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(NSMutableArray *)self->mBodyLayouts addObject:v5];
      }
      [(THPageLayout *)self addChild:v5];
      id v6 = v5;
    }
  }
  return v5;
}

- (id)insertValidatedChildLayoutForInfo:(id)a3
{
  id v4 = [(THPageLayout *)self p_insertChildLayoutForInfo:a3];
  id v5 = v4;
  if (v4)
  {
    [v4 updateChildrenFromInfo];
    [self layoutController].validateLayoutWithDependencies:v5];
  }
  return v5;
}

- (void)p_addLayoutsForInfos:(id)a3 toArray:(id)a4
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a3);
        }
        [a4 addObject:[self p_insertChildLayoutForInfo:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)]];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)wantsNormalBodyLayouts
{
  return 1;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (id)firstTarget
{
  v4.receiver = self;
  v4.super_class = (Class)THPageLayout;
  id result = [(THPageLayout *)&v4 firstTarget];
  if (!result) {
    return [[THGuidedPanPageTarget alloc] initWithLayout:self targeted:1];
  }
  return result;
}

- (id)firstChildTarget
{
  v3.receiver = self;
  v3.super_class = (Class)THPageLayout;
  return [(THPageLayout *)&v3 firstTarget];
}

- (id)lastTarget
{
  v4.receiver = self;
  v4.super_class = (Class)THPageLayout;
  id result = [(THPageLayout *)&v4 lastTarget];
  if (!result) {
    return [[THGuidedPanPageTarget alloc] initWithLayout:self targeted:1];
  }
  return result;
}

- (id)lastChildTarget
{
  v3.receiver = self;
  v3.super_class = (Class)THPageLayout;
  return [(THPageLayout *)&v3 lastTarget];
}

@end