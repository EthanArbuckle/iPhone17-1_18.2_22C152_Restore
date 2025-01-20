@interface NRBlockQueueWrapper
@end

@implementation NRBlockQueueWrapper

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end