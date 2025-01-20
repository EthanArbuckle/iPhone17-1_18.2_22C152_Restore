@interface SARestaurantOpening
+ (id)opening;
- (NSNumber)partySize;
- (NSURL)bookingId;
- (SACalendar)timeSlot;
- (SAUIAppPunchOut)makeReservationPunchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBookingId:(id)a3;
- (void)setMakeReservationPunchOut:(id)a3;
- (void)setPartySize:(id)a3;
- (void)setTimeSlot:(id)a3;
@end

@implementation SARestaurantOpening

- (id)groupIdentifier
{
  return @"com.apple.ace.restaurant";
}

- (id)encodedClassName
{
  return @"Opening";
}

+ (id)opening
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)bookingId
{
  return (NSURL *)AceObjectURLForProperty(self, @"bookingId");
}

- (void)setBookingId:(id)a3
{
}

- (SAUIAppPunchOut)makeReservationPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"makeReservationPunchOut");
}

- (void)setMakeReservationPunchOut:(id)a3
{
}

- (NSNumber)partySize
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"partySize"];
}

- (void)setPartySize:(id)a3
{
}

- (SACalendar)timeSlot
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, @"timeSlot");
}

- (void)setTimeSlot:(id)a3
{
}

@end