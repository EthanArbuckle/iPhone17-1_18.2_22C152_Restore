@interface NRMutableStateBaseObserverWrapper
@end

@implementation NRMutableStateBaseObserverWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_observer, 0);
}

@end