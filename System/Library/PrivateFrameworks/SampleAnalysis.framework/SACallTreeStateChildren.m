@interface SACallTreeStateChildren
@end

@implementation SACallTreeStateChildren

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioEvents, 0);
  objc_storeStrong((id *)&self->_timeRanges, 0);
}

@end