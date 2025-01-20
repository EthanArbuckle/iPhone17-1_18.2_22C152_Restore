@interface THFlowPageLayout
- (BOOL)caresAboutStorageChanges;
- (BOOL)invalidateOnExactTextRangeLayout;
- (BOOL)isMaxXEdgeObscured;
- (BOOL)p_isGutterInfo:(id)a3 assgnedToBodyLayout:(id)a4;
- (BOOL)p_isGutterInfoAssigned:(id)a3;
- (BOOL)wantsNormalBodyLayouts;
- (CGPoint)originOfCharacterIndex:(unint64_t)a3;
- (CGRect)bodyRectForChildLayout:(id)a3;
- (CGSize)maximumFrameSizeForChild:(id)a3;
- (Class)repClassOverride;
- (THFlowPageLayout)initWithInfo:(id)a3;
- (THModelBodyTextInfo)bodyInfo;
- (TSUPointerKeyDictionary)assignedGutterLayouts;
- (_NSRange)firstLineInRect:(CGRect)a3 fromCharIndex:(unint64_t)a4;
- (double)p_heightOfGutterDrawablesForBodyLayout:(id)a3;
- (double)p_offsetForGutterDrawableLayout:(id)a3 forBody:(id)a4 atOffset:(double)a5;
- (double)p_placeCompactGutterDrawableLayout:(id)a3 forBody:(id)a4 atOffset:(double)a5;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5;
- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4;
- (id)computeLayoutGeometry;
- (id)dependentLayouts;
- (id)gutterDrawableStorage;
- (id)layoutGeometryForLayout:(id)a3;
- (id)lineHintsForTarget:(id)a3;
- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)sortedGutterDrawables;
- (id)textWrapper;
- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3;
- (void)canvasDidScroll;
- (void)dealloc;
- (void)layoutContentAtBodyIndex:(unint64_t)a3 offsetFromTop:(double)a4 padAbove:(double *)a5 padBelow:(double *)a6;
- (void)layoutContentFromBottom:(double *)a3;
- (void)layoutContentFromTop:(double *)a3;
- (void)p_assignGutterInfo:(id)a3 toBodyLayout:(id)a4;
- (void)p_layoutBodyLayout:(id)a3;
- (void)p_layoutContentDownwardFromBodyIndex:(unint64_t)a3 amount:(double *)a4;
- (void)p_layoutContentUpwardFromBodyIndex:(unint64_t)a3 amount:(double *)a4;
- (void)p_layoutGutterDrawables;
- (void)p_layoutGutterDrawablesForBodyLayout:(id)a3;
- (void)p_layoutNextBodyLayout;
- (void)p_placeGutterDrawableLayout:(id)a3 withPositioning:(id)a4 inColumn:(id)a5 inBody:(id)a6;
- (void)setAssignedGutterLayouts:(id)a3;
- (void)setMaxXEdgeObscured:(BOOL)a3;
- (void)validate;
- (void)wasAddedToLayoutController:(id)a3;
- (void)willBeRemovedFromLayoutController:(id)a3;
@end

@implementation THFlowPageLayout

- (THFlowPageLayout)initWithInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THFlowPageLayout;
  v3 = [(THPageLayout *)&v6 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(-[THFlowPageLayout info](v3, "info"), "autosizes") & 1) == 0) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout initWithInfo:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:69 description:@"flow pages must autosize"];
    }
    v4->mLayoutManager = (TSWPLayoutManager *)[objc_alloc((Class)TSWPLayoutManager) initWithStorage:[-[THFlowPageLayout info](v4, "info") bodyStorage] owner:v4];
    v4->mFirstBodyIndexNeedingGutterLayout = 0x7FFFFFFFFFFFFFFFLL;
    v4->_assignedGutterLayouts = (TSUPointerKeyDictionary *)objc_alloc_init((Class)TSUPointerKeyDictionary);
  }
  return v4;
}

- (void)dealloc
{
  if (self->mLayoutTimer) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:80 description:@"layout timer should have been destroyed when we were removed from the layout controller"];
  }

  self->mLayoutManager = 0;
  self->mSortedGutterDrawables = 0;

  self->_assignedGutterLayouts = 0;
  v3.receiver = self;
  v3.super_class = (Class)THFlowPageLayout;
  [(THPageLayout *)&v3 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (THModelBodyTextInfo)bodyInfo
{
  id v2 = [[self info] modelBodyInfos];
  if ([v2 count] != (char *)&dword_0 + 1) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout bodyInfo]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:99 description:@"should only have one body info"];
  }
  objc_opt_class();
  [v2 lastObject];

  return (THModelBodyTextInfo *)TSUCheckedDynamicCast();
}

- (BOOL)wantsNormalBodyLayouts
{
  return 0;
}

- (id)dependentLayouts
{
  return 0;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  return 0;
}

- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = [(THPageLayout *)self bodyLayouts];
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) firstCharacterIndexOverlappingPageRect:x, y, width, height];
        if (v13 != (id)0x7FFFFFFFFFFFFFFFLL) {
          return (unint64_t)v13;
        }
      }
      id v10 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v9;
}

