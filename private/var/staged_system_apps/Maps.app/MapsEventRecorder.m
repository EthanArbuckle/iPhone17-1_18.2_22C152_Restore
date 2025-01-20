@interface MapsEventRecorder
+ (BOOL)isRecording;
+ (id)defaultRecorder;
+ (id)initializeDefaultRecorderWithTapToRadar:(BOOL)a3 window:(id)a4;
+ (unint64_t)numberOfTouchesInEvent:(id)a3;
+ (unint64_t)phaseOfEvent:(id)a3;
- (BOOL)recording;
- (BOOL)tapToRadarEnabled;
- (CGRect)windowFrame;
- (NSDate)startDate;
- (NSString)eventLogFilePath;
- (NSString)eventLogMoviePath;
- (NSString)info;
- (UIActivityIndicatorView)loadingIndicator;
- (UIView)navigationBarView;
- (UIWindow)window;
- (id)logMessageForEvent:(id)a3;
- (unint64_t)currentElement;
- (unint64_t)currentPhase;
- (unint64_t)elementTypeInEvent:(id)a3;
- (unint64_t)previousElement;
- (unint64_t)previousPhase;
- (unint64_t)previousTouchCount;
- (unint64_t)touchCount;
- (void)addNavigationBarView;
- (void)attachTapToRadarWithPaths:(id)a3;
- (void)beginRecordingWithCompletion:(id)a3;
- (void)clearDefaultRecorder;
- (void)endRecordingWithCompletion:(id)a3;
- (void)hideLoadingIndicator;
- (void)recordEvent:(id)a3;
- (void)removeNavigationBarView;
- (void)saveVideoFileToPhotoLibraryWithPaths:(id)a3;
- (void)setCurrentElement:(unint64_t)a3;
- (void)setCurrentPhase:(unint64_t)a3;
- (void)setEventLogFilePath:(id)a3;
- (void)setEventLogMoviePath:(id)a3;
- (void)setInfo:(id)a3;
- (void)setLoadingIndicator:(id)a3;
- (void)setNavigationBarView:(id)a3;
- (void)setPreviousElement:(unint64_t)a3;
- (void)setPreviousPhase:(unint64_t)a3;
- (void)setPreviousTouchCount:(unint64_t)a3;
- (void)setRecording:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setTapToRadarEnabled:(BOOL)a3;
- (void)setTouchCount:(unint64_t)a3;
- (void)setWindow:(id)a3;
- (void)setWindowFrame:(CGRect)a3;
- (void)showLoadingIndicator;
@end

@implementation MapsEventRecorder

+ (id)initializeDefaultRecorderWithTapToRadar:(BOOL)a3 window:(id)a4
{
  v4 = (void *)qword_10160FCA0;
  if (!qword_10160FCA0)
  {
    BOOL v5 = a3;
    id v6 = a4;
    v7 = objc_alloc_init(MapsEventRecorder);
    v8 = (void *)qword_10160FCA0;
    qword_10160FCA0 = (uint64_t)v7;

    [(id)qword_10160FCA0 setCurrentElement:24];
    [(id)qword_10160FCA0 setCurrentPhase:3];
    [(id)qword_10160FCA0 setPreviousPhase:3];
    [v6 frame];
    [qword_10160FCA0 setWindowFrame:];
    [(id)qword_10160FCA0 setWindow:v6];

    id v9 = objc_alloc_init((Class)NSDate);
    [(id)qword_10160FCA0 setStartDate:v9];

    [(id)qword_10160FCA0 setRecording:0];
    [(id)qword_10160FCA0 setPreviousTouchCount:0];
    [(id)qword_10160FCA0 setTouchCount:0];
    [(id)qword_10160FCA0 setTapToRadarEnabled:v5];
    if (qword_10160FCA8 != -1) {
      dispatch_once(&qword_10160FCA8, &stru_1012FECE8);
    }
    v4 = (void *)qword_10160FCA0;
  }

  return v4;
}

