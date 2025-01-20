@interface THNavigationUnit
+ (THNavigationUnit)navigationUnitWithContext:(id)a3 andModelNode:(id)a4;
+ (id)emptyNavigationUnitWithContext:(id)a3;
- (BOOL)containsContentNode:(id)a3;
- (NSArray)contentNodes;
- (THNavigationUnit)initWithContext:(id)a3 contentNodes:(id)a4;
- (_NSRange)absolutePageRangeForPresentationType:(id)a3;
- (id)contentNodeAfterNode:(id)a3;
- (id)contentNodeBeforeNode:(id)a3;
- (id)contentNodeForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (id)contentNodeForInfo:(id)a3;
- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (id)contentNodesSurroundingRelativePageRange:(_NSRange)a3 forPresentationType:(id)a4;
- (id)pageInfoForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (unint64_t)absolutePageIndexForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (unint64_t)navUnitRelativePageIndexForContentNode:(id)a3 forContentNodeRelativePageIndex:(unint64_t)a4 presentationType:(id)a5;
- (unint64_t)nodeRelativePageIndexInContentNode:(id)a3 forNavigationUnitRelativePageIndex:(unint64_t)a4 presentationType:(id)a5;
- (unint64_t)pageCountForPresentationType:(id)a3;
- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (unint64_t)startPageAbsolutePageIndexForPresentationType:(id)a3;
- (void)dealloc;
@end

@implementation THNavigationUnit

- (THNavigationUnit)initWithContext:(id)a3 contentNodes:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THNavigationUnit;
  v5 = [(THNavigationUnit *)&v7 initWithContext:a3];
  if (v5) {
    v5->mContentNodes = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithArray:a4];
  }
  return v5;
}

- (void)dealloc
{
  self->mContentNodes = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNavigationUnit;
  [(THNavigationUnit *)&v3 dealloc];
}

+ (id)emptyNavigationUnitWithContext:(id)a3
{
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithContext:a3 contentNodes:[NSArray array]];

  return v3;
}

+ (THNavigationUnit)navigationUnitWithContext:(id)a3 andModelNode:(id)a4
{
  id v6 = +[NSMutableArray array];
  sub_64BF0(a4, v6);
  result = (THNavigationUnit *)[v6 count];
  if (result)
  {
    v8 = [[THNavigationUnit alloc] initWithContext:a3 contentNodes:v6];
    return v8;
  }
  return result;
}

- (NSArray)contentNodes
{
  return +[NSArray arrayWithArray:self->mContentNodes];
}

- (BOOL)containsContentNode:(id)a3
{
  if (a3) {
    return -[NSArray containsObject:](self->mContentNodes, "containsObject:");
  }
  else {
    return 0;
  }
}

- (id)contentNodeForInfo:(id)a3
{
  if (!a3)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THNavigationUnit contentNodeForInfo:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"] lineNumber:103 description:@"Searching among content nodes to find nil info.";
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mContentNodes = self->mContentNodes;
  id v5 = [(NSArray *)mContentNodes countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(mContentNodes);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 isLoaded])
    {
      if ([v9 containsInfo:a3]) {
        return v9;
      }
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)mContentNodes countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_4;
      }
      return 0;
    }
  }
}

