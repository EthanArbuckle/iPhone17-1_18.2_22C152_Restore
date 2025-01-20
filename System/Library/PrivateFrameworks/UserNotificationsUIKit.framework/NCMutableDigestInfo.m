@interface NCMutableDigestInfo
- (void)setDeliveryOrder:(int64_t)a3;
- (void)setHeaderString:(id)a3;
- (void)setScheduleDate:(id)a3;
- (void)setScheduleTime:(id)a3;
- (void)setTitleString:(id)a3;
@end

@implementation NCMutableDigestInfo

- (void)setScheduleTime:(id)a3
{
}

- (void)setScheduleDate:(id)a3
{
}

- (void)setTitleString:(id)a3
{
}

- (void)setHeaderString:(id)a3
{
}

- (void)setDeliveryOrder:(int64_t)a3
{
  self->super._deliveryOrder = a3;
}

@end