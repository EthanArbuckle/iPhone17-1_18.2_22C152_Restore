@interface THDocumentNavigationModel
- (NSArray)contentNodes;
- (NSArray)navigationUnits;
- (NSMutableDictionary)contentNodeGUIDToContentNodeDictionary;
- (THDocumentNavigationModel)initWithDocumentRoot:(id)a3 navigationUnitsNodes:(id)a4;
- (THDocumentRoot)documentRoot;
- (THSnippetPair)p_snippetPairForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5;
- (id)chapterAndNumberStringForNavigationUnit:(id)a3;
- (id)contentNodeForAbsolutePageIndex:(unint64_t)a3;
- (id)contentNodeForBodyStorageID:(id)a3;
- (id)contentNodeForGUID:(id)a3;
- (id)contentNodeForInfoID:(id)a3;
- (id)contentNodeForPageLocation:(id)a3;
- (id)firstNavigationUnit;
- (id)linkForContentNode:(id)a3 fragment:(id)a4;
- (id)linkForNavigationUnitIndex:(unint64_t)a3;
- (id)minorSnippetForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5;
- (id)navigationUnitContainingContentNode:(id)a3;
- (id)navigationUnitFollowingNavigationUnit:(id)a3;
- (id)navigationUnitPrecedingNavigationUnit:(id)a3;
- (id)p_chapterNodeForContentNode:(id)a3;
- (id)p_lessonNodeForContentNode:(id)a3;
- (id)pageNumberStringForAbsolutePageIndex:(int64_t)a3 forPresentationType:(id)a4;
- (id)parentTitleForNavigationUnit:(id)a3;
- (id)sectionIdentifierForNavigationUnit:(id)a3;
- (id)titleStringForNavigationUnit:(id)a3;
- (id)uniqueIdentifierForNavigationUnit:(id)a3;
- (unint64_t)absolutePageIndexForContentNodeRelativePageIndex:(unint64_t)a3 inContentNode:(id)a4 forPresentationType:(id)a5;
- (unint64_t)absolutePageIndexForNavigationUnitRelativePageIndex:(unint64_t)a3 inNavigationUnit:(id)a4 forPresentationType:(id)a5;
- (unint64_t)navigationUnitRelativePageIndexForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (unint64_t)navigationUnitRelativePageIndexForContentNodeRelativePageIndex:(unint64_t)a3 inContentNode:(id)a4 forPresentationType:(id)a5;
- (unint64_t)pageCount;
- (void)dealloc;
- (void)p_inferNavigationUnits;
- (void)setContentNodeGUIDToContentNodeDictionary:(id)a3;
- (void)setDocumentRoot:(id)a3;
- (void)setNavigationUnits:(id)a3;
@end

@implementation THDocumentNavigationModel

- (THDocumentNavigationModel)initWithDocumentRoot:(id)a3 navigationUnitsNodes:(id)a4
{
  v33.receiver = self;
  v33.super_class = (Class)THDocumentNavigationModel;
  v6 = [(THDocumentNavigationModel *)&v33 init];
  v7 = v6;
  if (v6)
  {
    [(THDocumentNavigationModel *)v6 setDocumentRoot:a3];
    if (a4)
    {
      v26 = v7;
      v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a4 count]);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v9 = [a4 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v9)
      {
        id v10 = v9;
        v11 = &isPad_ptr;
        v12 = THTOCModel;
        uint64_t v13 = *(void *)v30;
        uint64_t v27 = *(void *)v30;
        do
        {
          v14 = 0;
          id v28 = v10;
          do
          {
            if (*(void *)v30 != v13) {
              objc_enumerationMutation(a4);
            }
            v15 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v16 = v8;
              id v17 = a3;
              v18 = v12;
              v19 = v11;
              id v20 = a4;
              id v21 = +[TSUAssertionHandler currentHandler];
              v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigationModel initWithDocumentRoot:navigationUnitsNodes:]");
              v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigationModel.m"];
              v24 = v21;
              a4 = v20;
              v11 = v19;
              v12 = v18;
              a3 = v17;
              v8 = v16;
              uint64_t v13 = v27;
              id v10 = v28;
              [v24 handleFailureInFunction:v22, v23, 62, @"Expected array of content nodes, got something not an array." file lineNumber description];
            }
            [v8 addObject:[objc_alloc(&v12[52]) initWithContext:[a3 context] contentNodes:[v15 copyWithZone:0]]];
            v14 = (char *)v14 + 1;
          }
          while (v10 != v14);
          id v10 = [a4 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v10);
      }
      v7 = v26;
      [(THDocumentNavigationModel *)v26 setNavigationUnits:v8];
    }
    else
    {
      [(THDocumentNavigationModel *)v7 p_inferNavigationUnits];
    }
    [(THDocumentNavigationModel *)v7 setContentNodeGUIDToContentNodeDictionary:+[NSMutableDictionary dictionary]];
    [(THModelNode *)[(THDocumentRoot *)[(THDocumentNavigationModel *)v7 documentRoot] rootNode] addMappingFromGUIDToNodeToDictionary:[(THDocumentNavigationModel *)v7 contentNodeGUIDToContentNodeDictionary]];
  }
  return v7;
}

