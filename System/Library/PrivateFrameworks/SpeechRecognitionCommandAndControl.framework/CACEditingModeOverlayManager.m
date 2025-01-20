@interface CACEditingModeOverlayManager
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (CACEditingModeOverlayManagerDelegate)delegate;
- (CACEditingModeOverlayViewController)editingModeOverlayViewController;
- (CGRect)_interfaceOrientedFrameForElement:(id)a3 axFrame:(CGRect)a4;
- (NSArray)overlayElements;
- (_NSRange)rangeForLineNumber:(int64_t)a3 forElement:(id)a4;
- (id)_visibleLineRangesForElement:(id)a3 lineFetchingGeneration:(unint64_t)a4;
- (id)_webVisibleLineRangesForElement:(id)a3 lineFetchingGeneration:(unint64_t)a4;
- (int64_t)overlayType;
- (void)_showOverlayElementsForElement:(id)a3 textUnit:(unint64_t)a4 startIndex:(unint64_t)a5;
- (void)_showPopoverForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5 type:(int64_t)a6;
- (void)hide;
- (void)hideWithoutAnimation;
- (void)setDelegate:(id)a3;
- (void)setEditingModeOverlayViewController:(id)a3;
- (void)setOverlayElements:(id)a3;
- (void)showCharactersForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5;
- (void)showLinesForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5;
- (void)showParagraphsForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5;
- (void)showSentencesForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5;
- (void)showWordsForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5;
- (void)startDelayedDimmingOfNumbers;
- (void)stopDelayedDimmingOfNumbers;
@end

@implementation CACEditingModeOverlayManager

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(CACSimpleContentViewManager *)self setContentViewManagerDelegate:obj];
  }
}

- (_NSRange)rangeForLineNumber:(int64_t)a3 forElement:(id)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  long long v14 = xmmword_238415C70;
  v15[0] = @"lineNumber";
  v5 = NSNumber;
  id v6 = a4;
  v7 = [v5 numberWithInteger:a3];
  v15[1] = @"lineColumn";
  v16[0] = v7;
  v16[1] = &unk_26EB4CF30;
  v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  v9 = [v6 uiElement];

  v10 = (const void *)[v9 objectWithAXAttribute:92504 parameter:v8];
  if (v10)
  {
    CFTypeID v11 = CFGetTypeID(v10);
    if (v11 == AXValueGetTypeID() && AXValueGetType((AXValueRef)v10) == kAXValueTypeCFRange) {
      AXValueGetValue((AXValueRef)v10, kAXValueTypeCFRange, &v14);
    }
  }

  NSUInteger v13 = *((void *)&v14 + 1);
  NSUInteger v12 = v14;
  result.length = v13;
  result.location = v12;
  return result;
}

- (id)_webVisibleLineRangesForElement:(id)a3 lineFetchingGeneration:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 textMarkerRangeForSelection];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __87__CACEditingModeOverlayManager__webVisibleLineRangesForElement_lineFetchingGeneration___block_invoke;
  v20[3] = &unk_264D12180;
  id v21 = v6;
  unint64_t v22 = a4;
  v20[4] = self;
  id v8 = v6;
  v9 = (void (**)(void, void, void, void))MEMORY[0x23EC8F1E0](v20);
  v10 = [v7 firstObject];
  uint64_t v11 = [v8 rangeForTextMarkers:v7];
  uint64_t v13 = objc_msgSend(v8, "isVisibleTextRange:", v11, v12) ^ 1;
  long long v14 = ((void (**)(void, void, void *, uint64_t))v9)[2](v9, 0, v10, v13);
  v15 = ((void (**)(void, uint64_t, void *, uint64_t))v9)[2](v9, 1, v10, v13);
  v16 = [v14 reverseObjectEnumerator];
  v17 = [v16 allObjects];

  v18 = [v17 arrayByAddingObjectsFromArray:v15];

  return v18;
}

