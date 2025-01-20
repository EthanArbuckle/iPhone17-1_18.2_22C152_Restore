@interface RideBookingAccessProxy
+ (id)coordinator;
+ (id)imageCache;
+ (id)rideBookingCurrentBookedSessionForAppIdentifier:(id)a3 rideIdentifier:(id)a4;
+ (id)rideBookingCurrentRideBookingSessionCreateIfNecessary:(BOOL)a3;
@end

@implementation RideBookingAccessProxy

+ (id)coordinator
{
  if (sub_10008034C())
  {
    id v3 = a1;
    objc_sync_enter(v3);
    v4 = (void *)qword_10160FBC8;
    if (!qword_10160FBC8)
    {
      v5 = objc_alloc_init(RideBookingDataCoordinator);
      v6 = (void *)qword_10160FBC8;
      qword_10160FBC8 = (uint64_t)v5;

      v4 = (void *)qword_10160FBC8;
    }
    id v7 = v4;
    objc_sync_exit(v3);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)imageCache
{
  if (sub_10008034C())
  {
    id v3 = a1;
    objc_sync_enter(v3);
    v4 = (void *)qword_10160FBD0;
    if (!qword_10160FBD0)
    {
      uint64_t v5 = +[RideBookingImageCache sharedCache];
      v6 = (void *)qword_10160FBD0;
      qword_10160FBD0 = v5;

      v4 = (void *)qword_10160FBD0;
    }
    id v7 = v4;
    objc_sync_exit(v3);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)rideBookingCurrentRideBookingSessionCreateIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_10008034C())
  {
    id v5 = a1;
    objc_sync_enter(v5);
    unsigned int v6 = [(id)qword_10160FBD8 sessionEnded];
    id v7 = (void *)qword_10160FBD8;
    if (!qword_10160FBD8 || (v6 & v3) != 0)
    {
      v8 = objc_alloc_init(RidesharingAnalyticsBookingSession);
      v9 = (void *)qword_10160FBD8;
      qword_10160FBD8 = (uint64_t)v8;

      id v7 = (void *)qword_10160FBD8;
    }
    id v10 = v7;
    objc_sync_exit(v5);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)rideBookingCurrentBookedSessionForAppIdentifier:(id)a3 rideIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_10008034C())
  {
    id v8 = a1;
    objc_sync_enter(v8);
    if (!qword_10160FBE0)
    {
      uint64_t v9 = objc_opt_new();
      id v10 = (void *)qword_10160FBE0;
      qword_10160FBE0 = v9;
    }
    v11 = 0;
    if (v6 && v7)
    {
      v12 = [v6 stringByAppendingString:v7];
      v13 = [(id)qword_10160FBE0 objectForKey:v12];
      v14 = v13;
      if (v13 && ![(RidesharingAnalyticsBookedSession *)v13 sessionEnded])
      {
        v11 = v14;
      }
      else
      {
        v11 = objc_alloc_init(RidesharingAnalyticsBookedSession);

        id v15 = [v6 copy];
        [(RidesharingAnalyticsBookedSession *)v11 setAppIdentifier:v15];

        v16 = [v7 sha1Hash];
        [(RidesharingAnalyticsBookedSession *)v11 setSessionId:v16];

        [(id)qword_10160FBE0 setObject:v11 forKey:v12];
      }
    }
    objc_sync_exit(v8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end