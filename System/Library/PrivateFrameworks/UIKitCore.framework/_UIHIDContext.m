@interface _UIHIDContext
@end

@implementation _UIHIDContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->scaleEventTracker, 0);
  objc_storeStrong((id *)&self->pathCollection, 0);
}

@end