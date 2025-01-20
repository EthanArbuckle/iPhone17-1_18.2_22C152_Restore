@interface THSectionInfo
- (BOOL)anchorAtOrigin;
- (BOOL)isAnchoredToText;
- (BOOL)isAttachedToBodyText;
- (BOOL)isFloatingAboveText;
- (BOOL)isInlineWithText;
- (BOOL)isThemeContent;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)pages;
- (NSString)description;
- (THModelContentNode)contentNode;
- (THModelPageInfo)lastPage;
- (THPageController)pageController;
- (TSDContainerInfo)parentInfo;
- (TSDInfoGeometry)geometry;
- (TSDOwningAttachment)owningAttachment;
- (TSDOwningAttachment)owningAttachmentNoRecurse;
- (id)childCommandForReplaceAllCommand:(id)a3;
- (id)childEnumerator;
- (id)childInfos;
- (id)copyWithContext:(id)a3;
- (void)dealloc;
- (void)setAnchorAtOrigin:(BOOL)a3;
- (void)setGeometry:(id)a3;
- (void)setLastPage:(id)a3;
- (void)setOwningAttachment:(id)a3;
- (void)setPageController:(id)a3;
- (void)setPages:(id)a3;
- (void)setParentInfo:(id)a3;
@end

@implementation THSectionInfo

- (void)dealloc
{
  [(THSectionInfo *)self setPages:0];
  [(THSectionInfo *)self setPageController:0];

  v3.receiver = self;
  v3.super_class = (Class)THSectionInfo;
  [(THSectionInfo *)&v3 dealloc];
}

- (id)copyWithContext:(id)a3
{
  return 0;
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (void)setOwningAttachment:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionInfo setOwningAttachment:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionInfo.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:47 description:@"Can't put a section info in an attachment. What does that even mean!"];
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (BOOL)isFloatingAboveText
{
  return 1;
}

- (BOOL)isAnchoredToText
{
  return 0;
}

- (BOOL)isInlineWithText
{
  return 0;
}

- (BOOL)isAttachedToBodyText
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (TSDContainerInfo)parentInfo
{
  return 0;
}

- (void)setParentInfo:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionInfo setParentInfo:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionInfo.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:83 description:@"Can't set the parent info of a THSectionInfo"];
}

- (TSDInfoGeometry)geometry
{
  return 0;
}

- (void)setGeometry:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionInfo setGeometry:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionInfo.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:91 description:@"Can't set geometry on TSDInfoGeometry"];
}

- (BOOL)isThemeContent
{
  return 0;
}

- (id)childInfos
{
  v2 = [(THSectionInfo *)self pages];

  return +[NSArray arrayWithArray:v2];
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

- (id)childEnumerator
{
  return 0;
}

- (THModelPageInfo)lastPage
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(THSectionInfo *)self pages];
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  v5 = 0;
  uint64_t v6 = *(void *)v12;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v2);
      }
      v8 = *(THModelPageInfo **)(*((void *)&v11 + 1) + 8 * i);
      if (v5)
      {
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) relativePageIndexInParent];
        if (v9 <= (id)[(THModelPageInfo *)v5 relativePageIndexInParent]) {
          continue;
        }
      }
      v5 = v8;
    }
    id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v4);
  return v5;
}

- (THModelContentNode)contentNode
{
  v2 = [(THSectionInfo *)self pageController];

  return (THModelContentNode *)[(THPageController *)v2 contentNode];
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@ %p> pages = %@", objc_opt_class(), self, self->mPages];
}

- (BOOL)anchorAtOrigin
{
  return self->mAnchorAtOrigin;
}

- (void)setAnchorAtOrigin:(BOOL)a3
{
  self->mAnchorAtOrigin = a3;
}

- (NSArray)pages
{
  return self->mPages;
}

- (void)setPages:(id)a3
{
}

- (THPageController)pageController
{
  return self->mPageController;
}

- (void)setPageController:(id)a3
{
}

- (void)setLastPage:(id)a3
{
}

@end