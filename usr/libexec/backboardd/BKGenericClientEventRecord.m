@interface BKGenericClientEventRecord
@end

@implementation BKGenericClientEventRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end