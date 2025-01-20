@interface SMReceiverNotificationUtilities
+ (void)fetchDestinationNameFromMapItem:(id)a3 completionHandler:(id)a4;
+ (void)prepareNotificationBodyFromMessage:(id)a3 completionHandler:(id)a4;
@end

@implementation SMReceiverNotificationUtilities

+ (void)prepareNotificationBodyFromMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, void))a4;
  uint64_t v9 = [(id)objc_opt_class() messageType];
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__0;
  v108 = __Block_byref_object_dispose__0;
  id v109 = 0;
  switch(v9)
  {
    case 3:
      uint64_t v16 = [v7 summaryText];
      v17 = (void *)v105[5];
      v105[5] = v16;

      v18 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = NSStringFromSelector(a2);
        uint64_t v22 = v105[5];
        *(_DWORD *)buf = 138412802;
        id v111 = v20;
        __int16 v112 = 2112;
        v113 = v21;
        __int16 v114 = 2112;
        uint64_t v115 = v22;
        _os_log_impl(&dword_25B6E0000, v18, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMMessageType SMMessageTypeKeyRelease summaryText: %@", buf, 0x20u);
      }
      v8[2](v8, v105[5], 0);
      goto LABEL_42;
    case 2:
      id v23 = v7;
      uint64_t v24 = [v23 summaryText];
      v25 = (void *)v105[5];
      v105[5] = v24;

      if ([v23 sessionEndReason] == 1 && objc_msgSend(v23, "destinationType") == 4)
      {
        v26 = [v23 destinationMapItem];
        v87[0] = MEMORY[0x263EF8330];
        v87[1] = 3221225472;
        v87[2] = __88__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_completionHandler___block_invoke_66;
        v87[3] = &unk_265499A20;
        id v90 = a1;
        SEL v91 = a2;
        v88 = v8;
        v89 = &v104;
        +[SMReceiverNotificationUtilities fetchDestinationNameFromMapItem:v26 completionHandler:v87];

        v27 = v88;
      }
      else
      {
        v8[2](v8, v105[5], 0);
        v27 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          id v34 = (id)objc_claimAutoreleasedReturnValue();
          v35 = NSStringFromSelector(a2);
          uint64_t v36 = v105[5];
          *(_DWORD *)buf = 138412802;
          id v111 = v34;
          __int16 v112 = 2112;
          v113 = v35;
          __int16 v114 = 2112;
          uint64_t v115 = v36;
          _os_log_impl(&dword_25B6E0000, v27, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMMessageTypeSessionEnd DEFAULT summaryText: %@", buf, 0x20u);
        }
      }
      goto LABEL_41;
    case 1:
      id v10 = v7;
      uint64_t v11 = [v10 summaryText];
      v12 = (void *)v105[5];
      v105[5] = v11;

      v13 = [v10 coarseEstimatedEndTime];
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        v15 = [v10 estimatedEndTime];
      }
      v27 = v15;

      uint64_t v37 = [v10 sessionType];
      if (v37 == 1)
      {
        v52 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v39 = [v52 localizedStringForKey:@"START_MESSAGE_TIME_BOUND_SUMMARY_FORMAT_WITH_ETA" value:@"Check In: Timer %@" table:0];

        v53 = NSString;
        v54 = [v27 roundedTime];
        v55 = [v54 absoluteTimeString:0 preposition:1 capitalized:0];
        uint64_t v56 = [v53 localizedStringWithValidatedFormat:v39, @"%@", 0, v55 validFormatSpecifiers error];
        v57 = (void *)v105[5];
        v105[5] = v56;

        v47 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v58 = (objc_class *)objc_opt_class();
          NSStringFromClass(v58);
          id v59 = (id)objc_claimAutoreleasedReturnValue();
          v60 = NSStringFromSelector(a2);
          uint64_t v61 = v105[5];
          *(_DWORD *)buf = 138412802;
          id v111 = v59;
          __int16 v112 = 2112;
          v113 = v60;
          __int16 v114 = 2112;
          uint64_t v115 = v61;
          _os_log_impl(&dword_25B6E0000, v47, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionTypeTimeBound summaryText: %@", buf, 0x20u);
        }
      }
      else
      {
        if (v37 != 2)
        {
          if (v37 == 3)
          {
            v38 = [v10 destinationMapItem];
            v92[0] = MEMORY[0x263EF8330];
            v92[1] = 3221225472;
            v92[2] = __88__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_completionHandler___block_invoke_53;
            v92[3] = &unk_2654999F8;
            v95 = &v104;
            v93 = v27;
            id v96 = a1;
            SEL v97 = a2;
            v94 = v8;
            +[SMReceiverNotificationUtilities fetchDestinationNameFromMapItem:v38 completionHandler:v92];

            v39 = v93;
          }
          else
          {
            v8[2](v8, v105[5], 0);
            v39 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              v62 = (objc_class *)objc_opt_class();
              NSStringFromClass(v62);
              id v63 = (id)objc_claimAutoreleasedReturnValue();
              v64 = NSStringFromSelector(a2);
              uint64_t v65 = v105[5];
              *(_DWORD *)buf = 138412802;
              id v111 = v63;
              __int16 v112 = 2112;
              v113 = v64;
              __int16 v114 = 2112;
              uint64_t v115 = v65;
              _os_log_impl(&dword_25B6E0000, v39, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMMessageTypeSessionStart DEFAULT summaryText: %@", buf, 0x20u);
            }
          }
          goto LABEL_40;
        }
        uint64_t v40 = [v10 destinationType];
        switch(v40)
        {
          case 3:
            v66 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v39 = [v66 localizedStringForKey:@"START_MESSAGE_SCHOOL_SUMMARY_FORMAT_WITH_ETA" value:@"Check In: School %@" table:0];

            v67 = NSString;
            v68 = [v27 roundedTime];
            v69 = [v68 absoluteTimeString:0 preposition:1 capitalized:0];
            uint64_t v70 = [v67 localizedStringWithValidatedFormat:v39, @"%@", 0, v69 validFormatSpecifiers error];
            v71 = (void *)v105[5];
            v105[5] = v70;

            v47 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v72 = (objc_class *)objc_opt_class();
              NSStringFromClass(v72);
              id v73 = (id)objc_claimAutoreleasedReturnValue();
              v74 = NSStringFromSelector(a2);
              uint64_t v75 = v105[5];
              *(_DWORD *)buf = 138412802;
              id v111 = v73;
              __int16 v112 = 2112;
              v113 = v74;
              __int16 v114 = 2112;
              uint64_t v115 = v75;
              _os_log_impl(&dword_25B6E0000, v47, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionTypeDestinationBound SCHOOL summaryText: %@", buf, 0x20u);
            }
            break;
          case 2:
            v76 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v39 = [v76 localizedStringForKey:@"START_MESSAGE_WORK_SUMMARY_FORMAT_WITH_ETA" value:@"Check In: Work %@" table:0];

            v77 = NSString;
            v78 = [v27 roundedTime];
            v79 = [v78 absoluteTimeString:0 preposition:1 capitalized:0];
            uint64_t v80 = [v77 localizedStringWithValidatedFormat:v39, @"%@", 0, v79 validFormatSpecifiers error];
            v81 = (void *)v105[5];
            v105[5] = v80;

            v47 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v82 = (objc_class *)objc_opt_class();
              NSStringFromClass(v82);
              id v83 = (id)objc_claimAutoreleasedReturnValue();
              v84 = NSStringFromSelector(a2);
              uint64_t v85 = v105[5];
              *(_DWORD *)buf = 138412802;
              id v111 = v83;
              __int16 v112 = 2112;
              v113 = v84;
              __int16 v114 = 2112;
              uint64_t v115 = v85;
              _os_log_impl(&dword_25B6E0000, v47, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionTypeDestinationBound WORK summaryText: %@", buf, 0x20u);
            }
            break;
          case 1:
            v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v39 = [v41 localizedStringForKey:@"START_MESSAGE_HOME_SUMMARY_FORMAT_WITH_ETA" value:@"Check In: Home %@" table:0];

            v42 = NSString;
            v43 = [v27 roundedTime];
            v44 = [v43 absoluteTimeString:0 preposition:1 capitalized:0];
            uint64_t v45 = [v42 localizedStringWithValidatedFormat:v39, @"%@", 0, v44 validFormatSpecifiers error];
            v46 = (void *)v105[5];
            v105[5] = v45;

            v47 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = (objc_class *)objc_opt_class();
              NSStringFromClass(v48);
              id v49 = (id)objc_claimAutoreleasedReturnValue();
              v50 = NSStringFromSelector(a2);
              uint64_t v51 = v105[5];
              *(_DWORD *)buf = 138412802;
              id v111 = v49;
              __int16 v112 = 2112;
              v113 = v50;
              __int16 v114 = 2112;
              uint64_t v115 = v51;
              _os_log_impl(&dword_25B6E0000, v47, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionTypeDestinationBound HOME summaryText: %@", buf, 0x20u);
            }
            break;
          default:
            v86 = [v10 destinationMapItem];
            v98[0] = MEMORY[0x263EF8330];
            v98[1] = 3221225472;
            v98[2] = __88__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_completionHandler___block_invoke;
            v98[3] = &unk_2654999F8;
            v101 = &v104;
            v99 = v27;
            id v102 = a1;
            SEL v103 = a2;
            v100 = v8;
            +[SMReceiverNotificationUtilities fetchDestinationNameFromMapItem:v86 completionHandler:v98];

            v39 = v99;
            goto LABEL_40;
        }
      }

      v8[2](v8, v105[5], 0);
