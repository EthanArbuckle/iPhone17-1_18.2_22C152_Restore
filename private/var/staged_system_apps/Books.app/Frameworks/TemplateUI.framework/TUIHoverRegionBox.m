@interface TUIHoverRegionBox
- (Class)layoutClass;
- (NSString)regionName;
- (void)setRegionName:(id)a3;
@end

@implementation TUIHoverRegionBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (NSString)regionName
{
  return self->_regionName;
}

- (void)setRegionName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end