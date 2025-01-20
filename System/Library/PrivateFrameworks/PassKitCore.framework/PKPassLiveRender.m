@interface PKPassLiveRender
+ (BOOL)supportsSecureCoding;
- (BOOL)enabled;
- (PKPassLiveRender)init;
- (PKPassLiveRender)initWithCoder:(id)a3;
- (PKPassLiveRender)initWithEnabled:(BOOL)a3;
- (id)_init;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation PKPassLiveRender

- (PKPassLiveRender)initWithEnabled:(BOOL)a3
{
  result = [(PKPassLiveRender *)self _init];
  if (result) {
    result->_enabled = a3;
  }
  return result;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassLiveRender;
  return [(PKPassLiveRender *)&v3 init];
}

- (PKPassLiveRender)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKPassLiveRender)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKPassLiveRender *)self _init];
  if (v5) {
    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
  }

  return v5;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_enabled) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 appendFormat:@"enabled: %@", v5];
  [v4 appendFormat:@">"];
  return v4;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end