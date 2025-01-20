@interface THModelNode
- (BOOL)hasFlushableContent;
- (BOOL)includeInTOC;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRoot;
- (NSString)nodeGUID;
- (NSString)title;
- (THModelContainerNode)parent;
- (THModelNode)initWithTitle:(id)a3 includeInTOC:(BOOL)a4 context:(id)a5;
- (THPresentationType)paginatedPresentationType;
- (_NSRange)absolutePageRangeForPresentationType:(id)a3;
- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (id)majorSnippet;
- (id)minorSnippet;
- (id)modelLinkWithFragment:(id)a3;
- (id)nextSibling;
- (id)pageAtRelativeIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (id)pageNumberStringForAbsolutePageIndex:(unint64_t)a3 presentationType:(id)a4;
- (id)previousSibling;
- (int)state;
- (unint64_t)absolutePageIndexForRelativePageIndex:(unint64_t)a3;
- (unint64_t)absolutePageIndexForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (unint64_t)pageCountForPresentationType:(id)a3;
- (unint64_t)precedingPageCountForPresentationType:(id)a3;
- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3;
- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (void)addMappingFromGUIDToNodeToDictionary:(id)a3;
- (void)dealloc;
- (void)enterAddedState:(id)a3;
- (void)enterAddingState:(id)a3;
- (void)enterRemovedState:(id)a3;
- (void)enterRemovingState:(id)a3;
- (void)setIncludeInTOC:(BOOL)a3;
- (void)setNodeGUID:(id)a3;
- (void)setPageCount:(unint64_t)a3 forPresentationType:(id)a4;
- (void)setPaginatedPresentationType:(id)a3;
- (void)setParent:(id)a3;
- (void)setState:(int)a3;
- (void)setTitle:(id)a3;
- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)wasRemovedFromDocumentRoot:(id)a3;
- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)willBeRemovedFromDocumentRoot:(id)a3;
@end

@implementation THModelNode

- (BOOL)includeInTOC
{
  return self->mIncludeInTOC;
}

- (void)setIncludeInTOC:(BOOL)a3
{
  self->mIncludeInTOC = a3;
}

- (NSString)nodeGUID
{
  return self->mGUID;
}

- (void)setNodeGUID:(id)a3
{
  [(THModelNode *)self willModify];
  id v5 = a3;

  self->mGUID = (NSString *)a3;
}

- (NSString)title
{
  return self->mTitle;
}

- (void)setTitle:(id)a3
{
  [(THModelNode *)self willModify];
  id v5 = a3;

  self->mTitle = (NSString *)a3;
}

- (int)state
{
  return self->mState;
}

- (void)setState:(int)a3
{
  self->mState = a3;
}

- (THModelContainerNode)parent
{
  return self->mParent;
}

- (void)setParent:(id)a3
{
  self->mParent = (THModelContainerNode *)a3;
}

- (THModelNode)initWithTitle:(id)a3 includeInTOC:(BOOL)a4 context:(id)a5
{
  BOOL v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)THModelNode;
  v8 = [(THModelNode *)&v11 initWithContext:a5];
  v9 = v8;
  if (v8)
  {
    [(THModelNode *)v8 setState:0];
    [(THModelNode *)v9 setNodeGUID:+[NSString tsu_stringWithUUID]];
    [(THModelNode *)v9 setTitle:a3];
    [(THModelNode *)v9 setIncludeInTOC:v6];
    [(THModelNode *)v9 setPaginatedPresentationType:+[THPresentationType paginatedPresentationTypeInContext:a5]];
  }
  return v9;
}

- (void)dealloc
{
  self->mGUID = 0;
  self->mTitle = 0;

  self->mPageCountByPresentationType = 0;
  self->mPaginatedPresentationType = 0;
  self->mParent = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelNode;
  [(THModelNode *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(THModelNode *)self nodeGUID];
  id v6 = [a3 nodeGUID];

  return [(NSString *)v5 isEqualToString:v6];
}

- (unint64_t)precedingPageCountForPresentationType:(id)a3
{
  unint64_t v5 = [[(THModelNode *)self parent] precedingPageCountForPresentationType:a3];
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v5;
    id v8 = [(THModelNode *)self previousSibling];
    if (v8)
    {
      id v9 = v8;
      unint64_t v6 = v7;
      while (1)
      {
        id v10 = [v9 pageCountForPresentationType:a3];
        if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        v6 += (unint64_t)v10;
        id v9 = [v9 previousSibling];
        if (!v9) {
          return v6;
        }
      }
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      return v7;
    }
  }
  return v6;
}

