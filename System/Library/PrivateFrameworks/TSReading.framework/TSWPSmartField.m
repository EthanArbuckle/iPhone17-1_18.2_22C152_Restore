@interface TSWPSmartField
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)defaultFieldStyleIdentifier;
- (BOOL)allowsEditing;
- (BOOL)allowsPasteAsSmartField;
- (BOOL)canCopy:(_NSRange)a3;
- (TSWPSmartField)initWithContext:(id)a3;
- (TSWPStorage)parentStorage;
- (_NSRange)range;
- (id)copyWithContext:(id)a3;
- (id)text;
- (int)elementKind;
- (int)styleAttributeArrayKind;
- (unsigned)attributeArrayKind;
- (void)dealloc;
- (void)setParentStorage:(id)a3;
@end

@implementation TSWPSmartField

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"It is illegal to instantiate TSWPSmartField; it is abstract",
  }
                               0));
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TSWPSmartField;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (TSWPSmartField)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPSmartField;
  return [(TSPObject *)&v4 initWithContext:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSWPSmartField;
  [(TSWPSmartField *)&v2 dealloc];
}

- (id)copyWithContext:(id)a3
{
  objc_super v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPSmartField zone](self, "zone"));

  return (id)[v4 initWithContext:a3];
}

- (int)elementKind
{
  return 0x2000;
}

- (unsigned)attributeArrayKind
{
  return 6;
}

- (int)styleAttributeArrayKind
{
  return 6;
}

- (_NSRange)range
{
  v3 = [(TSWPStorage *)[(TSWPSmartField *)self parentStorage] attributeArrayForKind:[(TSWPSmartField *)self attributeArrayKind]];
  if (v3
    && (objc_super v4 = v3,
        unint64_t Object = TSWPAttributeArray::findObject(v3, (objc_object *)self, self->_lastTableIndex),
        self->_lastTableIndex = Object,
        Object != 0x7FFFFFFFFFFFFFFFLL))
  {
    NSUInteger v6 = TSWPAttributeArray::rangeForAttributeIndex(v4, Object);
  }
  else
  {
    NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v7 = 0;
  }
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)allowsEditing
{
  return 0;
}

- (BOOL)allowsPasteAsSmartField
{
  return 1;
}

- (BOOL)canCopy:(_NSRange)a3
{
  return 1;
}

- (id)text
{
  return 0;
}

+ (id)defaultFieldStyleIdentifier
{
  return 0;
}

- (TSWPStorage)parentStorage
{
  return self->_parentStorage;
}

- (void)setParentStorage:(id)a3
{
  self->_parentStorage = (TSWPStorage *)a3;
}

@end