id __87__CACEditingModeOverlayManager__webVisibleLineRangesForElement_lineFetchingGeneration___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  v30[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [MEMORY[0x263EFF980] array];
  id v9 = v7;
  v26 = v9;
  if (v9)
  {
    uint64_t v10 = 0;
    id v11 = v9;
    int v28 = a2;
    uint64_t v27 = 0;
    do
    {
      uint64_t v12 = v11;
      if (*(void *)(*(void *)(a1 + 32) + 48) != *(void *)(a1 + 48)) {
        break;
      }
      context = (void *)MEMORY[0x23EC8EF90](v9);
      uint64_t v13 = *(void **)(a1 + 40);
      if (a2)
      {
        long long v14 = [v13 textLineEndMarker:v11];
        v15 = [*(id *)(a1 + 40) textLineStartMarker:v14];
        v16 = v14;
      }
      else
      {
        long long v14 = objc_msgSend(v13, "textLineStartMarker:", v11, v26);
        v16 = [*(id *)(a1 + 40) textLineEndMarker:v14];
        v15 = v14;
      }
      id v11 = v14;

      if (a4 && ![v8 count])
      {
        if ((unint64_t)++v27 > 0x64)
        {
LABEL_21:

          break;
        }
      }
      else if ((unint64_t)++v10 > 6)
      {
        goto LABEL_21;
      }
      if (v15 && v16)
      {
        uint64_t v17 = a4;
        v18 = v8;
        v19 = *(void **)(a1 + 40);
        v30[0] = v15;
        v30[1] = v16;
        v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
        uint64_t v21 = [v19 rangeForTextMarkers:v20];
        uint64_t v23 = v22;

        if (objc_msgSend(*(id *)(a1 + 40), "isVisibleTextRange:", v21, v23))
        {
          v24 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v21, v23);
          id v8 = v18;
          if (([v18 containsObject:v24] & 1) == 0)
          {
            [v18 addObject:v24];
            uint64_t v10 = 0;
          }
        }
        else
        {
          id v8 = v18;
        }
        a4 = v17;
        a2 = v28;
      }
    }
    while (v11);
  }
  else
  {
    id v11 = 0;
  }

  return v8;
}

- (id)_visibleLineRangesForElement:(id)a3 lineFetchingGeneration:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 hasAnyTraits:*MEMORY[0x263F21C90]])
  {
    id v7 = [(CACEditingModeOverlayManager *)self _webVisibleLineRangesForElement:v6 lineFetchingGeneration:a4];
  }
  else
  {
    id v7 = [MEMORY[0x263EFF980] array];
    uint64_t v8 = [v6 uiElement];
    uint64_t v9 = [v6 selectedTextRange];
    v29 = (void *)v8;
    if (v8 && self->_lineFetchingGeneration == a4)
    {
      unint64_t v10 = 0;
      uint64_t v11 = 10000;
      if (v9 > 10000) {
        uint64_t v11 = v9;
      }
      BOOL v12 = v9 == 0x7FFFFFFFFFFFFFFFLL || v9 == 0x7FFFFFFF;
      uint64_t v13 = v11 - 10000;
      if (v12) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = v13;
      }
      id v28 = v6;
      while (1)
      {
        v15 = (void *)MEMORY[0x23EC8EF90]();
        uint64_t v16 = [(CACEditingModeOverlayManager *)self rangeForLineNumber:v14 forElement:v6];
        if (v16 + v17 <= (unint64_t)(v14 + 1)) {
          ++v14;
        }
        else {
          uint64_t v14 = v16 + v17;
        }
        if (v10 >> 5 > 0x270) {
          break;
        }
        uint64_t v18 = v16;
        uint64_t v19 = v17;
        uint64_t v20 = [v7 count];
        BOOL v21 = v10 <= 4 || v20 == 0;
        if (!v21 || v18 == 0x7FFFFFFF || !(v19 | v18)) {
          break;
        }
        if (objc_msgSend(v6, "isVisibleTextRange:", v18, v19))
        {
          objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v18, v19);
          uint64_t v22 = self;
          v24 = unint64_t v23 = a4;
          char v25 = [v7 containsObject:v24];

          a4 = v23;
          self = v22;
          id v6 = v28;
          if ((v25 & 1) == 0)
          {
            v26 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v18, v19);
            [v7 addObject:v26];

            unint64_t v10 = 0;
          }
        }
        ++v10;
        if (self->_lineFetchingGeneration != a4) {
          goto LABEL_31;
        }
      }
    }
LABEL_31:
  }
  return v7;
}

