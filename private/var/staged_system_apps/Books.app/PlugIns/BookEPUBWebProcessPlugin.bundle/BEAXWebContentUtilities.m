@interface BEAXWebContentUtilities
+ (BOOL)checkIfCurrentSelection;
+ (CGPoint)offset;
+ (CGRect)frameForLineNumber:(int64_t)a3 forBookContentElement:(id)a4;
+ (CGRect)frameForRange:(_NSRange)a3 forBookContentElement:(id)a4;
+ (_NSRange)_visibleRangeWithRect:(CGRect)a3 withLineInfos:(id)a4;
+ (_NSRange)chapterRangeForRange:(_NSRange)a3 forBookContentElement:(id)a4;
+ (_NSRange)lineRangeForCharacterPosition:(int64_t)a3 forBookContentElement:(id)a4;
+ (_NSRange)lineRangeForLineNumber:(int64_t)a3 forBookContentElement:(id)a4;
+ (_NSRange)rangeFromBookContentElement:(id)a3;
+ (_NSRange)selectedTextRangeForBookContentElement:(id)a3;
+ (_NSRange)visibleLinesForBookContentElement:(id)a3;
+ (_NSRange)visibleTextRangeInChapterForBookContentElement:(id)a3;
+ (id)attributedPageContentForBookContentElement:(id)a3;
+ (id)attributedStringForLineNumber:(int64_t)a3 forBookContentElement:(id)a4;
+ (id)attributedStringWithFixedAttachments:(id)a3;
+ (id)attributedValueForBookContentElement:(id)a3;
+ (id)attributedValueForRange:(_NSRange)a3 forBookContentElement:(id)a4;
+ (id)childElementForRange:(_NSRange)a3 forBookContentElement:(id)a4;
+ (id)jsContext;
+ (id)sharedUtilities;
+ (id)stringForRange:(_NSRange)a3 forBookContentElement:(id)a4;
+ (id)visiblePageContentForBookContentElement:(id)a3;
+ (int64_t)lineNumberForPoint:(CGPoint)a3 forBookContentElement:(id)a4;
+ (void)checkCanPerformActions;
+ (void)jsSetSelectionWithFrame:(CGRect)a3;
+ (void)performNativeAction:(id)a3;
+ (void)setSelectedTextRange:(_NSRange)a3 forBookContentElement:(id)a4;
+ (void)setWebProcessPlugin:(id)a3;
+ (void)toggleBookmark;
+ (void)toggleControlsVisibility;
+ (void)turnPageWithDirection:(id)a3;
- (BookEPUBWebProcessPlugin)webProcessPlugin;
- (JSContext)jsContext;
- (void)setWebProcessPlugin:(id)a3;
@end

@implementation BEAXWebContentUtilities

+ (id)sharedUtilities
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D73C;
  block[3] = &unk_208B8;
  block[4] = a1;
  if (qword_27210 != -1) {
    dispatch_once(&qword_27210, block);
  }
  v2 = (void *)qword_27218;

  return v2;
}

+ (void)setWebProcessPlugin:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedUtilities];
  [v5 setWebProcessPlugin:v4];
}

+ (_NSRange)lineRangeForCharacterPosition:(int64_t)a3 forBookContentElement:(id)a4
{
  id v6 = a4;
  v7 = +[BEAXLineInfo chapterLineInfosForElement:v6];
  v8 = [a1 visibleTextRangeInChapterForBookContentElement:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    v12 = &v8[a3];
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v15 = [v14 rangeInChapter];
        if (v12 <= &v15[v16])
        {
          v18 = [v14 rangeInChapter];
          id v10 = v19;
          NSUInteger v17 = v18 - v8;
          goto LABEL_11;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  NSUInteger v17 = 0;
LABEL_11:

  NSUInteger v20 = v17;
  NSUInteger v21 = (NSUInteger)v10;
  result.length = v21;
  result.location = v20;
  return result;
}

+ (_NSRange)lineRangeForLineNumber:(int64_t)a3 forBookContentElement:(id)a4
{
  id v6 = a4;
  v7 = +[BEAXLineInfo chapterLineInfosForElement:v6];
  v8 = [a1 visibleTextRangeInChapterForBookContentElement:v6];
  id v9 = [a1 visibleLinesForBookContentElement:v6];

  unint64_t v10 = (unint64_t)v9 + a3;
  if (v10 >= (unint64_t)[v7 count])
  {
    NSUInteger v14 = 0;
    NSUInteger v15 = 0;
  }
  else
  {
    uint64_t v11 = [v7 objectAtIndexedSubscript:v10];
    v12 = [v11 rangeInChapter];
    NSUInteger v14 = v13;

    NSUInteger v15 = v12 - v8;
  }

  NSUInteger v16 = v15;
  NSUInteger v17 = v14;
  result.length = v17;
  result.location = v16;
  return result;
}

+ (_NSRange)selectedTextRangeForBookContentElement:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 elementTextRange];
    NSUInteger v6 = v5;
  }
  else
  {
    id v4 = 0;
    NSUInteger v6 = 0;
  }

  NSUInteger v7 = (NSUInteger)v4;
  NSUInteger v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

