@interface NavTrafficIncidentViewComposer
+ (void)configureDetailsView:(id)a3 withGEORouteIncident:(id)a4;
+ (void)configureDetailsView:(id)a3 withTrafficIncidentAlert:(id)a4;
+ (void)configureDetailsView:(id)a3 withTrafficIncidentFeature:(id)a4;
+ (void)configureHeaderView:(id)a3 withTrafficIncidentAlert:(id)a4;
+ (void)configureHeaderView:(id)a3 withTrafficIncidentFeature:(id)a4;
+ (void)configureRerouteView:(id)a3 withTrafficIncidentAlert:(id)a4;
@end

@implementation NavTrafficIncidentViewComposer

+ (void)configureHeaderView:(id)a3 withTrafficIncidentAlert:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 alertTitles];
  v9 = [v8 firstObject];
  v10 = [v6 primaryLabel];
  [v10 setText:v9];

  v11 = [v7 alertDescriptions];
  id v12 = [v11 count];

  if (v12)
  {
    v13 = [v7 alertDescriptions];
    v14 = [v13 firstObject];
    v15 = [v6 secondaryLabel];
    [v15 setText:v14];
  }
  else
  {
    v13 = [v6 secondaryLabel];
    [v13 setText:0];
  }

  v16 = [v7 artwork];

  if (v16)
  {
    v17 = sub_1006C1B8C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = [v7 artwork];
      int v47 = 134349314;
      id v48 = a1;
      __int16 v49 = 2112;
      id v50 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Initializing using artwork %@", (uint8_t *)&v47, 0x16u);
    }
    v19 = [v7 artwork];
    v20 = [v6 traitCollection];
    v21 = ImageForArtwork();
    [v6 setImageSource:v21];

    goto LABEL_28;
  }
  v22 = [v7 incident];

  if (!v22)
  {
    v32 = [v7 originalRoute];
    if ([v32 isEVRoute])
    {
      id v33 = [v7 alertType];

      if (v33 != (id)6)
      {
        v34 = sub_1006C1B8C();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          int v47 = 134349056;
          id v48 = a1;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[%{public}p] Initializing using VKTrafficIncidentTypeBatteryReroute", (uint8_t *)&v47, 0xCu);
        }

        id v35 = v6;
        v36 = [v35 window];
        v37 = [v36 screen];
        if (v37)
        {
          v38 = [v35 window];
          v39 = [v38 screen];
          [v39 nativeScale];
          double v41 = v40;
        }
        else
        {
          v38 = +[UIScreen mainScreen];
          [v38 nativeScale];
          double v41 = v46;
        }

        v19 = sub_100724254(v7, 0xCuLL, 4, v41);
        v45 = v35;
LABEL_27:
        [v45 setImageSource:v19];
        goto LABEL_28;
      }
    }
    else
    {
    }
    v44 = sub_1006C1B8C();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      int v47 = 134349312;
      id v48 = a1;
      __int16 v49 = 2048;
      id v50 = v7;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "[%{public}p] No GEORouteIncident to configure header for MNTrafficIncidentAlert %p", (uint8_t *)&v47, 0x16u);
    }

    v19 = +[UIImage imageNamed:@"alert-big"];
    v45 = v6;
    goto LABEL_27;
  }
  v23 = sub_1006C1B8C();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = [v7 incident];
    int v47 = 134349314;
    id v48 = a1;
    __int16 v49 = 2112;
    id v50 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}p] Initializing using incident type %@", (uint8_t *)&v47, 0x16u);
  }
  v19 = [v7 incident];
  id v25 = v6;
  v26 = [v25 window];
  v27 = [v26 screen];
  if (v27)
  {
    v28 = [v25 window];
    v29 = [v28 screen];
    [v29 nativeScale];
    double v31 = v30;
  }
  else
  {
    v28 = +[UIScreen mainScreen];
    [v28 nativeScale];
    double v31 = v42;
  }

  v43 = sub_100724150(v19, 4, v31);
  [v25 setImageSource:v43];

LABEL_28:
}

