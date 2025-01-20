@interface THModelPageInfo
- (BOOL)autosizes;
- (BOOL)isAnchoredToText;
- (BOOL)isAttachedToBodyText;
- (BOOL)isFloatingAboveText;
- (BOOL)isInlineWithText;
- (BOOL)isThemeContent;
- (CGSize)autosizeMargin;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)floatingDrawables;
- (NSArray)modelBodyInfos;
- (NSMutableArray)bodyBoxInfos;
- (THDrawableStorage)floatingDrawableStorage;
- (THDrawablesZOrder)drawablesZOrder;
- (THModelContentNode)parent;
- (THModelContentNodeBody)parentContentNodeBody;
- (THModelPageInfo)initWithContext:(id)a3;
- (THWPStorage)bodyStorage;
- (TSDContainerInfo)parentInfo;
- (TSDInfoGeometry)geometry;
- (TSDOwningAttachment)owningAttachment;
- (TSDOwningAttachment)owningAttachmentNoRecurse;
- (_NSRange)bodyStorageRange;
- (id)childCommandForReplaceAllCommand:(id)a3;
- (id)childEnumerator;
- (id)childInfos;
- (id)copyWithContext:(id)a3;
- (unint64_t)absolutePageIndex;
- (unint64_t)pageEndCharIndex;
- (unint64_t)pageStartCharIndex;
- (unint64_t)relativePageIndexInParent;
- (void)addBodyBoxInfo:(id)a3 insertContext:(id)a4;
- (void)addFloatingDrawable:(id)a3 insertContext:(id)a4;
- (void)dealloc;
- (void)setAutosizeMargin:(CGSize)a3;
- (void)setAutosizes:(BOOL)a3;
- (void)setBodyBoxInfos:(id)a3;
- (void)setDrawablesZOrder:(id)a3;
- (void)setFloatingDrawableStorage:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setOwningAttachment:(id)a3;
- (void)setPageEndCharIndex:(unint64_t)a3;
- (void)setPageStartCharIndex:(unint64_t)a3;
- (void)setParent:(id)a3;
- (void)setParentContentNodeBody:(id)a3;
- (void)setParentInfo:(id)a3;
- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)wasRemovedFromDocumentRoot:(id)a3;
- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)willBeRemovedFromDocumentRoot:(id)a3;
@end

@implementation THModelPageInfo

- (BOOL)autosizes
{
  return self->mAutosizes;
}

- (void)setAutosizes:(BOOL)a3
{
  self->mAutosizes = a3;
}

- (CGSize)autosizeMargin
{
  double width = self->mAutosizeMargin.width;
  double height = self->mAutosizeMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAutosizeMargin:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  [(THModelPageInfo *)self willModify];
  self->mAutosizeMargin.CGFloat width = width;
  self->mAutosizeMargin.CGFloat height = height;
}

- (NSMutableArray)bodyBoxInfos
{
  return self->mBodyBoxInfos;
}

- (void)setBodyBoxInfos:(id)a3
{
  [(THModelPageInfo *)self willModify];
  id v5 = a3;

  self->mBodyBoxInfos = (NSMutableArray *)a3;
}

- (THDrawablesZOrder)drawablesZOrder
{
  return self->mDrawablesZOrder;
}

- (void)setDrawablesZOrder:(id)a3
{
  [(THModelPageInfo *)self willModify];
  id v5 = a3;

  self->mDrawablesZOrder = (THDrawablesZOrder *)a3;
}

- (THDrawableStorage)floatingDrawableStorage
{
  return self->mFloatingDrawableStorage;
}

- (void)setFloatingDrawableStorage:(id)a3
{
  [(THModelPageInfo *)self willModify];
  id v5 = a3;

  self->mFloatingDrawableStorage = (THDrawableStorage *)a3;
}

- (TSDInfoGeometry)geometry
{
  return self->mGeometry;
}

- (void)setGeometry:(id)a3
{
  [(THModelPageInfo *)self willModify];
  id v5 = a3;

  self->mGeometry = (TSDInfoGeometry *)a3;
}