- (CGRect)bodyRectForChildLayout:(id)a3
{
  v4 = [(THPageLayout *)self pageController];
  uint64_t v5 = [a3 bodyIndex];

  [(THPageController *)v4 i_rectForBodyIndex:v5];
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (CGPoint)originOfCharacterIndex:(unint64_t)a3
{
  CGFloat x = CGPointZero.x;
  CGFloat y = CGPointZero.y;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  mBodyLayouts = self->super.mBodyLayouts;
  id v8 = [(NSMutableArray *)mBodyLayouts countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(mBodyLayouts);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v13 = -[THPageController i_textRangeForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_textRangeForBodyIndex:", [v12 bodyIndex]);
        if (a3 >= (unint64_t)v13 && a3 - (unint64_t)v13 < v14)
        {
          [(THFlowPageLayout *)self p_layoutBodyLayout:v12];
          [(THFlowPageLayout *)self p_layoutGutterDrawables];
          [v12 pageOriginOfCharacterIndex:a3];
          CGFloat x = v16;
          CGFloat y = v17;
          goto LABEL_13;
        }
      }
      id v9 = [(NSMutableArray *)mBodyLayouts countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
LABEL_13:
  double v18 = x;
  double v19 = y;
  result.CGFloat y = v19;
  result.CGFloat x = v18;
  return result;
}

- (void)layoutContentAtBodyIndex:(unint64_t)a3 offsetFromTop:(double)a4 padAbove:(double *)a5 padBelow:(double *)a6
{
  if (![(NSMutableArray *)self->super.mBodyLayouts count]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout layoutContentAtBodyIndex:offsetFromTop:padAbove:padBelow:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:170 description:@"must have body layouts to layout into"];
  }
  if ((unint64_t)[(NSMutableArray *)self->super.mBodyLayouts count] <= a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout layoutContentAtBodyIndex:offsetFromTop:padAbove:padBelow:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:171 description:@"invalid body index"];
  }
  if ((unint64_t)[(NSMutableArray *)self->super.mBodyLayouts count] > a3)
  {
    id v11 = [(NSMutableArray *)self->super.mBodyLayouts objectAtIndex:a3];
    [(THFlowPageLayout *)self p_layoutBodyLayout:v11];
    *a5 = *a5 - a4;
    [v11 textHeight];
    *a6 = *a6 - (v12 - a4);
    if (a3) {
      [(THFlowPageLayout *)self p_layoutContentUpwardFromBodyIndex:a3 - 1 amount:a5];
    }
    double v13 = *a5;
    if (*a5 > 0.0)
    {
      [(THPageController *)[(THPageLayout *)self pageController] bodyOffset];
      double v13 = *a5 - v14;
      *a5 = v13;
    }
    unint64_t v15 = a3 + 1;
    if (v15 < (unint64_t)[(NSMutableArray *)self->super.mBodyLayouts count]) {
      [(THFlowPageLayout *)self p_layoutContentDownwardFromBodyIndex:v15 amount:a6];
    }
  }
  [(THFlowPageLayout *)self p_layoutGutterDrawables];
  [(THPageController *)[(THPageLayout *)self pageController] i_gutterOverhang];
  *a6 = *a6 - v16;
}

- (void)layoutContentFromBottom:(double *)a3
{
  if (![(NSMutableArray *)self->super.mBodyLayouts count]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout layoutContentFromBottom:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:205 description:@"must have body layouts to layout into"];
  }
  if ([(NSMutableArray *)self->super.mBodyLayouts count])
  {
    [(THFlowPageLayout *)self p_layoutContentUpwardFromBodyIndex:(char *)[(NSMutableArray *)self->super.mBodyLayouts count] - 1 amount:a3];
    if (*a3 > 0.0)
    {
      [(THPageController *)[(THPageLayout *)self pageController] bodyOffset];
      *a3 = *a3 - v5;
    }
  }
}

- (void)layoutContentFromTop:(double *)a3
{
  if (![(NSMutableArray *)self->super.mBodyLayouts count]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout layoutContentFromTop:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:220 description:@"must have body layouts to layout into"];
  }
  if ([(NSMutableArray *)self->super.mBodyLayouts count])
  {
    [(THPageController *)[(THPageLayout *)self pageController] bodyOffset];
    *a3 = *a3 - v5;
    [(THFlowPageLayout *)self p_layoutContentDownwardFromBodyIndex:0 amount:a3];
  }
}

