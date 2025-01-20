@interface THModelContentNodeBody
- (BOOL)hasFlushableContent;
- (NSArray)pages;
- (NSMutableDictionary)infosForIDs;
- (THModelContentNode)parent;
- (THModelContentNodeBody)initWithContext:(id)a3;
- (THWGutterDrawableStorage)gutterDrawableStorage;
- (THWPStorage)bodyStorage;
- (TSSStylesheet)stylesheet;
- (TSUNoCopyDictionary)drawablesForWidgetInfos;
- (TSUNoCopyDictionary)pageIndexesForInfos;
- (TSUPointerKeyDictionary)IDsForInfos;
- (id)childCommandForReplaceAllCommand:(id)a3;
- (id)childEnumerator;
- (id)expandableInfoForWidgetInfo:(id)a3;
- (id)gutterDrawables;
- (id)infoForNodeUniqueID:(id)a3;
- (id)infos;
- (id)nodeUniqueIDForInfo:(id)a3;
- (int64_t)pageCount;
- (unint64_t)bodyCharIndexOfGutterDrawable:(id)a3;
- (unint64_t)relativeIndexOfPageInfo:(id)a3;
- (unint64_t)relativePageIndexForInfo:(id)a3;
- (void)addGutterDrawable:(id)a3 positioning:(id)a4 insertContext:(id)a5;
- (void)addPageInfo:(id)a3;
- (void)clearNodeUniqueIDForInfo:(id)a3;
- (void)dealloc;
- (void)p_clearFlushableMembers;
- (void)setBodyStorage:(id)a3;
- (void)setDrawablesForWidgetInfos:(id)a3;
- (void)setExpandedDrawable:(id)a3 forWidgetInfo:(id)a4;
- (void)setGutterDrawableStorage:(id)a3;
- (void)setIDsForInfos:(id)a3;
- (void)setInfosForIDs:(id)a3;
- (void)setNodeUniqueID:(id)a3 forInfo:(id)a4;
- (void)setPageIndexesForInfos:(id)a3;
- (void)setPages:(id)a3;
- (void)setParent:(id)a3;
- (void)setRelativePageIndex:(unint64_t)a3 forInfo:(id)a4;
- (void)setStylesheet:(id)a3;
- (void)unload;
- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)wasRemovedFromDocumentRoot:(id)a3;
- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)willBeRemovedFromDocumentRoot:(id)a3;
@end

@implementation THModelContentNodeBody

- (THModelContentNodeBody)initWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THModelContentNodeBody;
  v4 = [(THModelContentNodeBody *)&v6 init];
  if (v4)
  {
    [(THModelContentNodeBody *)v4 setPages:+[NSMutableArray array]];
    [(THModelContentNodeBody *)v4 setGutterDrawableStorage:[[THWGutterDrawableStorage alloc] initWithContext:a3]];
    [(THModelContentNodeBody *)v4 setInfosForIDs:+[NSMutableDictionary dictionary]];
    [(THModelContentNodeBody *)v4 setIDsForInfos:+[TSUPointerKeyDictionary dictionary]];
    [(THModelContentNodeBody *)v4 setPageIndexesForInfos:+[TSUNoCopyDictionary dictionary]];
    [(THModelContentNodeBody *)v4 setDrawablesForWidgetInfos:+[TSUNoCopyDictionary dictionary]];
  }
  return v4;
}

- (void)dealloc
{
  [(THModelContentNodeBody *)self p_clearFlushableMembers];
  v3.receiver = self;
  v3.super_class = (Class)THModelContentNodeBody;
  [(THModelContentNodeBody *)&v3 dealloc];
}

- (void)p_clearFlushableMembers
{
  self->mBodyStorage = 0;
  self->mGutterDrawableStorage = 0;

  self->mStylesheet = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mPages = self->mPages;
  id v4 = [(NSMutableArray *)mPages countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mPages);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) setParentContentNodeBody:0];
      }
      id v5 = [(NSMutableArray *)mPages countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  self->mPages = 0;
  self->mInfosForID = 0;

  self->mIDsForInfos = 0;
  self->mPageIndexesForInfos = 0;

  self->mDrawablesForWidgetInfos = 0;
}

- (void)unload
{
  [(THModelContentNodeBody *)self p_clearFlushableMembers];
  mParent = self->mParent;

  [(THModelContentNode *)mParent i_flushingBody:self];
}

