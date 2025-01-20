@interface CRLWPAttachment
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)mostSpecificAttachmentFromInfo:(id)a3;
+ (unint64_t)attributeArrayKind;
- (BOOL)changesWithPageCount;
- (BOOL)isAnchored;
- (BOOL)isAttachedToBodyText;
- (BOOL)isDrawable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHorizontallyCentered;
- (BOOL)isPartitioned;
- (BOOL)isSearchable;
- (BOOL)isVerticallyCentered;
- (BOOL)preserveAttributesOverSelectionWhenInserting;
- (BOOL)shouldInvalidateWhenTextPropertiesChange;
- (BOOL)specifiesEnabledKnobMask;
- (CRLWPTextSource)parentStorage;
- (id)topLevelAttachment;
- (unint64_t)enabledKnobMaskWithRep:(id)a3;
- (unint64_t)hash;
- (unsigned)elementKind;
- (void)setParentStorage:(id)a3;
@end

@implementation CRLWPAttachment

+ (unint64_t)attributeArrayKind
{
  return 4;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, @"It is illegal to instantiate CRLWPAttachment; it is abstract",
      0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CRLWPAttachment;
  return [super allocWithZone:a3];
}

+ (id)mostSpecificAttachmentFromInfo:(id)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (unint64_t)hash
{
  return 0;
}

- (unsigned)elementKind
{
  return 0;
}

- (BOOL)changesWithPageCount
{
  return 0;
}

- (id)topLevelAttachment
{
  v2 = self;

  return v2;
}

- (BOOL)isDrawable
{
  return 0;
}

- (BOOL)isAnchored
{
  return 0;
}

- (BOOL)isPartitioned
{
  return 0;
}

- (BOOL)isAttachedToBodyText
{
  v2 = [(CRLWPAttachment *)self parentStorage];
  BOOL v3 = [v2 wpKind] == 0;

  return v3;
}

- (BOOL)isSearchable
{
  return 0;
}

- (BOOL)isHorizontallyCentered
{
  return 0;
}

- (BOOL)isVerticallyCentered
{
  return 0;
}

- (BOOL)specifiesEnabledKnobMask
{
  return 0;
}

- (unint64_t)enabledKnobMaskWithRep:(id)a3
{
  return 0;
}

- (BOOL)shouldInvalidateWhenTextPropertiesChange
{
  return 0;
}

- (BOOL)preserveAttributesOverSelectionWhenInserting
{
  return 0;
}

- (CRLWPTextSource)parentStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentStorage);

  return (CRLWPTextSource *)WeakRetained;
}

- (void)setParentStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end