LABEL_40:

LABEL_41:
LABEL_42:

      goto LABEL_43;
  }
  v28 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = NSStringFromSelector(a2);
    uint64_t v32 = v105[5];
    *(_DWORD *)buf = 138412802;
    id v111 = v30;
    __int16 v112 = 2112;
    v113 = v31;
    __int16 v114 = 2112;
    uint64_t v115 = v32;
    _os_log_impl(&dword_25B6E0000, v28, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMMessageType DEFAULT summaryText: %@", buf, 0x20u);
  }
  v8[2](v8, v105[5], 0);
LABEL_43:
  _Block_object_dispose(&v104, 8);
}

void __88__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 localizedStringForKey:@"START_MESSAGE_FALLBACK_DESTINATION_SUMMARY_FORMAT_WITH_ETA" value:@"Check In: Destination %@" table:0];

    id v10 = NSString;
    uint64_t v11 = [*(id *)(a1 + 32) roundedTime];
    v12 = [v11 absoluteTimeString:0 preposition:1 capitalized:0];
    uint64_t v13 = [v10 localizedStringWithValidatedFormat:v9, @"%@", 0, v12 validFormatSpecifiers error];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      v29 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412802;
      v31 = v28;
      __int16 v32 = 2112;
      v33 = v29;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_error_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@,Unable to fetch destination name due to error %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v9 = [v7 localizedStringForKey:@"START_MESSAGE_CUSTOMISED_DESTINATION_SUMMARY_FORMAT_WITH_ETA" value:@"Check In: %@ %@" table:0];

    v17 = NSString;
    v18 = [*(id *)(a1 + 32) roundedTime];
    v19 = [v18 absoluteTimeString:0 preposition:1 capitalized:0];
    uint64_t v20 = [v17 localizedStringWithValidatedFormat:v9, @"%@%@", 0, v5, v19 validFormatSpecifiers error];
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = (objc_class *)objc_opt_class();
      uint64_t v24 = NSStringFromClass(v23);
      v25 = NSStringFromSelector(*(SEL *)(a1 + 64));
      v26 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v31 = v24;
      __int16 v32 = 2112;
      v33 = v25;
      __int16 v34 = 2112;
      id v35 = v26;
      _os_log_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionDestinationTypeOther summaryText: %@", buf, 0x20u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_completionHandler___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 localizedStringForKey:@"START_MESSAGE_ROUNDTRIP_FALLBACK_DESTINATION_SUMMARY_FORMAT_WITH_ETA" value:@"Check In: Round trip to destination %@" table:0];

    id v10 = NSString;
    uint64_t v11 = [*(id *)(a1 + 32) roundedTime];
    v12 = [v11 absoluteTimeString:0 preposition:1 capitalized:0];
    uint64_t v13 = [v10 localizedStringWithValidatedFormat:v9, @"%@", 0, v12 validFormatSpecifiers error];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      v29 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412802;
      v31 = v28;
      __int16 v32 = 2112;
      v33 = v29;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_error_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@,Unable to fetch destination name due to error %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v9 = [v7 localizedStringForKey:@"START_MESSAGE_ROUNDTRIP_CUSTOMISED_SUMMARY_FORMAT_WITH_ETA" value:@"Check In: Round trip to %@ %@" table:0];

    v17 = NSString;
    v18 = [*(id *)(a1 + 32) roundedTime];
    v19 = [v18 absoluteTimeString:0 preposition:1 capitalized:0];
    uint64_t v20 = [v17 localizedStringWithValidatedFormat:v9, @"%@%@", 0, v5, v19 validFormatSpecifiers error];
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = (objc_class *)objc_opt_class();
      uint64_t v24 = NSStringFromClass(v23);
      v25 = NSStringFromSelector(*(SEL *)(a1 + 64));
      v26 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v31 = v24;
      __int16 v32 = 2112;
      v33 = v25;
      __int16 v34 = 2112;
      id v35 = v26;
      _os_log_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMSessionTypeRoundTrip summaryText: %@", buf, 0x20u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__SMReceiverNotificationUtilities_prepareNotificationBodyFromMessage_completionHandler___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      uint64_t v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@,Unable to fetch destination name due to error %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"END_MESSAGE_SAFE_ARRIVAL_CUSTOMISED_DESTINATION_SUMMARY" value:@"Check In: Arrived at %@" table:0];

    uint64_t v10 = [NSString localizedStringWithValidatedFormat:v9, @"%@", 0, v5 validFormatSpecifiers error];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
      v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, SMMessageTypeSessionEnd Safe Arrival at customised destination summaryText: %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)fetchDestinationNameFromMapItem:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  v8 = (void *)MEMORY[0x263F41B18];
  id v9 = a3;
  uint64_t v10 = [v8 sharedService];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__SMReceiverNotificationUtilities_fetchDestinationNameFromMapItem_completionHandler___block_invoke;
  v12[3] = &unk_265499A48;
  id v13 = v7;
  id v14 = a1;
  SEL v15 = a2;
  id v11 = v7;
  [v10 resolveMapItemFromHandle:v9 completionHandler:v12];
}