+ (id)attributedValueForRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    NSUInteger v8 = [v7 attributedStringForRange:[a1 visibleTextRangeInChapterForBookContentElement:v7] + location length];
  }
  else
  {
    NSUInteger v8 = 0;
  }

  return v8;
}

+ (id)stringForRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    NSUInteger v8 = [v7 stringForRange:((char *)[a1 visibleTextRangeInChapterForBookContentElement:v7] + location)];
  }
  else
  {
    NSUInteger v8 = 0;
  }

  return v8;
}

+ (id)attributedValueForBookContentElement:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 attributedStringForElement];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (CGRect)frameForLineNumber:(int64_t)a3 forBookContentElement:(id)a4
{
  id v6 = a4;
  id v7 = (char *)[a1 visibleLinesForBookContentElement:v6] + a3;
  NSUInteger v8 = +[BEAXLineInfo chapterLineInfosForElement:v6];

  if (v7 >= [v8 count])
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  else
  {
    id v9 = [v8 objectAtIndexedSubscript:v7];
    [v9 frameInScreenCoordinates];
    double x = v10;
    double y = v12;
    CGFloat width = v14;
    CGFloat height = v16;
  }
  +[BEAXLineInfo subtractOffsetForPoint:](BEAXLineInfo, "subtractOffsetForPoint:", x, y);
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

+ (CGRect)frameForRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  [v7 baxBoundsForRange:((char *)[a1 visibleTextRangeInChapterForBookContentElement:v7] + location) length];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

+ (_NSRange)chapterRangeForRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger v5 = (char *)[a1 visibleTextRangeInChapterForBookContentElement:a4] + a3.location;
  NSUInteger v6 = length;
  result.NSUInteger length = v6;
  result.NSUInteger location = (NSUInteger)v5;
  return result;
}

+ (id)attributedPageContentForBookContentElement:(id)a3
{
  return [a1 visiblePageContentForBookContentElement:a3];
}

