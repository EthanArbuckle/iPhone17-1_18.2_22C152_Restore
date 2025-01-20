@interface TSWPPlaceholderSmartField
- (BOOL)isLocalizable;
- (TSWPPlaceholderSmartField)initWithContext:(id)a3;
- (id)copyWithContext:(id)a3;
- (int)elementKind;
- (void)dealloc;
- (void)setIsLocalizable:(BOOL)a3;
@end

@implementation TSWPPlaceholderSmartField

- (TSWPPlaceholderSmartField)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPPlaceholderSmartField;
  return [(TSWPSmartField *)&v4 initWithContext:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSWPPlaceholderSmartField;
  [(TSWPSmartField *)&v2 dealloc];
}

- (id)copyWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPPlaceholderSmartField;
  id v4 = [(TSWPSmartField *)&v6 copyWithContext:a3];
  if (v4) {
    objc_msgSend(v4, "setIsLocalizable:", -[TSWPPlaceholderSmartField isLocalizable](self, "isLocalizable"));
  }
  return v4;
}

- (int)elementKind
{
  return 1024;
}

- (BOOL)isLocalizable
{
  return self->_localizable;
}

- (void)setIsLocalizable:(BOOL)a3
{
  self->_localizable = a3;
}

@end