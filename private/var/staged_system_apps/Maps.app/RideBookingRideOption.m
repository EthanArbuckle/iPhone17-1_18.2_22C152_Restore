@interface RideBookingRideOption
- (INRideOption)intentsRideOption;
- (NSArray)passengerChoices;
- (NSArray)paymentMethods;
- (NSNumber)etaMinutes;
- (NSString)detailedDescription;
- (NSString)name;
- (NSString)partySizeSelectionPrompt;
- (NSString)priceRange;
- (NSString)selectionCommandTitle;
- (NSUserActivity)userActivityForBookingInApplication;
- (RideBookingApplication)application;
- (RideBookingRideOption)initWithApplication:(id)a3 optionName:(id)a4 paymentMethods:(id)a5 estimatedPickupDate:(id)a6 passengersChoice:(id)a7;
- (RidesharingSpecialPricingBadge)specialPricingBadge;
- (UIImage)icon;
- (UIImage)iconImage;
- (id)description;
- (void)setEtaMinutes:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIntentsRideOption:(id)a3;
@end

@implementation RideBookingRideOption

- (INRideOption)intentsRideOption
{
  return (INRideOption *)objc_getAssociatedObject(self, &unk_100F71CC0);
}

- (void)setIntentsRideOption:(id)a3
{
  id value = a3;
  v4 = [(RideBookingRideOption *)self intentsRideOption];
  if (([v4 isEqual:value] & 1) == 0) {
    objc_setAssociatedObject(self, &unk_100F71CC0, value, (void *)3);
  }
}

- (RideBookingRideOption)initWithApplication:(id)a3 optionName:(id)a4 paymentMethods:(id)a5 estimatedPickupDate:(id)a6 passengersChoice:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)RideBookingRideOption;
  v17 = [(RideBookingRideOption *)&v24 init];
  if (v17)
  {
    v18 = (NSString *)[v13 copy];
    name = v17->_name;
    v17->_name = v18;

    objc_storeWeak((id *)&v17->_application, v12);
    if (v15)
    {
      [v15 timeIntervalSinceNow];
      uint64_t v21 = +[NSNumber numberWithUnsignedInteger:vcvtpd_u64_f64(v20 / 60.0)];
      etaMinutes = v17->_etaMinutes;
      v17->_etaMinutes = (NSNumber *)v21;
    }
    objc_storeStrong((id *)&v17->_paymentMethods, a5);
    objc_storeStrong((id *)&v17->_passengerChoices, a7);
  }

  return v17;
}

- (id)description
{
  name = self->_name;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);
  v5 = +[NSString stringWithFormat:@"Name: %@\nApplication: %@\nPayment Methods: %@\nPassenger Choices: %@\nETA: %@ Minutes", name, WeakRetained, self->_paymentMethods, self->_passengerChoices, self->_etaMinutes];

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)paymentMethods
{
  return self->_paymentMethods;
}

- (NSArray)passengerChoices
{
  return self->_passengerChoices;
}

- (RideBookingApplication)application
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);

  return (RideBookingApplication *)WeakRetained;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSNumber)etaMinutes
{
  return self->_etaMinutes;
}

- (void)setEtaMinutes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaMinutes, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_destroyWeak((id *)&self->_application);
  objc_storeStrong((id *)&self->_passengerChoices, 0);
  objc_storeStrong((id *)&self->_paymentMethods, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (UIImage)iconImage
{
  v3 = [(RideBookingRideOption *)self application];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(RideBookingRideOption *)self application];
    v6 = [v5 iconWithFormat:0];
  }
  else
  {
    v6 = 0;
  }

  return (UIImage *)v6;
}

- (NSString)selectionCommandTitle
{
  v2 = [(RideBookingRideOption *)self intentsRideOption];
  v3 = [v2 userActivityForBookingInApplication];

  v4 = +[NSBundle mainBundle];
  v5 = v4;
  if (v3) {
    CFStringRef v6 = @"Open [Ridesharing]";
  }
  else {
    CFStringRef v6 = @"Next [Ridesharing]";
  }
  v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

  return (NSString *)v7;
}

- (NSString)detailedDescription
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v2 = [(RideBookingRideOption *)self intentsRideOption];
  v3 = [v2 availablePartySizeOptions];

  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    CFStringRef v6 = 0;
    uint64_t v7 = *(void *)v22;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v8);
        v11 = (char *)[v9 unsignedIntegerValue];
        id v12 = (char *)[v10 partySizeRange];
        [v10 partySizeRange];
        if (v11 <= &v12[v13])
        {
          id v15 = (char *)[v10 partySizeRange];
          [v10 partySizeRange];
          id v14 = &v15[v16];
        }
        else
        {
          id v14 = (char *)[v9 unsignedIntegerValue];
        }
        CFStringRef v6 = +[NSNumber numberWithUnsignedInteger:v14];

        v8 = (char *)v8 + 1;
        v9 = v6;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    CFStringRef v6 = 0;
  }

  v17 = [(RideBookingRideOption *)self etaMinutes];
  v18 = +[NSString _maps_ridesharingETA:v17 partySize:v6];

  return (NSString *)v18;
}

- (NSString)priceRange
{
  v3 = [(RideBookingRideOption *)self intentsRideOption];
  id v4 = [v3 usesMeteredFare];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    CFStringRef v6 = +[NSBundle mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"Metered fare [Ridesharing]" value:@"localized string not found" table:0];
  }
  else
  {
    CFStringRef v6 = [(RideBookingRideOption *)self intentsRideOption];
    v8 = [v6 priceRange];
    uint64_t v9 = [v8 _maps_formattedStringWithDefaultShortFormatStrings];
    v10 = (void *)v9;
    v11 = &stru_101324E70;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    uint64_t v7 = v11;
  }

  return (NSString *)v7;
}

- (NSString)partySizeSelectionPrompt
{
  v2 = [(RideBookingRideOption *)self intentsRideOption];
  v3 = [v2 availablePartySizeOptionsSelectionPrompt];

  return (NSString *)v3;
}

- (RidesharingSpecialPricingBadge)specialPricingBadge
{
  v3 = +[RideBookingAccessProxy imageCache];
  id v4 = [(RideBookingRideOption *)self intentsRideOption];
  unsigned int v5 = [v4 specialPricingBadgeImage];
  CFStringRef v6 = [v5 _identifier];
  uint64_t v7 = [v3 imageForKey:v6];

  v8 = [[RidesharingSpecialPricingBadge alloc] initWithTemplateImage:v7];

  return v8;
}

- (NSUserActivity)userActivityForBookingInApplication
{
  v2 = [(RideBookingRideOption *)self intentsRideOption];
  v3 = [v2 userActivityForBookingInApplication];

  return (NSUserActivity *)v3;
}

@end