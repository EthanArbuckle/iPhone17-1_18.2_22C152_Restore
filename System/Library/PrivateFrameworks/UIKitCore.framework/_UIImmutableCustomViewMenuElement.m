@interface _UIImmutableCustomViewMenuElement
- (id)copyWithZone:(_NSZone *)a3;
- (void)setMenuElementRepresentation:(id)a3;
- (void)setPrimaryActionHandler:(id)a3;
@end

@implementation _UIImmutableCustomViewMenuElement

- (void)setMenuElementRepresentation:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICustomViewMenuElement.m" lineNumber:174 description:@"Menu element is immutable because it is a child of a menu"];
}

- (void)setPrimaryActionHandler:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICustomViewMenuElement.m" lineNumber:179 description:@"Menu element is immutable because it is a child of a menu"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UICustomViewMenuElement alloc];
  return [(UICustomViewMenuElement *)v4 initWithMenuElement:self];
}

@end