@interface MapsSuggestionsEntry
+ (id)__debug_fakeHomeEntry;
+ (id)archivedDestinationForUniqueID:(id)a3;
+ (id)iconForSuggestionType:(int64_t)a3 suggestionAttributes:(id)a4 mapItemAttributes:(id)a5 originBundleID:(id)a6 screenScale:(double)a7 showEVChargingIcon:(BOOL)a8 showOnboardingMultipleVehiclesIcon:(BOOL)a9 inverted:(BOOL)a10 isDashboardWidget:(BOOL)a11 nightMode:(BOOL)a12 isRTL:(BOOL)a13 contact:(id)a14;
+ (id)sharedDefaults;
+ (void)removeStaleArchivedDestinations;
- (BOOL)hasVibrantBackground;
- (BOOL)isHybridEngineType;
- (GEOComposedWaypoint)findMyWaypoint;
- (GEOFeatureStyleAttributes)styleAttributes;
- (MKMapItem)MKMapItem;
- (NSArray)waypoints;
- (NSString)analyticsGrouping;
- (NSString)poiTitle;
- (UIImage)icon;
- (id)notificationDetailsWithTitle:(id)a3 message:(id)a4;
- (id)sharingContacts;
- (int)engineType;
- (int)proactiveItemType;
- (int)transportType;
- (void)archiveDestination;
- (void)setIcon:(id)a3;
- (void)updateModel:(id)a3;
@end

@implementation MapsSuggestionsEntry

+ (id)iconForSuggestionType:(int64_t)a3 suggestionAttributes:(id)a4 mapItemAttributes:(id)a5 originBundleID:(id)a6 screenScale:(double)a7 showEVChargingIcon:(BOOL)a8 showOnboardingMultipleVehiclesIcon:(BOOL)a9 inverted:(BOOL)a10 isDashboardWidget:(BOOL)a11 nightMode:(BOOL)a12 isRTL:(BOOL)a13 contact:(id)a14
{
  BOOL v14 = a9;
  BOOL v15 = a8;
  BOOL v20 = a11;
  id v107 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a14;
  v24 = v23;
  if (v15)
  {
    BOOL v25 = a11;
    id v26 = v21;
    id v27 = v22;
    id v28 = v23;
    v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 101661;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Trying to show the EV Charging Icon %u", buf, 8u);
    }

    v30 = +[MKSystemController sharedInstance];
    [v30 screenScale];
    +[MKIconManager imageForIconID:contentScale:sizeGroup:nightMode:](MKIconManager, "imageForIconID:contentScale:sizeGroup:nightMode:", 101661, 4, 0);
    v31 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      if (!a10)
      {
        v24 = v28;
        id v22 = v27;
        id v21 = v26;
        goto LABEL_60;
      }
      [v31 _maps_invertedImage];
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      v24 = v28;
      id v22 = v27;
      id v21 = v26;
      goto LABEL_59;
    }
    v37 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Could not fetch the icon for resuming an EV route", buf, 2u);
    }
    v24 = v28;
    id v22 = v27;
    id v21 = v26;
    goto LABEL_16;
  }
  if (!v14) {
    goto LABEL_17;
  }
  BOOL v25 = a11;
  id v33 = v21;
  id v34 = v22;
  id v35 = v23;
  sub_100CDBC88();
  v31 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  v36 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Trying to show the EVOnboardingIconForTipKit", buf, 2u);
  }

  v24 = v35;
  id v22 = v34;
  id v21 = v33;
  if (!v31)
  {
    v37 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Could not fetch the icon for onboarding with multiple vehicles", buf, 2u);
    }
LABEL_16:
    BOOL v20 = v25;

