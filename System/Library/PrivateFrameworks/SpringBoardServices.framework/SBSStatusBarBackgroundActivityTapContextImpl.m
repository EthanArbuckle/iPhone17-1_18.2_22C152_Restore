@interface SBSStatusBarBackgroundActivityTapContextImpl
+ (BOOL)supportsSecureCoding;
- (NSString)backgroundActivityIdentifier;
- (SBSStatusBarBackgroundActivityTapContextImpl)initWithBackgroundActivityIdentifier:(id)a3;
- (SBSStatusBarBackgroundActivityTapContextImpl)initWithCoder:(id)a3;
- (unint64_t)styleOverride;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundActivityIdentifier:(id)a3;
- (void)setStyleOverride:(unint64_t)a3;
@end

@implementation SBSStatusBarBackgroundActivityTapContextImpl

- (SBSStatusBarBackgroundActivityTapContextImpl)initWithBackgroundActivityIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSStatusBarBackgroundActivityTapContextImpl;
  v6 = [(SBSStatusBarBackgroundActivityTapContextImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backgroundActivityIdentifier, a3);
  }

  return v7;
}

- (SBSStatusBarBackgroundActivityTapContextImpl)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSStatusBarBackgroundActivityTapContextImpl;
  id v5 = [(SBSStatusBarBackgroundActivityTapContextImpl *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSBSStatusBarTapContextBackgroundActivityIdentifierKey"];
    backgroundActivityIdentifier = v5->_backgroundActivityIdentifier;
    v5->_backgroundActivityIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)backgroundActivityIdentifier
{
  return self->_backgroundActivityIdentifier;
}

- (void)setBackgroundActivityIdentifier:(id)a3
{
}

- (unint64_t)styleOverride
{
  return self->_styleOverride;
}

- (void)setStyleOverride:(unint64_t)a3
{
  self->_styleOverride = a3;
}

- (void).cxx_destruct
{
}

@end