- (void)dealloc
{
  [(THDocumentNavigationModel *)self setDocumentRoot:0];
  [(THDocumentNavigationModel *)self setNavigationUnits:0];
  [(THDocumentNavigationModel *)self setContentNodeGUIDToContentNodeDictionary:0];
  v3.receiver = self;
  v3.super_class = (Class)THDocumentNavigationModel;
  [(THDocumentNavigationModel *)&v3 dealloc];
}

- (id)linkForContentNode:(id)a3 fragment:(id)a4
{
  return [a3 modelLinkWithFragment:a4];
}

- (id)linkForNavigationUnitIndex:(unint64_t)a3
{
  id v4 = [[-[NSArray objectAtIndex:](-[THDocumentNavigationModel navigationUnits](self, "navigationUnits"), "objectAtIndex:", a3), "contentNodes"] objectAtIndex:0];

  return [(THDocumentNavigationModel *)self linkForContentNode:v4 fragment:0];
}

- (id)navigationUnitContainingContentNode:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(THDocumentNavigationModel *)self navigationUnits];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 containsContentNode:a3]) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)minorSnippetForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5
{
  [(THDocumentNavigationModel *)self p_snippetPairForAbsolutePageIndex:a3 withDocumentRoot:a4 forPresentationType:a5];
  return v5;
}

- (id)pageNumberStringForAbsolutePageIndex:(int64_t)a3 forPresentationType:(id)a4
{
  id v7 = [(id)THBundle() localizedStringForKey:@"-" value:&stru_46D7E8 table:0];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return v7;
  }
  id v8 = [(THModelNode *)[(THDocumentRoot *)[(THDocumentNavigationModel *)self documentRoot] rootNode] contentNodeForRelativePageIndex:a3 forPresentationType:a4];
  if (!v8) {
    return v7;
  }

  return [v8 pageNumberStringForAbsolutePageIndex:a3 presentationType:a4];
}

- (id)firstNavigationUnit
{
  v2 = [(THDocumentNavigationModel *)self navigationUnits];

  return [(NSArray *)v2 objectAtIndex:0];
}

- (id)navigationUnitPrecedingNavigationUnit:(id)a3
{
  NSUInteger v4 = [(NSArray *)[(THDocumentNavigationModel *)self navigationUnits] indexOfObject:a3];
  if (!v4) {
    return 0;
  }
  NSUInteger v5 = v4;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v7 = [(THDocumentNavigationModel *)self navigationUnits];

  return [(NSArray *)v7 objectAtIndex:v5 - 1];
}

- (id)navigationUnitFollowingNavigationUnit:(id)a3
{
  NSUInteger v4 = [(NSArray *)[(THDocumentNavigationModel *)self navigationUnits] indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  NSUInteger v5 = v4 + 1;
  if (v4 + 1 >= [(NSArray *)[(THDocumentNavigationModel *)self navigationUnits] count]) {
    return 0;
  }
  id v6 = [(THDocumentNavigationModel *)self navigationUnits];

  return [(NSArray *)v6 objectAtIndex:v5];
}

- (id)sectionIdentifierForNavigationUnit:(id)a3
{
  if (!a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigationModel sectionIdentifierForNavigationUnit:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigationModel.m") lineNumber:155 description:@"invalid nil value for '%s'", "navUnit"];
    return 0;
  }
  NSUInteger v4 = [(NSArray *)[(THDocumentNavigationModel *)self navigationUnits] indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v5 = v4;
  id v6 = [(THDocumentRoot *)[(THDocumentNavigationModel *)self documentRoot] tocModel];
  if (v5 >= [(NSArray *)[(THTOCModel *)v6 tiles] count]) {
    return &stru_46D7E8;
  }
  id v7 = [[-[NSArray objectAtIndex:](-[THTOCModel tiles](v6, "tiles"), "objectAtIndex:", v5), "portraitEntries"] objectAtIndex:0];

  return [v7 sectionIdentifier];
}

- (id)titleStringForNavigationUnit:(id)a3
{
  id v5 = -[THDocumentNavigationModel chapterAndNumberStringForNavigationUnit:](self, "chapterAndNumberStringForNavigationUnit:");
  id v6 = [(THDocumentNavigationModel *)self parentTitleForNavigationUnit:a3];
  if ([v5 length]) {
    return +[NSString stringWithFormat:@"%@: %@", v5, v6];
  }
  else {
    return v6;
  }
}

- (id)chapterAndNumberStringForNavigationUnit:(id)a3
{
  id v3 = [(THDocumentNavigationModel *)self sectionIdentifierForNavigationUnit:a3];
  if (v3) {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"Chapter %@" value:&stru_46D7E8 table:0], v3);
  }
  else {
    return &stru_46D7E8;
  }
}

