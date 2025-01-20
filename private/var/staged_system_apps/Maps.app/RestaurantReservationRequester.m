@interface RestaurantReservationRequester
- (BOOL)availableBookingsRequestPending;
- (BOOL)bookReservationRequestPending;
- (BOOL)guestRequestPending;
- (BOOL)reservationDefaultsRequestPending;
- (BOOL)userCurrentBookingRequestPending;
- (INBookRestaurantReservationIntentResponse)bookReservationResponse;
- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)reservationDefaultsResponse;
- (INGetAvailableRestaurantReservationBookingsIntent)availableBookingsRequest;
- (INGetAvailableRestaurantReservationBookingsIntentResponse)availableBookingsResponse;
- (INGetRestaurantGuestIntentResponse)guestResponse;
- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)userCurrentBookingResponse;
- (MKMapItem)mapItem;
- (NSError)availableBookingsRequestError;
- (NSError)bookReservationRequestError;
- (NSError)guestRequestError;
- (NSError)reservationDefaultsRequestError;
- (NSError)userCurrentBookingRequestError;
- (NSString)uniqueName;
- (NSUserActivity)availableBookingsUserActivity;
- (NSUserActivity)bookReservationUserActivity;
- (NSUserActivity)guestUserActivity;
- (NSUserActivity)reservationDefaultsUserActivity;
- (NSUserActivity)userCurrentBookingUserActivity;
- (RestaurantReservationRequester)initWithExtension:(id)a3 mapItem:(id)a4 delegate:(id)a5;
- (RestaurantReservationRequesterDelegate)delegate;
- (_MXExtension)extension;
- (id)extensionDoesNotSupportIntentError;
- (int64_t)currentAvailableBookingNumber;
- (int64_t)currentBookReservationNumber;
- (int64_t)currentGuestRequestNumber;
- (int64_t)currentReservationDefaultsNumber;
- (int64_t)currentUserBookingNumber;
- (void)bookRestaurantReservation:(id)a3 guest:(id)a4 selectedOffer:(id)a5 specialRequest:(id)a6;
- (void)requestAvailableBookingsForPreferredTime:(id)a3 partySize:(unint64_t)a4;
- (void)requestGuest;
- (void)requestReservationDefaults;
- (void)requestUserCurrentBookingWithRelevanceWindow:(double)a3;
- (void)requestUserCurrentBookingWithRelevanceWindow:(double)a3 reservationIdentifier:(id)a4;
- (void)requestUserCurrentBookingWithReservationIdentifier:(id)a3;
- (void)resetAvailableBookingsState;
- (void)resetBookRestaurantReservationState;
- (void)resetGuestState;
- (void)resetReservationDefaultsState;
- (void)resetUserCurrentBookingState;
- (void)setAvailableBookingsRequest:(id)a3;
- (void)setAvailableBookingsRequestError:(id)a3;
- (void)setAvailableBookingsRequestPending:(BOOL)a3;
- (void)setAvailableBookingsResponse:(id)a3;
- (void)setAvailableBookingsUserActivity:(id)a3;
- (void)setBookReservationRequestError:(id)a3;
- (void)setBookReservationRequestPending:(BOOL)a3;
- (void)setBookReservationResponse:(id)a3;
- (void)setBookReservationUserActivity:(id)a3;
- (void)setCurrentAvailableBookingNumber:(int64_t)a3;
- (void)setCurrentBookReservationNumber:(int64_t)a3;
- (void)setCurrentGuestRequestNumber:(int64_t)a3;
- (void)setCurrentReservationDefaultsNumber:(int64_t)a3;
- (void)setCurrentUserBookingNumber:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setGuestRequestError:(id)a3;
- (void)setGuestRequestPending:(BOOL)a3;
- (void)setGuestResponse:(id)a3;
- (void)setGuestUserActivity:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setReservationDefaultsRequestError:(id)a3;
- (void)setReservationDefaultsRequestPending:(BOOL)a3;
- (void)setReservationDefaultsResponse:(id)a3;
- (void)setReservationDefaultsUserActivity:(id)a3;
- (void)setUserCurrentBookingRequestError:(id)a3;
- (void)setUserCurrentBookingRequestPending:(BOOL)a3;
- (void)setUserCurrentBookingResponse:(id)a3;
- (void)setUserCurrentBookingUserActivity:(id)a3;
@end

