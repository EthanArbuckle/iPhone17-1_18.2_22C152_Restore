@interface _UITraitRegistration
@end

@implementation _UITraitRegistration

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong(&self->_handler, 0);
}

@end