- (_NSRange)firstLineInRect:(CGRect)a3 fromCharIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (![(NSMutableArray *)self->super.mBodyLayouts count])
  {
    id v10 = +[TSUAssertionHandler currentHandler];
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout firstLineInRect:fromCharIndex:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"];
    double v13 = v11;
    unint64_t v4 = a4;
    [v10 handleFailureInFunction:v13 file:v12 lineNumber:232 description:@"must have body layouts to lookup line ranges"];
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v14 = [(NSMutableArray *)self->super.mBodyLayouts copy];
  id v15 = [v14 countByEnumeratingWithState:&v50 objects:v54 count:16];
  uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v15)
  {
    NSUInteger v40 = 0;
    goto LABEL_27;
  }
  id v16 = v15;
  NSUInteger v45 = 0;
  id v46 = v14;
  uint64_t v17 = *(void *)v51;
  uint64_t v48 = *(void *)v51;
  while (2)
  {
    double v18 = 0;
    id v49 = v16;
    do
    {
      if (*(void *)v51 != v17) {
        objc_enumerationMutation(v14);
      }
      double v19 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v18);
      -[THPageController i_rectForBodyIndex:](-[THPageLayout pageController](self, "pageController", v44), "i_rectForBodyIndex:", [v19 bodyIndex]);
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      id v28 = -[THPageController i_textRangeForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_textRangeForBodyIndex:", [v19 bodyIndex]);
      if ((unint64_t)v28 + v29 > v4)
      {
        v56.origin.CGFloat x = v21;
        v56.origin.CGFloat y = v23;
        v56.size.CGFloat width = v25;
        v56.size.CGFloat height = v27;
        double MaxY = CGRectGetMaxY(v56);
        v57.origin.CGFloat x = x;
        v57.origin.CGFloat y = y;
        v57.size.CGFloat width = width;
        v57.size.CGFloat height = height;
        if (MaxY > CGRectGetMinY(v57))
        {
          if ([v19 isLaidOut])
          {
            id v31 = [[v19 columns] lastObject];
            if (v31)
            {
              v32 = v31;
              id v33 = [v31 range];
              id v34 = (id)v4;
              if ((unint64_t)v33 >= v4) {
                id v34 = [v32 range:v4];
              }
              v35 = (char *)[v32 lineIndexForCharIndex:v34 eol:1];
              v36 = (char *)[v32 countLines];
              if (v35 == (char *)0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_19;
              }
              v37 = v36;
              if (v35 >= v36)
              {
LABEL_18:
                id v14 = v46;
                unint64_t v4 = a4;
                id v16 = v49;
LABEL_19:
                uint64_t v17 = v48;
                goto LABEL_22;
              }
              while (1)
              {
                id v38 = [v32 rangeOfLineFragmentAtIndex:v35];
                NSUInteger v40 = v39;
                +[TSWPColumn rectForSelection:withColumns:](TSWPColumn, "rectForSelection:withColumns:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v38, v39), [v19 columns]);
                [v19 rectInParent:];
                double MidY = CGRectGetMidY(v58);
                v59.origin.CGFloat x = x;
                v59.origin.CGFloat y = y;
                v59.size.CGFloat width = width;
                v59.size.CGFloat height = height;
                if (MidY > CGRectGetMinY(v59)) {
                  break;
                }
                if (v37 == ++v35) {
                  goto LABEL_18;
                }
              }
              id v14 = v46;
              uint64_t v17 = v48;
              id v16 = v49;
              if (v38 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v44 = (uint64_t)v38;
                goto LABEL_27;
              }
              NSUInteger v45 = v40;
              unint64_t v4 = a4;
            }
          }
        }
      }
LABEL_22:
      double v18 = (char *)v18 + 1;
    }
    while (v18 != v16);
    id v16 = [v14 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v16) {
      continue;
    }
    break;
  }
  uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v40 = v45;
LABEL_27:
  NSUInteger v42 = v44;
  NSUInteger v43 = v40;
  result.length = v43;
  result.location = v42;
  return result;
}

- (void)canvasDidScroll
{
  [self interactiveCanvasController].visibleUnscaledRectForContent;
  rect[0] = v3;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  memset(&rect[1], 0, 32);
  long long v23 = 0u;
  long long v24 = 0u;
  mBodyLayouts = self->super.mBodyLayouts;
  id v11 = [(NSMutableArray *)mBodyLayouts countByEnumeratingWithState:&rect[1] objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)rect[3];
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)rect[3] != v13) {
        objc_enumerationMutation(mBodyLayouts);
      }
      id v15 = *(void **)(rect[2] + 8 * v14);
      [v15 frameInRoot];
      CGFloat x = v26.origin.x;
      CGFloat y = v26.origin.y;
      CGFloat width = v26.size.width;
      CGFloat height = v26.size.height;
      double MinY = CGRectGetMinY(v26);
      *(void *)&v27.origin.CGFloat x = rect[0];
      v27.origin.CGFloat y = v5;
      v27.size.CGFloat width = v7;
      v27.size.CGFloat height = v9;
      if (MinY > CGRectGetMaxY(v27)) {
        break;
      }
      if (([v15 isLaidOut] & 1) == 0)
      {
        v28.origin.CGFloat x = x;
        v28.origin.CGFloat y = y;
        v28.size.CGFloat width = width;
        v28.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v28);
        *(void *)&v29.origin.CGFloat x = rect[0];
        v29.origin.CGFloat y = v5;
        v29.size.CGFloat width = v7;
        v29.size.CGFloat height = v9;
        if (MaxY >= CGRectGetMinY(v29))
        {
          [self.interactiveCanvasController invalidateLayoutInBackground:self];
          return;
        }
      }
      if (v12 == (id)++v14)
      {
        id v12 = [(NSMutableArray *)mBodyLayouts countByEnumeratingWithState:&rect[1] objects:v25 count:16];
        if (v12) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (void)validate
{
  if (self->mFirstBodyIndexNeedingGutterLayout != 0x7FFFFFFFFFFFFFFFLL) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout validate]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:312 description:@"should have laid out gutter drawables immediately after body layouts so our current geometry can account for overhanging gutter drawables"];
  }
  v9.receiver = self;
  v9.super_class = (Class)THFlowPageLayout;
  [(THPageLayout *)&v9 validate];
  mBodyLayouts = self->super.mBodyLayouts;
  if (!mBodyLayouts)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowPageLayout validate]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"] lineNumber:316 description:@"invalid nil value for '%s'", "mBodyLayouts"];
    mBodyLayouts = self->super.mBodyLayouts;
  }
  if (![(NSMutableArray *)mBodyLayouts count])
  {
    double v4 = (char *)[(THPageController *)[(THPageLayout *)self pageController] i_bodyCount];
    if (v4)
    {
      CGFloat v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        id v7 = [(THPageController *)[(THPageLayout *)self pageController] i_infoForBodyIndex:i];
        id v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "layoutClass")), "initWithInfo:", v7);
        [v8 setBodyIndex:i];
        [(NSMutableArray *)self->super.mBodyLayouts addObject:v8];
        [(THFlowPageLayout *)self addChild:v8];
      }
    }
  }
  [layoutController validateOrderedLayouts:[self.super.mBodyLayouts copy]];
}