- (THModelContentNode)parent
{
  return self->mParent;
}

- (void)setParent:(id)a3
{
  self->mParent = (THModelContentNode *)a3;
}

- (void)setParentContentNodeBody:(id)a3
{
  self->mParentContentNodeBody = (THModelContentNodeBody *)a3;
}

- (unint64_t)pageStartCharIndex
{
  return self->mPageStartCharIndex;
}

- (void)setPageStartCharIndex:(unint64_t)a3
{
  self->mPageStartCharIndex = a3;
}

- (unint64_t)pageEndCharIndex
{
  return self->mPageEndCharIndex;
}

- (void)setPageEndCharIndex:(unint64_t)a3
{
  self->mPageEndCharIndex = a3;
}

- (THModelPageInfo)initWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THModelPageInfo;
  v3 = [(THModelPageInfo *)&v5 initWithContext:a3];
  if (v3)
  {
    [(THModelPageInfo *)v3 setFloatingDrawableStorage:[[THDrawableStorage alloc] initWithContext:[(THModelPageInfo *)v3 context]]];
    [(THModelPageInfo *)v3 setDrawablesZOrder:[[THDrawablesZOrder alloc] initWithContext:[(THModelPageInfo *)v3 context]]];
    [(THModelPageInfo *)v3 setBodyBoxInfos:+[NSMutableArray array]];
    [(THModelPageInfo *)v3 setPageStartCharIndex:0x7FFFFFFFFFFFFFFFLL];
    [(THModelPageInfo *)v3 setPageEndCharIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  return v3;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mBodyBoxInfos = self->mBodyBoxInfos;
  id v4 = [(NSMutableArray *)mBodyBoxInfos countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(mBodyBoxInfos);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) setParentInfo:0];
      }
      id v5 = [(NSMutableArray *)mBodyBoxInfos countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  self->mBodyBoxInfos = 0;
  self->mFloatingDrawableStorage = 0;

  self->mDrawablesZOrder = 0;
  self->mGeometry = 0;
  v8.receiver = self;
  v8.super_class = (Class)THModelPageInfo;
  [(THModelPageInfo *)&v8 dealloc];
}

- (id)copyWithContext:(id)a3
{
  return 0;
}

- (BOOL)isThemeContent
{
  return 0;
}

- (THModelContentNodeBody)parentContentNodeBody
{
  return (THModelContentNodeBody *)[(THModelContentNodeBody *)self->mParentContentNodeBody ownerAutoreleasedAccess];
}

- (NSArray)floatingDrawables
{
  v2 = [(THModelPageInfo *)self floatingDrawableStorage];

  return [(THDrawableStorage *)v2 drawables];
}

- (NSArray)modelBodyInfos
{
  v2 = [(THModelPageInfo *)self bodyBoxInfos];

  return +[NSArray arrayWithArray:v2];
}

- (THWPStorage)bodyStorage
{
  v2 = [(THModelPageInfo *)self parentContentNodeBody];

  return [(THModelContentNodeBody *)v2 bodyStorage];
}

- (_NSRange)bodyStorageRange
{
  NSUInteger v3 = NSInvalidRange[0];
  NSUInteger v4 = NSInvalidRange[1];
  unint64_t mPageStartCharIndex = self->mPageStartCharIndex;
  if (mPageStartCharIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t mPageEndCharIndex = self->mPageEndCharIndex;
    if (mPageEndCharIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v4 = mPageEndCharIndex - mPageStartCharIndex;
      NSUInteger v3 = mPageStartCharIndex;
    }
  }
  result.length = v4;
  result.location = v3;
  return result;
}

- (unint64_t)relativePageIndexInParent
{
  NSUInteger v3 = [(THModelPageInfo *)self parentContentNodeBody];

  return [(THModelContentNodeBody *)v3 relativeIndexOfPageInfo:self];
}

