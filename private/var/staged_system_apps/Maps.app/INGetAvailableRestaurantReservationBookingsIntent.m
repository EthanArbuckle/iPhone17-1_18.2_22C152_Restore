@interface INGetAvailableRestaurantReservationBookingsIntent
- (BOOL)_bookingIsValid:(id)a3;
- (BOOL)_maps_responseIsValid:(id)a3;
- (id)_maps_preferredBookingDateWithTimeZone:(id)a3;
- (id)_maps_sanitizedResponseForResponse:(id)a3;
@end

@implementation INGetAvailableRestaurantReservationBookingsIntent

- (id)_maps_preferredBookingDateWithTimeZone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INGetAvailableRestaurantReservationBookingsIntent *)self preferredBookingDateComponents];
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = +[NSCalendar currentCalendar];
    id v9 = [v8 copy];

    [v9 setTimeZone:v4];
    v7 = [v9 dateFromComponents:v6];
  }

  return v7;
}

- (id)_maps_sanitizedResponseForResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 availableBookings];
  v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v7 = [v4 availableBookings];
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if ([(INGetAvailableRestaurantReservationBookingsIntent *)self _bookingIsValid:v12]) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(INGetAvailableRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
  if (v13)
  {
    v14 = (void *)v13;
    id v15 = [v6 count];
    v16 = [(INGetAvailableRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
    id v17 = [v16 unsignedIntegerValue];

    if (v15 > v17)
    {
      v18 = [(INGetAvailableRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
      id v19 = [v18 unsignedIntegerValue];
      v20 = [v6 count];
      v21 = [(INGetAvailableRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
      [v6 removeObjectsInRange:v19, v20 - [v21 unsignedIntegerValue]];
    }
  }
  id v22 = objc_alloc((Class)INGetAvailableRestaurantReservationBookingsIntentResponse);
  id v23 = [v4 code];
  v24 = [v4 userActivity];
  id v25 = [v22 initWithAvailableBookings:v6 code:v23 userActivity:v24];

  v26 = [v4 localizedRestaurantDescriptionText];
  [v25 setLocalizedRestaurantDescriptionText:v26];

  v27 = [v4 localizedBookingAdvisementText];
  [v25 setLocalizedBookingAdvisementText:v27];

  v28 = [v4 termsAndConditions];
  [v25 setTermsAndConditions:v28];

  if ([(INGetAvailableRestaurantReservationBookingsIntent *)self _maps_responseIsValid:v25]) {
    id v29 = v25;
  }
  else {
    id v29 = 0;
  }

  return v29;
}

- (BOOL)_maps_responseIsValid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INGetAvailableRestaurantReservationBookingsIntent *)self maximumNumberOfResults];

  if (!v5) {
    goto LABEL_4;
  }
  v6 = [v4 availableBookings];
  id v7 = [v6 count];
  id v8 = [(INGetAvailableRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
  id v9 = [v8 unsignedIntegerValue];

  if (v7 > v9)
  {
    char v10 = 0;
  }
  else
  {
LABEL_4:
    uint64_t v11 = +[NSDate distantFuture];
    uint64_t v12 = +[NSDate distantPast];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v38 = v4;
    uint64_t v13 = [v4 availableBookings];
    id v14 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v40;
      while (2)
      {
        id v17 = 0;
        v18 = (void *)v11;
        id v19 = (void *)v12;
        do
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v13);
          }
          v20 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v17);
          if (![(INGetAvailableRestaurantReservationBookingsIntent *)self _bookingIsValid:v20])
          {

            char v10 = 0;
            goto LABEL_16;
          }
          v21 = [v20 bookingDate];
          uint64_t v11 = [v18 earlierDate:v21];

          id v22 = [v20 bookingDate];
          uint64_t v12 = [v19 laterDate:v22];

          id v17 = (char *)v17 + 1;
          v18 = (void *)v11;
          id v19 = (void *)v12;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v23 = [(INGetAvailableRestaurantReservationBookingsIntent *)self earliestBookingDateForResults];

    if (v23
      && (-[INGetAvailableRestaurantReservationBookingsIntent earliestBookingDateForResults](self, "earliestBookingDateForResults"), v24 = objc_claimAutoreleasedReturnValue(), [v24 earlierDate:v11], id v25 = objc_claimAutoreleasedReturnValue(), v26 = objc_msgSend(v25, "isEqualToDate:", v11), v25, v24, (v26 & 1) != 0))
    {
      char v10 = 0;
      id v19 = (void *)v12;
      v18 = (void *)v11;
LABEL_16:
      id v4 = v38;
    }
    else
    {
      v27 = [(INGetAvailableRestaurantReservationBookingsIntent *)self latestBookingDateForResults];

      id v4 = v38;
      if (v27
        && (-[INGetAvailableRestaurantReservationBookingsIntent latestBookingDateForResults](self, "latestBookingDateForResults"), v28 = objc_claimAutoreleasedReturnValue(), [v28 laterDate:v12], id v29 = objc_claimAutoreleasedReturnValue(), v30 = objc_msgSend(v29, "isEqualToDate:", v12), v29, v28, (v30 & 1) != 0))
      {
        char v10 = 0;
      }
      else
      {
        uint64_t v31 = [(INGetAvailableRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
        if (v31)
        {
          long long v32 = (void *)v31;
          long long v33 = [v38 availableBookings];
          id v34 = [v33 count];
          v35 = [(INGetAvailableRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
          BOOL v36 = v34 > [v35 unsignedIntegerValue];

          char v10 = !v36;
        }
        else
        {
          char v10 = 1;
        }
      }
      id v19 = (void *)v12;
      v18 = (void *)v11;
    }
  }
  return v10 & 1;
}

- (BOOL)_bookingIsValid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 restaurant];
  v6 = [v5 restaurantIdentifier];
  id v7 = [(INGetAvailableRestaurantReservationBookingsIntent *)self restaurant];
  id v8 = [v7 restaurantIdentifier];
  unsigned int v9 = [v6 isEqualToString:v8];

  if (!v9) {
    goto LABEL_6;
  }
  id v10 = [v4 partySize];
  if (v10 != (id)[(INGetAvailableRestaurantReservationBookingsIntent *)self partySize]) {
    goto LABEL_6;
  }
  uint64_t v11 = [v4 bookingDate];
  uint64_t v12 = +[NSDate date];
  uint64_t v13 = [v11 earlierDate:v12];
  id v14 = [v4 bookingDate];
  unsigned __int8 v15 = [v13 isEqualToDate:v14];

  if (v15) {
    goto LABEL_6;
  }
  uint64_t v16 = [(INGetAvailableRestaurantReservationBookingsIntent *)self earliestBookingDateForResults];
  if (!v16) {
    goto LABEL_8;
  }
  id v17 = (void *)v16;
  v18 = [v4 bookingDate];
  id v19 = [(INGetAvailableRestaurantReservationBookingsIntent *)self earliestBookingDateForResults];
  v20 = [v18 earlierDate:v19];
  v21 = [v4 bookingDate];
  unsigned __int8 v22 = [v20 isEqualToDate:v21];

  if (v22)
  {
LABEL_6:
    char v23 = 0;
  }
  else
  {
LABEL_8:
    uint64_t v25 = [(INGetAvailableRestaurantReservationBookingsIntent *)self latestBookingDateForResults];
    if (v25)
    {
      unsigned __int8 v26 = (void *)v25;
      v27 = [v4 bookingDate];
      v28 = [(INGetAvailableRestaurantReservationBookingsIntent *)self latestBookingDateForResults];
      id v29 = [v27 laterDate:v28];
      unsigned __int8 v30 = [v4 bookingDate];
      unsigned __int8 v31 = [v29 isEqualToDate:v30];

      char v23 = v31 ^ 1;
    }
    else
    {
      char v23 = 1;
    }
  }

  return v23;
}

@end