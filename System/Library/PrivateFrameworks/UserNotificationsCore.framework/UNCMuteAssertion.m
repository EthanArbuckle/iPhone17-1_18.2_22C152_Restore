@interface UNCMuteAssertion
+ (BOOL)supportsSecureCoding;
- (BOOL)isActiveForThreadIdentifier:(id)a3;
- (UNCMuteAssertion)initWithCoder:(id)a3;
- (id)_init;
@end

@implementation UNCMuteAssertion

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)UNCMuteAssertion;
  return [(UNCMuteAssertion *)&v3 init];
}

- (BOOL)isActiveForThreadIdentifier:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCMuteAssertion)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UNCMuteAssertion;
  return [(UNCMuteAssertion *)&v4 init];
}

@end