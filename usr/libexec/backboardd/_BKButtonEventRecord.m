@interface _BKButtonEventRecord
@end

@implementation _BKButtonEventRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);

  objc_storeStrong((id *)&self->_senderInfo, 0);
}

@end