@interface _NFFailForwardCoordinator
@end

@implementation _NFFailForwardCoordinator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_furyDelegate);

  objc_destroyWeak((id *)&self->_primaryDelegate);
}

@end