LABEL_17:
    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472;
    v110[2] = sub_1000A7658;
    v110[3] = &unk_101316120;
    *(double *)&v110[4] = a7;
    BOOL v111 = a10;
    BOOL v112 = a12;
    v38 = objc_retainBlock(v110);
    v31 = (void (**)(void, void))v38;
    switch(a3)
    {
      case 0:
      case 4:
      case 5:
      case 6:
      case 10:
      case 17:
      case 18:
      case 21:
        v41 = v21;
        uint64_t v42 = ((void (**)(void, NSObject *))v31)[2](v31, v41);
        if (v42) {
          goto LABEL_57;
        }
        v43 = v107;

        ((void (**)(void, NSObject *))v31)[2](v31, v43);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        v41 = v43;
        if (v32) {
          goto LABEL_58;
        }
        goto LABEL_55;
      case 1:
      case 2:
      case 7:
      case 13:
      case 14:
      case 15:
      case 16:
      case 19:
      case 22:
        goto LABEL_18;
      case 3:
        v46 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v20;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Will fetch image for calendar event (isDashboardWidget:%d)", buf, 8u);
        }

        v39 = (void (*)(void))v31[2];
        goto LABEL_19;
      case 8:
      case 12:
        if (v20)
        {
LABEL_18:
          v39 = (void (*)(void))v38[2];
LABEL_19:
          uint64_t v40 = v39();
          if (v40)
          {
LABEL_20:
            id v32 = (id)v40;
            break;
          }
          goto LABEL_56;
        }
        v44 = v22;
        v41 = v44;
        if (!v44) {
          goto LABEL_52;
        }
        if ([v44 isEqualToString:@"com.apple.siri.homepod"])
        {
          ((void (**)(void, id))v31)[2](v31, v21);
        }
        else
        {
          v101 = +[UIScreen mainScreen];
          [v101 scale];
          +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v41, 2);
          id v32 = (id)objc_claimAutoreleasedReturnValue();

          if (v32) {
            goto LABEL_58;
          }
