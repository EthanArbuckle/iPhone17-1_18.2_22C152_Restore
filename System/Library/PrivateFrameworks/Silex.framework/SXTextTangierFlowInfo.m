@interface SXTextTangierFlowInfo
- (BOOL)anchoredToText;
- (BOOL)attachedToBodyText;
- (BOOL)floatingAboveText;
- (BOOL)hasSpeakableContent;
- (BOOL)inlineWithText;
- (BOOL)isAnchoredToText;
- (BOOL)isAttachedToBodyText;
- (BOOL)isFloatingAboveText;
- (BOOL)isInlineWithText;
- (BOOL)isThemeContent;
- (Class)layoutClass;
- (Class)repClass;
- (SXTextTangierFlowInfo)initWithStorage:(id)a3 range:(_NSRange)a4;
- (SXTextTangierFlowStorage)storage;
- (TSDContainerInfo)parentInfo;
- (TSDInfoGeometry)geometry;
- (TSDOwningAttachment)owningAttachment;
- (TSDOwningAttachment)owningAttachmentNoRecurse;
- (TSDRepDirectLayerHosting)directLayerHost;
- (_NSRange)range;
- (id)childInfos;
- (id)copyWithContext:(id)a3;
- (void)setDirectLayerHost:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setOwningAttachment:(id)a3;
- (void)setParentInfo:(id)a3;
@end

@implementation SXTextTangierFlowInfo

- (SXTextTangierFlowInfo)initWithStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SXTextTangierFlowInfo;
  v9 = [(SXTextTangierFlowInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    v10->_range.NSUInteger location = location;
    v10->_range.NSUInteger length = length;
  }

  return v10;
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
  return (id)[MEMORY[0x263EFF8C0] array];
}

- (id)copyWithContext:(id)a3
{
  return 0;
}

- (BOOL)hasSpeakableContent
{
  if (!hasSpeakableContent_speakableCharacterSet)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F089C0]);
    v4 = [MEMORY[0x263F08708] alphanumericCharacterSet];
    [v3 formUnionWithCharacterSet:v4];

    v5 = [MEMORY[0x263F08708] symbolCharacterSet];
    [v3 formUnionWithCharacterSet:v5];

    v6 = [MEMORY[0x263F08708] punctuationCharacterSet];
    [v3 formUnionWithCharacterSet:v6];

    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 65532);
    [v3 addCharactersInString:v7];

    uint64_t v8 = [v3 copy];
    v9 = (void *)hasSpeakableContent_speakableCharacterSet;
    hasSpeakableContent_speakableCharacterSet = v8;
  }
  v10 = [(SXTextTangierFlowInfo *)self storage];
  v11 = [v10 string];
  uint64_t v12 = [(SXTextTangierFlowInfo *)self range];
  v14 = objc_msgSend(v11, "substringWithRange:", v12, v13);

  LOBYTE(v10) = [v14 rangeOfCharacterFromSet:hasSpeakableContent_speakableCharacterSet] != 0x7FFFFFFFFFFFFFFFLL;
  return (char)v10;
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

- (SXTextTangierFlowStorage)storage
{
  return self->_storage;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (TSDRepDirectLayerHosting)directLayerHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_directLayerHost);
  return (TSDRepDirectLayerHosting *)WeakRetained;
}

- (void)setDirectLayerHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_directLayerHost);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->geometry, 0);
}

@end