- (id)parentTitleForNavigationUnit:(id)a3
{
  if (!objc_msgSend(objc_msgSend(a3, "contentNodes"), "count")) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigationModel parentTitleForNavigationUnit:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigationModel.m") lineNumber:211 description:@"can't get parent name from empty navigation unit"];
  }
  if (!objc_msgSend(objc_msgSend(a3, "contentNodes"), "count")) {
    return &stru_46D7E8;
  }
  objc_opt_class();
  objc_msgSend(objc_msgSend(a3, "contentNodes"), "objectAtIndex:", 0);
  id v4 = [(id)TSUDynamicCast() parent];

  return [v4 title];
}

- (id)uniqueIdentifierForNavigationUnit:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"#chapterguid(%@)", objc_msgSend(objc_msgSend(objc_msgSend(a3, "contentNodes"), "firstObject"), "nodeGUID"));
}

- (void)p_inferNavigationUnits
{
  objc_opt_class();
  [(THDocumentRoot *)[(THDocumentNavigationModel *)self documentRoot] rootNode];
  id v3 = (void *)TSUDynamicCast();
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(objc_msgSend(v3, "childNodes"), "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v3 childNodes];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[THNavigationUnit navigationUnitWithContext:[(THDocumentRoot *)[(THDocumentNavigationModel *)self documentRoot] context] andModelNode:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        if (v10) {
          [(NSMutableArray *)v4 addObject:v10];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(THDocumentNavigationModel *)self setNavigationUnits:v4];
}

- (id)p_lessonNodeForContentNode:(id)a3
{
  return a3;
}

- (id)p_chapterNodeForContentNode:(id)a3
{
  return [a3 parent];
}

- (THSnippetPair)p_snippetPairForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5
{
  id v6 = objc_msgSend(objc_msgSend(a4, "rootNode"), "contentNodeForRelativePageIndex:forPresentationType:", a3, a5);
  id v7 = [(THDocumentNavigationModel *)self p_lessonNodeForContentNode:v6];
  id v8 = [(THDocumentNavigationModel *)self p_chapterNodeForContentNode:v6];
  id v9 = (NSString *)[v7 majorSnippet];
  id v10 = (__CFString *)[v7 minorSnippet];
  if (v9)
  {
    long long v11 = v10;
  }
  else
  {
    id v12 = [[v7 parent] indexOfNode:v7];
    long long v13 = (char *)objc_msgSend(objc_msgSend(v8, "parent"), "indexOfNode:", v8);
    long long v14 = (void *)THBundle();
    v15 = v13 + 1;
    if (v12)
    {
      id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [v14 localizedStringForKey:@"Lesson %lu.%lu" value:&stru_46D7E8 table:0], v15, v12);
      v16 = (__CFString *)[v7 title];
      if (v16) {
        long long v11 = v16;
      }
      else {
        long long v11 = &stru_46D7E8;
      }
    }
    else
    {
      id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [v14 localizedStringForKey:@"Chapter %lu" value:&stru_46D7E8 table:0], v15);
      id v17 = (__CFString *)[v8 title];
      if (v17) {
        long long v11 = v17;
      }
      else {
        long long v11 = &stru_46D7E8;
      }
    }
  }
  v18 = v9;
  result.var1 = v11;
  result.var0 = v18;
  return result;
}

- (unint64_t)pageCount
{
  id v3 = [(THDocumentRoot *)[(THDocumentNavigationModel *)self documentRoot] rootNode];
  id v4 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigationModel *)self documentRoot] context]];

  return [(THModelNode *)v3 pageCountForPresentationType:v4];
}