- (CGRect)_interfaceOrientedFrameForElement:(id)a3 axFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v8 = [a3 windowDisplayId];
  uint64_t v9 = +[CACDisplayManager sharedManager];
  unint64_t v10 = [v9 overlayViewForDisplayID:v8];

  if (v10)
  {
    uint64_t v11 = +[CACDisplayManager sharedManager];
    int v12 = [v11 carPlayConnected];

    uint64_t v13 = [MEMORY[0x263F21668] systemWideElement];
    uint64_t v14 = v13;
    if (v12)
    {
      v15 = [v13 elementsForAttribute:1009];
      uint64_t v16 = [v15 firstObject];

      uint64_t v14 = (void *)v16;
    }
    uint64_t v17 = [v10 window];
    objc_msgSend(v14, "convertRect:toContextId:displayId:", objc_msgSend(v17, "_contextId"), v8, x, y, width, height);
    double x = v18;
    double y = v19;
    double width = v20;
    double height = v21;
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)_showOverlayElementsForElement:(id)a3 textUnit:(unint64_t)a4 startIndex:(unint64_t)a5
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  ++self->_lineFetchingGeneration;
  uint64_t v9 = [v7 application];
  unint64_t v10 = [v9 elementForAttribute:2076];
  [v10 frame];
  CGFloat v102 = v12;
  CGFloat v103 = v11;
  CGFloat v100 = v14;
  CGFloat v101 = v13;

  unint64_t lineFetchingGeneration = self->_lineFetchingGeneration;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obj = [(CACEditingModeOverlayManager *)self _visibleLineRangesForElement:v7 lineFetchingGeneration:lineFetchingGeneration];
  uint64_t v89 = [obj countByEnumeratingWithState:&v110 objects:v114 count:16];
  if (v89)
  {
    uint64_t v88 = *(void *)v111;
    double v81 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v82 = *MEMORY[0x263F001A0];
    double v79 = *(double *)(MEMORY[0x263F001A0] + 24);
    double v80 = *(double *)(MEMORY[0x263F001A0] + 16);
    unint64_t v84 = a4;
    unint64_t v83 = lineFetchingGeneration;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v111 != v88) {
        objc_enumerationMutation(obj);
      }
      if (lineFetchingGeneration != self->_lineFetchingGeneration) {
        break;
      }
      uint64_t v17 = *(void **)(*((void *)&v110 + 1) + 8 * v16);
      uint64_t v18 = [v17 rangeValue];
      objc_msgSend(v7, "rectForRange:", v18, v19);
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      -[CACEditingModeOverlayManager _interfaceOrientedFrameForElement:axFrame:](self, "_interfaceOrientedFrameForElement:axFrame:", v7);
      double v94 = v28;
      double v96 = v29;
      double v92 = v30;
      double v104 = v31;
      [v7 frame];
      -[CACEditingModeOverlayManager _interfaceOrientedFrameForElement:axFrame:](self, "_interfaceOrientedFrameForElement:axFrame:", v7);
      double v90 = v32;
      uint64_t location = [v17 rangeValue];
      NSUInteger length = v34;
      v120.origin.CGFloat x = v103;
      v120.origin.CGFloat y = v102;
      v120.size.CGFloat width = v101;
      v120.size.double height = v100;
      CGFloat v98 = v23;
      CGFloat v99 = v21;
      v129.origin.CGFloat x = v21;
      v129.origin.CGFloat y = v23;
      CGFloat v97 = v25;
      v129.size.CGFloat width = v25;
      double v105 = v27;
      v129.size.double height = v27;
      CGRect v121 = CGRectIntersection(v120, v129);
      CGFloat x = v121.origin.x;
      CGFloat y = v121.origin.y;
      CGFloat width = v121.size.width;
      double height = v121.size.height;
      v121.origin.CGFloat x = v103;
      v121.origin.CGFloat y = v102;
      v121.size.CGFloat width = v101;
      v121.size.double height = v100;
      if (CGRectIsEmpty(v121)
        || (v122.origin.CGFloat y = v102,
            v122.origin.CGFloat x = v103,
            v122.size.double height = v100,
            v122.size.CGFloat width = v101,
            CGRectIsNull(v122)))
      {
        if (a4 == 2) {
          goto LABEL_16;
        }
      }
      else
      {
        v123.origin.CGFloat x = x;
        v123.origin.CGFloat y = y;
        v123.size.CGFloat width = width;
        v123.size.double height = height;
        BOOL IsNull = CGRectIsNull(v123);
        char v41 = height < v105 * 0.5 || IsNull;
        if (a4 == 2 && (v41 & 1) != 0)
        {
LABEL_16:
          if (v94 - v90 <= 0.0) {
            double v42 = -0.0;
          }
          else {
            double v42 = v94 - v90;
          }
          CGFloat v44 = v81;
          CGFloat v43 = v82;
          CGFloat v46 = v79;
          CGFloat v45 = v80;
          if ([v8 count])
          {
            v47 = [v8 lastObject];
            [v47 axFrame];
            CGFloat v43 = v48;
            CGFloat v44 = v49;
            CGFloat v45 = v50;
            CGFloat v46 = v51;
          }
          double v52 = v96;
          if ([v8 count])
          {
            v53 = [v8 lastObject];
            NSUInteger v54 = [v53 range];
            NSUInteger v56 = v55;
          }
          else
          {
            NSUInteger v56 = 0;
            NSUInteger v54 = 0x7FFFFFFFFFFFFFFFLL;
          }
          v124.size.CGFloat width = v92 + v42;
          double v57 = v94 - fmax(v94 - v90, 0.0);
          v124.origin.CGFloat x = v57;
          v124.origin.CGFloat y = v96;
          double v95 = v92 + v42;
          double v58 = v104;
          v124.size.double height = v104;
          v130.origin.CGFloat x = v43;
          v130.origin.CGFloat y = v44;
          v130.size.CGFloat width = v45;
          v130.size.double height = v46;
          CGRect v125 = CGRectUnion(v124, v130);
          CGFloat v59 = v125.origin.x;
          double v91 = v125.size.height;
          double v93 = v125.origin.y;
          CGFloat v86 = v125.size.width;
          v118.uint64_t location = [v17 rangeValue];
          v118.NSUInteger length = v60;
          v116.uint64_t location = v54;
          v116.NSUInteger length = v56;
          NSRange v61 = NSUnionRange(v116, v118);
          v126.origin.CGFloat x = v43;
          v126.origin.CGFloat y = v44;
          v126.size.CGFloat width = v45;
          v126.size.double height = v46;
          if (CGRectIsNull(v126) || v54 == 0x7FFFFFFFFFFFFFFFLL)
          {
            double v73 = v98;
            double v72 = v99;
            double v74 = v97;
          }
          else
          {
            CGFloat v78 = v59;
            v127.size.double height = v104;
            v127.size.CGFloat width = v95;
            double v62 = vabdd_f64(v93, v96);
            v127.origin.CGFloat x = v57;
            v127.origin.CGFloat y = v96;
            v131.origin.CGFloat x = v43;
            v131.origin.CGFloat y = v44;
            v131.size.CGFloat width = v45;
            v131.size.double height = v46;
            CGRect v128 = CGRectIntersection(v127, v131);
            if (vabdd_f64(v91, v104) < 10.0 && v62 < 10.0)
            {
              BOOL v65 = v128.size.height <= 0.0 || v61.location == 0x7FFFFFFFFFFFFFFFLL || v61.length == 0;
              double v73 = v98;
              double v72 = v99;
              double v74 = v97;
              double v58 = v104;
              if (!v65)
              {
                [v8 removeLastObject];
                double v57 = v78;
                double v58 = v91;
                double v52 = v93;
                double v95 = v86;
                uint64_t location = v61.location;
                NSUInteger length = v61.length;
              }
            }
            else
            {
              double v73 = v98;
              double v72 = v99;
              double v74 = v97;
              double v58 = v104;
            }
          }
          v66 = objc_opt_new();
          v67 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count") + a5);
          v68 = [v67 stringValue];
          [v66 setLabel:v68];

          objc_msgSend(v66, "setAxFrame:", v72, v73, v74, v105);
          objc_msgSend(v66, "setInterfaceOrientedFrame:", v57, v52, v95, v58);
          objc_msgSend(v66, "setRange:", location, length);
          [v66 setTextUnit:2];
          v69 = [v7 value];
          v119.NSUInteger length = [v69 length];
          v117.uint64_t location = location;
          v117.NSUInteger length = length;
          v119.uint64_t location = 0;
          NSRange v70 = NSIntersectionRange(v117, v119);
          if (v70.length)
          {
            v71 = objc_msgSend(v69, "substringWithRange:", v70.location, v70.length);
            [v66 setRepresentedText:v71];
          }
          else
          {
            [v66 setRepresentedText:&stru_26EB332F0];
          }
          a4 = v84;
          [v8 addObject:v66];

          unint64_t lineFetchingGeneration = v83;
        }
      }
      if (v89 == ++v16)
      {
        uint64_t v89 = [obj countByEnumeratingWithState:&v110 objects:v114 count:16];
        if (v89) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  unint64_t v75 = [v8 count];
  p_overlayElements = &self->_overlayElements;
  if (v75 > 1)
  {
    objc_storeStrong((id *)p_overlayElements, v8);
    v106[0] = MEMORY[0x263EF8330];
    v106[1] = 3221225472;
    v106[2] = __83__CACEditingModeOverlayManager__showOverlayElementsForElement_textUnit_startIndex___block_invoke_2;
    v106[3] = &unk_264D121A8;
    v108 = self;
    unint64_t v109 = a4;
    id v107 = v8;
    [(CACSimpleContentViewManager *)self showViewControllerWithCreationHandler:&__block_literal_global_20 updateHandler:v106];
  }
  else
  {
    v77 = *p_overlayElements;
    *p_overlayElements = (NSArray *)MEMORY[0x263EFFA68];

    [(CACSimpleContentViewManager *)self hideAnimated:1 completion:0];
  }
}