+ (void)configureHeaderView:(id)a3 withTrafficIncidentFeature:(id)a4
{
  id v27 = a3;
  id v5 = a4;
  if ([v5 isRestrictionIncident])
  {
    id v6 = [v5 restrictionTitle];
    id v7 = [v27 primaryLabel];
    [v7 setText:v6];

    uint64_t v8 = [v5 restrictionCombinedDetails];
LABEL_5:
    v13 = (void *)v8;
    v14 = [v27 secondaryLabel];
    [v14 setText:v13];

    goto LABEL_6;
  }
  v9 = [v5 title];
  v10 = [v27 primaryLabel];
  [v10 setText:v9];

  v11 = [v5 subtitle];
  id v12 = [v11 length];

  if (v12)
  {
    uint64_t v8 = [v5 subtitle];
    goto LABEL_5;
  }
  v13 = [v27 secondaryLabel];
  [v13 setText:0];
LABEL_6:

  v15 = [v5 artwork];

  if (v15)
  {
    v16 = [v5 artwork];
    v17 = [v27 traitCollection];
    v18 = ImageForArtwork();
    [v27 setImageSource:v18];
  }
  else
  {
    id v19 = v27;
    v20 = [v19 window];
    v21 = [v20 screen];
    if (v21)
    {
      v22 = [v19 window];
      v23 = [v22 screen];
      [v23 nativeScale];
      double v25 = v24;
    }
    else
    {
      v22 = +[UIScreen mainScreen];
      [v22 nativeScale];
      double v25 = v26;
    }

    v16 = sub_100723FDC(v5, 4, v25);
    [v19 setImageSource:v16];
  }
}

+ (void)configureDetailsView:(id)a3 withTrafficIncidentAlert:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v6 bannerDescription];
  id v8 = [v7 length];

  if (v8)
  {
    v9 = [v6 bannerDescription];
    [v11 setPrimaryLabelText:v9];
  }
  else
  {
    v10 = [v6 incident];

    if (!v10) {
      goto LABEL_6;
    }
    v9 = [v6 incident];
    [a1 configureDetailsView:v11 withGEORouteIncident:v9];
  }

LABEL_6:
}

+ (void)configureDetailsView:(id)a3 withTrafficIncidentFeature:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = [v5 info];
  [v11 setPrimaryLabelText:v6];

  id v7 = [v5 lastUpdatedDate];

  if (v7)
  {
    if (qword_10160F5A0 != -1) {
      dispatch_once(&qword_10160F5A0, &stru_1012F50D8);
    }
    id v8 = (void *)qword_10160F598;
    v9 = [v5 lastUpdatedDate];
    v10 = [v8 lastUpdatedUIStringForDate:v9];
    [v11 setSecondaryLabelText:v10];
  }
  else
  {
    [v11 setSecondaryLabelText:0];
  }
}

+ (void)configureDetailsView:(id)a3 withGEORouteIncident:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 info];
    [v10 setPrimaryLabelText:v7];

    if (qword_10160F5B0 != -1) {
      dispatch_once(&qword_10160F5B0, &stru_1012F50F8);
    }
    id v8 = [objc_alloc((Class)NSDate) initWithTimeIntervalSince1970:(double)(uint64_t)[v6 updateTime] / 1000.0];
    v9 = [(id)qword_10160F5A8 lastUpdatedUIStringForDate:v8];
    [v10 setSecondaryLabelText:v9];
  }
  else
  {
    [v10 setPrimaryLabelText:0];
    [v10 setSecondaryLabelText:0];
  }
}

+ (void)configureRerouteView:(id)a3 withTrafficIncidentAlert:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  id v6 = [v5 alertTitles];
  id v7 = [v6 firstObject];
  id v8 = [v16 primaryLabel];
  [v8 setText:v7];

  v9 = [v5 alertDescriptions];
  id v10 = [v9 count];

  if (v10)
  {
    id v11 = [v5 alertDescriptions];
    id v12 = [v11 firstObject];
    v13 = [v16 secondaryLabel];
    [v13 setText:v12];
  }
  else
  {
    id v11 = [v16 secondaryLabel];
    [v11 setText:0];
  }

  v14 = [v5 dismissButtonTitle];
  [v16 setCancelButtonTitle:v14];

  v15 = [v5 acceptButtonTitle];
  [v16 setConfirmButtonTitle:v15];
}

@end