- (unint64_t)pageCountForPresentationType:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setPageCount:(unint64_t)a3 forPresentationType:(id)a4
{
  mPageCountByPresentationType = self->mPageCountByPresentationType;
  if (mPageCountByPresentationType)
  {
    [mPageCountByPresentationType objectForKey:a4].integerValue;
    id v8 = self->mPageCountByPresentationType;
  }
  else
  {
    id v8 = (TSUNoCopyDictionary *)[objc_alloc((Class)TSUNoCopyDictionary) initWithCapacity:2];
    self->mPageCountByPresentationType = v8;
  }
  id v9 = +[NSNumber numberWithUnsignedInteger:a3];

  [(TSUNoCopyDictionary *)v8 setObject:v9 forUncopiedKey:a4];
}

- (_NSRange)absolutePageRangeForPresentationType:(id)a3
{
  unint64_t v5 = -[THModelNode pageCountForPresentationType:](self, "pageCountForPresentationType:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = NSInvalidRange[0];
    id v7 = NSInvalidRange[1];
  }
  else
  {
    id v7 = (id)v5;
    id v6 = [(THModelNode *)self precedingPageCountForPresentationType:a3];
  }
  NSUInteger v8 = (NSUInteger)v7;
  result.length = v8;
  result.location = (NSUInteger)v6;
  return result;
}

- (id)pageAtRelativeIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  return 0;
}

- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  return 0;
}

- (void)addMappingFromGUIDToNodeToDictionary:(id)a3
{
  unint64_t v5 = [(THModelNode *)self nodeGUID];

  [a3 setObject:self forKey:v5];
}

- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  if ([(THModelNode *)self parent])
  {
    a3 = [[(THModelNode *)self parent] relativePageIndexForAbsolutePageIndex:a3 forPresentationType:a4];
    id v7 = [(THModelNode *)self previousSibling];
    if (v7)
    {
      id v8 = v7;
      do
      {
        a3 -= (unint64_t)[v8 pageCountForPresentationType:a4];
        id v8 = [v8 previousSibling];
      }
      while (v8);
    }
  }
  return a3;
}

- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3
{
  unint64_t v5 = [(THModelNode *)self paginatedPresentationType];

  return [(THModelNode *)self relativePageIndexForAbsolutePageIndex:a3 forPresentationType:v5];
}

- (unint64_t)absolutePageIndexForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  unint64_t v5 = [(THModelNode *)self precedingPageCountForPresentationType:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v5 + a3;
  }
}

- (unint64_t)absolutePageIndexForRelativePageIndex:(unint64_t)a3
{
  unint64_t v5 = [(THModelNode *)self paginatedPresentationType];

  return [(THModelNode *)self absolutePageIndexForRelativePageIndex:a3 forPresentationType:v5];
}

- (id)modelLinkWithFragment:(id)a3
{
  id v5 = [@"/" stringByAppendingPathComponent:[-[THModelNode documentRoot](self, "documentRoot") applePubDocId]];
  objc_opt_class();
  id v6 = (void *)TSUDynamicCast();
  if (v6) {
    goto LABEL_2;
  }
  objc_opt_class();
  while (1)
  {
    id v9 = (void *)TSUDynamicCast();
    id v10 = v9;
    if (!v9) {
      break;
    }
    if (![v9 count]) {
      break;
    }
    [v10 nodeAtIndex:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    objc_opt_class();
    [v10 nodeAtIndex:0];
  }
  if ([v10 count])
  {
    objc_opt_class();
    [v10 nodeAtIndex:0];
    id v6 = (void *)TSUDynamicCast();
    if (v6) {
LABEL_2:
    }
      id v5 = [v5 stringByAppendingPathComponent:[v6 applePubRelativePath]];
  }
  id v7 = [[THModelLink alloc] initWithPath:v5 fragment:a3 context:[self documentRoot].context];

  return v7;
}

- (BOOL)isRoot
{
  return [(THModelNode *)self parent] == 0;
}

- (void)enterAddingState:(id)a3
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode enterAddingState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m") lineNumber:231 description:@"invalid nil value for '%s'", "documentRoot"];
  }

  [(THModelNode *)self setState:1];
}

