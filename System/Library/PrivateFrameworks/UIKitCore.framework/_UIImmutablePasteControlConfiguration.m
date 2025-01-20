@interface _UIImmutablePasteControlConfiguration
- (void)setBaseBackgroundColor:(id)a3;
- (void)setBaseForegroundColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCornerStyle:(int64_t)a3;
- (void)setDisplayMode:(unint64_t)a3;
@end

@implementation _UIImmutablePasteControlConfiguration

- (void)setDisplayMode:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIPasteControl.m" lineNumber:103 description:@"Configuration is immutable because it is a property of a paste control"];
}

- (void)setCornerStyle:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIPasteControl.m" lineNumber:107 description:@"Configuration is immutable because it is a property of a paste control"];
}

- (void)setCornerRadius:(double)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIPasteControl.m" lineNumber:111 description:@"Configuration is immutable because it is a property of a paste control"];
}

- (void)setBaseForegroundColor:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIPasteControl.m" lineNumber:115 description:@"Configuration is immutable because it is a property of a paste control"];
}

- (void)setBaseBackgroundColor:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIPasteControl.m" lineNumber:119 description:@"Configuration is immutable because it is a property of a paste control"];
}

@end