void sub_100003B24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003BE8;
  v6[3] = &unk_1000081F0;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v4 = *(void **)(a1 + 48);
  v9 = *(void *)(a1 + 40);
  v10 = v4;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_100003BE8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) incidentType];
  uint64_t v3 = +[TrafficIncidentIntentSupport incidentTypeForINTrafficIncidentType:](TrafficIncidentIntentSupport, "incidentTypeForINTrafficIncidentType:", [v2 type]);

  if (*(void *)(a1 + 40))
  {
    v4 = [*(id *)(a1 + 32) isClear];
    if ([v4 BOOLValue])
    {

LABEL_5:
      v7 = [*(id *)(a1 + 32) incidentType];
      if (!v7)
      {
LABEL_8:
        id v10 = [objc_alloc((Class)INSupportedTrafficIncidentType) initWithType:0 localizedDisplayString:0];
        uint64_t v11 = +[INReportIncidentIncidentTypeResolutionResult successWithResolvedSupportedTrafficIncidentType:v10];
LABEL_15:
        id v14 = (id)v11;

        goto LABEL_19;
      }
      v8 = v7;
      if (v3)
      {
        unsigned __int8 v9 = [*(id *)(a1 + 40) isIncidentTypeSupported:v3];

        if (v9) {
          goto LABEL_8;
        }
      }
      else
      {
      }
LABEL_13:
      id v10 = [*(id *)(a1 + 48) _supportedIncidentTypesForIncidentLayout:*(void *)(a1 + 40)];
      uint64_t v11 = +[INReportIncidentIncidentTypeResolutionResult resolutionResultUnsupportedWithReason:2 alternativeItems:v10];
      goto LABEL_15;
    }
    v5 = [*(id *)(a1 + 32) additionalDetails];
    unsigned int v6 = [v5 isEqual:@"update"];

    if (v6) {
      goto LABEL_5;
    }
    v12 = [*(id *)(a1 + 32) incidentType];

    if (!v12)
    {
      id v10 = [*(id *)(a1 + 48) _supportedIncidentTypesForIncidentLayout:*(void *)(a1 + 40)];
      uint64_t v11 = +[INReportIncidentIncidentTypeResolutionResult disambiguationWithSupportedTrafficIncidentTypesToDisambiguate:v10];
      goto LABEL_15;
    }
    if ([*(id *)(a1 + 40) isIncidentTypeSupported:v3])
    {
      v13 = [*(id *)(a1 + 32) incidentType];
      id v14 = +[INReportIncidentIncidentTypeResolutionResult successWithResolvedSupportedTrafficIncidentType:v13];

      goto LABEL_19;
    }
    if (![*(id *)(a1 + 40) isIncidentTypeSupported:v3] || !v3) {
      goto LABEL_13;
    }
  }
  id v14 = +[INReportIncidentIncidentTypeResolutionResult unsupportedForReason:1];