CACEditingModeOverlayViewController *__83__CACEditingModeOverlayManager__showOverlayElementsForElement_textUnit_startIndex___block_invoke()
{
  v0 = objc_alloc_init(CACEditingModeOverlayViewController);
  return v0;
}

void __83__CACEditingModeOverlayManager__showOverlayElementsForElement_textUnit_startIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setElements:*(void *)(a1 + 32)];
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 <= 4) {
    [v4 setOverlayType:qword_238415C88[v3]];
  }
  [*(id *)(a1 + 40) setEditingModeOverlayViewController:v4];
}

- (void)showWordsForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5
{
}

- (void)hide
{
  ++self->_lineFetchingGeneration;
  v2.receiver = self;
  v2.super_class = (Class)CACEditingModeOverlayManager;
  [(CACSimpleContentViewManager *)&v2 hide];
}

- (void)hideWithoutAnimation
{
  ++self->_lineFetchingGeneration;
  unint64_t v3 = [(CACSimpleContentViewManager *)self viewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(CACSimpleContentViewManager *)self viewController];
    id v6 = [v5 viewControllerInPopover];
    [v6 setPopoverShowing:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)CACEditingModeOverlayManager;
  [(CACSimpleContentViewManager *)&v7 hideWithoutAnimation];
}

- (void)_showPopoverForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5 type:(int64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v9 = a3;
  CGFloat v46 = self;
  unint64_t v10 = [(CACSimpleContentViewManager *)self viewController];
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass();

  if (self)
  {
    double v11 = [(CACSimpleContentViewManager *)v46 viewController];
    double v12 = [v11 viewControllerInPopover];
    [v12 setPopoverShowing:0];
  }
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3010000000;
  NSRange v70 = &unk_238423B1B;
  NSUInteger v71 = location;
  NSUInteger v72 = length;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v13 = [v9 value];
    uint64_t v14 = [v13 length];
    v15 = v68;
    v68[4] = 0;
    v15[5] = v14;
  }
  char v41 = [v9 value];
  CGFloat v43 = objc_msgSend(v41, "substringWithRange:", location, length);
  CGFloat v45 = [MEMORY[0x263EFF980] array];
  [MEMORY[0x263F84D90] textSegmentModelsForText:v43 type:a6 start:a5];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
  CGFloat v17 = *MEMORY[0x263F001A8];
  CGFloat v18 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v19 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v20 = *(double *)(MEMORY[0x263F001A8] + 24);
  if (v16)
  {
    uint64_t v21 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v64 != v21) {
          objc_enumerationMutation(obj);
        }
        CGFloat v23 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if (([v23 isWhiteSpace] & 1) == 0)
        {
          double v24 = objc_opt_new();
          CGFloat v25 = [v23 label];
          double v26 = [v25 string];
          [v24 setLabel:v26];

          CGFloat v27 = [v23 representedText];
          double v28 = [v27 string];
          [v24 setRepresentedText:v28];

          if ((unint64_t)a6 < 2) {
            [v24 setTextUnit:a6];
          }
          uint64_t v29 = [v23 nsRange];
          [v23 nsRange];
          uint64_t v31 = v30;
          objc_msgSend(v9, "rectForRange:", v29 + location, v30);
          objc_msgSend(v24, "setAxFrame:");
          [v24 axFrame];
          -[CACEditingModeOverlayManager _interfaceOrientedFrameForElement:axFrame:](v46, "_interfaceOrientedFrameForElement:axFrame:", v9);
          objc_msgSend(v24, "setInterfaceOrientedFrame:");
          objc_msgSend(v24, "setRange:", v29 + location, v31);
          [v45 addObject:v24];
          [v24 axFrame];
          if (v20 != 0.0)
          {
            v76.origin.CGFloat x = v32;
            v76.origin.CGFloat y = v33;
            v76.size.CGFloat width = v34;
            v76.size.double height = v35;
            v75.origin.CGFloat x = v17;
            v75.origin.CGFloat y = v18;
            v75.size.CGFloat width = v19;
            v75.size.double height = v20;
            *(CGRect *)&CGFloat v32 = CGRectUnion(v75, v76);
          }
          CGFloat v17 = v32;
          CGFloat v18 = v33;
          CGFloat v19 = v34;
          double v20 = v35;
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v16);
  }

  if ((unint64_t)[v45 count] > 1)
  {
    v39 = [(CACSimpleContentViewManager *)v46 viewController];
    if ([v39 isBeingPresented])
    {
      BOOL v40 = [(NSArray *)v46->_overlayElements isEqualToArray:v45];

      if (v40) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&v46->_overlayElements, v45);
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_2;
    v57[3] = &unk_264D12238;
    v57[4] = v46;
    id v58 = &__block_literal_global_351;
    CGFloat v59 = v17;
    CGFloat v60 = v18;
    CGFloat v61 = v19;
    double v62 = v20;
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_7;
    v48[3] = &unk_264D12260;
    id v49 = v41;
    double v50 = &v67;
    int64_t v51 = a6;
    unint64_t v52 = a5;
    CGFloat v53 = v17;
    CGFloat v54 = v18;
    CGFloat v55 = v19;
    double v56 = v20;
    [(CACSimpleContentViewManager *)v46 showViewControllerWithCreationHandler:v57 updateHandler:v48];
  }
  else
  {
    overlayElements = v46->_overlayElements;
    v46->_overlayElements = (NSArray *)MEMORY[0x263EFFA68];

    v37 = [(CACSimpleContentViewManager *)v46 viewController];
    int v38 = [v37 isBeingPresented];

    if (v38) {
      [(CACSimpleContentViewManager *)v46 hideAnimated:1 completion:0];
    }
  }
