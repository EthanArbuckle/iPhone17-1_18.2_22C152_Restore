@interface _UIKeyShortcutHUDPresentationResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)accepted;
- (_UIKeyShortcutHUDPresentationResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccepted:(BOOL)a3;
@end

@implementation _UIKeyShortcutHUDPresentationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_UIKeyShortcutHUDPresentationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (_UIKeyShortcutHUDPresentationResponse *)objc_opt_new();
  uint64_t v6 = [v4 decodeBoolForKey:@"accepted"];

  [(_UIKeyShortcutHUDPresentationResponse *)v5 setAccepted:v6];
  return v5;
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

@end