LABEL_52:
          ((void (**)(void, id))v31)[2](v31, v107);
        v102 = };
        if (!v102) {
          goto LABEL_55;
        }
        id v32 = v102;

        goto LABEL_58;
      case 9:
      case 20:
        if (v20) {
          goto LABEL_56;
        }
        v41 = v22;
        if (!v41) {
          goto LABEL_55;
        }
        v45 = +[UIScreen mainScreen];
        [v45 scale];
        +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v41, 2);
        id v32 = (id)objc_claimAutoreleasedReturnValue();

        if (!v32) {
          goto LABEL_55;
        }
        goto LABEL_58;
      case 11:
        uint64_t v40 = +[UIImage imageNamed:@"recentroute"];
        if (!v40) {
          goto LABEL_56;
        }
        goto LABEL_20;
      case 23:
        v47 = +[UIColor whiteColor];
        v115[0] = v47;
        +[UIColor blackColor];
        v49 = v48 = v24;
        v115[1] = v49;
        v50 = +[NSArray arrayWithObjects:v115 count:2];
        v51 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v50];
        v52 = +[UIImage systemImageNamed:@"shippingbox.circle.fill" withConfiguration:v51];

        v24 = v48;
        if (!v52) {
          goto LABEL_56;
        }
        int BOOL = GEOConfigGetBOOL();
        if (v107
          && BOOL
          && (+[GEOFeatureStyleAttributes addressMarkerStyleAttributes], id v54 = (id)objc_claimAutoreleasedReturnValue(), v54, v54 != v107)&& (((void (**)(void, id))v31)[2](v31, v107), (v55 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v56 = (void *)v55;
          [v52 size];
          double v58 = v57 * 0.5;
          [v52 size];
          double v60 = v59 * 0.5;
          id v61 = v52;
          id v62 = v56;
          id v63 = objc_alloc((Class)UIGraphicsImageRenderer);
          [v61 size];
          double v65 = v64 + 0.0;
          [v61 size];
          id v67 = [v63 initWithSize:v65, v66 + 0.0];
          *(void *)buf = _NSConcreteStackBlock;
          uint64_t v117 = 3221225472;
          v118 = sub_100A953D0;
          v119 = &unk_1012F3A58;
          id v120 = v61;
          id v121 = v62;
          double v122 = v58;
          double v123 = v60;
          id v68 = v62;
          v41 = v61;
          id v32 = [v67 imageWithActions:buf];

          v24 = v48;
        }
        else
        {
          id v100 = objc_alloc((Class)UIGraphicsImageRenderer);
          [v52 size];
          id v68 = [v100 initWithSize:];
          v108[0] = _NSConcreteStackBlock;
          v108[1] = 3221225472;
          v108[2] = sub_100A953BC;
          v108[3] = &unk_1012ED568;
          id v109 = v52;
          v41 = [v68 imageWithActions:v108];

          id v32 = v41;
        }

        goto LABEL_58;
      case 24:
        v104 = v24;
        [v24 avatarImageWithSize:a13 scale:128.0 rightToLeft:128.0];
        id v69 = (id)objc_claimAutoreleasedReturnValue();
        v70 = +[UIColor systemWhiteColor];
        v125[0] = v70;
        v71 = +[UIColor systemGreenColor];
        v125[1] = v71;
        v72 = +[NSArray arrayWithObjects:v125 count:2];
        v106 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v72];

        v73 = +[UIImage systemImageNamed:@"location.circle.fill" withConfiguration:v106];
        id v74 = [objc_alloc((Class)UIImageView) initWithImage:v73];
        v75 = [v74 layer];
        [v75 setBorderWidth:1.0];

        id v76 = +[UIColor tertiarySystemBackgroundColor];
        id v77 = [v76 CGColor];
        v78 = [v74 layer];
        [v78 setBackgroundColor:v77];

        id v79 = +[UIColor tertiarySystemBackgroundColor];
        id v80 = [v79 CGColor];
        v81 = [v74 layer];
        [v81 setBorderColor:v80];

        [v73 size];
        double v83 = v82 * 0.5;
        v84 = [v74 layer];
        [v84 setCornerRadius:v83];

        v85 = [v74 layer];
        [v85 setMasksToBounds:1];

        id v86 = objc_alloc((Class)UIGraphicsImageRenderer);
        [v73 size];
        id v87 = [v86 initWithSize:];
        v113[0] = _NSConcreteStackBlock;
        v113[1] = 3221225472;
        v113[2] = sub_100A95458;
        v113[3] = &unk_1012ED568;
        id v114 = v74;
        id v105 = v74;
        v88 = [v87 imageWithActions:v113];

        [v69 size];
        double v90 = v89 * 0.5;
        [v69 size];
        double v92 = v90 + v91 * 0.5 * 0.707106781 + -40.0;
        [v69 size];
        double v94 = v93 * 0.5;
        [v69 size];
        double v96 = v94 + v95 * 0.5 * 0.707106781 + -40.0;
        id v97 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v92 + 80.0, v96 + 80.0];
        *(void *)buf = _NSConcreteStackBlock;
        uint64_t v117 = 3221225472;
        v118 = sub_100A954C8;
        v119 = &unk_101316148;
        double v122 = v92;
        double v123 = v96;
        id v120 = v69;
        id v121 = v88;
        uint64_t v124 = 0x4054000000000000;
        id v98 = v88;
        id v99 = v69;
        id v32 = [v97 imageWithActions:buf];

        if (v32)
        {
          v24 = v104;
        }
        else
        {
          v41 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "Unable to get an image from the Monogrammer. Showing red pin. This should never happen.", buf, 2u);
          }
          v24 = v104;
LABEL_55:

LABEL_56:
          v41 = +[GEOFeatureStyleAttributes markerStyleAttributes];
          uint64_t v42 = ((void (**)(void, NSObject *))v31)[2](v31, v41);
LABEL_57:
          id v32 = (id)v42;
LABEL_58:
        }
        break;
      default:
        goto LABEL_56;
    }
LABEL_59:

    v31 = (void (**)(void, void))v32;
  }
LABEL_60:

  return v31;
}

- (int)proactiveItemType
{
  unint64_t v2 = (unint64_t)[(MapsSuggestionsEntry *)self type];
  if (v2 > 0x18) {
    return 0;
  }
  else {
    return dword_100F6FA00[v2];
  }
}