- (void)enterAddedState:(id)a3
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode enterAddedState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m") lineNumber:238 description:@"invalid nil value for '%s'", "documentRoot"];
  }

  [(THModelNode *)self setState:2];
}

- (void)enterRemovingState:(id)a3
{
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THModelNode enterRemovingState:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"] lineNumber:245 description:@"invalid nil value for '%s'", "documentRoot"];
  }

  [(THModelNode *)self setState:3];
}

- (void)enterRemovedState:(id)a3
{
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THModelNode enterRemovedState:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"] lineNumber:252 description:@"invalid nil value for '%s'", "documentRoot"];
  }

  [(THModelNode *)self setState:4];
}

- (id)nextSibling
{
  objc_super v3 = [(THModelNode *)self parent];

  return [(THModelContainerNode *)v3 nodeAfterNode:self];
}

- (id)previousSibling
{
  objc_super v3 = [(THModelNode *)self parent];

  return [(THModelContainerNode *)v3 nodeBeforeNode:self];
}

- (id)majorSnippet
{
  return 0;
}

- (id)minorSnippet
{
  return 0;
}

- (id)pageNumberStringForAbsolutePageIndex:(unint64_t)a3 presentationType:(id)a4
{
  id v7 = [(id)THBundle() localizedStringForKey:@"-" value:&stru_46D7E8 table:0];
  unint64_t v8 = [(THModelNode *)self relativePageIndexForAbsolutePageIndex:a3 forPresentationType:a4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL
    || (id v9 = [(THModelNode *)self contentNodeForRelativePageIndex:v8 forPresentationType:a4]) == 0)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
      return v7;
    }
    else {
      return +[NSString stringWithFormat:@"%lu", a3 + 1];
    }
  }
  else
  {
    return [v9 pageNumberStringForAbsolutePageIndex:a3 presentationType:a4];
  }
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  if (([(THModelNode *)self state] | 4) == 4)
  {
    objc_opt_class();
    uint64_t v5 = TSUDynamicCast();
    [(THModelNode *)self enterAddingState:v5];
  }
  else
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode willBeAddedToDocumentRoot:context:]");
    unint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:313 description:@"Invalid DOLC state transition willBeAddedToDocument"];
  }
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  if ([(THModelNode *)self state] == 1)
  {
    objc_opt_class();
    uint64_t v5 = TSUDynamicCast();
    [(THModelNode *)self enterAddedState:v5];
  }
  else
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode wasAddedToDocumentRoot:context:]");
    unint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:327 description:@"Invalid DOLC state transition wasAddedToDocument"];
  }
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  if ([(THModelNode *)self state] == 2)
  {
    objc_opt_class();
    uint64_t v4 = TSUDynamicCast();
    [(THModelNode *)self enterRemovingState:v4];
  }
  else
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode willBeRemovedFromDocumentRoot:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:342 description:@"Invalid DOLC state transition willBeRemovedFromDocument"];
  }
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  if ([(THModelNode *)self state] == 4)
  {
    objc_opt_class();
    uint64_t v4 = TSUDynamicCast();
    [(THModelNode *)self enterRemovedState:v4];
  }
  else
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode wasRemovedFromDocumentRoot:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:356 description:@"Invalid DOLC state transition wasRemovedFromDocument"];
  }
}

- (BOOL)hasFlushableContent
{
  return 0;
}

- (THPresentationType)paginatedPresentationType
{
  return self->mPaginatedPresentationType;
}

- (void)setPaginatedPresentationType:(id)a3
{
}

@end