LABEL_26:

  _Block_object_dispose(&v67, 8);
}

id __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke(uint64_t a1, void *a2)
{
  v60[14] = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    id v3 = objc_alloc(MEMORY[0x263F82E00]);
    double v4 = *MEMORY[0x263F001A8];
    double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
    id v8 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
    double v56 = +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 0, v4, v5, v6, v7);
    [v56 addSubview:v2];
    id v9 = +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 1, v4, v5, v6, v7);
    unint64_t v10 = [v2 contrastedCopy];
    [v9 addSubview:v10];
    [v8 addSubview:v9];
    [v8 addSubview:v56];
    [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v40 = (void *)MEMORY[0x263F08938];
    CGFloat v59 = [v56 topAnchor];
    id v58 = [v8 topAnchor];
    double v57 = [v59 constraintEqualToAnchor:v58];
    v60[0] = v57;
    CGFloat v55 = [v56 bottomAnchor];
    CGFloat v54 = [v8 bottomAnchor];
    CGFloat v53 = [v55 constraintEqualToAnchor:v54];
    v60[1] = v53;
    unint64_t v52 = [v56 leadingAnchor];
    int64_t v51 = [v8 leadingAnchor];
    double v50 = [v52 constraintEqualToAnchor:v51];
    v60[2] = v50;
    id v49 = [v56 trailingAnchor];
    double v48 = [v8 trailingAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v60[3] = v47;
    CGFloat v46 = [v9 topAnchor];
    CGFloat v45 = [v8 topAnchor];
    CGFloat v44 = [v46 constraintEqualToAnchor:v45];
    v60[4] = v44;
    CGFloat v43 = [v9 bottomAnchor];
    double v42 = [v8 bottomAnchor];
    char v41 = [v43 constraintEqualToAnchor:v42];
    v60[5] = v41;
    int v38 = [v9 leadingAnchor];
    v37 = [v8 leadingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v60[6] = v36;
    CGFloat v35 = [v9 trailingAnchor];
    CGFloat v34 = [v8 trailingAnchor];
    CGFloat v32 = [v35 constraintEqualToAnchor:v34];
    v60[7] = v32;
    uint64_t v31 = [v10 topAnchor];
    uint64_t v30 = [v9 topAnchor];
    uint64_t v29 = [v31 constraintEqualToAnchor:v30];
    v60[8] = v29;
    double v28 = [v10 bottomAnchor];
    CGFloat v27 = [v9 bottomAnchor];
    double v26 = [v28 constraintEqualToAnchor:v27];
    v60[9] = v26;
    CGFloat v25 = [v10 leadingAnchor];
    v39 = v9;
    double v24 = [v9 leadingAnchor];
    CGFloat v23 = [v25 constraintEqualToAnchor:v24];
    v60[10] = v23;
    double v11 = v10;
    CGFloat v33 = v10;
    double v22 = [v10 trailingAnchor];
    uint64_t v21 = [v9 trailingAnchor];
    double v12 = [v22 constraintEqualToAnchor:v21];
    v60[11] = v12;
    double v13 = [v2 centerYAnchor];
    uint64_t v14 = [v10 centerYAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v60[12] = v15;
    uint64_t v16 = [v2 centerXAnchor];
    CGFloat v17 = [v11 centerXAnchor];
    CGFloat v18 = [v16 constraintEqualToAnchor:v17];
    v60[13] = v18;
    CGFloat v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:14];
    [v40 activateConstraints:v19];
  }
  else
  {
    id v8 = v2;
  }

  return v8;
}

CACEditingOverlayPopoverPresentingViewController *__83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(CACEditingOverlayPopoverPresentingViewController);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_3;
  v10[3] = &unk_264D121F0;
  id v11 = *(id *)(a1 + 40);
  [MEMORY[0x263F84D88] setRightBadgeViewForText:v10];
  [MEMORY[0x263F84D88] setRightBadgeSizeForDigits:&__block_literal_global_360];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  double v7 = __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_5;
  id v8 = &unk_264D121F0;
  id v9 = *(id *)(a1 + 40);
  [MEMORY[0x263F84D88] setDownBadgeViewForText:&v5];
  objc_msgSend(MEMORY[0x263F84D88], "setDownBadgeSizeForDigits:", &__block_literal_global_362, v5, v6, v7, v8);
  id v3 = objc_alloc_init(MEMORY[0x263F84D90]);
  [(CACPopoverPresentingViewController *)v2 setPopoverPresentationDelegate:*(void *)(a1 + 32)];
  [(CACPopoverPresentingViewController *)v2 setViewControllerInPopover:v3];
  -[CACPopoverPresentingViewController setPortraitUpSourceRect:](v2, "setPortraitUpSourceRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [(CACPopoverPresentingViewController *)v2 setPermittedArrowDirections:1];
  [v3 setPopoverShowing:1];

  return v2;
}

id __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [CACLabeledBadgeView alloc];
  uint64_t v5 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v4, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v3, 1, 0, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v6;
}