- (NSString)analyticsGrouping
{
  id v2 = [(MapsSuggestionsEntry *)self type];
  result = (NSString *)@"AppConnections";
  switch((unint64_t)v2)
  {
    case 0uLL:
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
    case 0x11uLL:
    case 0x14uLL:
      result = (NSString *)@"Other";
      break;
    case 1uLL:
    case 2uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x16uLL:
      result = (NSString *)@"UserDefined";
      break;
    case 3uLL:
    case 8uLL:
      result = (NSString *)@"Strong Signals";
      break;
    case 4uLL:
    case 7uLL:
    case 0x15uLL:
      result = (NSString *)@"UserBehavior";
      break;
    case 5uLL:
    case 0xBuLL:
      result = (NSString *)@"MapsAppActions";
      break;
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x17uLL:
      result = (NSString *)@"Bookings";
      break;
    case 0x18uLL:
      if (isLikelyMeetupThroughMessages())
      {
        result = (NSString *)@"BehaviorPrediction_Directions_Messages";
      }
      else if (isLikelyMeetupThroughFindMy())
      {
        result = (NSString *)@"BehaviorPrediction_Directions_FindMy";
      }
      else if (isRecentlyShared())
      {
        result = (NSString *)@"BehaviorPrediction_RecentlyShared";
      }
      else
      {
        result = (NSString *)@"Other";
      }
      break;
    default:
      return result;
  }
  return result;
}

- (id)sharingContacts
{
  v3 = [(MapsSuggestionsEntry *)self dataForKey:@"MapsSuggestionsResumeRouteRouteSharedETAData"];
  if (v3
    && (+[MSPSharedTripService sharedInstance],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 contactsFromArchivedTripSharingState:v3],
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    id v6 = v5;
    id v7 = v6;
  }
  else
  {
    v8 = [(MapsSuggestionsEntry *)self arrayForKey:@"MapsSuggestionSharedETAHandlesFromFavorite"];
    if (v8)
    {
      id v6 = +[MSPSharedTripContact contactsFromHandles:v8];
    }
    else
    {
      id v6 = 0;
    }
    v9 = &__NSArray0__struct;
    if (v6) {
      v9 = v6;
    }
    id v7 = v9;
  }

  return v7;
}

- (void)updateModel:(id)a3
{
  id v22 = a3;
  v4 = +[NSSet setWithArray:&off_1013AD8A8];
  id v5 = +[NSNumber numberWithBool:0];
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v6 objectForKey:@"__internal__CarMapsSuggestionsEntryDecoratedTitle"];

  if (v7) {
    v8 = v7;
  }
  else {
    v8 = v5;
  }
  id v9 = v8;

  unsigned int v10 = [v9 BOOLValue];
  if (v10)
  {
    uint64_t v11 = +[NSSet setWithArray:&off_1013AD8C0];

    v4 = (void *)v11;
  }
  if ([(MapsSuggestionsEntry *)self wasEverOneOfTypes:v4])
  {
    v12 = [(MapsSuggestionsEntry *)self title];
  }
  else
  {
    v12 = [(MapsSuggestionsEntry *)self stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
    if (![v12 length])
    {
      uint64_t v13 = [(MapsSuggestionsEntry *)self undecoratedTitle];

      v12 = (void *)v13;
    }
  }
  [v22 setFirstLine:v12];

  BOOL v14 = [(MapsSuggestionsEntry *)self MKMapItem];
  if (v14) {
    [v22 setMapItem:v14];
  }
  BOOL v15 = +[NSSet setWithArray:&off_1013AD8D8];
  [v22 observeObject:self forKeyPaths:v15];
  v16 = [v22 mapItem];
  v17 = [v16 _shortAddress];
  [v22 setSecondLine:v17];

  if ([(MapsSuggestionsEntry *)self type] == (id)11)
  {
    v18 = MapsSuggestionsLocalizedResumeRouteString();
    [v22 setSecondLine:v18];
  }
  if ([(MapsSuggestionsEntry *)self type] == (id)10)
  {
    v19 = [(MapsSuggestionsEntry *)self subtitle];
    [v22 setSecondLine:v19];
  }
  [(MapsSuggestionsEntry *)self type];
  BOOL v20 = NSStringFromMapsSuggestionsEntryType();
  id v21 = +[NSString stringWithFormat:@"[MSg %@]", v20];
  [v22 setDebugSubtitle:v21];
}

