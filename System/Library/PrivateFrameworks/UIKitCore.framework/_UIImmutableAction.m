@interface _UIImmutableAction
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

@implementation _UIImmutableAction

- (void)setTitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIAction.m" lineNumber:376 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setAttributedTitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIAction.m" lineNumber:380 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setSubtitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIAction.m" lineNumber:384 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setImage:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIAction.m" lineNumber:388 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setSelectedImage:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIAction.m" lineNumber:392 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setDiscoverabilityTitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIAction.m" lineNumber:396 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setAttributes:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIAction.m" lineNumber:400 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setState:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIAction.m" lineNumber:404 description:@"Action is immutable because it is a child of a menu"];
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIAction.m" lineNumber:408 description:@"Action is immutable because it is a child of a menu"];
}

- (void)_setPreferredDisplayMode:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIAction.m" lineNumber:413 description:@"Action is immutable because it is a child of a menu"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UIAction alloc];
  return [(UIAction *)v4 initWithAction:self];
}

@end