- (id)computeLayoutGeometry
{
  [(THPageController *)[(THPageLayout *)self pageController] i_rectForPageLayout];
  id v6 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v2, v3, v4, v5];

  return v6;
}

- (void)wasAddedToLayoutController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THFlowPageLayout;
  [(THPageLayout *)&v4 wasAddedToLayoutController:a3];
  if ((objc_msgSend(-[THFlowPageLayout layoutController](self, "layoutController"), "isLayoutOffscreen") & 1) == 0)
  {
    if (self->mLayoutTimer) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout wasAddedToLayoutController:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:346 description:@"expected nil value for '%s'", "mLayoutTimer"];
    }
    self->mLayoutTimer = +[NSTimer timerWithTimeInterval:self target:"p_layoutNextBodyLayout" selector:0 userInfo:1 repeats:0.25];
    [+[NSRunLoop mainRunLoop] addTimer:self->mLayoutTimer forMode:NSDefaultRunLoopMode];
  }
}

- (void)willBeRemovedFromLayoutController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THFlowPageLayout;
  [(THPageLayout *)&v4 willBeRemovedFromLayoutController:a3];
  if ((objc_msgSend(-[THFlowPageLayout layoutController](self, "layoutController"), "isLayoutOffscreen") & 1) == 0)
  {
    [(NSTimer *)self->mLayoutTimer invalidate];

    self->mLayoutTimer = 0;
  }
}

- (BOOL)caresAboutStorageChanges
{
  return 1;
}

- (id)textWrapper
{
  return 0;
}

- (id)lineHintsForTarget:(id)a3
{
  return 0;
}