+ (id)defaultRecorder
{
  return (id)qword_10160FCA0;
}

- (void)clearDefaultRecorder
{
  v2 = (void *)qword_10160FCA0;
  qword_10160FCA0 = 0;
}

+ (BOOL)isRecording
{
  BOOL result = qword_10160FCA0;
  if (qword_10160FCA0) {
    return [(id)qword_10160FCA0 recording];
  }
  return result;
}

- (void)beginRecordingWithCompletion:(id)a3
{
  id v4 = a3;
  [(MapsEventRecorder *)self showLoadingIndicator];
  BOOL v5 = [sub_1008959CC() sharedRecorder];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100895AB0;
  v7[3] = &unk_1012F0BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 startRecordingWithHandler:v7];
}

- (void)endRecordingWithCompletion:(id)a3
{
  id v4 = a3;
  [(MapsEventRecorder *)self showLoadingIndicator];
  BOOL v5 = +[GEOEventRecorderInstrumentation defaultInstrumentation];
  [v5 captureUIEvent:@"<<<<<<<< RECORDING END <<<<<<<<"];

  [(MapsEventRecorder *)self setRecording:0];
  id v6 = [sub_1008959CC() sharedRecorder];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100895C58;
  v8[3] = &unk_1012FED10;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 stopRecordingWithHandler:v8];
}

- (void)attachTapToRadarWithPaths:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v11 = [v10 lastPathComponent];
        v12 = +[NSURL fileURLWithPath:v10];
        v13 = +[MapsRadarFileAttachment attachmentWithFileName:v11 fileURL:v12];
        [v4 addObject:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v7);
  }

  v14 = objc_opt_new();
  [v14 addAttachments:v4];
  v15 = sub_10057637C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self;
    if (!v16)
    {
      v21 = @"<nil>";
      goto LABEL_17;
    }
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      v19 = [(MapsEventRecorder *)v16 performSelector:"accessibilityIdentifier"];
      v20 = v19;
      if (v19 && ![v19 isEqualToString:v18])
      {
        v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

        goto LABEL_15;
      }
    }
    v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_15:

LABEL_17:
    *(_DWORD *)buf = 138543362;
    v29 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR from event recorder", buf, 0xCu);
  }
  v22 = +[MapsRadarController sharedInstance];
  [v22 launchTTRWithRadar:v14];
}

- (void)saveVideoFileToPhotoLibraryWithPaths:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(NSString **)(*((void *)&v9 + 1) + 8 * i);
        if ([(NSString *)v8 containsString:@".mp4"]) {
          UISaveVideoAtPathToSavedPhotosAlbum(v8, 0, 0, 0);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)recordEvent:(id)a3
{
  id v8 = a3;
  if ([(MapsEventRecorder *)self recording])
  {
    [(MapsEventRecorder *)self setInfo:0];
    [(MapsEventRecorder *)self setPreviousPhase:[(MapsEventRecorder *)self currentPhase]];
    [(MapsEventRecorder *)self setCurrentPhase:+[MapsEventRecorder phaseOfEvent:v8]];
    [(MapsEventRecorder *)self setPreviousTouchCount:[(MapsEventRecorder *)self touchCount]];
    [(MapsEventRecorder *)self setTouchCount:+[MapsEventRecorder numberOfTouchesInEvent:v8]];
    [(MapsEventRecorder *)self setPreviousElement:[(MapsEventRecorder *)self currentElement]];
    unint64_t v4 = [(MapsEventRecorder *)self elementTypeInEvent:v8];
    if (v4 != 23) {
      [(MapsEventRecorder *)self setCurrentElement:v4];
    }
    id v5 = [(MapsEventRecorder *)self logMessageForEvent:v8];
    uint64_t v6 = v5;
    if (v5 && ([v5 isEqualToString:&stru_101324E70] & 1) == 0)
    {
      id v7 = +[GEOEventRecorderInstrumentation defaultInstrumentation];
      [v7 captureUIEvent:v6];
    }
  }
}