+ (int64_t)lineNumberForPoint:(CGPoint)a3 forBookContentElement:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  +[BEAXLineInfo addOffsetForPoint:](BEAXLineInfo, "addOffsetForPoint:", x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = +[BEAXLineInfo chapterLineInfosForElement:v7];
  uint64_t v13 = (uint64_t)[a1 visibleLinesForBookContentElement:v7];
  uint64_t v45 = v14;
  double v15 = +[NSMutableIndexSet indexSet];
  uint64_t v46 = v13;
  if ([v12 count])
  {
    unint64_t v16 = 0;
    uint64_t v17 = -v13;
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    double v19 = 1.79769313e308;
    double v47 = v9;
    double v48 = v11;
    while (1)
    {
      double v20 = [v12 objectAtIndexedSubscript:v16];
      [v20 frameInScreenCoordinates];
      CGFloat v21 = v65.origin.x;
      CGFloat v22 = v65.origin.y;
      CGFloat width = v65.size.width;
      CGFloat height = v65.size.height;
      v64.double x = v9;
      v64.double y = v11;
      if (CGRectContainsPoint(v65, v64)) {
        break;
      }
      [v20 frameInScreenCoordinates];
      double MidX = CGRectGetMidX(v66);
      [v20 frameInScreenCoordinates];
      double MidY = CGRectGetMidY(v67);
      [v20 frameInScreenCoordinates];
      double MinY = CGRectGetMinY(v68);
      v28 = +[BEAccessibilityReadingState currentReadingState];
      v29 = (char *)[v28 bookLayout];

      if (v29 == (unsigned char *)&dword_0 + 3)
      {
        v69.origin.double x = v21;
        v69.origin.double y = v22;
        v69.size.CGFloat width = width;
        v69.size.CGFloat height = height;
        if (CGRectGetMinY(v69) <= v48)
        {
          v70.origin.double x = v21;
          v70.origin.double y = v22;
          v70.size.CGFloat width = width;
          v70.size.CGFloat height = height;
          if (v48 <= CGRectGetMaxY(v70)) {
            [v15 addIndex:v16];
          }
        }
        double v30 = vabdd_f64(v48, MidY);
        [v20 frameInScreenCoordinates];
        double MinY = CGRectGetMinX(v71);
        CGFloat v9 = v47;
        double v31 = v47;
      }
      else
      {
        CGFloat v9 = v47;
        double v30 = vabdd_f64(v47, MidX);
        v72.origin.double x = v21;
        v72.origin.double y = v22;
        v72.size.CGFloat width = width;
        v72.size.CGFloat height = height;
        if (CGRectGetMinX(v72) <= v47)
        {
          v73.origin.double x = v21;
          v73.origin.double y = v22;
          v73.size.CGFloat width = width;
          v73.size.CGFloat height = height;
          if (v47 <= CGRectGetMaxX(v73)) {
            [v15 addIndex:v16];
          }
        }
        double v31 = v48;
      }
      BOOL v32 = v30 >= v19;
      if (MinY < 0.0) {
        BOOL v32 = 1;
      }
      if (MinY > v31) {
        BOOL v32 = 1;
      }
      if (!v32)
      {
        uint64_t v18 = v17 + v16;
        double v19 = v30;
      }

      ++v16;
      CGFloat v11 = v48;
      if (v16 >= (unint64_t)[v12 count]) {
        goto LABEL_23;
      }
    }

    if (v46 + 0x7FFFFFFFFFFFFFFFLL != v16)
    {
      int64_t v43 = v16 - v46;
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_23:
  v33 = +[BEAccessibilityReadingState currentReadingState];
  [v33 primaryVisibleContentRect];
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;

  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0x7FFFFFFFFFFFFFFFLL;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_E15C;
  v49[3] = &unk_208E0;
  CGFloat v52 = v9;
  CGFloat v53 = v11;
  uint64_t v54 = v35;
  uint64_t v55 = v37;
  uint64_t v56 = v39;
  uint64_t v57 = v41;
  id v50 = v12;
  v51 = &v60;
  uint64_t v58 = v46;
  uint64_t v59 = v45;
  [v15 enumerateIndexesUsingBlock:v49];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v42 = 0;
  }
  else {
    int64_t v42 = v18;
  }
  if (v61[3] == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v43 = v42;
  }
  else {
    int64_t v43 = v61[3];
  }

  _Block_object_dispose(&v60, 8);
LABEL_30:

  return v43;
}

+ (id)attributedStringForLineNumber:(int64_t)a3 forBookContentElement:(id)a4
{
  id v6 = a4;
  id v7 = +[BEAXLineInfo chapterLineInfosForElement:v6];
  id v8 = [a1 visibleLinesForBookContentElement:v6];

  unint64_t v9 = (unint64_t)v8 + a3;
  if (v9 >= (unint64_t)[v7 count])
  {
    CGFloat v11 = 0;
  }
  else
  {
    double v10 = [v7 objectAtIndexedSubscript:v9];
    CGFloat v11 = [v10 attributedText];
  }

  return v11;
}

+ (id)jsContext
{
  v2 = [a1 sharedUtilities];
  id v3 = [v2 webProcessPlugin];
  id v4 = [v3 defaultJSContext];

  return v4;
}

+ (CGPoint)offset
{
  id v3 = +[NSString stringWithFormat:@"__ibooks_content_support.pageOffset()"];
  id v4 = [a1 jsContext];
  NSUInteger v5 = [v4 evaluateScript:v3];

  id v6 = [v5 toDictionary];
  id v7 = [v6 objectForKeyedSubscript:@"xOffset"];
  id v8 = [v6 objectForKeyedSubscript:@"yOffset"];
  [v7 floatValue];
  double v10 = v9;
  [v8 floatValue];
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

+ (_NSRange)rangeFromBookContentElement:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 elementTextRange];
    NSUInteger v6 = v5;
  }
  else
  {
    id v4 = 0;
    NSUInteger v6 = 0;
  }

  NSUInteger v7 = (NSUInteger)v4;
  NSUInteger v8 = v6;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