- (unint64_t)absolutePageIndex
{
  unint64_t v3 = [(THModelPageInfo *)self relativePageIndexInParent];
  NSUInteger v4 = [(THModelPageInfo *)self parent];

  return [(THModelNode *)v4 absolutePageIndexForRelativePageIndex:v3];
}

- (void)addFloatingDrawable:(id)a3 insertContext:(id)a4
{
  [a3 setParentInfo:self];
  v7 = [(THModelPageInfo *)self floatingDrawableStorage];

  [(THDrawableStorage *)v7 addDrawable:a3 insertContext:a4];
}

- (void)addBodyBoxInfo:(id)a3 insertContext:(id)a4
{
  id v7 = [(THModelPageInfo *)self documentRoot];
  if (v7)
  {
    id v8 = v7;
    [a3 willBeAddedToDocumentRoot:v7 context:a4];
    [a3 setParentInfo:self];
    [(NSMutableArray *)[(THModelPageInfo *)self bodyBoxInfos] addObject:a3];
    [a3 wasAddedToDocumentRoot:v8 context:a4];
  }
  else
  {
    [a3 setParentInfo:self];
    long long v9 = [(THModelPageInfo *)self bodyBoxInfos];
    [(NSMutableArray *)v9 addObject:a3];
  }
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  [(THDrawableStorage *)[(THModelPageInfo *)self floatingDrawableStorage] willBeAddedToDocumentRoot:a3 context:a4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3DCB4;
  v7[3] = &unk_4578E8;
  v7[4] = a3;
  v7[5] = a4;
  [(NSMutableArray *)[(THModelPageInfo *)self bodyBoxInfos] enumerateObjectsUsingBlock:v7];
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  [(THDrawableStorage *)[(THModelPageInfo *)self floatingDrawableStorage] wasAddedToDocumentRoot:a3 context:a4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3DD60;
  v7[3] = &unk_4578E8;
  v7[4] = a3;
  v7[5] = a4;
  [(NSMutableArray *)[(THModelPageInfo *)self bodyBoxInfos] enumerateObjectsUsingBlock:v7];
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  [(THDrawableStorage *)[(THModelPageInfo *)self floatingDrawableStorage] willBeRemovedFromDocumentRoot:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3DDFC;
  v5[3] = &unk_457910;
  v5[4] = a3;
  [(NSMutableArray *)[(THModelPageInfo *)self bodyBoxInfos] enumerateObjectsUsingBlock:v5];
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  [(THDrawableStorage *)[(THModelPageInfo *)self floatingDrawableStorage] wasRemovedFromDocumentRoot:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3DE98;
  v5[3] = &unk_457910;
  v5[4] = a3;
  [(NSMutableArray *)[(THModelPageInfo *)self bodyBoxInfos] enumerateObjectsUsingBlock:v5];
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (void)setOwningAttachment:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  NSUInteger v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelPageInfo setOwningAttachment:]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelPageInfo.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:193 description:@"Can't set owning attachment on page info. It's a page."];
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (TSDContainerInfo)parentInfo
{
  return 0;
}

- (void)setParentInfo:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  NSUInteger v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelPageInfo setParentInfo:]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelPageInfo.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:205 description:@"THModelPageInfos have no info parent"];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

- (id)childEnumerator
{
  id v2 = [(THModelPageInfo *)self childInfos];

  return [v2 objectEnumerator];
}

- (BOOL)isFloatingAboveText
{
  return [(THModelPageInfo *)self owningAttachment] == 0;
}

- (BOOL)isAnchoredToText
{
  id v2 = [(THModelPageInfo *)self owningAttachment];

  return [(TSDOwningAttachment *)v2 isAnchored];
}

- (BOOL)isInlineWithText
{
  if ([(THModelPageInfo *)self isFloatingAboveText]) {
    return 0;
  }
  else {
    return ![(THModelPageInfo *)self isAnchoredToText];
  }
}

- (BOOL)isAttachedToBodyText
{
  return 0;
}

- (id)childInfos
{
  return [(THModelPageInfo *)self floatingDrawables];
}

@end