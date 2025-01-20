@interface UIMenuDisplayPreferences
+ (BOOL)supportsSecureCoding;
- (UIMenuDisplayPreferences)init;
- (UIMenuDisplayPreferences)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maximumNumberOfTitleLines;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumNumberOfTitleLines:(int64_t)a3;
@end

@implementation UIMenuDisplayPreferences

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[UIMenuDisplayPreferences allocWithZone:a3] init];
  [(UIMenuDisplayPreferences *)v4 setMaximumNumberOfTitleLines:[(UIMenuDisplayPreferences *)self maximumNumberOfTitleLines]];
  return v4;
}

- (void)setMaximumNumberOfTitleLines:(int64_t)a3
{
  self->_maximumNumberOfTitleLines = a3;
}

- (UIMenuDisplayPreferences)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIMenuDisplayPreferences;
  result = [(UIMenuDisplayPreferences *)&v3 init];
  if (result) {
    result->_maximumNumberOfTitleLines = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (int64_t)maximumNumberOfTitleLines
{
  return self->_maximumNumberOfTitleLines;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (UIMenuDisplayPreferences)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIMenuDisplayPreferences;
  v5 = [(UIMenuDisplayPreferences *)&v7 init];
  if (v5) {
    v5->_maximumNumberOfTitleLines = [v4 decodeIntegerForKey:@"maximumNumberOfTitleLines"];
  }

  return v5;
}

@end