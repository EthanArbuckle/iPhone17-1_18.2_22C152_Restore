@interface PKPass
- (NSDate)anyDate;
- (NSNumber)arrivalAirportLat;
- (NSNumber)arrivalAirportLong;
- (NSNumber)departureAirportLat;
- (NSNumber)departureAirportLong;
- (NSString)boardingPassFirstName;
- (NSString)boardingPassLastName;
- (id)evaluateWithAttribute:(id)a3 expression:(id)a4;
@end

@implementation PKPass

- (NSNumber)arrivalAirportLat
{
  v2 = self;
  v3 = (void *)PKPass.arrivalAirportLat.getter();

  return (NSNumber *)v3;
}

- (NSNumber)arrivalAirportLong
{
  v2 = self;
  v3 = (void *)PKPass.arrivalAirportLong.getter();

  return (NSNumber *)v3;
}

- (NSNumber)departureAirportLat
{
  v2 = self;
  v3 = (void *)PKPass.departureAirportLat.getter();

  return (NSNumber *)v3;
}

- (NSNumber)departureAirportLong
{
  v2 = self;
  v3 = (void *)PKPass.departureAirportLong.getter();

  return (NSNumber *)v3;
}

- (NSDate)anyDate
{
  v2 = self;
  Class v3 = PKPass.anyDate.getter();

  return (NSDate *)v3;
}

- (NSString)boardingPassFirstName
{
  v2 = self;
  id v3 = PKPass.boardingPassFirstName.getter();

  return (NSString *)v3;
}

- (NSString)boardingPassLastName
{
  v2 = self;
  id v3 = PKPass.boardingPassLastName.getter();

  return (NSString *)v3;
}

- (id)evaluateWithAttribute:(id)a3 expression:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  PKPass.evaluate(attribute:expression:)(v7, (uint64_t)v16);

  uint64_t v9 = v17;
  if (v17)
  {
    v10 = sub_10002EAE0(v16, v17);
    uint64_t v11 = *(void *)(v9 - 8);
    __chkstk_darwin(v10);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    sub_10002EB9C((uint64_t)v16);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end