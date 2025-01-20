@interface THGlossaryEntryInfo
- (BOOL)anchoredToText;
- (BOOL)floatingAboveText;
- (BOOL)hasTitle;
- (BOOL)inlineWithText;
- (BOOL)isAnchoredToText;
- (BOOL)isAttachedToBodyText;
- (BOOL)isFloatingAboveText;
- (BOOL)isInlineWithText;
- (BOOL)isThemeContent;
- (Class)layoutClass;
- (Class)repClass;
- (THGlossaryEntryFloatingInfo)floatingInfo;
- (THGlossaryEntryInfo)initWithEntry:(id)a3 body:(id)a4;
- (THModelGlossaryEntry)entry;
- (THModelGlossaryEntryBody)body;
- (THWPStorage)bodyStorage;
- (THWPStorage)headerInfo;
- (THWPStorage)linksInfo;
- (THWPStorage)relatedTermsInfo;
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

@implementation THGlossaryEntryInfo

- (THGlossaryEntryInfo)initWithEntry:(id)a3 body:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)THGlossaryEntryInfo;
  v6 = [(THGlossaryEntryInfo *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->mEntry = (THModelGlossaryEntry *)a3;
    v6->mBody = (THModelGlossaryEntryFlushable *)a4;
    id v8 = +[TSSPropertyMap propertyMap];
    [v8 setObject:[TSUColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0] forProperty:18];
    [v8 setObject:[+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 15.0) fontName] forProperty:16];
    LODWORD(v9) = 15.0;
    [v8 setFloatValue:17 forProperty:v9];
    v13[0] = [(THModelGlossaryEntryBody *)[(THGlossaryEntryInfo *)v7 body] relatedTermsInfo];
    v13[1] = [(THModelGlossaryEntryBody *)[(THGlossaryEntryInfo *)v7 body] linksInfo];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_C0FFC;
    v11[3] = &unk_458F38;
    v11[4] = v8;
    [+[NSArray arrayWithObjects:v13 count:2] enumerateObjectsUsingBlock:v11];
    if (objc_msgSend(objc_msgSend(objc_msgSend(a4, "body"), "bodyFloatingInfos"), "count")) {
      v7->mFloatingInfo = [[THGlossaryEntryFloatingInfo alloc] initWithEntry:a3 body:a4];
    }
  }
  return v7;
}

- (void)dealloc
{
  self->mChildInfos = 0;
  self->mFloatingInfo = 0;

  self->mBody = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryEntryInfo;
  [(THGlossaryEntryInfo *)&v3 dealloc];
}

- (THModelGlossaryEntryBody)body
{
  return [(THModelGlossaryEntryFlushable *)self->mBody body];
}

- (BOOL)hasTitle
{
  objc_super v3 = [(THModelGlossaryEntryBody *)[(THGlossaryEntryInfo *)self body] bodyStorage];
  if (v3) {
    LOBYTE(v3) = [(THWPStorage *)[(THModelGlossaryEntryBody *)[(THGlossaryEntryInfo *)self body] bodyStorage] length] != 0;
  }
  return (char)v3;
}

- (THWPStorage)headerInfo
{
  v2 = [(THGlossaryEntryInfo *)self body];

  return [(THModelGlossaryEntryBody *)v2 headerInfo];
}

- (THWPStorage)bodyStorage
{
  v2 = [(THGlossaryEntryInfo *)self body];

  return [(THModelGlossaryEntryBody *)v2 bodyStorage];
}

- (THWPStorage)relatedTermsInfo
{
  v2 = [(THGlossaryEntryInfo *)self body];

  return [(THModelGlossaryEntryBody *)v2 relatedTermsInfo];
}

- (THWPStorage)linksInfo
{
  v2 = [(THGlossaryEntryInfo *)self body];

  return [(THModelGlossaryEntryBody *)v2 linksInfo];
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

- (id)childEnumerator
{
  id v2 = [(THGlossaryEntryInfo *)self childInfos];

  return [v2 objectEnumerator];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithEntry:body:", self->mEntry, self->mBody);
  [v4 setParentInfo:[self parentInfo]];
  [v4 setOwningAttachment:[self owningAttachment]];
  return v4;
}

- (id)copyWithContext:(id)a3
{
  return [(THGlossaryEntryInfo *)self copyWithZone:0];
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
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryInfo setOwningAttachment:]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryInfo.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:152 description:@"Glossary entries should not have an owning attachment."];
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
  return [(THGlossaryEntryInfo *)self owningAttachment] == 0;
}

- (BOOL)isAnchoredToText
{
  id v2 = [(THGlossaryEntryInfo *)self owningAttachment];

  return [(TSDOwningAttachment *)v2 isAnchored];
}

- (BOOL)isInlineWithText
{
  if ([(THGlossaryEntryInfo *)self isFloatingAboveText]) {
    return 0;
  }
  else {
    return ![(THGlossaryEntryInfo *)self isAnchoredToText];
  }
}

- (BOOL)isThemeContent
{
  return 0;
}

- (id)childInfos
{
  id v3 = [(THGlossaryEntryInfo *)self body];
  id result = self->mChildInfos;
  if (!result)
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:((char *)-[NSArray count](-[THModelGlossaryEntryBody bodyFloatingInfos](v3, "bodyFloatingInfos"), "count") + 4)];
    if ([(THModelGlossaryEntryBody *)v3 headerInfo]) {
      [v5 addObject:[v3 headerInfo]];
    }
    if ([(THGlossaryEntryInfo *)self floatingInfo]) {
      [v5 addObject:[self floatingInfo]];
    }
    if ([(THModelGlossaryEntryBody *)v3 bodyStorage]) {
      [v5 addObject:[v3 bodyStorage]];
    }
    if ([(THModelGlossaryEntryBody *)v3 relatedTermsInfo]) {
      [v5 addObject:[v3 relatedTermsInfo]];
    }
    if ([(THModelGlossaryEntryBody *)v3 linksInfo]) {
      [v5 addObject:[v3 linksInfo]];
    }
    self->mChildInfos = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v5];

    return self->mChildInfos;
  }
  return result;
}

- (THModelGlossaryEntry)entry
{
  return self->mEntry;
}

- (THGlossaryEntryFloatingInfo)floatingInfo
{
  return self->mFloatingInfo;
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