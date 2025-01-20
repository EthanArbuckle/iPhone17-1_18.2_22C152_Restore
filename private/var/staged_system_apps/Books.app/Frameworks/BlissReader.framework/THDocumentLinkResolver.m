@interface THDocumentLinkResolver
- (NSDictionary)pathToNodeIndex;
- (THDisplayPageNumberMap)displayPageNumberMap;
- (THDocumentLinkResolver)initWithDocumentRoot:(id)a3;
- (id)absoluteLink:(id)a3 withContentNode:(id)a4;
- (id)anchorFromAbsoluteLink:(id)a3 presentationType:(id)a4;
- (id)anchorFromCustomLink:(id)a3 presentationType:(id)a4;
- (id)contentNodeFromLink:(id)a3;
- (id)nodeFromLink:(id)a3;
- (id)p_anchorFromChapterLink:(id)a3 presentationType:(id)a4;
- (id)p_anchorFromPageLink:(id)a3 presentationType:(id)a4;
- (id)p_buildPathToNodeIndex;
- (id)p_modelLinkFromChapterLink:(id)a3;
- (unint64_t)absolutePageNumberFromCustomLink:(id)a3 presentationType:(id)a4;
- (void)dealloc;
- (void)invalidatePaginationResults;
- (void)setDisplayPageNumberMap:(id)a3;
- (void)updatePaginationResults;
@end

@implementation THDocumentLinkResolver

- (THDocumentLinkResolver)initWithDocumentRoot:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THDocumentLinkResolver;
  v4 = [(THDocumentLinkResolver *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mDocumentRoot = (THDocumentRoot *)a3;
    v4->_displayPageNumberMap = objc_alloc_init(THDisplayPageNumberMap);
  }
  return v5;
}

- (void)dealloc
{
  self->mPathToNodeIndex = 0;
  self->_displayPageNumberMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)THDocumentLinkResolver;
  [(THDocumentLinkResolver *)&v3 dealloc];
}

- (void)updatePaginationResults
{
  objc_super v3 = [(THDocumentLinkResolver *)self displayPageNumberMap];
  mDocumentRoot = self->mDocumentRoot;

  [(THDisplayPageNumberMap *)v3 buildDisplayPageMapsWithDocumentRoot:mDocumentRoot];
}

- (void)invalidatePaginationResults
{
  objc_super v3 = [(THDocumentLinkResolver *)self displayPageNumberMap];
  mDocumentRoot = self->mDocumentRoot;

  [(THDisplayPageNumberMap *)v3 clearDisplayPageMapsWithDocumentRoot:mDocumentRoot];
}

- (NSDictionary)pathToNodeIndex
{
  result = self->mPathToNodeIndex;
  if (!result)
  {
    result = (NSDictionary *)[(THDocumentLinkResolver *)self p_buildPathToNodeIndex];
    self->mPathToNodeIndex = result;
  }
  return result;
}

- (id)nodeFromLink:(id)a3
{
  id v4 = [a3 docRelativePath];
  v5 = [(THDocumentLinkResolver *)self pathToNodeIndex];

  return [(NSDictionary *)v5 objectForKey:v4];
}

- (id)contentNodeFromLink:(id)a3
{
  [(THDocumentLinkResolver *)self nodeFromLink:a3];
  objc_opt_class();
  id result = (id)TSUDynamicCast();
  if (!result)
  {
    objc_opt_class();
    id result = (id)TSUDynamicCast();
    if (result)
    {
      id v4 = result;
      do
      {
        if (![v4 count]) {
          break;
        }
        [v4 nodeAtIndex:0];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        objc_opt_class();
        [v4 nodeAtIndex:0];
        id v4 = (void *)TSUDynamicCast();
      }
      while (v4);
      id result = [v4 count];
      if (result)
      {
        objc_opt_class();
        [v4 nodeAtIndex:0];
        return (id)TSUDynamicCast();
      }
    }
  }
  return result;
}

- (id)absoluteLink:(id)a3 withContentNode:(id)a4
{
  id v7 = [a3 docRelativePath];
  if (v7 && [v7 length])
  {
    a4 = [(THDocumentLinkResolver *)self contentNodeFromLink:a3];
    if (!a4) {
      return 0;
    }
  }
  else if (!a4)
  {
    return 0;
  }
  id v9 = [a3 fragment];

  return [a4 modelLinkWithFragment:v9];
}

- (id)anchorFromAbsoluteLink:(id)a3 presentationType:(id)a4
{
  if ([a3 isPageLink])
  {
    return -[THDocumentLinkResolver p_anchorFromPageLink:presentationType:](self, "p_anchorFromPageLink:presentationType:", a3);
  }
  else if (([a3 isChapterLink] & 1) != 0 {
         || [a3 isChapterGuidLink])
  }
  {
    return -[THDocumentLinkResolver p_anchorFromChapterLink:presentationType:](self, "p_anchorFromChapterLink:presentationType:", a3);
  }
  else
  {
    id result = [(THDocumentLinkResolver *)self contentNodeFromLink:a3];
    if (result)
    {
      id v7 = +[THContentLinkResolver contentLinkResolverWithContentNode:result presentationType:a4];
      return [(THContentLinkResolver *)v7 navigableAnchorFromLink:a3];
    }
  }
  return result;
}

