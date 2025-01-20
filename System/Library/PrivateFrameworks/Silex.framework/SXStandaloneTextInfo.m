@interface SXStandaloneTextInfo
- (BOOL)anchoredToText;
- (BOOL)attachedToBodyText;
- (BOOL)floatingAboveText;
- (BOOL)inlineWithText;
- (BOOL)isAnchoredToText;
- (BOOL)isAttachedToBodyText;
- (BOOL)isFloatingAboveText;
- (BOOL)isInlineWithText;
- (BOOL)isThemeContent;
- (Class)layoutClass;
- (Class)repClass;
- (SXStandaloneTextInfo)initWithStorage:(id)a3;
- (SXTextTangierStorage)storage;
- (TSDContainerInfo)parentInfo;
- (TSDInfoGeometry)geometry;
- (TSDOwningAttachment)owningAttachment;
- (TSDOwningAttachment)owningAttachmentNoRecurse;
- (id)childInfos;
- (id)copyWithContext:(id)a3;
- (void)dealloc;
- (void)setGeometry:(id)a3;
- (void)setOwningAttachment:(id)a3;
- (void)setParentInfo:(id)a3;
@end

@implementation SXStandaloneTextInfo

- (SXStandaloneTextInfo)initWithStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXStandaloneTextInfo;
  v6 = [(SXStandaloneTextInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    [(TSWPStorage *)v7->_storage setParentInfo:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(TSWPStorage *)self->_storage setParentInfo:0];
  v3.receiver = self;
  v3.super_class = (Class)SXStandaloneTextInfo;
  [(SXStandaloneTextInfo *)&v3 dealloc];
}

- (BOOL)anchoredToText
{
  return 0;
}

- (BOOL)attachedToBodyText
{
  return 0;
}

- (BOOL)floatingAboveText
{
  return 0;
}

- (TSDInfoGeometry)geometry
{
  return 0;
}

- (BOOL)inlineWithText
{
  return 0;
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (TSDContainerInfo)parentInfo
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

- (BOOL)isThemeContent
{
  return 0;
}

- (id)childInfos
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(SXStandaloneTextInfo *)self storage];
  v5[0] = v2;
  objc_super v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)copyWithContext:(id)a3
{
  return 0;
}

- (void)setGeometry:(id)a3
{
}

- (void)setOwningAttachment:(id)a3
{
  self->owningAttachment = (TSDOwningAttachment *)a3;
}

- (void)setParentInfo:(id)a3
{
  self->parentInfo = (TSDContainerInfo *)a3;
}

- (BOOL)isFloatingAboveText
{
  return self->floatingAboveText;
}

- (BOOL)isAnchoredToText
{
  return self->anchoredToText;
}

- (BOOL)isInlineWithText
{
  return self->inlineWithText;
}

- (BOOL)isAttachedToBodyText
{
  return self->attachedToBodyText;
}

- (SXTextTangierStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->geometry, 0);
}

@end