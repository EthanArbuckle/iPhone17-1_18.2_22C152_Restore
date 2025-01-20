@interface THWControlContainer
- (BOOL)isAnchoredToText;
- (BOOL)isAttachedToBodyText;
- (BOOL)isFloatingAboveText;
- (BOOL)isInlineWithText;
- (BOOL)isThemeContent;
- (Class)layoutClass;
- (Class)repClass;
- (THWControlContainer)initWithDelegate:(id)a3;
- (THWControlContainerLayoutDelegate)delegate;
- (TSDContainerInfo)parentInfo;
- (TSDInfoGeometry)geometry;
- (TSDOwningAttachment)owningAttachment;
- (TSDOwningAttachment)owningAttachmentNoRecurse;
- (id)childCommandForReplaceAllCommand:(id)a3;
- (id)childEnumerator;
- (id)childInfos;
- (id)copyWithContext:(id)a3;
- (id)instanceData;
- (unint64_t)index;
- (unint64_t)tag;
- (void)dealloc;
- (void)setIndex:(unint64_t)a3;
- (void)setInstanceData:(id)a3;
- (void)setTag:(unint64_t)a3;
@end

@implementation THWControlContainer

- (THWControlContainer)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWControlContainer;
  result = [(THWControlContainer *)&v5 init];
  if (result)
  {
    result->_delegate = (THWControlContainerLayoutDelegate *)a3;
    *(int64x2_t *)&result->_tag = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWControlContainer;
  [(THWControlContainer *)&v3 dealloc];
}

- (id)childInfos
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

- (TSDInfoGeometry)geometry
{
  return 0;
}

- (id)copyWithContext:(id)a3
{
  return 0;
}

- (TSDContainerInfo)parentInfo
{
  return 0;
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (BOOL)isInlineWithText
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

- (BOOL)isAttachedToBodyText
{
  return 0;
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

- (id)childEnumerator
{
  return 0;
}

- (unint64_t)tag
{
  return self->_tag;
}

- (void)setTag:(unint64_t)a3
{
  self->_tag = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (THWControlContainerLayoutDelegate)delegate
{
  return self->_delegate;
}

- (id)instanceData
{
  return self->_instanceData;
}

- (void)setInstanceData:(id)a3
{
}

@end