uint64_t __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = UIAccessibilityDarkerSystemColorsEnabled();
  return +[CACLabeledBadgeView sizeOfBadgeGivenNumberOfDisplayedDigits:a2 arrowOrientation:1 badgePresentation:0 badgeIndicator:0 contrasted:v3];
}

id __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [CACLabeledBadgeView alloc];
  uint64_t v5 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v4, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v3, 2, 0, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v6;
}

uint64_t __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_6(uint64_t a1, uint64_t a2)
{
  BOOL v3 = UIAccessibilityDarkerSystemColorsEnabled();
  return +[CACLabeledBadgeView sizeOfBadgeGivenNumberOfDisplayedDigits:a2 arrowOrientation:2 badgePresentation:0 badgeIndicator:0 contrasted:v3];
}

void __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 viewControllerInPopover];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [v4 setText:v5];

  [v4 setType:*(void *)(a1 + 48)];
  [v4 setStartIndex:*(void *)(a1 + 56)];
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  id v8 = [v3 view];
  [v8 bounds];
  CGFloat v10 = v6 - v9 * 0.5;

  id v11 = [v3 view];

  [v11 bounds];
  CGFloat v13 = v7 - (v12 * 0.5 + 15.0);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_8;
  block[3] = &unk_264D115D0;
  id v16 = v4;
  id v14 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
  v17.size.CGFloat width = *(CGFloat *)(a1 + 80);
  v17.size.double height = *(CGFloat *)(a1 + 88);
  v17.origin.CGFloat x = v10;
  v17.origin.CGFloat y = v13;
  CGRect v18 = CGRectInset(v17, 0.0, 4.0);
  objc_msgSend(v14, "setFocusRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

uint64_t __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPopoverShowing:1];
}