- (BOOL)invalidateOnExactTextRangeLayout
{
  return 1;
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v4 = objc_msgSend(objc_msgSend(-[THFlowPageLayout info](self, "info"), "bodyStorage"), "paragraphStyleAtParIndex:effectiveRange:", a3, a4);
  if ([v4 definesProperty:91]
    && [v4 intValueForProperty:91])
  {
    id v5 = [objc_alloc((Class)TSSPropertyMap) initWithPropertiesAndValues:91, 0, 0, 0];
    id v4 = objc_msgSend(objc_msgSend(v4, "stylesheet"), "variationOfStyle:propertyMap:", v4, v5);
  }
  return v4;
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THFlowPageLayout;
  [(THFlowPageLayout *)&v5 maximumFrameSizeForChild:a3];
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (id)layoutGeometryForLayout:(id)a3
{
  return 0;
}

- (id)adjustLayoutGeometry:(id)a3 forLayout:(id)a4
{
  [self.pageController.pagePositionController pageSize];
  double v8 = v7;
  if (objc_msgSend(-[THPageController delegate](-[THPageLayout pageController](self, "pageController"), "delegate"), "shouldScaleFlowLayoutsForPageController:", -[THPageLayout pageController](self, "pageController"))&& v8 != 768.0&& -[NSArray containsObject:](-[THPageLayout floatingDrawableLayouts](self, "floatingDrawableLayouts"), "containsObject:", a4))
  {
    memset(&v15, 0, sizeof(v15));
    CGAffineTransformMakeScale(&v15, v8 / 768.0, v8 / 768.0);
    if (a3) {
      [a3 transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    CGAffineTransform t2 = v15;
    CGAffineTransformConcat(&v14, &t1, &t2);
    CGAffineTransform v15 = v14;
    id v9 = objc_alloc((Class)TSDLayoutGeometry);
    [a3 size];
    CGAffineTransform v11 = v15;
    return [v9 initWithSize:&v11];
  }
  return a3;
}

- (id)adjustImageGeometry:(id)a3 withLayoutGeometry:(id)a4 forLayout:(id)a5
{
  id v6 = a3;
  if (objc_msgSend(-[THPageController delegate](-[THPageLayout pageController](self, "pageController", a3, a4), "delegate"), "shouldScaleFlowLayoutsForPageController:", -[THPageLayout pageController](self, "pageController")))
  {
    if ([(NSArray *)[(THPageLayout *)self floatingDrawableLayouts] containsObject:a5])
    {
      [self.pageController.pagePositionController pageSize];
      if (v8 != 768.0)
      {
        memset(&v15, 0, sizeof(v15));
        CGAffineTransformMakeScale(&v15, v8 / 768.0, v8 / 768.0);
        if (v6) {
          [v6 transform];
        }
        else {
          memset(&t1, 0, sizeof(t1));
        }
        CGAffineTransform t2 = v15;
        CGAffineTransformConcat(&v14, &t1, &t2);
        CGAffineTransform v15 = v14;
        id v9 = objc_alloc((Class)TSDLayoutGeometry);
        [v6 size];
        CGAffineTransform v11 = v15;
        return [v9 initWithSize:&v11];
      }
    }
  }
  return v6;
}

- (void)p_assignGutterInfo:(id)a3 toBodyLayout:(id)a4
{
  if (!-[THFlowPageLayout p_isGutterInfoAssigned:](self, "p_isGutterInfoAssigned:"))
  {
    double v7 = [(THFlowPageLayout *)self assignedGutterLayouts];
    [(TSUPointerKeyDictionary *)v7 setObject:a4 forUncopiedKey:a3];
  }
}

- (BOOL)p_isGutterInfo:(id)a3 assgnedToBodyLayout:(id)a4
{
  return [(TSUPointerKeyDictionary *)[(THFlowPageLayout *)self assignedGutterLayouts] objectForKey:a3] == a4;
}

- (BOOL)p_isGutterInfoAssigned:(id)a3
{
  id v4 = [(TSUPointerKeyDictionary *)[(THFlowPageLayout *)self assignedGutterLayouts] allKeys];

  return [v4 tsu_containsObjectIdenticalTo:a3];
}

- (double)p_offsetForGutterDrawableLayout:(id)a3 forBody:(id)a4 atOffset:(double)a5
{
  objc_msgSend(objc_msgSend(a3, "geometry"), "frame");
  return v6 + a5 + 24.0;
}

- (double)p_heightOfGutterDrawablesForBodyLayout:(id)a3
{
  id v5 = [(THFlowPageLayout *)self gutterDrawableStorage];
  id v6 = [(THFlowPageLayout *)self sortedGutterDrawables];
  double v7 = (char *)-[THPageController i_textRangeForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_textRangeForBodyIndex:", [a3 bodyIndex]);
  uint64_t v9 = v8;
  double v10 = 0.0;
  if (objc_msgSend(-[THFlowPageLayout info](self, "info"), "hasBodyFlow"))
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v6;
    id v11 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = &v7[v9];
      uint64_t v14 = *(void *)v32;
      do
      {
        CGAffineTransform v15 = 0;
        id v16 = obj;
        do
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v16);
          }
          uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v15);
          id v18 = [v5 positioningOfDrawable:v17];
          if (v18)
          {
            double v19 = (char *)[v18 bodyCharIndex];
            BOOL v20 = v7 <= v19 && v13 >= v19;
            if (v20
              || v19 == (char *)0x7FFFFFFFFFFFFFFFLL
              && (unsigned int v21 = [a3 bodyIndex],
                  BOOL v22 = (char *)[(NSMutableArray *)self->super.mBodyLayouts count] - 1 == (unsigned char *)v21,
                  id v16 = obj,
                  v22))
            {
              if (![(THFlowPageLayout *)self p_isGutterInfoAssigned:v17]
                || [(THFlowPageLayout *)self p_isGutterInfo:v17 assgnedToBodyLayout:a3])
              {
                id v23 = [(THPageLayout *)self insertValidatedChildLayoutForInfo:v17];
                if (v23)
                {
                  [(THFlowPageLayout *)self p_offsetForGutterDrawableLayout:v23 forBody:a3 atOffset:v10];
                  double v10 = v24;
                  [(THFlowPageLayout *)self p_assignGutterInfo:v17 toBodyLayout:a3];
                }
                else
                {
                  id v25 = +[TSUAssertionHandler currentHandler];
                  CGRect v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout p_heightOfGutterDrawablesForBodyLayout:]");
                  CGRect v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"];
                  CGRect v28 = v25;
                  id v16 = obj;
                  [v28 handleFailureInFunction:v26 file:v27 lineNumber:536 description:@"invalid nil value for '%s'", "gutterLayout"];
                }
              }
            }
          }
          CGAffineTransform v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        id v12 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v12);
    }
  }
  return v10;
}

