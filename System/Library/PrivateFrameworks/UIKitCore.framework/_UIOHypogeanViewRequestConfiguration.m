@interface _UIOHypogeanViewRequestConfiguration
+ (BOOL)supportsSecureCoding;
- (_UIOHypogeanViewRequestConfiguration)initWithCoder:(id)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation _UIOHypogeanViewRequestConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIOHypogeanViewRequestConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIOHypogeanViewRequestConfiguration;
  v5 = [(_UIOHypogeanViewRequestConfiguration *)&v8 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_type);
    v5->_type = [v4 decodeIntegerForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v4 = a3;
  NSStringFromSelector(sel_type);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:type forKey:v5];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

@end