- (BOOL)hasFlushableContent
{
  return [(THModelContentNodeBody *)self pages] != 0;
}

- (void)setNodeUniqueID:(id)a3 forInfo:(id)a4
{
  id v7 = [(NSMutableDictionary *)[(THModelContentNodeBody *)self infosForIDs] objectForKey:a3];
  if (v7) {
    [(TSUPointerKeyDictionary *)[(THModelContentNodeBody *)self IDsForInfos] removeObjectForKey:v7];
  }
  [(TSUPointerKeyDictionary *)[(THModelContentNodeBody *)self IDsForInfos] setObject:a3 forUncopiedKey:a4];
  long long v8 = [(THModelContentNodeBody *)self infosForIDs];

  [(NSMutableDictionary *)v8 setObject:a4 forKey:a3];
}

- (void)clearNodeUniqueIDForInfo:(id)a3
{
  id v5 = [(TSUPointerKeyDictionary *)[(THModelContentNodeBody *)self IDsForInfos] objectForKey:a3];
  if (v5)
  {
    [(NSMutableDictionary *)[(THModelContentNodeBody *)self infosForIDs] removeObjectForKey:v5];
    uint64_t v6 = [(THModelContentNodeBody *)self IDsForInfos];
    [(TSUPointerKeyDictionary *)v6 removeObjectForKey:a3];
  }
}

- (id)nodeUniqueIDForInfo:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [(THModelContentNodeBody *)self IDsForInfos];

  return [(TSUPointerKeyDictionary *)v4 objectForKey:a3];
}

- (id)infoForNodeUniqueID:(id)a3
{
  id v4 = [(THModelContentNodeBody *)self infosForIDs];

  return [(NSMutableDictionary *)v4 objectForKey:a3];
}

- (id)infos
{
  v2 = [(THModelContentNodeBody *)self IDsForInfos];

  return [(TSUPointerKeyDictionary *)v2 allKeys];
}

- (int64_t)pageCount
{
  return (int64_t)[(NSMutableArray *)self->mPages count];
}

- (void)addPageInfo:(id)a3
{
  -[NSMutableArray addObject:](self->mPages, "addObject:");

  [a3 setParentContentNodeBody:self];
}

- (unint64_t)relativeIndexOfPageInfo:(id)a3
{
  id v4 = [(THModelContentNodeBody *)self pages];

  return [(NSArray *)v4 indexOfObject:a3];
}

- (unint64_t)relativePageIndexForInfo:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v3 = a3;
  while (1)
  {
    objc_opt_class();
    [(TSUPointerKeyDictionary *)self->mPageIndexesForInfos objectForKey:v3];
    id v5 = (void *)TSUDynamicCast();
    if (v5) {
      break;
    }
    id v3 = [v3 parentInfo];
    if (!v3) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return [v5 unsignedIntValue];
}

- (void)setRelativePageIndex:(unint64_t)a3 forInfo:(id)a4
{
  mPageIndexesForInfos = self->mPageIndexesForInfos;
  uint64_t v6 = +[NSNumber numberWithInteger:a3];

  [(TSUPointerKeyDictionary *)mPageIndexesForInfos setObject:v6 forUncopiedKey:a4];
}

- (void)addGutterDrawable:(id)a3 positioning:(id)a4 insertContext:(id)a5
{
  long long v8 = [(THModelContentNodeBody *)self gutterDrawableStorage];

  [(THWGutterDrawableStorage *)v8 addDrawable:a3 positioning:a4 insertContext:a5];
}

- (unint64_t)bodyCharIndexOfGutterDrawable:(id)a3
{
  id v3 = [(THWGutterDrawableStorage *)[(THModelContentNodeBody *)self gutterDrawableStorage] positioningOfDrawable:a3];

  return (unint64_t)[v3 bodyCharIndex];
}

- (id)gutterDrawables
{
  v2 = [(THModelContentNodeBody *)self gutterDrawableStorage];

  return [(THWGutterDrawableStorage *)v2 drawables];
}

- (id)expandableInfoForWidgetInfo:(id)a3
{
  if (a3) {
    return -[TSUPointerKeyDictionary objectForKey:](self->mDrawablesForWidgetInfos, "objectForKey:");
  }
  else {
    return 0;
  }
}