- (void)p_layoutBodyLayout:(id)a3
{
  unsigned __int8 v5 = [a3 isLaidOut];
  id v6 = -[THPageController i_textRangeForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_textRangeForBodyIndex:", [a3 bodyIndex]);
  NSUInteger v8 = v7;
  v20.location = (NSUInteger)[(TSWPLayoutManager *)self->mLayoutManager dirtyRange];
  v21.location = (NSUInteger)v6;
  v21.length = v8;
  if (NSIntersectionRange(v20, v21).length || (v5 & 1) == 0)
  {
    [a3 layoutWithLayoutManager:self->mLayoutManager range:v6, v8];
    if ((v5 & 1) == 0)
    {
      double v9 = 0.0;
      if (objc_msgSend(-[THPageController delegate](-[THPageLayout pageController](self, "pageController"), "delegate"), "isCompactFlowPresentationForPageController:", -[THPageLayout pageController](self, "pageController")))
      {
        [(THFlowPageLayout *)self p_heightOfGutterDrawablesForBodyLayout:a3];
        double v9 = v10;
      }
      id v11 = [(THPageLayout *)self pageController];
      [a3 textHeight];
      -[THPageController i_setHeight:forBodyIndex:](v11, "i_setHeight:forBodyIndex:", [a3 bodyIndex], v9 + v12);
      LODWORD(v13) = [a3 bodyIndex];
      id v14 = [(NSMutableArray *)self->super.mBodyLayouts count];
      if ((unint64_t)v14 > v13)
      {
        unint64_t v15 = (unint64_t)v14;
        unint64_t v13 = v13;
        do
          [self->super.mBodyLayouts[v13++] invalidatePosition];
        while (v15 != v13);
      }
      unint64_t mFirstBodyIndexNeedingGutterLayout = self->mFirstBodyIndexNeedingGutterLayout;
      if (mFirstBodyIndexNeedingGutterLayout >= [a3 bodyIndex]) {
        unint64_t v17 = [a3 bodyIndex];
      }
      else {
        unint64_t v17 = self->mFirstBodyIndexNeedingGutterLayout;
      }
      self->unint64_t mFirstBodyIndexNeedingGutterLayout = v17;
    }
    [(THFlowPageLayout *)self invalidateFrame];
    id v18 = [(THFlowPageLayout *)self parent];
    [v18 invalidateFrame];
  }
}

- (void)p_layoutNextBodyLayout
{
  if ([(NSMutableArray *)self->super.mBodyLayouts count]
    && (objc_msgSend(-[THFlowPageLayout interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling") & 1) == 0)
  {
    [self interactiveCanvasController].visibleUnscaledRectForContent;
    TSDCenterOfRect();
    double v4 = v3;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    mBodyLayouts = self->super.mBodyLayouts;
    id v6 = [(NSMutableArray *)mBodyLayouts countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      NSUInteger v8 = 0;
      uint64_t v9 = *(void *)v20;
      double v10 = 1.79769313e308;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(mBodyLayouts);
          }
          double v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (([v12 isLaidOut] & 1) == 0)
          {
            [v12 frameInRoot];
            CGFloat x = v24.origin.x;
            CGFloat y = v24.origin.y;
            CGFloat width = v24.size.width;
            CGFloat height = v24.size.height;
            if (CGRectGetMaxY(v24) > v4)
            {
              v26.origin.CGFloat x = x;
              v26.origin.CGFloat y = y;
              v26.size.CGFloat width = width;
              v26.size.CGFloat height = height;
              double v17 = CGRectGetMinY(v26) - v4;
              goto LABEL_16;
            }
            v25.origin.CGFloat x = x;
            v25.origin.CGFloat y = y;
            v25.size.CGFloat width = width;
            v25.size.CGFloat height = height;
            double v10 = v4 - CGRectGetMaxY(v25);
            NSUInteger v8 = v12;
          }
        }
        id v7 = [(NSMutableArray *)mBodyLayouts countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
      double v12 = 0;
      double v17 = 1.79769313e308;
    }
    else
    {
      double v12 = 0;
      NSUInteger v8 = 0;
      double v17 = 1.79769313e308;
      double v10 = 1.79769313e308;
    }
LABEL_16:
    if (v10 >= v17) {
      id v18 = v12;
    }
    else {
      id v18 = v8;
    }
    if (v18)
    {
      [(THFlowPageLayout *)self p_layoutBodyLayout:"p_layoutBodyLayout:"];
      [(THFlowPageLayout *)self p_layoutGutterDrawables];
    }
    else
    {
      [(NSTimer *)self->mLayoutTimer invalidate];

      self->mLayoutTimer = 0;
    }
  }
}

- (void)p_layoutContentUpwardFromBodyIndex:(unint64_t)a3 amount:(double *)a4
{
  if (a3 != -1)
  {
    unint64_t v6 = a3;
    double v7 = *a4;
    do
    {
      if (v7 <= 0.0) {
        break;
      }
      id v8 = [(NSMutableArray *)self->super.mBodyLayouts objectAtIndex:v6];
      [(THFlowPageLayout *)self p_layoutBodyLayout:v8];
      [v8 textHeight];
      double v7 = *a4 - v9;
      *a4 = v7;
      --v6;
    }
    while (v6 != -1);
  }
  [(THFlowPageLayout *)self p_layoutGutterDrawables];
  [(THPageController *)[(THPageLayout *)self pageController] i_gutterOverhang];
  *a4 = *a4 - v10;
}

- (void)p_layoutContentDownwardFromBodyIndex:(unint64_t)a3 amount:(double *)a4
{
  id v7 = [(NSMutableArray *)self->super.mBodyLayouts count];
  if ((unint64_t)v7 > a3)
  {
    id v8 = v7;
    double v9 = *a4;
    do
    {
      if (v9 <= 0.0) {
        break;
      }
      id v10 = [(NSMutableArray *)self->super.mBodyLayouts objectAtIndex:a3];
      [(THFlowPageLayout *)self p_layoutBodyLayout:v10];
      [v10 textHeight];
      double v9 = *a4 - v11;
      *a4 = v9;
      ++a3;
    }
    while (v8 != (id)a3);
  }
  [(THFlowPageLayout *)self p_layoutGutterDrawables];
  [(THPageController *)[(THPageLayout *)self pageController] i_gutterOverhang];
  *a4 = *a4 - v12;
}

- (id)gutterDrawableStorage
{
  id v3 = [[self info] parent];
  id v4 = [(THPageController *)[(THPageLayout *)self pageController] presentationType];

  return [v3 gutterStorageForPresentationType:v4];
}

- (id)sortedGutterDrawables
{
  id result = self->mSortedGutterDrawables;
  if (!result)
  {
    id result = [[self gutterDrawableStorage] orderedDrawables];
    self->mSortedGutterDrawables = (NSArray *)result;
  }
  return result;
}

- (void)p_placeGutterDrawableLayout:(id)a3 withPositioning:(id)a4 inColumn:(id)a5 inBody:(id)a6
{
  id v11 = [a4 bodyCharIndex];
  if (a5) {
    [a5 topOfLineAtCharIndex:v11];
  }
  id v12 = [a3 geometry];
  [a4 offset];
  [v12 frame];
  double v14 = v13;
  -[THPageController i_rectForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_rectForBodyIndex:", [a6 bodyIndex]);
  [a6 bodyIndex];
  TSURound();

  [a3 offsetGeometryBy:0.0, v15 - v14];
}

- (double)p_placeCompactGutterDrawableLayout:(id)a3 forBody:(id)a4 atOffset:(double)a5
{
  objc_msgSend(objc_msgSend(a3, "geometry"), "frame");
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  -[THPageController i_rectForBodyIndex:](-[THPageLayout pageController](self, "pageController"), "i_rectForBodyIndex:", [a4 bodyIndex]);
  double v16 = v15;
  [a4 textHeight];
  id v18 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v10, v17 + v16 + a5, v12, v14];
  [a3 setGeometry:v18];

  return v14 + a5 + 24.0;
}

- (void)p_layoutGutterDrawablesForBodyLayout:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(THFlowPageLayout *)self sortedGutterDrawables];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    double v9 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ([(THFlowPageLayout *)self p_isGutterInfo:v11 assgnedToBodyLayout:a3])
        {
          id v12 = [(THPageLayout *)self insertValidatedChildLayoutForInfo:v11];
          if (v12)
          {
            [(THFlowPageLayout *)self p_placeCompactGutterDrawableLayout:v12 forBody:a3 atOffset:v9];
            double v9 = v13;
          }
          else
          {
            [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout p_layoutGutterDrawablesForBodyLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:733 description:@"invalid nil value for '%s'", "gutterLayout"];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)p_layoutGutterDrawables
{
  if (objc_msgSend(-[THFlowPageLayout info](self, "info"), "hasBodyFlow"))
  {
    if (self->mFirstBodyIndexNeedingGutterLayout == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    if (objc_msgSend(-[THPageController delegate](-[THPageLayout pageController](self, "pageController"), "delegate"), "isCompactFlowPresentationForPageController:", -[THPageLayout pageController](self, "pageController")))
    {
      unint64_t mFirstBodyIndexNeedingGutterLayout = self->mFirstBodyIndexNeedingGutterLayout;
      id v4 = [(NSMutableArray *)self->super.mBodyLayouts count];
      if (mFirstBodyIndexNeedingGutterLayout < (unint64_t)v4)
      {
        id v5 = v4;
        do
        {
          id v6 = [(NSMutableArray *)self->super.mBodyLayouts objectAtIndex:mFirstBodyIndexNeedingGutterLayout];
          if ([v6 isLaidOut]) {
            [(THFlowPageLayout *)self p_layoutGutterDrawablesForBodyLayout:v6];
          }
          ++mFirstBodyIndexNeedingGutterLayout;
        }
        while (v5 != (id)mFirstBodyIndexNeedingGutterLayout);
      }
    }
    else
    {
      id v7 = [(THFlowPageLayout *)self layoutController];
      id v8 = [(THFlowPageLayout *)self gutterDrawableStorage];
      id v9 = [(THFlowPageLayout *)self sortedGutterDrawables];
      CGFloat x = CGRectNull.origin.x;
      CGFloat y = CGRectNull.origin.y;
      CGFloat width = CGRectNull.size.width;
      CGFloat height = CGRectNull.size.height;
      v73 = v9;
      v74 = (char *)[v9 count];
      unint64_t v14 = self->mFirstBodyIndexNeedingGutterLayout;
      id v72 = [(NSMutableArray *)self->super.mBodyLayouts count];
      if (v14 < (unint64_t)v72)
      {
        long long v15 = 0;
        id rect_24 = v8;
        id v67 = v7;
        do
        {
          id v16 = [(NSMutableArray *)self->super.mBodyLayouts objectAtIndex:v14];
          unsigned int v70 = [v16 isLaidOut];
          id v17 = (id)(v14 + 1);
          unint64_t rect_8 = v14;
          id v18 = (char *)[(THPageController *)[(THPageLayout *)self pageController] i_textRangeForBodyIndex:v14];
          if (v15 < v74)
          {
            long long v20 = v18;
            v68 = &v18[v19];
            id v69 = v17;
            do
            {
              id v21 = [v73 objectAtIndex:v15];
              id v22 = [v8 positioningOfDrawable:v21];
              id v23 = (char *)[v22 bodyCharIndex];
              if (v23 >= v20)
              {
                CGRect v29 = v23;
                if (v17 != v72 && v23 >= v68) {
                  goto LABEL_35;
                }
                if (v70)
                {
                  if (objc_msgSend(objc_msgSend(v16, "columns"), "count") != (char *)&dword_0 + 1)
                  {
                    id v17 = v69;
                    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout p_layoutGutterDrawables]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:804 description:@"should only have one column in flow"];
                  }
                  id v30 = objc_msgSend(objc_msgSend(v16, "columns"), "lastObject");
                  long long v31 = (char *)[v30 range];
                  if (v29 < v31 || v29 - v31 >= v32)
                  {
                    if (v17 != v72 || (long long v33 = (char *)[v30 range], v29 != &v33[v34]))
                    {
                      id v17 = v69;
                      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageLayout p_layoutGutterDrawables]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm") lineNumber:807 description:@"column range should include drawable range"];
                    }
                  }
                  id v35 = [(THPageLayout *)self insertValidatedChildLayoutForInfo:v21];
                  if (!v35)
                  {
                    id v17 = v69;
                    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowPageLayout p_layoutGutterDrawables]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageLayout.mm"] lineNumber:810 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "gutterLayout"];
                  }
                  [(THFlowPageLayout *)self p_placeGutterDrawableLayout:v35 withPositioning:v22 inColumn:v30 inBody:v16];
                  v75.origin.CGFloat x = x;
                  v75.origin.CGFloat y = y;
                  v75.size.CGFloat width = width;
                  v75.size.CGFloat height = height;
                  if (!CGRectIsNull(v75))
                  {
                    [v35 frame];
                    CGFloat v37 = v36;
                    CGFloat rect_16 = v38;
                    CGFloat v40 = v39;
                    CGFloat v42 = v41;
                    v76.origin.CGFloat x = x;
                    v76.origin.CGFloat y = y;
                    v76.size.CGFloat width = width;
                    v76.size.CGFloat height = height;
                    CGFloat v43 = height;
                    CGFloat v44 = width;
                    CGFloat v45 = y;
                    CGFloat v46 = x;
                    CGFloat v47 = CGRectGetMaxY(v76) + 24.0;
                    v77.origin.CGFloat x = v37;
                    v77.origin.CGFloat y = rect_16;
                    v77.size.CGFloat width = v40;
                    v77.size.CGFloat height = v42;
                    if (v47 > CGRectGetMinY(v77))
                    {
                      v78.origin.CGFloat x = v46;
                      v78.origin.CGFloat y = v45;
                      v78.size.CGFloat width = v44;
                      v78.size.CGFloat height = v43;
                      CGFloat v48 = CGRectGetMaxY(v78) + 24.0;
                      v79.origin.CGFloat x = v37;
                      v79.origin.CGFloat y = rect_16;
                      v79.size.CGFloat width = v40;
                      v79.size.CGFloat height = v42;
                      [v35 offsetGeometryBy:0.0, v48 - CGRectGetMinY(v79)];
                    }
                  }
                  [v35 frame];
                  CGFloat x = v49;
                  CGFloat y = v50;
                  CGFloat width = v51;
                  CGFloat height = v52;
                  id v8 = rect_24;
                  id v7 = v67;
                }
              }
              else
              {
                id v24 = [v7 layoutForInfo:v21 childOfLayout:self];
                if (v24)
                {
                  [v24 frame];
                  CGFloat x = v25;
                  CGFloat y = v26;
                  CGFloat width = v27;
                  CGFloat height = v28;
                }
              }
              ++v15;
            }
            while (v74 != v15);
            long long v15 = v74;
          }
LABEL_35:
          char v53 = v70 ^ 1;
          if (v17 != v72) {
            char v53 = 1;
          }
          if ((v53 & 1) == 0)
          {
            [(THPageController *)[(THPageLayout *)self pageController] i_rectForBodyIndex:rect_8];
            CGFloat v71 = v54;
            CGFloat v56 = v55;
            CGFloat v58 = v57;
            CGFloat v60 = v59;
            v80.origin.CGFloat x = x;
            v80.origin.CGFloat y = y;
            v80.size.CGFloat width = width;
            v80.size.CGFloat height = height;
            if (!CGRectIsNull(v80))
            {
              v81.origin.CGFloat x = x;
              v81.origin.CGFloat y = y;
              v81.size.CGFloat width = width;
              v81.size.CGFloat height = height;
              double MaxY = CGRectGetMaxY(v81);
              v82.origin.CGFloat x = v71;
              v82.origin.CGFloat y = v56;
              v82.size.CGFloat width = v58;
              v82.size.CGFloat height = v60;
              if (MaxY > CGRectGetMaxY(v82))
              {
                v62 = [(THPageLayout *)self pageController];
                v83.origin.CGFloat x = x;
                v83.origin.CGFloat y = y;
                v83.size.CGFloat width = width;
                v83.size.CGFloat height = height;
                double v63 = CGRectGetMaxY(v83);
                v84.origin.CGFloat x = v71;
                v84.origin.CGFloat y = v56;
                v84.size.CGFloat width = v58;
                v84.size.CGFloat height = v60;
                [(THPageController *)v62 i_setGutterOverhang:v63 - CGRectGetMaxY(v84)];
              }
            }
          }
          unint64_t v14 = (unint64_t)v17;
        }
        while (v17 != v72);
      }
    }
  }
  self->unint64_t mFirstBodyIndexNeedingGutterLayout = 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isMaxXEdgeObscured
{
  return self->_maxXEdgeObscured;
}

- (void)setMaxXEdgeObscured:(BOOL)a3
{
  self->_maxXEdgeObscured = a3;
}

- (TSUPointerKeyDictionary)assignedGutterLayouts
{
  return self->_assignedGutterLayouts;
}

- (void)setAssignedGutterLayouts:(id)a3
{
}

@end