void __85__SMReceiverNotificationUtilities_fetchDestinationNameFromMapItem_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    v8 = [v5 geoAddress];
    id v9 = [v8 structuredAddress];
    uint64_t v10 = [v9 fullThoroughfare];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = [v6 geoAddress];
      id v14 = [v13 structuredAddress];
      SEL v15 = [v14 fullThoroughfare];
      (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v15, 0);
    }
    else
    {
      uint64_t v16 = [v6 shortAddress];
      uint64_t v17 = [v16 length];

      if (!v17)
      {
        v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = (objc_class *)objc_opt_class();
          uint64_t v21 = NSStringFromClass(v20);
          uint64_t v22 = NSStringFromSelector(*(SEL *)(a1 + 48));
          int v23 = 138412546;
          uint64_t v24 = v21;
          __int16 v25 = 2112;
          id v26 = v22;
          _os_log_error_impl(&dword_25B6E0000, v19, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@, Unable to retrieve destination address from geoMapItem", (uint8_t *)&v23, 0x16u);
        }
        id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
        goto LABEL_3;
      }
      uint64_t v18 = *(void *)(a1 + 32);
      id v13 = [v6 shortAddress];
      (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v13, 0);
    }

    goto LABEL_9;
  }
  id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_3:
  v7();
LABEL_9:
}

@end