- (int)engineType
{
  if ([(MapsSuggestionsEntry *)self type] != (id)10) {
    return 0;
  }
  v3 = [(MapsSuggestionsEntry *)self numberForKey:@"MapsSuggestionsCarPlayEnergyTypeKey"];
  int v4 = [v3 intValue];

  return v4;
}

- (BOOL)isHybridEngineType
{
  unsigned int v2 = [(MapsSuggestionsEntry *)self engineType];
  return ((v2 >> 1) & 1) + (v2 & 1) + ((v2 >> 2) & 1) + ((v2 >> 3) & 1) > 1;
}

- (GEOComposedWaypoint)findMyWaypoint
{
  if ([(MapsSuggestionsEntry *)self type] == (id)24
    && [(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsContactLikelyAppleIDKey"]&& [(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsLatitudeKey"]&& [(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsLongitudeKey"])
  {
    v3 = [(MapsSuggestionsEntry *)self numberForKey:@"MapsSuggestionsLatitudeKey"];
    [v3 doubleValue];
    double v5 = v4;
    id v6 = [(MapsSuggestionsEntry *)self numberForKey:@"MapsSuggestionsLongitudeKey"];
    [v6 doubleValue];
    double v8 = v7;

    id v9 = 0;
    if (v8 >= -180.0 && v8 <= 180.0 && v5 >= -90.0 && v5 <= 90.0)
    {
      unsigned int v10 = [(MapsSuggestionsEntry *)self dateForKey:@"MapsSuggestionsContactLocationTimestampKey"];
      id v11 = [objc_alloc((Class)GEOLocation) initWithGEOCoordinate:v5, v8];
      [v10 timeIntervalSinceReferenceDate];
      [v11 setTimestamp:];
      v12 = [(MapsSuggestionsEntry *)self stringForKey:@"MapsSuggestionsContactLikelyAppleIDKey"];
      id v9 = [objc_alloc((Class)GEOComposedWaypoint) initWithLocation:v11 findMyHandleID:v12];
    }
  }
  else
  {
    id v9 = 0;
  }

  return (GEOComposedWaypoint *)v9;
}

- (int)transportType
{
  unsigned int v2 = [(MapsSuggestionsEntry *)self numberForKey:@"MapsSuggestionsTransportTypeKey"];
  v3 = v2;
  if (v2) {
    int v4 = [v2 unsignedIntegerValue];
  }
  else {
    int v4 = 4;
  }

  return v4;
}

- (BOOL)hasVibrantBackground
{
  unsigned int v3 = [(MapsSuggestionsEntry *)self isShortcutForSetup];
  if (v3) {
    LOBYTE(v3) = [(MapsSuggestionsEntry *)self type] != (id)7;
  }
  return v3;
}

- (MKMapItem)MKMapItem
{
  unsigned int v3 = [(MapsSuggestionsEntry *)self geoMapItem];

  if (v3)
  {
    int v4 = objc_getAssociatedObject(self, &unk_100F73598);
    double v5 = objc_getAssociatedObject(self, &unk_100F73599);
    if (v4
      && ([(MapsSuggestionsEntry *)self geoMapItem],
          id v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 isEqual:v5],
          v6,
          v7))
    {
      id v8 = v4;
    }
    else
    {
      id v9 = [(MapsSuggestionsEntry *)self geoMapItem];
      if ([(MapsSuggestionsEntry *)self isShortcut])
      {
        id v10 = [v9 copy];

        id v11 = objc_alloc_init((Class)GEOMapItemStorageUserValues);
        [v10 setUserValues:v11];

        v12 = [(MapsSuggestionsEntry *)self undecoratedTitle];
        uint64_t v13 = [v10 userValues];
        [v13 setName:v12];

        id v9 = v10;
      }
      id v14 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v9 isPlaceHolderPlace:0];

      objc_setAssociatedObject(self, &unk_100F73598, v14, (void *)0x301);
      objc_setAssociatedObject(self, &unk_100F73599, v9, (void *)0x301);
      id v8 = v14;
    }
  }
  else
  {
    id v8 = 0;
  }

  return (MKMapItem *)v8;
}

- (UIImage)icon
{
  unsigned int v3 = [(MapsSuggestionsEntry *)self iconData];

  if (v3)
  {
    int v4 = objc_getAssociatedObject(self, &unk_100F7359A);
    double v5 = objc_getAssociatedObject(self, &unk_100F7359B);
    if (!v4
      || ([(MapsSuggestionsEntry *)self iconData],
          id v6 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v7 = [v6 isEqual:v5],
          v6,
          (v7 & 1) == 0))
    {
      id v8 = [(MapsSuggestionsEntry *)self iconData];
      id v9 = +[UIImage imageWithData:v8];

      objc_setAssociatedObject(self, &unk_100F7359A, v9, (void *)0x301);
      id v10 = [(MapsSuggestionsEntry *)self iconData];
      objc_setAssociatedObject(self, &unk_100F7359B, v10, (void *)0x301);

      int v4 = v9;
    }
    id v11 = v4;
  }
  else
  {
    id v11 = 0;
  }

  return (UIImage *)v11;
}

- (void)setIcon:(id)a3
{
  image = (UIImage *)a3;
  int v4 = objc_getAssociatedObject(self, &unk_100F7359A);
  if (image)
  {
    if (([(UIImage *)image isEqual:v4] & 1) == 0)
    {
      double v5 = UIImagePNGRepresentation(image);
      [(MapsSuggestionsEntry *)self setIconData:v5];

      objc_setAssociatedObject(self, &unk_100F7359A, image, (void *)0x301);
      id v6 = [(MapsSuggestionsEntry *)self iconData];
      objc_setAssociatedObject(self, &unk_100F7359B, v6, (void *)0x301);
    }
  }
  else if (v4)
  {
    objc_setAssociatedObject(self, &unk_100F7359A, 0, (void *)0x301);
    objc_setAssociatedObject(self, &unk_100F7359B, 0, (void *)0x301);
    [(MapsSuggestionsEntry *)self setIconData:0];
  }
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  unint64_t v3 = (unint64_t)[(MapsSuggestionsEntry *)self type];
  if (v3 > 0x18) {
    goto LABEL_8;
  }
  if (((1 << v3) & 0x8018E) == 0)
  {
    if (v3 == 24)
    {
      unsigned __int8 v7 = +[GEOFeatureStyleAttributes sharedLocationStyleAttributes];
      if (v7) {
        goto LABEL_24;
      }
      goto LABEL_3;
    }
LABEL_8:
    id v9 = [(MapsSuggestionsEntry *)self MKMapItem];
    unsigned __int8 v7 = [v9 _styleAttributes];

    if (v7) {
      goto LABEL_24;
    }
  }
LABEL_3:
  id v4 = [(MapsSuggestionsEntry *)self type];
  id v5 = [(MapsSuggestionsEntry *)self uniqueIdentifier];
  id v6 = v5;
  unsigned __int8 v7 = 0;
  switch((unint64_t)v4)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 0xBuLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes markerStyleAttributes];
      goto LABEL_22;
    case 1uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes homeStyleAttributes];
      goto LABEL_22;
    case 2uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes workStyleAttributes];
      goto LABEL_22;
    case 3uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes calendarEventStyleAttributes];
      goto LABEL_22;
    case 7uLL:
    case 0xAuLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes parkedCarStyleAttributes];
      goto LABEL_22;
    case 8uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes restaurantStyleAttributes];
      goto LABEL_22;
    case 0xDuLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes hotelStyleAttributes];
      goto LABEL_22;
    case 0xEuLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes carRentalStyleAttributes];
      goto LABEL_22;
    case 0xFuLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes airportStyleAttributes];
      goto LABEL_22;
    case 0x10uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes ticketedEventStyleAttributes];
      goto LABEL_22;
    case 0x13uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes schoolStyleAttributes];
      goto LABEL_22;
    case 0x16uLL:
      if ([v5 isEqualToString:@"NearbyTransit"])
      {
        uint64_t v8 = +[GEOFeatureStyleAttributes nearbyTransitStyleAttributes];
LABEL_22:
        unsigned __int8 v7 = (void *)v8;
      }
      else
      {
        unsigned __int8 v7 = 0;
      }