- (void)showLinesForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5
{
  self->_overlayType = 1;
  [(CACEditingModeOverlayManager *)self _showOverlayElementsForElement:a3 textUnit:2 startIndex:a5];
}

- (void)showParagraphsForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5
{
  self->_overlayType = 2;
  [(CACEditingModeOverlayManager *)self _showOverlayElementsForElement:a3 textUnit:4 startIndex:a5];
}

- (void)showSentencesForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5
{
  self->_overlayType = 3;
  [(CACEditingModeOverlayManager *)self _showOverlayElementsForElement:a3 textUnit:3 startIndex:a5];
}

- (void)showCharactersForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5
{
  self->_overlayType = 4;
  -[CACEditingModeOverlayManager _showPopoverForElement:targetRange:startIndex:type:](self, "_showPopoverForElement:targetRange:startIndex:type:", a3, a4.location, a4.length, a5, 0);
}

- (BOOL)isOverlay
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)startDelayedDimmingOfNumbers
{
  [(CACSimpleContentViewManager *)self setPendingDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID] + 1];
  [(CACSimpleContentViewManager *)self setActiveDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID]];
  id v3 = [(CACEditingModeOverlayManager *)self editingModeOverlayViewController];
  double v4 = [v3 view];
  [v4 setAlpha:1.0];

  uint64_t v5 = [(CACEditingModeOverlayManager *)self delegate];
  LODWORD(v4) = [v5 isOverlayFadingEnabledForEditingModeOverlayManager:self];

  if (v4)
  {
    double v6 = [(CACEditingModeOverlayManager *)self delegate];
    [v6 overlayFadeDelayForEditingModeOverlayManager:self];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__CACEditingModeOverlayManager_startDelayedDimmingOfNumbers__block_invoke;
    block[3] = &unk_264D115D0;
    void block[4] = self;
    dispatch_after(v8, MEMORY[0x263EF83A0], block);
  }
}