+ (unint64_t)phaseOfEvent:(id)a3
{
  id v3 = [a3 allTouches];
  unint64_t v4 = [v3 allObjects];
  id v5 = [v4 firstObject];
  unint64_t v6 = (unint64_t)[v5 phase];
  if (v6 > 3) {
    unint64_t v7 = 3;
  }
  else {
    unint64_t v7 = qword_100F72740[v6];
  }

  return v7;
}

- (id)logMessageForEvent:(id)a3
{
  if ((id)[(MapsEventRecorder *)self touchCount] == (id)2
    && (id)[(MapsEventRecorder *)self previousTouchCount] == (id)1)
  {
    unint64_t v4 = @"The user stopped panning and started zooming";
    goto LABEL_59;
  }
  if ((id)[(MapsEventRecorder *)self touchCount] == (id)1
    && (id)[(MapsEventRecorder *)self previousTouchCount] == (id)2)
  {
    unint64_t v4 = @"The user stopped zooming and started panning";
    goto LABEL_59;
  }
  if ([(MapsEventRecorder *)self currentPhase])
  {
    if ((id)[(MapsEventRecorder *)self currentPhase] == (id)1)
    {
      if ((id)[(MapsEventRecorder *)self previousPhase] == (id)2
        && (id)[(MapsEventRecorder *)self previousElement] == (id)13)
      {
        unint64_t v5 = [(MapsEventRecorder *)self touchCount];
        CFStringRef v6 = @"The user began panning";
        CFStringRef v7 = @"The user started zooming";
        goto LABEL_22;
      }
      goto LABEL_56;
    }
    if ((id)[(MapsEventRecorder *)self currentPhase] != (id)2) {
      goto LABEL_56;
    }
    uint64_t v10 = [(MapsEventRecorder *)self currentElement];
    if (v10 > 15)
    {
      if (v10 != 16)
      {
        if (v10 == 18)
        {
          unint64_t v4 = @"The user tapped the compass";
          goto LABEL_59;
        }
        goto LABEL_56;
      }
      long long v12 = [(MapsEventRecorder *)self info];
      +[NSString stringWithFormat:@"The user cleared the text in the search bar that contained the text \"%@\"", v12];
    }
    else
    {
      if (v10 != 6)
      {
        if (v10 == 13)
        {
          unint64_t v5 = [(MapsEventRecorder *)self touchCount];
          CFStringRef v6 = @"The user began touching the map";
          CFStringRef v7 = @"The user began zooming the map";
LABEL_22:
          if (v5 == 2) {
            unint64_t v4 = (__CFString *)v7;
          }
          else {
            unint64_t v4 = (__CFString *)v6;
          }
          goto LABEL_59;
        }
LABEL_56:
        unint64_t v4 = &stru_101324E70;
        goto LABEL_59;
      }
      long long v12 = [(MapsEventRecorder *)self info];
      +[NSString stringWithFormat:@"The user tapped the search bar that currently contains the text \"%@\"", v12];
    }
LABEL_58:
    unint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_59;
  }
  if ((id)[(MapsEventRecorder *)self previousPhase] != (id)1
    || (id)[(MapsEventRecorder *)self previousElement] != (id)13)
  {
    unint64_t v4 = @"The user pressed the current location button";
    switch([(MapsEventRecorder *)self currentElement])
    {
      case 0uLL:
        goto LABEL_59;
      case 1uLL:
      case 2uLL:
        long long v11 = [(MapsEventRecorder *)self info];

        if (!v11) {
          goto LABEL_56;
        }
        long long v12 = [(MapsEventRecorder *)self info];
        +[NSString stringWithFormat:@"The user pressed a button called %@", v12];
        goto LABEL_58;
      case 3uLL:
        v13 = [(MapsEventRecorder *)self info];

        if (!v13) {
          goto LABEL_56;
        }
        long long v12 = [(MapsEventRecorder *)self info];
        +[NSString stringWithFormat:@"The user selected option %@ on the segmented control", v12];
        goto LABEL_58;
      case 4uLL:
        v14 = [(MapsEventRecorder *)self info];

        if (!v14) {
          goto LABEL_56;
        }
        long long v12 = [(MapsEventRecorder *)self info];
        +[NSString stringWithFormat:@"The user tapped a UITableViewCell titled %@", v12];
        goto LABEL_58;
      case 5uLL:
        v15 = [(MapsEventRecorder *)self info];

        if (!v15) {
          goto LABEL_56;
        }
        long long v12 = [(MapsEventRecorder *)self info];
        +[NSString stringWithFormat:@"The user tapped a UISwitch to the %@ state", v12];
        goto LABEL_58;
      case 7uLL:
        unint64_t v4 = @"The user pressed the settings button";
        goto LABEL_59;
      case 8uLL:
        unint64_t v4 = @"The user tapped the share button";
        goto LABEL_59;
      case 9uLL:
        unint64_t v4 = @"The user tapped the route button";
        goto LABEL_59;
      case 0xAuLL:
        unint64_t v4 = @"The user tapped the route button on the pin";
        goto LABEL_59;
      case 0xBuLL:
        unint64_t v4 = @"The user changed the route mode";
        goto LABEL_59;
      case 0xCuLL:
        unint64_t v4 = @"The user tapped more info on the pinned location";
        goto LABEL_59;
      case 0xDuLL:
        unint64_t v4 = @"The user tapped the map";
        goto LABEL_59;
      case 0xEuLL:
        unint64_t v4 = @"The user tapped the details button for the route";
        goto LABEL_59;
      case 0xFuLL:
        unint64_t v4 = @"The user pressed the cancel button in the share menu";
        goto LABEL_59;
      case 0x11uLL:
        uint64_t v16 = [(MapsEventRecorder *)self info];
        if (!v16
          || (v17 = (void *)v16,
              [(MapsEventRecorder *)self info],
              v18 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v19 = [v18 isEqualToString:&stru_101324E70],
              v18,
              v17,
              (v19 & 1) != 0))
        {
          unint64_t v4 = @"The user tapped one of the category buttons";
          goto LABEL_59;
        }
        long long v12 = [(MapsEventRecorder *)self info];
        +[NSString stringWithFormat:@"The user tapped the %@ button", v12];
        break;
      case 0x13uLL:
        unint64_t v4 = @"The user pressed a route option";
        goto LABEL_59;
      case 0x14uLL:
        unint64_t v4 = @"The user pressed the call button";
        goto LABEL_59;
      case 0x15uLL:
        unint64_t v4 = @"The user pressed the address cell";
        goto LABEL_59;
      case 0x16uLL:
        v20 = [(MapsEventRecorder *)self info];

        if (!v20) {
          goto LABEL_56;
        }
        long long v12 = [(MapsEventRecorder *)self info];
        +[NSString stringWithFormat:@"The user tapped a view titled label %@", v12];
        goto LABEL_58;
      default:
        goto LABEL_56;
    }
    goto LABEL_58;
  }
  unint64_t v8 = [(MapsEventRecorder *)self touchCount];
  long long v9 = @"The user finished panning";
  if (v8 == 2) {
    long long v9 = @"The user finished zooming";
  }
  unint64_t v4 = v9;
LABEL_59:

  return v4;
}

