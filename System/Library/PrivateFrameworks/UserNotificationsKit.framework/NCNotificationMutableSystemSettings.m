@interface NCNotificationMutableSystemSettings
- (void)setHighlightsEnabled:(BOOL)a3;
- (void)setListDisplayStyleSetting:(int64_t)a3;
- (void)setScheduledDeliveryEnabled:(BOOL)a3;
- (void)setScheduledDeliveryShowNextSummary:(BOOL)a3;
- (void)setScheduledDeliveryTimes:(id)a3;
- (void)setScheduledDeliveryUninitialized:(BOOL)a3;
@end

@implementation NCNotificationMutableSystemSettings

- (void)setScheduledDeliveryEnabled:(BOOL)a3
{
  self->super._scheduledDeliveryEnabled = a3;
}

- (void)setScheduledDeliveryUninitialized:(BOOL)a3
{
  self->super._scheduledDeliveryUninitialized = a3;
}

- (void)setScheduledDeliveryShowNextSummary:(BOOL)a3
{
  self->super._scheduledDeliveryShowNextSummary = a3;
}

- (void)setScheduledDeliveryTimes:(id)a3
{
  self->super._scheduledDeliveryTimes = (NSArray *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setListDisplayStyleSetting:(int64_t)a3
{
  self->super._listDisplayStyleSetting = a3;
}

- (void)setHighlightsEnabled:(BOOL)a3
{
  self->super._highlightsEnabled = a3;
}

@end