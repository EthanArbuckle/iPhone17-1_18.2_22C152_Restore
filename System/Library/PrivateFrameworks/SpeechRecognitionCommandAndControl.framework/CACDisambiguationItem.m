@interface CACDisambiguationItem
- (NSString)displayDescription;
- (NSString)displayName;
- (UIImage)displayImage;
- (int64_t)type;
- (void)setType:(int64_t)a3;
- (void)startInteraction;
@end

@implementation CACDisambiguationItem

- (UIImage)displayImage
{
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)startInteraction
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (NSString)displayName
{
  return 0;
}

- (NSString)displayDescription
{
  return 0;
}

@end