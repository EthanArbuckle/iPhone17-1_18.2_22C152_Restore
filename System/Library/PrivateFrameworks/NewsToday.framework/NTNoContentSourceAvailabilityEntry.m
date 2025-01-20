@interface NTNoContentSourceAvailabilityEntry
- (BOOL)isAvailable;
- (Class)todayResultsFetchDescriptorClass;
- (NTNoContentSourceAvailabilityEntry)init;
- (id)availabilityChangedNotificationBlock;
- (void)setAvailabilityChangedNotificationBlock:(id)a3;
@end

@implementation NTNoContentSourceAvailabilityEntry

- (NTNoContentSourceAvailabilityEntry)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTNoContentSourceAvailabilityEntry;
  return [(NTNoContentSourceAvailabilityEntry *)&v3 init];
}

- (Class)todayResultsFetchDescriptorClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)availabilityChangedNotificationBlock
{
  return self->availabilityChangedNotificationBlock;
}

- (void)setAvailabilityChangedNotificationBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end