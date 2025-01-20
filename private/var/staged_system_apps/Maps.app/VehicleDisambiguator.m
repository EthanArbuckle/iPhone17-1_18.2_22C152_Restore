@interface VehicleDisambiguator
+ (BOOL)isAccessory:(id)a3 alreadyPairedWithVehicleInGarage:(id)a4;
+ (id)findPossibleMatchesForAccessory:(id)a3 inVehicles:(id)a4;
+ (void)pairAccessory:(id)a3 withVehicle:(id)a4;
@end

@implementation VehicleDisambiguator

+ (BOOL)isAccessory:(id)a3 alreadyPairedWithVehicleInGarage:(id)a4
{
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [a4 vehicles];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) iapIdentifier];
        v11 = [v5 identifier];
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

+ (id)findPossibleMatchesForAccessory:(id)a3 inVehicles:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 count])
  {
    v13 = sub_100576D94();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "There are no vehicles to pair the current accessory against.", buf, 2u);
    }
    id v12 = &__NSDictionary0__struct;
    goto LABEL_49;
  }
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_100C723A8;
  v81[3] = &unk_1012F1C18;
  id v7 = v5;
  v82 = v7;
  uint64_t v8 = sub_1000AC254(v6, v81);
  if (![v8 count])
  {
    v71 = v8;
    id v73 = v5;
    v76 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v72 = v6;
    id v14 = v6;
    id v15 = [v14 countByEnumeratingWithState:&v77 objects:v83 count:16];
    if (!v15) {
      goto LABEL_47;
    }
    id v16 = v15;
    uint64_t v17 = *(void *)v78;
    uint64_t v74 = *(void *)v78;
    id v75 = v14;
    while (1)
    {
      v18 = 0;
      do
      {
        if (*(void *)v78 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v77 + 1) + 8 * (void)v18);
        v20 = [v19 iapIdentifier];
        id v21 = [v20 length];

        if (!v21)
        {
          v22 = [v19 siriIntentsIdentifier];
          id v23 = [v22 length];

          if (v23)
          {
            v24 = [v19 headUnitIdentifier];
            v25 = [v7 identifier];
            if ([v24 isEqualToString:v25])
            {

LABEL_46:
              [v76 setObject:&off_1013AF7A8 forKeyedSubscript:v19];
              id v14 = v75;
              goto LABEL_47;
            }
            v26 = [v19 headUnitBluetoothIdentifier];
            v27 = [v7 bluetoothIdentifier];
            unsigned int v28 = [v26 isEqualToString:v27];

            if (v28) {
              goto LABEL_46;
            }
            uint64_t v29 = [v19 model];
            float v30 = 1.0;
            if (v29
              && (v31 = (void *)v29,
                  [v7 model],
                  v32 = objc_claimAutoreleasedReturnValue(),
                  v32,
                  v31,
                  v32))
            {
              v33 = [v19 model];
              v34 = [v7 model];
              v35 = [v33 lowercaseString];
              v36 = +[NSCharacterSet whitespaceCharacterSet];
              v37 = [v35 stringByTrimmingCharactersInSet:v36];

              v38 = [v34 lowercaseString];
              v39 = +[NSCharacterSet whitespaceCharacterSet];
              v40 = [v38 stringByTrimmingCharactersInSet:v39];

              id v41 = [v37 _navigation_distanceLevenshtein:v40];
              id v42 = [v37 length];
              if (v42 <= [v40 length]) {
                v43 = v40;
              }
              else {
                v43 = v37;
              }
              float v30 = 1.0 - (float)((float)(unint64_t)v41 / (float)(unint64_t)[v43 length]);

              int v44 = 1;
            }
            else
            {
              int v44 = 0;
            }
            uint64_t v45 = [v19 manufacturer];
            if (v45)
            {
              v46 = (void *)v45;
              v47 = [v7 manufacturer];

              if (v47)
              {
                v48 = [v19 manufacturer];
                v49 = [v7 manufacturer];
                v50 = [v48 lowercaseString];
                v51 = +[NSCharacterSet whitespaceCharacterSet];
                v52 = [v50 stringByTrimmingCharactersInSet:v51];

                v53 = [v49 lowercaseString];
                v54 = +[NSCharacterSet whitespaceCharacterSet];
                v55 = [v53 stringByTrimmingCharactersInSet:v54];

                id v56 = [v52 _navigation_distanceLevenshtein:v55];
                id v57 = [v52 length];
                if (v57 <= [v55 length]) {
                  v58 = v55;
                }
                else {
                  v58 = v52;
                }
                float v59 = 1.0 - (float)((float)(unint64_t)v56 / (float)(unint64_t)[v58 length]);

                float v30 = v30 * v59;
                int v44 = 1;
              }
            }
            uint64_t v60 = [v19 year];
            if (v60)
            {
              v61 = (void *)v60;
              v62 = [v7 year];

              if (v62)
              {
                v63 = [v19 year];
                v64 = [v7 year];
                v65 = [v64 stringValue];
                unsigned int v66 = [v63 isEqualToString:v65];

                if (!v66) {
                  float v30 = 0.0;
                }
LABEL_37:
                *(float *)&double v67 = v30;
              }
              else
              {
                double v67 = 0.0;
                if (v44) {
                  goto LABEL_37;
                }
              }
            }
            else
            {
              double v67 = 0.0;
              if (v44) {
                goto LABEL_37;
              }
            }
            v68 = +[NSNumber numberWithFloat:v67];
            [v76 setObject:v68 forKeyedSubscript:v19];

            uint64_t v17 = v74;
            id v14 = v75;
          }
        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v69 = [v14 countByEnumeratingWithState:&v77 objects:v83 count:16];
      id v16 = v69;
      if (!v69)
      {
LABEL_47:

        v9 = v76;
        id v12 = [v76 copy];
        id v6 = v72;
        id v5 = v73;
        uint64_t v8 = v71;
        goto LABEL_48;
      }
    }
  }
  v9 = sub_100576D94();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 identifier];
    v11 = [v8 firstObject];
    *(_DWORD *)buf = 138412546;
    v85 = v10;
    __int16 v86 = 2112;
    v87 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "There is already a vehicle in the garage that matches this accessory: %@, vehicle: %@", buf, 0x16u);
  }
  id v12 = &__NSDictionary0__struct;
LABEL_48:

  v13 = v82;
LABEL_49:

  return v12;
}

+ (void)pairAccessory:(id)a3 withVehicle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100576D94();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 identifier];
    v9 = [v5 bluetoothIdentifier];
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will pair accessory with identifier: %@, bluetoothIdentifier: %@ to vehicle: %@", (uint8_t *)&v13, 0x20u);
  }
  v10 = [v5 identifier];
  v11 = [v5 bluetoothIdentifier];
  [v6 pairToIapIdentifier:v10 bluetoothIdentifier:v11];

  id v12 = +[VGVirtualGarageService sharedService];
  [v12 virtualGarageSaveVehicle:v6];
}

@end