@interface KTPeerOverride
+ (BOOL)supportsSecureCoding;
- (KTPeerOverride)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)uiStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setUiStatus:(unint64_t)a3;
@end

@implementation KTPeerOverride

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[KTPeerOverride uiStatus](self, "uiStatus"), @"uiStatus");
}

- (KTPeerOverride)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)KTPeerOverride;
  v5 = [(KTPeerOverride *)&v7 init];
  if (v5) {
    -[KTPeerOverride setUiStatus:](v5, "setUiStatus:", (int)[v4 decodeIntForKey:@"uiStatus"]);
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<KTPeerOverride: (uiStatus: %lu)>", -[KTPeerOverride uiStatus](self, "uiStatus"));
}

- (unint64_t)uiStatus
{
  return self->_uiStatus;
}

- (void)setUiStatus:(unint64_t)a3
{
  self->_uiStatus = a3;
}

@end