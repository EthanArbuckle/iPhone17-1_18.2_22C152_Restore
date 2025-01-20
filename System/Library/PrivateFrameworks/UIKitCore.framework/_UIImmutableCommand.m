@interface _UIImmutableCommand
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setPreferredDisplayMode:(unint64_t)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setAttributes:(unint64_t)a3;
- (void)setDiscoverabilityTitle:(id)a3;
- (void)setImage:(id)a3;
- (void)setSelectedImage:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UIImmutableCommand

- (void)setTitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICommand.m" lineNumber:612 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setAttributedTitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICommand.m" lineNumber:616 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setSubtitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICommand.m" lineNumber:620 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setImage:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICommand.m" lineNumber:624 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setSelectedImage:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICommand.m" lineNumber:628 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setDiscoverabilityTitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICommand.m" lineNumber:632 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setAttributes:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICommand.m" lineNumber:636 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setState:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICommand.m" lineNumber:640 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICommand.m" lineNumber:644 description:@"Command is immutable because it is a child of a menu"];
}

- (void)_setPreferredDisplayMode:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UICommand.m" lineNumber:649 description:@"Command is immutable because it is a child of a menu"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UICommand alloc];
  return [(UICommand *)v4 initWithCommand:self];
}

@end