- (unint64_t)absolutePageIndexForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit absolutePageIndexForRelativePageIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m") lineNumber:123 description:@"Translating invalid relative page index (NSUNotFound)."];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = [(THNavigationUnit *)self contentNodes];
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      unint64_t v10 = a3;
LABEL_5:
      long long v11 = 0;
      unint64_t v12 = v10;
      while (1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
        unint64_t v14 = (unint64_t)[v13 pageCountForPresentationType:a4];
        if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        unint64_t v10 = v12 - v14;
        if (v12 < v14)
        {
          if (!v13) {
            break;
          }
          id v15 = [v13 absolutePageRangeForPresentationType:a4];
          unint64_t result = (unint64_t)v15 + v12;
          if (v15 == (id)0x7FFFFFFFFFFFFFFFLL || result == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          return result;
        }
        long long v11 = (char *)v11 + 1;
        v12 -= v14;
        if (v8 == v11)
        {
          id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v8) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit absolutePageIndexForRelativePageIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m") lineNumber:160 description:@"Failed to find absolute page index for relative page index %lu" a3];
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m") lineNumber:165 description:@"Translating invalid absolute page index (NSUNotFound)."];
  }
  if (![(NSArray *)[(THNavigationUnit *)self contentNodes] count]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m") lineNumber:167 description:@"Warning: translating relative page from absolute page %lu when navigation unit has no content nodes." a3];
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || ![(NSArray *)[(THNavigationUnit *)self contentNodes] count]) {
    goto LABEL_24;
  }
  objc_opt_class();
  [(NSArray *)[(THNavigationUnit *)self contentNodes] objectAtIndex:0];
  id v7 = objc_msgSend(objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "documentRoot"), "rootNode"), "contentNodeForRelativePageIndex:forPresentationType:", a3, a4);
  if (!v7) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m") lineNumber:172 description:@"failed to find content node for absolute page index %lu" a3];
  }
  if (![(THNavigationUnit *)self containsContentNode:v7]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m") lineNumber:173 description:@"current navigation unit does not contain content node for absolute page index %lu" a3];
  }
  if (!v7 || ![(THNavigationUnit *)self containsContentNode:v7]) {
    goto LABEL_24;
  }
  id v8 = (char *)[v7 relativePageIndexForAbsolutePageIndex:a3 forPresentationType:a4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [(THNavigationUnit *)self contentNodes];
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_15:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(id *)(*((void *)&v16 + 1) + 8 * v13);
      if (v14 == v7) {
        break;
      }
      id v8 = &v8[(void)[v14 pageCountForPresentationType:a4]];
      if (v11 == (id)++v13)
      {
        id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          goto LABEL_15;
        }
        break;
      }
    }
  }
  if (v8 >= (char *)[(THNavigationUnit *)self pageCountForPresentationType:a4]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"] lineNumber:183 description:[NSString stringWithFormat:@"Asking for page index %lu out of bounds", v8];
  }
  if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_24:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m") lineNumber:186 description:@"Failed to find relative page index for absolute page index %lu" a3];
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return (unint64_t)v8;
}

- (unint64_t)nodeRelativePageIndexInContentNode:(id)a3 forNavigationUnitRelativePageIndex:(unint64_t)a4 presentationType:(id)a5
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(THNavigationUnit *)self contentNodes];
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(id *)(*((void *)&v16 + 1) + 8 * v12);
      if (v13 == a3) {
        break;
      }
      id v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) pageCountForPresentationType:a5];
      if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        [v13 startLoading];
        [v13 waitUntilFinishedLoadingAndPaginating];
        id v14 = [v13 pageCountForPresentationType:a5];
        if (v14 == (id)0x7FFFFFFFFFFFFFFFLL) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      a4 -= (unint64_t)v14;
      if (v10 == (id)++v12)
      {
        id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          goto LABEL_3;
        }
        return a4;
      }
    }
  }
  return a4;
}

- (unint64_t)navUnitRelativePageIndexForContentNode:(id)a3 forContentNodeRelativePageIndex:(unint64_t)a4 presentationType:(id)a5
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [(THNavigationUnit *)self contentNodes];
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v9) {
    return 0;
  }
  id v10 = v9;
  unint64_t v11 = 0;
  uint64_t v12 = *(void *)v18;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v8);
      }
      id v14 = *(id *)(*((void *)&v17 + 1) + 8 * i);
      if (v14 == a3)
      {
        v11 += a4;
        return v11;
      }
      id v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) pageCountForPresentationType:a5];
      if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        [v14 startLoading];
        [v14 waitUntilFinishedLoadingAndPaginating];
        id v15 = [v14 pageCountForPresentationType:a5];
        if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      v11 += (unint64_t)v15;
    }
    id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10) {
      continue;
    }
    break;
  }
  return v11;
}

- (id)pageInfoForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit pageInfoForRelativePageIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m") lineNumber:265 description:@"Finding page info for invalid relative page index (NSUNotFound)."];
    return 0;
  }
  if (!a4) {
    return 0;
  }
  unint64_t v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(THNavigationUnit *)self contentNodes];
  id result = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      id v10 = 0;
      unint64_t v11 = v5;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
        unint64_t v13 = (unint64_t)[v12 pageCountForPresentationType:a4];
        unint64_t v5 = v11 - v13;
        if (v11 < v13) {
          return [v12 pageAtRelativeIndex:v11 forPresentationType:a4];
        }
        id v10 = (char *)v10 + 1;
        v11 -= v13;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id result = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)contentNodeBeforeNode:(id)a3
{
  NSUInteger v4 = [(NSArray *)[(THNavigationUnit *)self contentNodes] indexOfObjectIdenticalTo:a3];
  if (v4 < 2) {
    return 0;
  }
  NSUInteger v5 = v4;
  id v6 = [(THNavigationUnit *)self contentNodes];

  return [(NSArray *)v6 objectAtIndex:v5 - 1];
}

- (id)contentNodeAfterNode:(id)a3
{
  NSUInteger v4 = [(NSArray *)[(THNavigationUnit *)self contentNodes] indexOfObjectIdenticalTo:a3];
  if (v4 >= (char *)[(NSArray *)[(THNavigationUnit *)self contentNodes] count] - 1) {
    return 0;
  }
  NSUInteger v5 = [(THNavigationUnit *)self contentNodes];

  return [(NSArray *)v5 objectAtIndex:v4 + 1];
}

- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit contentNodeForRelativePageIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m") lineNumber:312 description:@"Finding content node for invalid relative page index (NSUNotFound)."];
    return 0;
  }
  if (!a4) {
    return 0;
  }
  unint64_t v5 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(THNavigationUnit *)self contentNodes];
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7) {
    return 0;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v17;
LABEL_6:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v17 != v9) {
      objc_enumerationMutation(v6);
    }
    unint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
    unint64_t v12 = (unint64_t)[v11 pageCountForPresentationType:a4];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v11 startLoading];
      [v11 waitUntilFinishedLoadingAndPaginating];
      unint64_t v12 = (unint64_t)[v11 pageCountForPresentationType:a4];
    }
    BOOL v13 = v5 >= v12;
    v5 -= v12;
    if (!v13 || v12 == 0x7FFFFFFFFFFFFFFFLL) {
      return v11;
    }
    if (v8 == (id)++v10)
    {
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      unint64_t v11 = 0;
      if (v8) {
        goto LABEL_6;
      }
      return v11;
    }
  }
}

- (id)contentNodeForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit contentNodeForAbsolutePageIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m") lineNumber:350 description:@"Finding content node for invalid absolute page index (NSUNotFound)."];
    return 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(THNavigationUnit *)self contentNodes];
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7) {
    return 0;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v17;
LABEL_5:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v17 != v9) {
      objc_enumerationMutation(v6);
    }
    unint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
    id v12 = [v11 absolutePageRangeForPresentationType:a4];
    if (v12 != (id)0x7FFFFFFFFFFFFFFFLL && a3 >= (unint64_t)v12 && a3 - (unint64_t)v12 < v13) {
      return v11;
    }
    if (v8 == (id)++v10)
    {
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      unint64_t v11 = 0;
      if (v8) {
        goto LABEL_5;
      }
      return v11;
    }
  }
}

- (id)contentNodesSurroundingRelativePageRange:(_NSRange)a3 forPresentationType:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = +[NSMutableIndexSet indexSet];
  NSUInteger v9 = [(NSArray *)[(THNavigationUnit *)self contentNodes] count];
  if (v9)
  {
    NSUInteger v10 = v9;
    uint64_t v11 = 0;
    NSUInteger v12 = 0;
    NSUInteger v13 = location + length;
    do
    {
      id v14 = [[-[THNavigationUnit contentNodes](self, "contentNodes") objectAtIndex:v11] pageCountForPresentationType:a4];
      id v15 = v14;
      if (location < v12 || location - v12 >= (unint64_t)v14)
      {
        if (v12 >= v13)
        {
          [v8 addIndex:v11];
          break;
        }
      }
      else if (v11)
      {
        [v8 addIndex:v11 - 1];
      }
      v12 += (NSUInteger)v15;
      ++v11;
    }
    while (v10 != v11);
  }
  long long v16 = [(THNavigationUnit *)self contentNodes];

  return [(NSArray *)v16 objectsAtIndexes:v8];
}

- (_NSRange)absolutePageRangeForPresentationType:(id)a3
{
  id v5 = NSInvalidRange[0];
  id v6 = NSInvalidRange[1];
  unint64_t v7 = -[THNavigationUnit startPageAbsolutePageIndexForPresentationType:](self, "startPageAbsolutePageIndexForPresentationType:");
  unint64_t v8 = [(THNavigationUnit *)self pageCountForPresentationType:a3];
  BOOL v9 = v7 != 0x7FFFFFFFFFFFFFFFLL;
  BOOL v10 = v8 != 0x7FFFFFFFFFFFFFFFLL;
  if (v9 && v10) {
    NSUInteger v11 = v8;
  }
  else {
    NSUInteger v11 = (NSUInteger)v6;
  }
  if (v9 && v10) {
    NSUInteger v12 = v7;
  }
  else {
    NSUInteger v12 = (NSUInteger)v5;
  }
  result.NSUInteger length = v11;
  result.NSUInteger location = v12;
  return result;
}

- (unint64_t)pageCountForPresentationType:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  NSUInteger v4 = [(THNavigationUnit *)self contentNodes];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)v13;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) pageCountForPresentationType:a3];
      if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      v7 += (unint64_t)v10;
    }
    id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6) {
      continue;
    }
    break;
  }
  return v7;
}

- (unint64_t)startPageAbsolutePageIndexForPresentationType:(id)a3
{
  id v4 = [(NSArray *)[(THNavigationUnit *)self contentNodes] objectAtIndex:0];

  return (unint64_t)[v4 absolutePageIndexForRelativePageIndex:0 forPresentationType:a3];
}

@end