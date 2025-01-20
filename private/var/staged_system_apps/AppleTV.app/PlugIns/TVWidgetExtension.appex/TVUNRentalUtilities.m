@interface TVUNRentalUtilities
+ (id)fetchRentals;
+ (id)validRentalWithIdentifier:(unint64_t)a3 inRentals:(id)a4;
@end

@implementation TVUNRentalUtilities

+ (id)fetchRentals
{
  v2 = sub_1000054E4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "TVUNRentalUtilities - Begin fetchRentals", (uint8_t *)&v17, 2u);
  }

  v3 = +[NSDate date];
  if (qword_10012FF60 != -1) {
    dispatch_once(&qword_10012FF60, &stru_10011FB98);
  }
  v4 = +[MPMediaQuery movieRentalsQuery];
  +[NSDate timeIntervalSinceReferenceDate];
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v6 = MPMediaItemPropertyRentalExpirationDate;
  v7 = +[MPMediaPropertyPredicate predicateWithValue:v5 forProperty:MPMediaItemPropertyRentalExpirationDate comparisonType:101];

  v8 = +[MPMediaPropertyPredicate predicateWithValue:&off_100124D30 forProperty:v6 comparisonType:0];
  v21[0] = v7;
  v21[1] = v8;
  v9 = +[NSArray arrayWithObjects:v21 count:2];
  v10 = +[MPMediaCompoundAnyPredicate predicateMatchingPredicates:v9];

  [v4 addFilterPredicate:v10];
  v11 = [v4 items];
  v12 = sub_1000054E4();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 count]);
    v14 = +[NSDate date];
    [v14 timeIntervalSinceDate:v3];
    int v17 = 138412546;
    v18 = v13;
    __int16 v19 = 2048;
    uint64_t v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "TVUNRentalUtilities- End fetchRentals [%@] elapsed:%.5f", (uint8_t *)&v17, 0x16u);
  }

  return v11;
}

+ (id)validRentalWithIdentifier:(unint64_t)a3 inRentals:(id)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = a4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    uint64_t v9 = MPMediaItemPropertyStoreID;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      v12 = [v11 valueForProperty:v9];
      id v13 = [v12 longLongValue];

      if (v13 == (id)a3) {
        break;
      }
      if (v7 == (id)++v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
    v14 = sub_1000054E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "TVUNRentalUtilities- Found rental: %llu", buf, 0xCu);
    }

    if ((objc_msgSend(v11, "tvun_isExpired") & 1) == 0)
    {
      id v16 = v11;
      goto LABEL_18;
    }
    uint64_t v15 = sub_1000054E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TVUNRentalUtilities -Skipping expired rental: %llu", buf, 0xCu);
    }
  }
LABEL_16:
  id v16 = 0;
LABEL_18:

  return v16;
}

@end