@implementation RestaurantReservationRequester

- (RestaurantReservationRequester)initWithExtension:(id)a3 mapItem:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RestaurantReservationRequester;
  v12 = [(RestaurantReservationRequester *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_extension, a3);
    objc_storeStrong((id *)&v13->_mapItem, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (void)requestGuest
{
  [(RestaurantReservationRequester *)self resetGuestState];
  id v3 = objc_alloc_init((Class)INGetRestaurantGuestIntent);
  v4 = [(RestaurantReservationRequester *)self extension];
  unsigned __int8 v5 = [v4 canSupportIntent:v3];

  if (v5)
  {
    v6 = [(RestaurantReservationRequester *)self currentGuestRequestNumber];
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = [(RestaurantReservationRequester *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      __int16 v19 = 2080;
      v20 = "requestGuest";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestGuest", "", buf, 2u);
    }

    id v10 = [(RestaurantReservationRequester *)self extension];
    uint64_t v11 = objc_opt_class();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100BE7E50;
    v14[3] = &unk_10131AE28;
    objc_copyWeak(v15, &location);
    v15[1] = v6;
    id v12 = [v10 handleIntent:v3 expectResponseClass:v11 withCompletion:v14];

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = [(RestaurantReservationRequester *)self extensionDoesNotSupportIntentError];
    [(RestaurantReservationRequester *)self setGuestRequestError:v13];

    [(RestaurantReservationRequester *)self setGuestRequestPending:0];
  }
}

- (void)resetGuestState
{
  [(RestaurantReservationRequester *)self setCurrentGuestRequestNumber:(char *)[(RestaurantReservationRequester *)self currentGuestRequestNumber] + 1];
  [(RestaurantReservationRequester *)self setGuestRequestPending:1];
  [(RestaurantReservationRequester *)self setGuestUserActivity:0];
  [(RestaurantReservationRequester *)self setGuestResponse:0];

  [(RestaurantReservationRequester *)self setGuestRequestError:0];
}

- (void)setGuestRequestPending:(BOOL)a3
{
  if (((!self->_guestRequestPending ^ a3) & 1) == 0)
  {
    self->_guestRequestPending = a3;
    if (!a3)
    {
      v4 = [(RestaurantReservationRequester *)self guestRequestError];

      unsigned __int8 v5 = [(RestaurantReservationRequester *)self delegate];
      if (v4)
      {
        char v6 = objc_opt_respondsToSelector();

        if ((v6 & 1) == 0) {
          return;
        }
        id v9 = [(RestaurantReservationRequester *)self delegate];
        v7 = [(RestaurantReservationRequester *)self guestRequestError];
        [v9 requester:self guestRequestDidFailWithError:v7];
      }
      else
      {
        uint64_t v8 = objc_opt_respondsToSelector();

        if ((v8 & 1) == 0) {
          return;
        }
        id v9 = [(RestaurantReservationRequester *)self delegate];
        [v9 requesterGuestRequestDidComplete:self];
      }
    }
  }
}

- (void)requestReservationDefaults
{
  [(RestaurantReservationRequester *)self resetReservationDefaultsState];
  id v3 = objc_alloc_init((Class)INGetAvailableRestaurantReservationBookingDefaultsIntent);
  v4 = [(RestaurantReservationRequester *)self mapItem];
  uint64_t v5 = [v4 _maps_intentsRestaurant];
  [v3 setRestaurant:v5];

  char v6 = [(RestaurantReservationRequester *)self extension];
  LOBYTE(v5) = [v6 canSupportIntent:v3];

  if (v5)
  {
    v7 = [(RestaurantReservationRequester *)self currentReservationDefaultsNumber];
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [(RestaurantReservationRequester *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      __int16 v19 = v9;
      __int16 v20 = 2080;
      v21 = "requestReservationDefaults";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestReservationDefaults", "", buf, 2u);
    }

    uint64_t v11 = [(RestaurantReservationRequester *)self extension];
    uint64_t v12 = objc_opt_class();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    id v15[2] = sub_100BE87DC;
    v15[3] = &unk_10131AE28;
    objc_copyWeak(v16, &location);
    v16[1] = v7;
    id v13 = [v11 handleIntent:v3 expectResponseClass:v12 withCompletion:v15];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = [(RestaurantReservationRequester *)self extensionDoesNotSupportIntentError];
    [(RestaurantReservationRequester *)self setReservationDefaultsRequestError:v14];

    [(RestaurantReservationRequester *)self setReservationDefaultsRequestPending:0];
  }
}

- (void)resetReservationDefaultsState
{
  [(RestaurantReservationRequester *)self setCurrentReservationDefaultsNumber:(char *)[(RestaurantReservationRequester *)self currentReservationDefaultsNumber]+ 1];
  [(RestaurantReservationRequester *)self setReservationDefaultsRequestPending:1];
  [(RestaurantReservationRequester *)self setReservationDefaultsUserActivity:0];
  [(RestaurantReservationRequester *)self setReservationDefaultsResponse:0];

  [(RestaurantReservationRequester *)self setReservationDefaultsRequestError:0];
}

- (void)setReservationDefaultsRequestPending:(BOOL)a3
{
  if (((!self->_reservationDefaultsRequestPending ^ a3) & 1) == 0)
  {
    self->_reservationDefaultsRequestPending = a3;
    if (!a3)
    {
      v4 = [(RestaurantReservationRequester *)self reservationDefaultsRequestError];

      uint64_t v5 = [(RestaurantReservationRequester *)self delegate];
      if (v4)
      {
        char v6 = objc_opt_respondsToSelector();

        if ((v6 & 1) == 0) {
          return;
        }
        id v9 = [(RestaurantReservationRequester *)self delegate];
        v7 = [(RestaurantReservationRequester *)self reservationDefaultsRequestError];
        [v9 requester:self reservationDefaultsRequestDidFailWithError:v7];
      }
      else
      {
        uint64_t v8 = objc_opt_respondsToSelector();

        if ((v8 & 1) == 0) {
          return;
        }
        id v9 = [(RestaurantReservationRequester *)self delegate];
        [v9 requesterReservationDefaultsRequestDidComplete:self];
      }
    }
  }
}

- (void)requestUserCurrentBookingWithRelevanceWindow:(double)a3
{
}

- (void)requestUserCurrentBookingWithReservationIdentifier:(id)a3
{
}

- (void)requestUserCurrentBookingWithRelevanceWindow:(double)a3 reservationIdentifier:(id)a4
{
  id v6 = a4;
  [(RestaurantReservationRequester *)self resetUserCurrentBookingState];
  id v7 = objc_alloc_init((Class)INGetUserCurrentRestaurantReservationBookingsIntent);
  uint64_t v8 = [(RestaurantReservationRequester *)self mapItem];
  uint64_t v9 = [v8 _maps_intentsRestaurant];
  [v7 setRestaurant:v9];

  [v7 setMaximumNumberOfResults:&off_1013AA9D8];
  id v10 = +[NSDate dateWithTimeIntervalSinceNow:-a3];
  [v7 setEarliestBookingDateForResults:v10];

  [v7 setReservationIdentifier:v6];
  uint64_t v11 = [(RestaurantReservationRequester *)self extension];
  LOBYTE(v9) = [v11 canSupportIntent:v7];

  if (v9)
  {
    uint64_t v12 = [(RestaurantReservationRequester *)self currentUserBookingNumber];
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = [(RestaurantReservationRequester *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v24 = v14;
      __int16 v25 = 2080;
      v26 = "requestUserCurrentBooking";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    objc_super v15 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestUserCurrentBooking", "", buf, 2u);
    }

    v16 = [(RestaurantReservationRequester *)self extension];
    uint64_t v17 = objc_opt_class();
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100BE91E0;
    v20[3] = &unk_10131AE28;
    objc_copyWeak(v21, &location);
    v21[1] = v12;
    id v18 = [v16 handleIntent:v7 expectResponseClass:v17 withCompletion:v20];

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v19 = [(RestaurantReservationRequester *)self extensionDoesNotSupportIntentError];
    [(RestaurantReservationRequester *)self setUserCurrentBookingRequestError:v19];

    [(RestaurantReservationRequester *)self setUserCurrentBookingRequestPending:0];
  }
}

- (void)resetUserCurrentBookingState
{
  [(RestaurantReservationRequester *)self setCurrentUserBookingNumber:(char *)[(RestaurantReservationRequester *)self currentUserBookingNumber] + 1];
  [(RestaurantReservationRequester *)self setUserCurrentBookingRequestPending:1];
  [(RestaurantReservationRequester *)self setUserCurrentBookingUserActivity:0];
  [(RestaurantReservationRequester *)self setUserCurrentBookingResponse:0];

  [(RestaurantReservationRequester *)self setUserCurrentBookingRequestError:0];
}

- (void)setUserCurrentBookingRequestPending:(BOOL)a3
{
  if (((!self->_userCurrentBookingRequestPending ^ a3) & 1) == 0)
  {
    self->_userCurrentBookingRequestPending = a3;
    if (!a3)
    {
      v4 = [(RestaurantReservationRequester *)self userCurrentBookingRequestError];

      uint64_t v5 = [(RestaurantReservationRequester *)self delegate];
      if (v4)
      {
        char v6 = objc_opt_respondsToSelector();

        if ((v6 & 1) == 0) {
          return;
        }
        id v9 = [(RestaurantReservationRequester *)self delegate];
        id v7 = [(RestaurantReservationRequester *)self userCurrentBookingRequestError];
        [v9 requester:self userCurrentBookingRequestDidFailWithError:v7];
      }
      else
      {
        uint64_t v8 = objc_opt_respondsToSelector();

        if ((v8 & 1) == 0) {
          return;
        }
        id v9 = [(RestaurantReservationRequester *)self delegate];
        [v9 requesterUserCurrentBookingRequestDidComplete:self];
      }
    }
  }
}

- (void)requestAvailableBookingsForPreferredTime:(id)a3 partySize:(unint64_t)a4
{
  id v6 = a3;
  [(RestaurantReservationRequester *)self resetAvailableBookingsState];
  id v7 = +[NSCalendar currentCalendar];
  id v8 = objc_alloc_init((Class)INGetAvailableRestaurantReservationBookingsIntent);
  id v9 = [(RestaurantReservationRequester *)self mapItem];
  id v10 = [v9 _maps_intentsRestaurant];
  [v8 setRestaurant:v10];

  [v8 setPartySize:a4];
  [v8 setPreferredBookingDate:v6];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [(RestaurantReservationRequester *)self mapItem];
    uint64_t v12 = [v11 timeZone];
    id v13 = v12;
    if (!v12)
    {
      id v13 = +[NSTimeZone defaultTimeZone];
    }
    v14 = [v7 componentsInTimeZone:v13 fromDate:v6];
    [v8 setPreferredBookingDateComponents:v14];

    if (!v12) {
  }
    }
  [v8 setMaximumNumberOfResults:&off_1013AA9F0];
  objc_super v15 = +[NSDate date];
  [v8 setEarliestBookingDateForResults:v15];

  v16 = [(RestaurantReservationRequester *)self mapItem];
  uint64_t v17 = [v16 timeZone];
  id v18 = [v6 _maps_nextDayAtHour:0 timeZone:v17];
  [v8 setLatestBookingDateForResults:v18];

  __int16 v19 = [(RestaurantReservationRequester *)self extension];
  LOBYTE(v17) = [v19 canSupportIntent:v8];

  if (v17)
  {
    [(RestaurantReservationRequester *)self setAvailableBookingsRequest:v8];
    __int16 v20 = [(RestaurantReservationRequester *)self currentAvailableBookingNumber];
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = [(RestaurantReservationRequester *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v33 = v22;
      __int16 v34 = 2080;
      v35 = "requestAvailableBookings";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    v23 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestAvailableBookings", "", buf, 2u);
    }

    v24 = [(RestaurantReservationRequester *)self extension];
    uint64_t v25 = objc_opt_class();
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100BE9CE8;
    v28[3] = &unk_10131AE50;
    objc_copyWeak(v30, &location);
    id v29 = v8;
    v30[1] = v20;
    id v26 = [v24 handleIntent:v29 expectResponseClass:v25 withCompletion:v28];

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);
  }
  else
  {
    v27 = [(RestaurantReservationRequester *)self extensionDoesNotSupportIntentError];
    [(RestaurantReservationRequester *)self setAvailableBookingsRequestError:v27];

    [(RestaurantReservationRequester *)self setAvailableBookingsRequestPending:0];
  }
}

- (void)resetAvailableBookingsState
{
  [(RestaurantReservationRequester *)self setCurrentAvailableBookingNumber:(char *)[(RestaurantReservationRequester *)self currentAvailableBookingNumber] + 1];
  [(RestaurantReservationRequester *)self setAvailableBookingsRequestPending:1];
  [(RestaurantReservationRequester *)self setAvailableBookingsUserActivity:0];
  [(RestaurantReservationRequester *)self setAvailableBookingsResponse:0];
  [(RestaurantReservationRequester *)self setAvailableBookingsRequestError:0];

  [(RestaurantReservationRequester *)self setAvailableBookingsRequest:0];
}

- (void)setAvailableBookingsRequestPending:(BOOL)a3
{
  if (((!self->_availableBookingsRequestPending ^ a3) & 1) == 0)
  {
    self->_availableBookingsRequestPending = a3;
    if (!a3)
    {
      v4 = [(RestaurantReservationRequester *)self availableBookingsRequestError];

      uint64_t v5 = [(RestaurantReservationRequester *)self delegate];
      if (v4)
      {
        char v6 = objc_opt_respondsToSelector();

        if ((v6 & 1) == 0) {
          return;
        }
        id v9 = [(RestaurantReservationRequester *)self delegate];
        id v7 = [(RestaurantReservationRequester *)self availableBookingsRequestError];
        [v9 requester:self availableBookingsRequestDidFailWithError:v7];
      }
      else
      {
        uint64_t v8 = objc_opt_respondsToSelector();

        if ((v8 & 1) == 0) {
          return;
        }
        id v9 = [(RestaurantReservationRequester *)self delegate];
        [v9 requesterAvailableBookingsRequestDidComplete:self];
      }
    }
  }
}

- (void)bookRestaurantReservation:(id)a3 guest:(id)a4 selectedOffer:(id)a5 specialRequest:(id)a6
{
  id v10 = a3;
  id v34 = a4;
  id v35 = a5;
  id v11 = a6;
  [(RestaurantReservationRequester *)self resetBookRestaurantReservationState];
  v32 = +[NSCalendar currentCalendar];
  id v12 = objc_alloc_init((Class)INBookRestaurantReservationIntent);
  id v13 = [(RestaurantReservationRequester *)self mapItem];
  v14 = [v13 _maps_intentsRestaurant];
  [v12 setRestaurant:v14];

  [v12 setPartySize:[v10 partySize]];
  objc_super v15 = [v10 bookingDate];
  [v12 setBookingDate:v15];

  if (objc_opt_respondsToSelector())
  {
    v16 = [(RestaurantReservationRequester *)self mapItem];
    uint64_t v17 = [v16 timeZone];
    id v18 = v17;
    if (!v17)
    {
      id v18 = +[NSTimeZone defaultTimeZone];
    }
    __int16 v19 = [v10 bookingDate];
    __int16 v20 = [v32 componentsInTimeZone:v18 fromDate:v19];
    [v12 setBookingDateComponents:v20];

    if (!v17) {
  }
    }
  v21 = [v10 bookingIdentifier:v32];
  [v12 setBookingIdentifier:v21];

  [v12 setGuest:v34];
  [v12 setSelectedOffer:v35];
  [v12 setGuestProvidedSpecialRequestText:v11];
  v22 = [(RestaurantReservationRequester *)self extension];
  unsigned __int8 v23 = [v22 canSupportIntent:v12];

  if ((v23 & 1) == 0)
  {
    v24 = [(RestaurantReservationRequester *)self extensionDoesNotSupportIntentError];
    [(RestaurantReservationRequester *)self setBookReservationRequestError:v24];

    [(RestaurantReservationRequester *)self setBookReservationRequestPending:0];
  }
  uint64_t v25 = [(RestaurantReservationRequester *)self currentBookReservationNumber];
  objc_initWeak(&location, self);
  GEOFindOrCreateLog();
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v27 = [(RestaurantReservationRequester *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v40 = v27;
    __int16 v41 = 2080;
    v42 = "bookRestaurantReservation";
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v28 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "bookRestaurantReservation", "", buf, 2u);
  }

  id v29 = [(RestaurantReservationRequester *)self extension];
  uint64_t v30 = objc_opt_class();
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100BEA838;
  v36[3] = &unk_10131AE28;
  objc_copyWeak(v37, &location);
  v37[1] = v25;
  id v31 = [v29 handleIntent:v12 expectResponseClass:v30 withCompletion:v36];

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
}

- (void)resetBookRestaurantReservationState
{
  [(RestaurantReservationRequester *)self setCurrentBookReservationNumber:(char *)[(RestaurantReservationRequester *)self currentBookReservationNumber] + 1];
  [(RestaurantReservationRequester *)self setBookReservationRequestPending:1];
  [(RestaurantReservationRequester *)self setBookReservationUserActivity:0];
  [(RestaurantReservationRequester *)self setBookReservationResponse:0];

  [(RestaurantReservationRequester *)self setBookReservationRequestError:0];
}

- (void)setBookReservationRequestPending:(BOOL)a3
{
  if (((!self->_bookReservationRequestPending ^ a3) & 1) == 0)
  {
    self->_bookReservationRequestPending = a3;
    if (!a3)
    {
      v4 = [(RestaurantReservationRequester *)self bookReservationRequestError];

      uint64_t v5 = [(RestaurantReservationRequester *)self delegate];
      if (v4)
      {
        char v6 = objc_opt_respondsToSelector();

        if ((v6 & 1) == 0) {
          return;
        }
        id v9 = [(RestaurantReservationRequester *)self delegate];
        id v7 = [(RestaurantReservationRequester *)self bookReservationRequestError];
        [v9 requester:self bookRestaurantReservationRequestDidFailWithError:v7];
      }
      else
      {
        uint64_t v8 = objc_opt_respondsToSelector();

        if ((v8 & 1) == 0) {
          return;
        }
        id v9 = [(RestaurantReservationRequester *)self delegate];
        [v9 requesterBookRestaurantReservationRequestDidComplete:self];
      }
    }
  }
}

- (id)extensionDoesNotSupportIntentError
{
  return +[NSError errorWithDomain:_MXExtensionServiceErrorDomain code:8 userInfo:0];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (RestaurantReservationRequesterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RestaurantReservationRequesterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_MXExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (BOOL)guestRequestPending
{
  return self->_guestRequestPending;
}

- (BOOL)reservationDefaultsRequestPending
{
  return self->_reservationDefaultsRequestPending;
}

- (BOOL)userCurrentBookingRequestPending
{
  return self->_userCurrentBookingRequestPending;
}

- (BOOL)availableBookingsRequestPending
{
  return self->_availableBookingsRequestPending;
}

- (BOOL)bookReservationRequestPending
{
  return self->_bookReservationRequestPending;
}

- (INGetAvailableRestaurantReservationBookingsIntent)availableBookingsRequest
{
  return self->_availableBookingsRequest;
}

- (void)setAvailableBookingsRequest:(id)a3
{
}

- (INGetRestaurantGuestIntentResponse)guestResponse
{
  return self->_guestResponse;
}

- (void)setGuestResponse:(id)a3
{
}

- (NSUserActivity)guestUserActivity
{
  return self->_guestUserActivity;
}

- (void)setGuestUserActivity:(id)a3
{
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)reservationDefaultsResponse
{
  return self->_reservationDefaultsResponse;
}

- (void)setReservationDefaultsResponse:(id)a3
{
}

- (NSUserActivity)reservationDefaultsUserActivity
{
  return self->_reservationDefaultsUserActivity;
}

- (void)setReservationDefaultsUserActivity:(id)a3
{
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)userCurrentBookingResponse
{
  return self->_userCurrentBookingResponse;
}

- (void)setUserCurrentBookingResponse:(id)a3
{
}

- (NSUserActivity)userCurrentBookingUserActivity
{
  return self->_userCurrentBookingUserActivity;
}

- (void)setUserCurrentBookingUserActivity:(id)a3
{
}

- (INGetAvailableRestaurantReservationBookingsIntentResponse)availableBookingsResponse
{
  return self->_availableBookingsResponse;
}

- (void)setAvailableBookingsResponse:(id)a3
{
}

- (NSUserActivity)availableBookingsUserActivity
{
  return self->_availableBookingsUserActivity;
}

- (void)setAvailableBookingsUserActivity:(id)a3
{
}

- (INBookRestaurantReservationIntentResponse)bookReservationResponse
{
  return self->_bookReservationResponse;
}

- (void)setBookReservationResponse:(id)a3
{
}

- (NSUserActivity)bookReservationUserActivity
{
  return self->_bookReservationUserActivity;
}

- (void)setBookReservationUserActivity:(id)a3
{
}

- (int64_t)currentGuestRequestNumber
{
  return self->_currentGuestRequestNumber;
}

- (void)setCurrentGuestRequestNumber:(int64_t)a3
{
  self->_currentGuestRequestNumber = a3;
}

- (NSError)guestRequestError
{
  return self->_guestRequestError;
}

- (void)setGuestRequestError:(id)a3
{
}

- (int64_t)currentReservationDefaultsNumber
{
  return self->_currentReservationDefaultsNumber;
}

- (void)setCurrentReservationDefaultsNumber:(int64_t)a3
{
  self->_currentReservationDefaultsNumber = a3;
}

- (NSError)reservationDefaultsRequestError
{
  return self->_reservationDefaultsRequestError;
}

- (void)setReservationDefaultsRequestError:(id)a3
{
}

- (int64_t)currentUserBookingNumber
{
  return self->_currentUserBookingNumber;
}

- (void)setCurrentUserBookingNumber:(int64_t)a3
{
  self->_currentUserBookingNumber = a3;
}

- (NSError)userCurrentBookingRequestError
{
  return self->_userCurrentBookingRequestError;
}

- (void)setUserCurrentBookingRequestError:(id)a3
{
}

- (int64_t)currentAvailableBookingNumber
{
  return self->_currentAvailableBookingNumber;
}

- (void)setCurrentAvailableBookingNumber:(int64_t)a3
{
  self->_currentAvailableBookingNumber = a3;
}

- (NSError)availableBookingsRequestError
{
  return self->_availableBookingsRequestError;
}

- (void)setAvailableBookingsRequestError:(id)a3
{
}

- (int64_t)currentBookReservationNumber
{
  return self->_currentBookReservationNumber;
}

- (void)setCurrentBookReservationNumber:(int64_t)a3
{
  self->_currentBookReservationNumber = a3;
}

- (NSError)bookReservationRequestError
{
  return self->_bookReservationRequestError;
}

- (void)setBookReservationRequestError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookReservationRequestError, 0);
  objc_storeStrong((id *)&self->_availableBookingsRequestError, 0);
  objc_storeStrong((id *)&self->_userCurrentBookingRequestError, 0);
  objc_storeStrong((id *)&self->_reservationDefaultsRequestError, 0);
  objc_storeStrong((id *)&self->_guestRequestError, 0);
  objc_storeStrong((id *)&self->_bookReservationUserActivity, 0);
  objc_storeStrong((id *)&self->_bookReservationResponse, 0);
  objc_storeStrong((id *)&self->_availableBookingsUserActivity, 0);
  objc_storeStrong((id *)&self->_availableBookingsResponse, 0);
  objc_storeStrong((id *)&self->_userCurrentBookingUserActivity, 0);
  objc_storeStrong((id *)&self->_userCurrentBookingResponse, 0);
  objc_storeStrong((id *)&self->_reservationDefaultsUserActivity, 0);
  objc_storeStrong((id *)&self->_reservationDefaultsResponse, 0);
  objc_storeStrong((id *)&self->_guestUserActivity, 0);
  objc_storeStrong((id *)&self->_guestResponse, 0);
  objc_storeStrong((id *)&self->_availableBookingsRequest, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end