+ (void)setSelectedTextRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [v6 _accessibilitySetSelectedTextRange:location, length];
  }
}

+ (id)visiblePageContentForBookContentElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 baxStoredAttributedPageContent];
  if (!v5
    || (id v6 = (void *)v5,
        [v4 baxStoredAttributedPageContent],
        NSUInteger v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 length],
        v7,
        v6,
        !v8))
  {
    float v9 = [v4 attributedStringForElement];
    double v10 = (char *)[a1 visibleTextRangeInChapterForBookContentElement:v4];
    uint64_t v12 = v11;
    if (&v10[v11] <= [v9 length])
    {
      double v13 = [v9 attributedSubstringFromRange:v10, v12];
      [v4 baxSetStoredAttributedPageContent:v13];
    }
    else
    {
      [v4 baxSetStoredAttributedPageContent:0];
    }
  }
  double v14 = [v4 baxStoredAttributedPageContent];

  return v14;
}

+ (void)toggleBookmark
{
  id v3 = [a1 jsContext];
  id v2 = [v3 evaluateScript:@"__ibooks_content_support.notifyNativeOfBookmarkPage()"];
}

+ (void)toggleControlsVisibility
{
  id v3 = [a1 jsContext];
  id v2 = [v3 evaluateScript:@"__ibooks_content_support.notifyNativeOfToggleControlsVisibility()"];
}

+ (void)turnPageWithDirection:(id)a3
{
  id v6 = +[NSString stringWithFormat:@"__ibooks_content_support.notifyNativeOfPageTurn('%@')", a3];
  id v4 = [a1 jsContext];
  id v5 = [v4 evaluateScript:v6];
}

+ (void)checkCanPerformActions
{
  id v5 = +[NSString stringWithFormat:@"__ibooks_content_support.checkNativeForOperations()"];
  id v3 = [a1 jsContext];
  id v4 = [v3 evaluateScript:v5];
}

+ (void)performNativeAction:(id)a3
{
  id v6 = +[NSString stringWithFormat:@"__ibooks_content_support.performNativeOperation('%@')", a3];
  id v4 = [a1 jsContext];
  id v5 = [v4 evaluateScript:v6];
}

+ (BOOL)checkIfCurrentSelection
{
  id v3 = +[NSString stringWithFormat:@"__ibooks_content_support.checkIfCurrentSelection()"];
  id v4 = [a1 jsContext];
  id v5 = [v4 evaluateScript:v3];
  unsigned __int8 v6 = [v5 toBool];

  return v6;
}

+ (void)jsSetSelectionWithFrame:(CGRect)a3
{
  id v6 = +[NSString stringWithFormat:@"__ibooks_content_support.setSelectionForRange('%f, %f')", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(void *)&a3.origin.x, *(void *)&a3.origin.y];
  id v4 = [a1 jsContext];
  id v5 = [v4 evaluateScript:v6];
}

+ (_NSRange)visibleLinesForBookContentElement:(id)a3
{
  id v3 = a3;
  id v4 = +[BEAXLineInfo chapterLineInfosForElement:v3];
  id v5 = +[BEAccessibilityReadingState currentReadingState];
  if ([v5 isFixedLayoutBook])
  {
    [v3 accessibilityVisibleContentRect];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v10 = +[BEAccessibilityReadingState currentReadingState];
    [v10 primaryVisibleContentRect];
    double v7 = v11;
    double v9 = v12;
  }
  +[BEAXLineInfo addOffsetForPoint:](BEAXLineInfo, "addOffsetForPoint:", v7, v9);
  id v13 = +[BEAXWebContentUtilities _visibleRangeWithRect:withLineInfos:](BEAXWebContentUtilities, "_visibleRangeWithRect:withLineInfos:", v4);
  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    double v15 = +[BEAccessibilityReadingState currentReadingState];
    if ([v15 isFixedLayoutBook])
    {
      [v3 accessibilityVisibleContentRect];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
    }
    else
    {
      double v24 = +[BEAccessibilityReadingState currentReadingState];
      [v24 secondaryVisibleContentRect];
      double v17 = v25;
      double v19 = v26;
      double v21 = v27;
      double v23 = v28;
    }
    id v13 = +[BEAXWebContentUtilities _visibleRangeWithRect:withLineInfos:](BEAXWebContentUtilities, "_visibleRangeWithRect:withLineInfos:", v4, v17, v19, v21, v23);
  }
  NSUInteger v29 = (NSUInteger)v13;
  NSUInteger v30 = v14;

  NSUInteger v31 = v29;
  NSUInteger v32 = v30;
  result.NSUInteger length = v32;
  result.NSUInteger location = v31;
  return result;
}