LABEL_19:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t sub_100003F38(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id MAPSGetIncidentsReportingLog()
{
  if (qword_10000D108 != -1) {
    dispatch_once(&qword_10000D108, &stru_100008280);
  }
  v0 = (void *)qword_10000D100;

  return v0;
}

void sub_100004140(id a1)
{
  qword_10000D100 = (uint64_t)os_log_create("com.apple.Maps", "IncidentsReporting");

  _objc_release_x1();
}

void sub_100004324(uint64_t a1, void *a2, void *a3, void *a4)
{
  unsigned int v6 = a2;
  id v7 = a3;
  id v8 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  unsigned __int8 v9 = [(TrafficIncidentLayout *)v6 feedbackResult];
  id v10 = [v9 layoutConfigResult];
  uint64_t v11 = [v10 forms];

  id v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v12)
  {
    id v13 = v12;
    id v30 = v8;
    id v31 = v7;
    v32 = v6;
    id v14 = 0;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        unsigned int v18 = [v17 formType:v30, v31, v32];
        v19 = [*(id *)(a1 + 32) feedbackRequestParameters];
        v20 = [v19 layoutConfigParameters];
        unsigned int v21 = [v20 formType];

        if (v18 == v21)
        {
          id v22 = v17;

          id v14 = v22;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v13);

    id v7 = v31;
    unsigned int v6 = v32;
    id v8 = v30;
    if (v14)
    {
      v23 = [[TrafficIncidentLayout alloc] initWithLayoutFormConfig:v14 location:*(void *)(a1 + 40)];
      int v24 = *(_DWORD *)(a1 + 56);
      if (v24 == 7)
      {
        v25 = +[TrafficIncidentLayoutStorage sharedInstance];
        [v25 saveIncidentLayout:v23];
      }
      else
      {
        if (v24 != 9)
        {
LABEL_21:
          v28 = MAPSGetIncidentsReportingLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v23;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "LayoutItem %@", buf, 0xCu);
          }

          uint64_t v29 = *(void *)(a1 + 48);
          if (v29) {
            (*(void (**)(uint64_t, TrafficIncidentLayout *))(v29 + 16))(v29, v23);
          }

          goto LABEL_26;
        }
        v25 = +[TrafficIncidentLayoutStorage sharedInstance];
        [v25 saveIncidentVotingLayout:v23];
      }

      goto LABEL_21;
    }
  }
  else
  {
  }
  v26 = MAPSGetIncidentsReportingLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v39 = v6;
    __int16 v40 = 2112;
    id v41 = v8;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error: Layout config not included in response: %@ error: %@", buf, 0x16u);
  }

  uint64_t v27 = *(void *)(a1 + 48);
  if (v27) {
    (*(void (**)(uint64_t, void))(v27 + 16))(v27, 0);
  }
LABEL_26:
}

void sub_100004710(id a1)
{
  qword_10000D118 = objc_alloc_init(TrafficIncidentLayoutStorage);

  _objc_release_x1();
}

uint64_t GEOCalculateDistance()
{
  return _GEOCalculateDistance();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__sharedUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 _sharedUserDefaults];
}

id objc_msgSend_additionalDetails(void *a1, const char *a2, ...)
{
  return [a1 additionalDetails];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cachedIncidentLayout(void *a1, const char *a2, ...)
{
  return [a1 cachedIncidentLayout];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocation(void *a1, const char *a2, ...)
{
  return [a1 currentLocation];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultTraits(void *a1, const char *a2, ...)
{
  return [a1 defaultTraits];
}

id objc_msgSend_displayIncidentOnMap(void *a1, const char *a2, ...)
{
  return [a1 displayIncidentOnMap];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_feedbackRequestParameters(void *a1, const char *a2, ...)
{
  return [a1 feedbackRequestParameters];
}

id objc_msgSend_feedbackResult(void *a1, const char *a2, ...)
{
  return [a1 feedbackResult];
}

id objc_msgSend_formType(void *a1, const char *a2, ...)
{
  return [a1 formType];
}

id objc_msgSend_forms(void *a1, const char *a2, ...)
{
  return [a1 forms];
}

id objc_msgSend_hasDisplayIncidentOnMap(void *a1, const char *a2, ...)
{
  return [a1 hasDisplayIncidentOnMap];
}

id objc_msgSend_incidentField(void *a1, const char *a2, ...)
{
  return [a1 incidentField];
}

id objc_msgSend_incidentType(void *a1, const char *a2, ...)
{
  return [a1 incidentType];
}

id objc_msgSend_isClear(void *a1, const char *a2, ...)
{
  return [a1 isClear];
}

id objc_msgSend_latLng(void *a1, const char *a2, ...)
{
  return [a1 latLng];
}

id objc_msgSend_layoutConfigParameters(void *a1, const char *a2, ...)
{
  return [a1 layoutConfigParameters];
}

id objc_msgSend_layoutConfigResult(void *a1, const char *a2, ...)
{
  return [a1 layoutConfigResult];
}

id objc_msgSend_layoutFields(void *a1, const char *a2, ...)
{
  return [a1 layoutFields];
}

id objc_msgSend_layoutItems(void *a1, const char *a2, ...)
{
  return [a1 layoutItems];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return [a1 radius];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLocationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedLocationManager];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_trafficType(void *a1, const char *a2, ...)
{
  return [a1 trafficType];
}

id objc_msgSend_ttl(void *a1, const char *a2, ...)
{
  return [a1 ttl];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userLocation(void *a1, const char *a2, ...)
{
  return [a1 userLocation];
}