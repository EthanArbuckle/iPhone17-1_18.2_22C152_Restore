@interface TUICapslockAccessory
+ (BOOL)supportsSecureCoding;
- (TUICapslockAccessory)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUICapslockAccessory

- (TUICapslockAccessory)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUICapslockAccessory;
  return [(TUICursorAccessory *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TUICapslockAccessory;
  [(TUICursorAccessory *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end