+ (_NSRange)_visibleRangeWithRect:(CGRect)a3 withLineInfos:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = a4;
  double v9 = 0;
  if ([v8 count])
  {
    double v10 = 0;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      double v12 = [v8 objectAtIndexedSubscript:v10];
      [v12 frameInScreenCoordinates];
      v22.origin.CGFloat x = v13;
      v22.origin.CGFloat y = v14;
      v22.size.CGFloat width = v15;
      v22.size.CGFloat height = v16;
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      if (CGRectIntersectsRect(v21, v22))
      {
        if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v17 = (uint64_t)v10;
        }
        else {
          uint64_t v17 = v11;
        }
      }
      else
      {
        uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          double v9 = &v10[-v11];

          uint64_t v17 = v11;
          goto LABEL_14;
        }
      }
      if (v10 == (char *)[v8 count] - 1) {
        double v9 = (char *)[v8 count] - v17;
      }

      ++v10;
      uint64_t v11 = v17;
      if (v10 >= [v8 count]) {
        goto LABEL_14;
      }
    }
  }
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  NSUInteger v18 = v17;
  NSUInteger v19 = (NSUInteger)v9;
  result.NSUInteger length = v19;
  result.NSUInteger location = v18;
  return result;
}

+ (_NSRange)visibleTextRangeInChapterForBookContentElement:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[a1 visibleLinesForBookContentElement:v4];
  uint64_t v7 = v6;
  id v8 = +[BEAXLineInfo chapterLineInfosForElement:v4];

  if (v5 < [v8 count] && (double v9 = &v5[v7], &v5[v7] <= objc_msgSend(v8, "count")))
  {
    double v12 = [v8 objectAtIndexedSubscript:v5];
    id v10 = [v12 rangeInChapter];

    CGFloat v13 = [v8 objectAtIndexedSubscript:v9 - 1];
    CGFloat v14 = (char *)[v13 rangeInChapter];
    uint64_t v16 = v15;

    uint64_t v11 = &v14[v16 - (void)v10];
  }
  else
  {
    id v10 = 0;
    uint64_t v11 = 0;
  }

  NSUInteger v17 = (NSUInteger)v10;
  NSUInteger v18 = (NSUInteger)v11;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

+ (id)childElementForRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = [a1 visibleTextRangeInChapterForBookContentElement:v7];
  double v9 = (char *)[v7 accessibilityElementCount];
  id v10 = 0;
  uint64_t v11 = v9 - 1;
  if ((uint64_t)v9 >= 1)
  {
    double v12 = 0;
    NSUInteger v13 = (NSUInteger)v8 + location;
    do
    {
      CGFloat v14 = v10;
      id v10 = [v7 accessibilityElementAtIndex:v12];

      v20.NSUInteger location = (NSUInteger)[v10 elementTextRange];
      v20.NSUInteger length = v15;
      v19.NSUInteger location = v13;
      v19.NSUInteger length = length;
      if (NSIntersectionRange(v19, v20).length) {
        break;
      }
    }
    while (v11 != v12++);
  }

  return v10;
}

+ (id)attributedStringWithFixedAttachments:(id)a3
{
  id v4 = [a3 mutableCopy];
  uint64_t v5 = UIAccessibilityTokenAttachment;
  id v6 = [v4 length];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  double v12 = sub_EEB4;
  NSUInteger v13 = &unk_20908;
  id v14 = v4;
  id v15 = a1;
  id v7 = v4;
  [v7 enumerateAttribute:v5 inRange:0 options:0x100000 usingBlock:&v10];
  id v8 = [v7 copy:v10, v11, v12, v13];

  return v8;
}

- (BookEPUBWebProcessPlugin)webProcessPlugin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webProcessPlugin);

  return (BookEPUBWebProcessPlugin *)WeakRetained;
}

- (void)setWebProcessPlugin:(id)a3
{
}

- (JSContext)jsContext
{
  return self->_jsContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsContext, 0);

  objc_destroyWeak((id *)&self->_webProcessPlugin);
}

@end