- (id)p_anchorFromPageLink:(id)a3 presentationType:(id)a4
{
  unint64_t v6 = -[THDisplayPageNumberMap absolutePageIndexForDisplayPageNumber:](-[THDocumentLinkResolver displayPageNumberMap](self, "displayPageNumberMap"), "absolutePageIndexForDisplayPageNumber:", [a3 pageNumberString]);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v8 = v6;
  id v9 = [(THModelNode *)[(THDocumentRoot *)self->mDocumentRoot rootNode] contentNodeForRelativePageIndex:0 forPresentationType:a4];
  v10 = -[THModelPageAnchor initWithContentNode:relativePageIndex:presentationType:]([THModelPageAnchor alloc], "initWithContentNode:relativePageIndex:presentationType:", v9, [v9 relativePageIndexForAbsolutePageIndex:v8 forPresentationType:a4], a4);

  return v10;
}

- (id)p_anchorFromChapterLink:(id)a3 presentationType:(id)a4
{
  id v6 = [(THDocumentLinkResolver *)self p_modelLinkFromChapterLink:a3];
  id result = [(THDocumentLinkResolver *)self contentNodeFromLink:v6];
  if (result)
  {
    unint64_t v8 = +[THContentLinkResolver contentLinkResolverWithContentNode:result presentationType:a4];
    return [(THContentLinkResolver *)v8 navigableAnchorFromLink:v6];
  }
  return result;
}

- (id)anchorFromCustomLink:(id)a3 presentationType:(id)a4
{
  if (![a3 targetIsiBooks]) {
    return 0;
  }
  if ([a3 isPageLink])
  {
    return [(THDocumentLinkResolver *)self p_anchorFromPageLink:a3 presentationType:a4];
  }
  if (([a3 isChapterLink] & 1) != 0 || objc_msgSend(a3, "isChapterGuidLink"))
  {
    return [(THDocumentLinkResolver *)self p_anchorFromChapterLink:a3 presentationType:a4];
  }
  id v7 = objc_msgSend(objc_msgSend(a3, "fragment"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  if (![v7 length]
    || ![(NSDictionary *)[(THTOCModel *)[(THDocumentRoot *)self->mDocumentRoot tocModel] figureReference] objectForKey:v7])
  {
    return 0;
  }
  unint64_t v8 = [[THModelLink alloc] initWithTarget:[[NSString stringWithFormat:@"apub:///0/0/0%@", -[NSDictionary objectForKey:](-[THTOCModel figureReference](-[THDocumentRoot tocModel](self->mDocumentRoot, "tocModel"), "figureReference"), "objectForKey:", v7)] context:[[THDocumentRoot context](self->mDocumentRoot, "context")]];

  return [(THDocumentLinkResolver *)self anchorFromAbsoluteLink:v8 presentationType:a4];
}

- (id)p_modelLinkFromChapterLink:(id)a3
{
  unsigned int v5 = [a3 isChapterGuidLink];
  char v6 = v5;
  if (v5) {
    id v7 = [a3 chapterGuidString];
  }
  else {
    id v7 = [a3 chapterString];
  }
  id v8 = v7;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = [(THTOCModel *)[(THDocumentRoot *)self->mDocumentRoot tocModel] tiles];
  id result = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (result)
  {
    id v10 = result;
    uint64_t v11 = *(void *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v12);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v14 = [v13 portraitEntries];
        id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v23;
LABEL_11:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
            id v20 = (v6 & 1) != 0 ? [v19 nodeGUID] : [v19 sectionIdentifier];
            if ([v20 isEqualToString:v8]) {
              break;
            }
            if (v16 == (id)++v18)
            {
              id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v16) {
                goto LABEL_11;
              }
              goto LABEL_22;
            }
          }
          id result = [v19 modelLink];
          if (result) {
            return result;
          }
        }
LABEL_22:
        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id result = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      id v10 = result;
    }
    while (result);
  }
  return result;
}

- (unint64_t)absolutePageNumberFromCustomLink:(id)a3 presentationType:(id)a4
{
  if ([a3 isPageLink])
  {
    id v7 = [(THDocumentLinkResolver *)self displayPageNumberMap];
    id v8 = [a3 pageNumberString];
    return [(THDisplayPageNumberMap *)v7 absolutePageIndexForDisplayPageNumber:v8];
  }
  else if ((([a3 isChapterLink] & 1) != 0 {
          || [a3 isChapterGuidLink])
  }
         && (id v10 = [(THDocumentLinkResolver *)self p_modelLinkFromChapterLink:a3]) != 0)
  {
    id v11 = [(THDocumentLinkResolver *)self contentNodeFromLink:v10];
    v12 = [(THDocumentRoot *)self->mDocumentRoot navigationModel];
    return [(THDocumentNavigationModel *)v12 absolutePageIndexForContentNodeRelativePageIndex:0 inContentNode:v11 forPresentationType:a4];
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)p_buildPathToNodeIndex
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  id v10 = sub_5FB74;
  id v11 = sub_5FB84;
  id v12 = 0;
  id v12 = +[NSMutableDictionary dictionary];
  objc_opt_class();
  [(THDocumentRoot *)self->mDocumentRoot rootNode];
  objc_super v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_5FB90;
    v6[3] = &unk_457CB0;
    v6[4] = &v7;
    [v3 enumerateSubtreeUsingBlock:v6];
  }
  id v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (THDisplayPageNumberMap)displayPageNumberMap
{
  return self->_displayPageNumberMap;
}

- (void)setDisplayPageNumberMap:(id)a3
{
}

@end