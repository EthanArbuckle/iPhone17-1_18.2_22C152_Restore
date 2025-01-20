@interface _UIImmutableKeyCommand
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setEnumerationPriority:(int64_t)a3;
- (void)_setEventDeferringEnvironment:(id)a3;
- (void)setAllowsAutomaticLocalization:(BOOL)a3;
- (void)setAllowsAutomaticMirroring:(BOOL)a3;
- (void)setAttributes:(unint64_t)a3;
- (void)setDiscoverabilityTitle:(id)a3;
- (void)setImage:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setWantsPriorityOverSystemBehavior:(BOOL)a3;
@end

@implementation _UIImmutableKeyCommand

- (void)setTitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:1132 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setImage:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:1136 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setDiscoverabilityTitle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:1140 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setAttributes:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:1144 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setState:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:1148 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setWantsPriorityOverSystemBehavior:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:1152 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setAllowsAutomaticLocalization:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:1156 description:@"Command is immutable because it is a child of a menu"];
}

- (void)setAllowsAutomaticMirroring:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:1160 description:@"Command is immutable because it is a child of a menu"];
}

- (void)_setEventDeferringEnvironment:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:1164 description:@"Command is immutable because it is a child of a menu"];
}

- (void)_setEnumerationPriority:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIKeyCommand.m" lineNumber:1168 description:@"Command is immutable because it is a child of a menu"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UIKeyCommand alloc];
  return [(UIKeyCommand *)v4 initWithKeyCommand:self];
}

@end