- (void)setExpandedDrawable:(id)a3 forWidgetInfo:(id)a4
{
  if (a3 && a4)
  {
    mDrawablesForWidgetInfos = self->mDrawablesForWidgetInfos;
    -[TSUPointerKeyDictionary setObject:forUncopiedKey:](mDrawablesForWidgetInfos, "setObject:forUncopiedKey:");
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNodeBody setExpandedDrawable:forWidgetInfo:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNodeBody.m") lineNumber:183 description:@"Invalid parameter not satisfying: %s", "gutterDrawable != nil && widgetInfo != nil"];
  }
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  [(THWPStorage *)[(THModelContentNodeBody *)self bodyStorage] willBeAddedToDocumentRoot:a3 dolcContext:a4];
  [(THWGutterDrawableStorage *)[(THModelContentNodeBody *)self gutterDrawableStorage] willBeAddedToDocumentRoot:a3 context:a4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_53CD4;
  v7[3] = &unk_4578E8;
  v7[4] = a3;
  v7[5] = a4;
  [(NSArray *)[(THModelContentNodeBody *)self pages] enumerateObjectsUsingBlock:v7];
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  [(THWPStorage *)[(THModelContentNodeBody *)self bodyStorage] wasAddedToDocumentRoot:a3 dolcContext:a4];
  [(THWGutterDrawableStorage *)[(THModelContentNodeBody *)self gutterDrawableStorage] wasAddedToDocumentRoot:a3 context:a4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_53D94;
  v7[3] = &unk_4578E8;
  v7[4] = a3;
  v7[5] = a4;
  [(NSArray *)[(THModelContentNodeBody *)self pages] enumerateObjectsUsingBlock:v7];
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  [(THWPStorage *)[(THModelContentNodeBody *)self bodyStorage] willBeRemovedFromDocumentRoot:a3];
  [(THWGutterDrawableStorage *)[(THModelContentNodeBody *)self gutterDrawableStorage] willBeRemovedFromDocumentRoot:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_53E40;
  v5[3] = &unk_457910;
  v5[4] = a3;
  [(NSArray *)[(THModelContentNodeBody *)self pages] enumerateObjectsUsingBlock:v5];
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  [(THWPStorage *)[(THModelContentNodeBody *)self bodyStorage] wasRemovedFromDocumentRoot:a3];
  [(THWGutterDrawableStorage *)[(THModelContentNodeBody *)self gutterDrawableStorage] wasRemovedFromDocumentRoot:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_53EEC;
  v5[3] = &unk_457910;
  v5[4] = a3;
  [(NSArray *)[(THModelContentNodeBody *)self pages] enumerateObjectsUsingBlock:v5];
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

- (id)childEnumerator
{
  id v3 = +[NSMutableArray array];
  if ([(THModelContentNodeBody *)self bodyStorage]) {
    [v3 addObject:[self bodyStorage]];
  }
  if ([(THModelContentNodeBody *)self gutterDrawableStorage]) {
    [v3 addObjectsFromArray:[-[THModelContentNodeBody gutterDrawableStorage](self, "gutterDrawableStorage") drawables]];
  }
  if ([(THModelContentNodeBody *)self pages]) {
    [v3 addObjectsFromArray:[self pages]];
  }

  return [v3 objectEnumerator];
}

- (THWPStorage)bodyStorage
{
  return self->mBodyStorage;
}

- (void)setBodyStorage:(id)a3
{
}

- (NSArray)pages
{
  return &self->mPages->super;
}

- (void)setPages:(id)a3
{
}

- (THWGutterDrawableStorage)gutterDrawableStorage
{
  return self->mGutterDrawableStorage;
}

- (void)setGutterDrawableStorage:(id)a3
{
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

- (void)setStylesheet:(id)a3
{
}

- (THModelContentNode)parent
{
  return self->mParent;
}

- (void)setParent:(id)a3
{
  self->mParent = (THModelContentNode *)a3;
}

- (TSUPointerKeyDictionary)IDsForInfos
{
  return self->mIDsForInfos;
}

- (void)setIDsForInfos:(id)a3
{
}

- (NSMutableDictionary)infosForIDs
{
  return self->mInfosForID;
}

- (void)setInfosForIDs:(id)a3
{
}

- (TSUNoCopyDictionary)pageIndexesForInfos
{
  return self->mPageIndexesForInfos;
}

- (void)setPageIndexesForInfos:(id)a3
{
}

- (TSUNoCopyDictionary)drawablesForWidgetInfos
{
  return self->mDrawablesForWidgetInfos;
}

- (void)setDrawablesForWidgetInfos:(id)a3
{
}

@end