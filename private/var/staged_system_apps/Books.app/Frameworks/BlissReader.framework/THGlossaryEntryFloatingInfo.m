@interface THGlossaryEntryFloatingInfo
- (BOOL)anchoredToText;
- (BOOL)floatingAboveText;
- (BOOL)inlineWithText;
- (BOOL)isAnchoredToText;
- (BOOL)isAttachedToBodyText;
- (BOOL)isFloatingAboveText;
- (BOOL)isInlineWithText;
- (BOOL)isThemeContent;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)bodyFloatingInfos;
- (THGlossaryEntryFloatingInfo)initWithEntry:(id)a3 body:(id)a4;
- (THModelGlossaryEntry)entry;
- (THModelGlossaryEntryBody)body;
- (TSDContainerInfo)parentInfo;
- (TSDInfoGeometry)geometry;
- (TSDOwningAttachment)owningAttachment;
- (TSDOwningAttachment)owningAttachmentNoRecurse;
- (id)childCommandForReplaceAllCommand:(id)a3;
- (id)childEnumerator;
- (id)childInfos;
- (id)copyWithContext:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setOwningAttachment:(id)a3;
- (void)setParentInfo:(id)a3;
@end

@implementation THGlossaryEntryFloatingInfo

- (THGlossaryEntryFloatingInfo)initWithEntry:(id)a3 body:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THGlossaryEntryFloatingInfo;
  v6 = [(THGlossaryEntryFloatingInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->mEntry = (THModelGlossaryEntry *)a3;
    v6->mBody = (THModelGlossaryEntryFlushable *)a4;
  }
  return v7;
}

- (void)dealloc
{
  self->mBody = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryEntryFloatingInfo;
  [(THGlossaryEntryFloatingInfo *)&v3 dealloc];
}

- (THModelGlossaryEntryBody)body
{
  return [(THModelGlossaryEntryFlushable *)self->mBody body];
}

- (NSArray)bodyFloatingInfos
{
  v2 = [(THGlossaryEntryFloatingInfo *)self body];

  return [(THModelGlossaryEntryBody *)v2 bodyFloatingInfos];
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

- (id)childEnumerator
{
  id v2 = [(THGlossaryEntryFloatingInfo *)self childInfos];

  return [v2 objectEnumerator];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] initWithEntry:self->mEntry body:self->mBody];
  [v4 setParentInfo:[self parentInfo]];
  [v4 setGeometry:[self geometry]];
  [v4 setOwningAttachment:[self owningAttachment]];
  return v4;
}

- (id)copyWithContext:(id)a3
{
  return [(THGlossaryEntryFloatingInfo *)self copyWithZone:0];
}

- (TSDInfoGeometry)geometry
{
  id v2 = objc_alloc_init((Class)TSDInfoGeometry);

  return (TSDInfoGeometry *)v2;
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (void)setOwningAttachment:(id)a3
{
  if (a3)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryFloatingInfo setOwningAttachment:]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryFloatingInfo.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:109 description:@"Glossary entries should not have an owning attachment."];
  }
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (BOOL)floatingAboveText
{
  return 0;
}

- (BOOL)anchoredToText
{
  return 0;
}

- (BOOL)inlineWithText
{
  return 1;
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

- (BOOL)isFloatingAboveText
{
  return [(THGlossaryEntryFloatingInfo *)self owningAttachment] == 0;
}

- (BOOL)isAnchoredToText
{
  id v2 = [(THGlossaryEntryFloatingInfo *)self owningAttachment];

  return [(TSDOwningAttachment *)v2 isAnchored];
}

- (BOOL)isInlineWithText
{
  if ([(THGlossaryEntryFloatingInfo *)self isFloatingAboveText]) {
    return 0;
  }
  else {
    return ![(THGlossaryEntryFloatingInfo *)self isAnchoredToText];
  }
}

- (BOOL)isThemeContent
{
  return 0;
}

- (id)childInfos
{
  id v2 = [(THGlossaryEntryFloatingInfo *)self body];

  return [(THModelGlossaryEntryBody *)v2 bodyFloatingInfos];
}

- (THModelGlossaryEntry)entry
{
  return self->mEntry;
}

- (TSDContainerInfo)parentInfo
{
  return self->mParentInfo;
}

- (void)setParentInfo:(id)a3
{
  self->mParentInfo = (TSDContainerInfo *)a3;
}

@end