- (unint64_t)elementTypeInEvent:(id)a3
{
  unint64_t v4 = [a3 allTouches];
  unint64_t v5 = [v4 allObjects];
  CFStringRef v6 = [v5 firstObject];
  if (![v5 count])
  {
    unint64_t v14 = 23;
    goto LABEL_7;
  }
  CFStringRef v7 = [v6 view];
  unint64_t v8 = [v7 superview];
  long long v9 = [v8 superview];
  uint64_t v10 = (objc_class *)objc_opt_class();
  long long v11 = NSStringFromClass(v10);
  long long v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v82 = self;
      unint64_t v14 = 23;
      if (!v7 || !v11) {
        goto LABEL_5;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 text];
        v17 = uint64_t v16 = v13;
        [(MapsEventRecorder *)v82 setInfo:v17];

        v13 = v16;
        unint64_t v14 = 6;
        goto LABEL_5;
      }
      v76 = v13;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v7;
        unsigned __int8 v19 = [v18 titleForSegmentAtIndex:[v18 selectedSegmentIndex]];

        [(MapsEventRecorder *)v82 setInfo:v19];
        unint64_t v14 = 3;
LABEL_70:
        v13 = v76;
        goto LABEL_5;
      }
      if ([v11 isEqualToString:@"UINavigationButton"])
      {
        id v20 = v7;
        v21 = [v20 title];

        if (v21)
        {
          v22 = [v20 title];
          [(MapsEventRecorder *)v82 setInfo:v22];

          unint64_t v14 = 2;
          goto LABEL_70;
        }
      }
      objc_opt_class();
      v77 = v11;
      v73 = v8;
      if (objc_opt_isKindOfClass())
      {
        id v23 = v7;
        long long v24 = [v23 titleLabel];
        long long v25 = [v24 text];

        if (v25)
        {
          long long v26 = [v23 titleLabel];
          long long v27 = [v26 text];
          [(MapsEventRecorder *)v82 setInfo:v27];

          unint64_t v14 = 1;
          v13 = v76;
LABEL_36:

          goto LABEL_5;
        }
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        v72 = v23;
        id obj = [v23 subviews];
        id v78 = [obj countByEnumeratingWithState:&v95 objects:v102 count:16];
        if (v78)
        {
          uint64_t v28 = *(void *)v96;
          v29 = NSCollectionLayoutEdgeSpacing_ptr;
          while (2)
          {
            for (i = 0; i != v78; i = (char *)i + 1)
            {
              if (*(void *)v96 != v28) {
                objc_enumerationMutation(obj);
              }
              v31 = *(void **)(*((void *)&v95 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v32 = v9;
                uint64_t v33 = v28;
                v34 = v29;
                id v35 = v31;
                v36 = [v35 text];

                if (v36)
                {
                  v37 = [v35 text];
                  [(MapsEventRecorder *)v82 setInfo:v37];

                  unint64_t v14 = 1;
                  v13 = v76;
                  long long v11 = v77;
                  id v23 = v72;
                  long long v9 = v32;
                  goto LABEL_35;
                }

                v29 = v34;
                uint64_t v28 = v33;
                long long v9 = v32;
                unint64_t v8 = v73;
              }
            }
            id v78 = [obj countByEnumeratingWithState:&v95 objects:v102 count:16];
            if (v78) {
              continue;
            }
            break;
          }
        }

        long long v11 = v77;
        if ([v77 isEqualToString:@"ResizableButton"])
        {
          unint64_t v14 = 7;
LABEL_33:
          v13 = v76;
          id v23 = v72;
          goto LABEL_36;
        }
        v13 = v76;
        id v23 = v72;
        if ([v77 isEqualToString:@"DismissSettingsView"])
        {
          unint64_t v14 = 7;
          goto LABEL_36;
        }
        if (([v77 isEqualToString:@"MapsUserTrackingButton"] & 1) != 0
          || ([v77 isEqualToString:@"MapsUserTrackingRoundedButton"] & 1) != 0)
        {
          unint64_t v14 = 0;
          goto LABEL_36;
        }
        if ([v77 isEqualToString:@"MapsLargerHitTargetButton"])
        {
          id v23 = v72;
          [v72 frame];
          double v39 = v38;
          [(MapsEventRecorder *)v82 windowFrame];
          if (v39 >= v40 * 0.5) {
            unint64_t v14 = 8;
          }
          else {
            unint64_t v14 = 9;
          }
          v13 = v76;
          long long v11 = v77;
          goto LABEL_36;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v8 = v73;
          v41 = [v73 text];
          [(MapsEventRecorder *)v82 setInfo:v41];

          unint64_t v14 = 16;
          long long v11 = v77;
          goto LABEL_33;
        }
        if ([v76 isEqualToString:@"MKPlaceDirectionsCell"])
        {
          unint64_t v14 = 19;
          v13 = v76;
          long long v11 = v77;
          id v23 = v72;
LABEL_35:
          unint64_t v8 = v73;
          goto LABEL_36;
        }
        long long v11 = v77;
        unsigned __int8 v42 = [v77 isEqualToString:@"CNTransportButton"];

        unint64_t v8 = v73;
        if (v42)
        {
          unint64_t v14 = 20;
          goto LABEL_70;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id obja = [v7 subviews];
        id v43 = [obja countByEnumeratingWithState:&v91 objects:v101 count:16];
        if (v43)
        {
          id v44 = v43;
          id v79 = *(id *)v92;
          while (2)
          {
            for (j = 0; j != v44; j = (char *)j + 1)
            {
              if (*(id *)v92 != v79) {
                objc_enumerationMutation(obja);
              }
              v46 = *(void **)(*((void *)&v91 + 1) + 8 * (void)j);
              if ([v46 isMemberOfClass:objc_opt_class()])
              {
                id v47 = v46;
                v48 = [v47 text];

                if (v48)
                {
                  v50 = [v47 text];
                  id v51 = [v50 copy];
                  [(MapsEventRecorder *)v82 setInfo:v51];

                  unint64_t v14 = 4;
                  v13 = v76;
                  long long v11 = v77;
                  goto LABEL_5;
                }

                long long v11 = v77;
              }
            }
            id v44 = [obja countByEnumeratingWithState:&v91 objects:v101 count:16];
            if (v44) {
              continue;
            }
            break;
          }
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = v76;
        if ([v11 isEqualToString:@"_MKSmallCalloutPassthroughButton"])
        {
          unint64_t v14 = 12;
        }
        else if ([v11 isEqualToString:@"DirectionsCalloutButton"])
        {
          unint64_t v14 = 10;
        }
        else if ([v11 isEqualToString:@"MKNewAnnotationContainerView"])
        {
          unint64_t v14 = 13;
        }
        else if ([v11 isEqualToString:@"MKCompassView"])
        {
          unint64_t v14 = 18;
        }
        else
        {
          if ([v11 isEqualToString:@"BrowseItemView"])
          {
            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            id v80 = [v7 subviews];
            id v52 = [v80 countByEnumeratingWithState:&v87 objects:v100 count:16];
            if (v52)
            {
              id v53 = v52;
              uint64_t v54 = *(void *)v88;
              while (2)
              {
                for (k = 0; k != v53; k = (char *)k + 1)
                {
                  if (*(void *)v88 != v54) {
                    objc_enumerationMutation(v80);
                  }
                  v56 = *(void **)(*((void *)&v87 + 1) + 8 * (void)k);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v57 = v53;
                    uint64_t v58 = v54;
                    id v59 = v56;
                    v60 = [v59 text];

                    if (v60)
                    {
                      v70 = [v59 text];
                      [(MapsEventRecorder *)v82 setInfo:v70];

                      goto LABEL_106;
                    }

                    uint64_t v54 = v58;
                    id v53 = v57;
                  }
                }
                id v53 = [v80 countByEnumeratingWithState:&v87 objects:v100 count:16];
                if (v53) {
                  continue;
                }
                break;
              }
            }
LABEL_106:

            unint64_t v14 = 17;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v85 = 0u;
              long long v86 = 0u;
              long long v83 = 0u;
              long long v84 = 0u;
              id v81 = [v7 subviews];
              id v61 = [v81 countByEnumeratingWithState:&v83 objects:v99 count:16];
              if (v61)
              {
                id v62 = v61;
                uint64_t v63 = *(void *)v84;
                while (2)
                {
                  for (m = 0; m != v62; m = (char *)m + 1)
                  {
                    if (*(void *)v84 != v63) {
                      objc_enumerationMutation(v81);
                    }
                    v65 = *(void **)(*((void *)&v83 + 1) + 8 * (void)m);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v66 = v62;
                      uint64_t v67 = v63;
                      id v68 = v65;
                      v69 = [v68 text];

                      if (v69)
                      {
                        v71 = [v68 text];
                        [(MapsEventRecorder *)v82 setInfo:v71];

                        unint64_t v14 = 22;
                        goto LABEL_108;
                      }

                      uint64_t v63 = v67;
                      id v62 = v66;
                    }
                  }
                  id v62 = [v81 countByEnumeratingWithState:&v83 objects:v99 count:16];
                  if (v62) {
                    continue;
                  }
                  break;
                }
              }
            }
            unint64_t v14 = 24;
          }
LABEL_108:
          v13 = v76;
          long long v11 = v77;
          unint64_t v8 = v73;
        }
        goto LABEL_5;
      }
      if ([v7 isOn]) {
        CFStringRef v49 = @"on";
      }
      else {
        CFStringRef v49 = @"off";
      }
      [(MapsEventRecorder *)v82 setInfo:v49];
      unint64_t v14 = 5;
      goto LABEL_70;
    }
  }
  unint64_t v14 = 24;