void __60__CACEditingModeOverlayManager_startDelayedDimmingOfNumbers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeDimmingTransactionID];
  if (v2 == [*(id *)(a1 + 32) pendingDimmingTransactionID])
  {
    id v3 = [*(id *)(a1 + 32) editingModeOverlayViewController];

    if (v3)
    {
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __60__CACEditingModeOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2;
      v4[3] = &unk_264D115D0;
      v4[4] = *(void *)(a1 + 32);
      [MEMORY[0x263F82E00] animateWithDuration:v4 animations:0 completion:1.0];
    }
  }
}

void __60__CACEditingModeOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 overlayFadeOpacityForEditingModeOverlayManager:*(void *)(a1 + 32)];
  double v3 = v2;
  double v4 = [*(id *)(a1 + 32) editingModeOverlayViewController];
  uint64_t v5 = [v4 view];
  [v5 setAlpha:v3];
}

- (void)stopDelayedDimmingOfNumbers
{
  [(CACSimpleContentViewManager *)self setPendingDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID] + 1];
  id v4 = [(CACEditingModeOverlayManager *)self editingModeOverlayViewController];
  double v3 = [v4 view];
  [v3 setAlpha:1.0];
}

- (CACEditingModeOverlayManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACEditingModeOverlayManagerDelegate *)WeakRetained;
}

- (NSArray)overlayElements
{
  return self->_overlayElements;
}

- (void)setOverlayElements:(id)a3
{
}

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (CACEditingModeOverlayViewController)editingModeOverlayViewController
{
  return self->_editingModeOverlayViewController;
}

- (void)setEditingModeOverlayViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingModeOverlayViewController, 0);
  objc_storeStrong((id *)&self->_overlayElements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lineFetchingQueue, 0);
}

@end