LABEL_23:

      break;
    default:
      goto LABEL_23;
  }
LABEL_24:

  return (GEOFeatureStyleAttributes *)v7;
}

- (NSString)poiTitle
{
  unint64_t v3 = (unint64_t)[(MapsSuggestionsEntry *)self type];
  if (v3 > 0x18)
  {
    id v5 = 0;
  }
  else
  {
    if (((1 << v3) & 0x7E96F7) != 0)
    {
      uint64_t v4 = [(MapsSuggestionsEntry *)self undecoratedTitle];
LABEL_4:
      id v5 = (void *)v4;
      goto LABEL_5;
    }
    if (((1 << v3) & 0x1816108) != 0
      && ([(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsEntryTitleNameKey"] & 1) != 0)
    {
      uint64_t v4 = [(MapsSuggestionsEntry *)self stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
      goto LABEL_4;
    }
    unsigned __int8 v7 = [(MapsSuggestionsEntry *)self MKMapItem];
    id v5 = [v7 name];
  }
LABEL_5:

  return (NSString *)v5;
}

- (NSArray)waypoints
{
  unsigned int v2 = self;
  if (self)
  {
    if ([(MapsSuggestionsEntry *)self type] == (id)11)
    {
      unsigned int v2 = [v2 routeRequestStorageForKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"];
    }
    else
    {
      unsigned int v2 = 0;
    }
  }
  unint64_t v3 = [v2 waypoints];

  return (NSArray *)v3;
}

+ (id)archivedDestinationForUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [a1 sharedDefaults];
    id v6 = [v5 dataForKey:@"kSavedMapsCommuteDestinations"];
    *(void *)uint64_t v13 = objc_opt_class();
    *(void *)&v13[8] = objc_opt_class();
    *(void *)&v13[16] = objc_opt_class();
    *(void *)&v13[24] = objc_opt_class();
    unsigned __int8 v7 = +[NSArray arrayWithObjects:v13 count:4];
    uint64_t v8 = +[NSSet setWithArray:](NSSet, "setWithArray:", v7, *(void *)v13, *(void *)&v13[8], *(void *)&v13[16]);

    id v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v6 error:0];
    id v10 = [v9 objectForKeyedSubscript:@"kDestinationsKey"];

    id v11 = [v10 objectForKeyedSubscript:v4];
  }
  else
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t v13 = 136446978;
      *(void *)&v13[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/MapsSuggestionsEntry+DoomExtras.m";
      *(_WORD *)&v13[12] = 1024;
      *(_DWORD *)&v13[14] = 37;
      *(_WORD *)&v13[18] = 2082;
      *(void *)&v13[20] = "+[MapsSuggestionsEntry(DoomExtras) archivedDestinationForUniqueID:]";
      *(_WORD *)&v13[28] = 2082;
      *(void *)&v13[30] = "0u == uniqueID.length";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Desintation ID is nil", v13, 0x26u);
    }
    id v11 = 0;
  }

  return v11;
}

+ (void)removeStaleArchivedDestinations
{
  id v21 = [a1 sharedDefaults];
  uint64_t v2 = [v21 dataForKey:@"kSavedMapsCommuteDestinations"];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  unint64_t v3 = +[NSArray arrayWithObjects:v27 count:4];
  id v4 = +[NSSet setWithArray:v3];

  BOOL v20 = (void *)v2;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v4 fromData:v2 error:0];
  id v6 = [v5 mutableCopy];

  unsigned __int8 v7 = [v6 objectForKeyedSubscript:@"kDatesKey"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"kDestinationsKey"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [v7 allKeys];
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        BOOL v15 = [v7 objectForKeyedSubscript:v14];
        [v15 timeIntervalSinceNow];
        double v17 = -v16;
        GEOConfigGetDouble();
        if (v18 < v17)
        {
          [v7 removeObjectForKey:v14];
          [v8 removeObjectForKey:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  v19 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  [v21 setObject:v19 forKey:@"kSavedMapsCommuteDestinations"];
  [v21 synchronize];
}

- (void)archiveDestination
{
  unint64_t v3 = [(MapsSuggestionsEntry *)self uniqueIdentifier];

  if (v3)
  {
    id v4 = [(id)objc_opt_class() sharedDefaults];
    id v5 = [v4 dataForKey:@"kSavedMapsCommuteDestinations"];
    *(void *)double v18 = objc_opt_class();
    *(void *)&v18[8] = objc_opt_class();
    *(void *)&v18[16] = objc_opt_class();
    *(void *)&v18[24] = objc_opt_class();
    id v6 = +[NSArray arrayWithObjects:v18 count:4];
    unsigned __int8 v7 = +[NSSet setWithArray:](NSSet, "setWithArray:", v6, *(void *)v18, *(void *)&v18[8], *(void *)&v18[16]);

    uint64_t v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v5 error:0];
    id v9 = [v8 mutableCopy];

    id v10 = [v9 objectForKeyedSubscript:@"kDatesKey"];
    id v11 = [v9 objectForKeyedSubscript:@"kDestinationsKey"];
    if (!v9)
    {
      id v9 = (id)objc_opt_new();
      uint64_t v12 = objc_opt_new();

      uint64_t v13 = objc_opt_new();
      [v9 setObject:v12 forKeyedSubscript:@"kDatesKey"];
      [v9 setObject:v13 forKeyedSubscript:@"kDestinationsKey"];
      id v10 = (void *)v12;
      id v11 = (void *)v13;
    }
    uint64_t v14 = [(MapsSuggestionsEntry *)self uniqueIdentifier];
    [v11 setObject:self forKeyedSubscript:v14];

    BOOL v15 = MapsSuggestionsNow();
    double v16 = [(MapsSuggestionsEntry *)self uniqueIdentifier];
    [v10 setObject:v15 forKeyedSubscript:v16];

    double v17 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
    [v4 setObject:v17 forKey:@"kSavedMapsCommuteDestinations"];
    [v4 synchronize];
  }
  else
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)double v18 = 136446978;
      *(void *)&v18[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/MapsSuggestionsEntry+DoomExtras.m";
      *(_WORD *)&v18[12] = 1024;
      *(_DWORD *)&v18[14] = 72;
      *(_WORD *)&v18[18] = 2082;
      *(void *)&v18[20] = "-[MapsSuggestionsEntry(DoomExtras) archiveDestination]";
      *(_WORD *)&v18[28] = 2082;
      *(void *)&v18[30] = "nil == (self.uniqueIdentifier)";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Destination ID is nil", v18, 0x26u);
    }
  }
}

- (id)notificationDetailsWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  GEOConfigGetDouble();
  double v9 = v8;
  id v10 = objc_alloc((Class)NSDate);
  id v11 = MapsSuggestionsNow();
  id v12 = [v10 initWithTimeInterval:v11 sinceDate:v9];

  id v13 = objc_alloc((Class)GEOCommuteNotificationDetails);
  uint64_t v14 = [(MapsSuggestionsEntry *)self uniqueIdentifier];
  id v15 = [v13 initWithTitle:v7 message:v6 commuteDetailsIdentifier:v14 expirationDate:v12 score:1];

  return v15;
}

+ (id)sharedDefaults
{
  if (qword_101610A50 != -1) {
    dispatch_once(&qword_101610A50, &stru_10131AA50);
  }
  uint64_t v2 = (void *)qword_101610A48;

  return v2;
}

+ (id)__debug_fakeHomeEntry
{
  return _[a1 entryFromSerializedBase64String:&cfstr_64Ynbsaxn0mddu hasPrefix:1];
}

@end