LABEL_5:

LABEL_7:
  return v14;
}

+ (unint64_t)numberOfTouchesInEvent:(id)a3
{
  id v3 = [a3 allTouches];
  unint64_t v4 = [v3 allObjects];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (void)addNavigationBarView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008972E0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)removeNavigationBarView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100897538;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)showLoadingIndicator
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10089770C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)hideLoadingIndicator
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008978C0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);

  return (UIWindow *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (unint64_t)currentElement
{
  return self->_currentElement;
}

- (void)setCurrentElement:(unint64_t)a3
{
  self->_currentElement = a3;
}

- (unint64_t)previousElement
{
  return self->_previousElement;
}

- (void)setPreviousElement:(unint64_t)a3
{
  self->_previousElement = a3;
}

- (unint64_t)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(unint64_t)a3
{
  self->_currentPhase = a3;
}

- (unint64_t)previousPhase
{
  return self->_previousPhase;
}

- (void)setPreviousPhase:(unint64_t)a3
{
  self->_previousPhase = a3;
}

- (CGRect)windowFrame
{
  double x = self->_windowFrame.origin.x;
  double y = self->_windowFrame.origin.y;
  double width = self->_windowFrame.size.width;
  double height = self->_windowFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setWindowFrame:(CGRect)a3
{
  self->_windowFrame = a3;
}

- (unint64_t)previousTouchCount
{
  return self->_previousTouchCount;
}

- (void)setPreviousTouchCount:(unint64_t)a3
{
  self->_previousTouchCount = a3;
}

- (unint64_t)touchCount
{
  return self->_touchCount;
}

- (void)setTouchCount:(unint64_t)a3
{
  self->_touchCount = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)recording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (BOOL)tapToRadarEnabled
{
  return self->_tapToRadarEnabled;
}

- (void)setTapToRadarEnabled:(BOOL)a3
{
  self->_tapToRadarEnabled = a3;
}

- (NSString)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSString)eventLogFilePath
{
  return self->_eventLogFilePath;
}

- (void)setEventLogFilePath:(id)a3
{
}

- (NSString)eventLogMoviePath
{
  return self->_eventLogMoviePath;
}

- (void)setEventLogMoviePath:(id)a3
{
}

- (UIView)navigationBarView
{
  return self->_navigationBarView;
}

- (void)setNavigationBarView:(id)a3
{
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_navigationBarView, 0);
  objc_storeStrong((id *)&self->_eventLogMoviePath, 0);
  objc_storeStrong((id *)&self->_eventLogFilePath, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_destroyWeak((id *)&self->_window);
}

@end