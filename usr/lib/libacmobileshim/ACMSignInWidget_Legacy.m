@interface ACMSignInWidget_Legacy
- (id)accountLabel;
@end

@implementation ACMSignInWidget_Legacy

- (id)accountLabel
{
  accountLabel = self->super._accountLabel;
  if (!accountLabel)
  {
    v4.receiver = self;
    v4.super_class = (Class)ACMSignInWidget_Legacy;
    accountLabel = [(ACMSignInWidget *)&v4 accountLabel];
    -[UILabel setFont:](accountLabel, "setFont:", [MEMORY[0x263F1C658] boldSystemFontOfSize:16.0]);
  }
  return accountLabel;
}

@end