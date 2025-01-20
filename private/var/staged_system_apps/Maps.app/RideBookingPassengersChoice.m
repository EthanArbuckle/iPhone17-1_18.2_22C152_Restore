@interface RideBookingPassengersChoice
- (INPriceRange)intentsPriceRange;
- (INRidePartySizeOption)intentsPartySizeOption;
- (NSString)formattedPriceRange;
- (NSString)title;
- (RideBookingPassengersChoice)initWithNumberOfPassengers:(unint64_t)a3;
- (id)description;
- (unint64_t)numberOfPassengers;
- (unint64_t)size;
- (void)setIntentsPartySizeOption:(id)a3;
- (void)setIntentsPriceRange:(id)a3;
- (void)setNumberOfPassengers:(unint64_t)a3;
@end

@implementation RideBookingPassengersChoice

- (NSString)formattedPriceRange
{
  v3 = [(RideBookingPassengersChoice *)self intentsPartySizeOption];
  v4 = [v3 priceRange];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(RideBookingPassengersChoice *)self intentsPriceRange];
  }
  v7 = v6;

  [v7 _maps_formattedStringWithDefaultShortFormatStrings];
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8) {
    v8 = &stru_101324E70;
  }
  v10 = v8;

  return v10;
}

- (unint64_t)size
{
  v3 = [(RideBookingPassengersChoice *)self intentsPartySizeOption];
  id v4 = [v3 partySizeRange];
  v5 = [(RideBookingPassengersChoice *)self intentsPartySizeOption];
  [v5 partySizeRange];
  unint64_t v7 = (unint64_t)v4 + v6;

  return v7;
}

- (NSString)title
{
  v2 = [(RideBookingPassengersChoice *)self intentsPartySizeOption];
  v3 = [v2 sizeDescription];

  return (NSString *)v3;
}

- (RideBookingPassengersChoice)initWithNumberOfPassengers:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RideBookingPassengersChoice;
  result = [(RideBookingPassengersChoice *)&v5 init];
  if (result) {
    result->_numberOfPassengers = a3;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"Number of Passengers: %lu", self->_numberOfPassengers];
}

- (unint64_t)numberOfPassengers
{
  return self->_numberOfPassengers;
}

- (void)setNumberOfPassengers:(unint64_t)a3
{
  self->_numberOfPassengers = a3;
}

- (INPriceRange)intentsPriceRange
{
  return (INPriceRange *)objc_getAssociatedObject(self, &unk_100F73768);
}

- (void)setIntentsPriceRange:(id)a3
{
  id value = a3;
  id v4 = [(RideBookingPassengersChoice *)self intentsPriceRange];
  if (([v4 isEqual:value] & 1) == 0) {
    objc_setAssociatedObject(self, &unk_100F73768, value, (void *)3);
  }
}

- (INRidePartySizeOption)intentsPartySizeOption
{
  return (INRidePartySizeOption *)objc_getAssociatedObject(self, &unk_100F73769);
}

- (void)setIntentsPartySizeOption:(id)a3
{
  id value = a3;
  id v4 = [(RideBookingPassengersChoice *)self intentsPartySizeOption];
  if (([v4 isEqual:value] & 1) == 0) {
    objc_setAssociatedObject(self, &unk_100F73769, value, (void *)3);
  }
}

@end