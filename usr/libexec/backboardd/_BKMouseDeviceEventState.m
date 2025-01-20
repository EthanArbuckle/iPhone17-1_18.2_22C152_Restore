@interface _BKMouseDeviceEventState
@end

@implementation _BKMouseDeviceEventState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodCalculator, 0);
  objc_storeStrong((id *)&self->_restingPaths, 0);
  objc_storeStrong((id *)&self->_touchingPathsAtButtonEvent, 0);
  objc_storeStrong((id *)&self->_rangingPaths, 0);
  objc_storeStrong((id *)&self->_touchingPaths, 0);

  objc_storeStrong((id *)&self->_senderInfo, 0);
}

@end