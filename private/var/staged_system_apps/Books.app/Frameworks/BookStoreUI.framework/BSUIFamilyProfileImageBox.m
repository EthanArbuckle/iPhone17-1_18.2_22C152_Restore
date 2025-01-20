@interface BSUIFamilyProfileImageBox
- (Class)layoutClass;
- (NSString)urlString;
- (double)cornerRadius;
- (void)setCornerRadius:(double)a3;
- (void)setUrlString:(id)a3;
@end

@implementation BSUIFamilyProfileImageBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end