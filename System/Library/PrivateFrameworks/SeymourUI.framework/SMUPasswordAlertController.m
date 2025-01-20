@interface SMUPasswordAlertController
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)supportedOrientations;
- (void)setSupportedOrientations:(unint64_t)a3;
@end

@implementation SMUPasswordAlertController

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedOrientations;
}

- (unint64_t)supportedOrientations
{
  return self->_supportedOrientations;
}

- (void)setSupportedOrientations:(unint64_t)a3
{
  self->_supportedOrientations = a3;
}

@end