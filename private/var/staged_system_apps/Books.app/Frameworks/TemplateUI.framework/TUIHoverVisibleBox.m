@interface TUIHoverVisibleBox
- (Class)layoutClass;
- (NSString)regionName;
- (unint64_t)whenUnavailable;
- (void)setRegionName:(id)a3;
- (void)setWhenUnavailable:(unint64_t)a3;
@end

@implementation TUIHoverVisibleBox

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

- (unint64_t)whenUnavailable
{
  return self->_whenUnavailable;
}

- (void)setWhenUnavailable:(unint64_t)a3
{
  self->_whenUnavailable = a3;
}

- (void).cxx_destruct
{
}

@end