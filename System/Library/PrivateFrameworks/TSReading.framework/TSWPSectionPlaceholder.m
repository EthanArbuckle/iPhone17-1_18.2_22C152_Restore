@interface TSWPSectionPlaceholder
- (BOOL)isEqual:(id)a3;
- (TSWPSectionPlaceholder)initWithContext:(id)a3;
- (id)copyWithContext:(id)a3;
- (id)description;
- (id)parentStorage;
- (void)i_ensureHeaderFooterStoragesExistWithStylesheet:(id)a3;
- (void)setParentStorage:(id)a3;
@end

@implementation TSWPSectionPlaceholder

- (TSWPSectionPlaceholder)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPSectionPlaceholder;
  return [(TSPObject *)&v4 initWithContext:a3];
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPSectionPlaceholder;
  return [(TSWPSectionPlaceholder *)&v4 isEqual:a3];
}

- (id)copyWithContext:(id)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 initWithContext:a3];
}

- (id)parentStorage
{
  return self->_parentStorage;
}

- (void)setParentStorage:(id)a3
{
  self->_parentStorage = (TSWPStorage *)a3;
}

- (void)i_ensureHeaderFooterStoragesExistWithStylesheet:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPSectionPlaceholder i_ensureHeaderFooterStoragesExistWithStylesheet:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSectionPlaceholder.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:89 description:@"Should be defined in the real section class: i_ensureHeaderFooterStoragesExistWithStylesheet:"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"[%@] 0x%p", NSStringFromClass(v4), self];
}

@end