- (NSArray)contentNodes
{
  id v3 = (NSArray *)+[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(THDocumentNavigationModel *)self navigationUnits];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) contentNodes]);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)contentNodeForAbsolutePageIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v7 = [(THDocumentRoot *)[(THDocumentNavigationModel *)self documentRoot] rootNode];
  id v8 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THDocumentNavigationModel *)self documentRoot] context]];
  return [(THModelNode *)v7 contentNodeForRelativePageIndex:a3 forPresentationType:v8];
}

- (id)contentNodeForGUID:(id)a3
{
  id v4 = [(THDocumentNavigationModel *)self contentNodeGUIDToContentNodeDictionary];

  return [(NSMutableDictionary *)v4 objectForKey:a3];
}

- (id)contentNodeForInfoID:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(THDocumentNavigationModel *)self contentNodes];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 infoForNodeUniqueID:a3]) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)contentNodeForBodyStorageID:(id)a3
{
  id v5 = -[THDocumentNavigationModel contentNodeForGUID:](self, "contentNodeForGUID:");
  if (!v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [(THDocumentNavigationModel *)self contentNodes];
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        id v5 = *(id *)(*((void *)&v12 + 1) + 8 * v11);
        if ([v5 hasBodyStorageUID:a3]) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          id v5 = 0;
          if (v9) {
            goto LABEL_5;
          }
          return v5;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (id)contentNodeForPageLocation:(id)a3
{
  if ([a3 storageUID])
  {
    id result = -[THDocumentNavigationModel contentNodeForInfoID:](self, "contentNodeForInfoID:", [a3 storageUID]);
    if (result) {
      return result;
    }
    goto LABEL_6;
  }
  if ([a3 absolutePhysicalPageIndex] == (id)0x7FFFFFFFFFFFFFFFLL
    || (id result = -[THDocumentNavigationModel contentNodeForAbsolutePageIndex:](self, "contentNodeForAbsolutePageIndex:", [a3 absolutePhysicalPageIndex])) == 0)
  {
LABEL_6:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigationModel contentNodeForPageLocation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigationModel.m") lineNumber:391 description:@"Failed to find node for %@", a3];
    return 0;
  }
  return result;
}

- (unint64_t)absolutePageIndexForNavigationUnitRelativePageIndex:(unint64_t)a3 inNavigationUnit:(id)a4 forPresentationType:(id)a5
{
  return (unint64_t)[a4 absolutePageIndexForRelativePageIndex:a3 forPresentationType:a5];
}

- (unint64_t)absolutePageIndexForContentNodeRelativePageIndex:(unint64_t)a3 inContentNode:(id)a4 forPresentationType:(id)a5
{
  return (unint64_t)[a4 absolutePageIndexForRelativePageIndex:a3 forPresentationType:a5];
}

- (unint64_t)navigationUnitRelativePageIndexForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  [(THModelNode *)[(THDocumentRoot *)[(THDocumentNavigationModel *)self documentRoot] rootNode] contentNodeForRelativePageIndex:a3 forPresentationType:a4];
  objc_opt_class();
  uint64_t v7 = TSUDynamicCast();
  if (!v7) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v8 = [(THDocumentNavigationModel *)self navigationUnitContainingContentNode:v7];
  unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    id v10 = [v8 absolutePageIndexForRelativePageIndex:0 forPresentationType:a4];
    if (a3 >= (unint64_t)v10) {
      return a3 - (void)v10;
    }
  }
  return v9;
}

- (unint64_t)navigationUnitRelativePageIndexForContentNodeRelativePageIndex:(unint64_t)a3 inContentNode:(id)a4 forPresentationType:(id)a5
{
  if (!a4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v8 = [a4 absolutePageIndexForRelativePageIndex:a3 forPresentationType:a5];
  id v9 = [(THDocumentNavigationModel *)self navigationUnitContainingContentNode:a4];
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 && v8 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [v9 absolutePageIndexForRelativePageIndex:0 forPresentationType:a5];
    if (v8 >= v11) {
      return v8 - v11;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  self->mDocumentRoot = (THDocumentRoot *)a3;
}

- (NSArray)navigationUnits
{
  return self->mNavigationUnits;
}

- (void)setNavigationUnits:(id)a3
{
}

- (NSMutableDictionary)contentNodeGUIDToContentNodeDictionary
{
  return self->mContentNodeGUIDToContentNodeDictionary;
}

- (void)setContentNodeGUIDToContentNodeDictionary:(id)a3
{
}

@end