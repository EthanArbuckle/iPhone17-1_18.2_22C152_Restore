@interface SAMovieShowtime
+ (id)showtime;
- (BOOL)is3d;
- (BOOL)isImax;
- (NSNumber)childTicketQuantity;
- (NSNumber)regularTicketQuantity;
- (NSNumber)seniorTicketQuantity;
- (SACalendar)showtime;
- (SAUIAppPunchOut)buyTicketsPunchout;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBuyTicketsPunchout:(id)a3;
- (void)setChildTicketQuantity:(id)a3;
- (void)setIs3d:(BOOL)a3;
- (void)setIsImax:(BOOL)a3;
- (void)setRegularTicketQuantity:(id)a3;
- (void)setSeniorTicketQuantity:(id)a3;
- (void)setShowtime:(id)a3;
@end

@implementation SAMovieShowtime

- (id)groupIdentifier
{
  return @"com.apple.ace.movie";
}

- (id)encodedClassName
{
  return @"Showtime";
}

+ (id)showtime
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIAppPunchOut)buyTicketsPunchout
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"buyTicketsPunchout");
}

- (void)setBuyTicketsPunchout:(id)a3
{
}

- (NSNumber)childTicketQuantity
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"childTicketQuantity"];
}

- (void)setChildTicketQuantity:(id)a3
{
}

- (BOOL)is3d
{
  return AceObjectBoolForProperty(self, @"is3d");
}

- (void)setIs3d:(BOOL)a3
{
}

- (BOOL)isImax
{
  return AceObjectBoolForProperty(self, @"isImax");
}

- (void)setIsImax:(BOOL)a3
{
}

- (NSNumber)regularTicketQuantity
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"regularTicketQuantity"];
}

- (void)setRegularTicketQuantity:(id)a3
{
}

- (NSNumber)seniorTicketQuantity
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"seniorTicketQuantity"];
}

- (void)setSeniorTicketQuantity:(id)a3
{
}

- (SACalendar)showtime
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, @"showtime");
}

- (void)setShowtime:(id)a3
{
}

@end