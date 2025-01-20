@interface GEORPProblemStatusResponse
+ (GEORPProblemStatusResponse)problemStatusResponseWithNotificationID:(id)a3;
- (BOOL)canDisplayAdditionalUI;
- (BOOL)getSingleServerSideAlertTitle:(id *)a3 message:(id *)a4 messageIsSameAsNotificationTitle:(BOOL *)a5;
- (BOOL)writeToDisk:(id)a3 error:(id *)a4;
- (void)_displayDedicatedFixedProblemViewController:(id)a3;
- (void)displayAdditionalUIOnViewController:(id)a3;
- (void)getDefaultAlertTitle:(id *)a3 alertMessage:(id *)a4;
@end

@implementation GEORPProblemStatusResponse

- (void)getDefaultAlertTitle:(id *)a3 alertMessage:(id *)a4
{
  if (a3)
  {
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Your Reported Issues [push]" value:@"localized string not found" table:0];

    id v9 = v8;
    *a3 = v9;
  }
  if (a4)
  {
    v54 = a4;
    v57 = +[NSMutableArray array];
    v56 = +[NSMutableArray array];
    v55 = +[NSMutableArray array];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v10 = [(GEORPProblemStatusResponse *)self problemStatus];
    id v11 = [v10 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v59;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v16 = +[MKMapService sharedService];
          v17 = [v15 details];
          id v18 = [v16 mapItemsForPlacesInDetails:v17];

          v19 = [v18 firstObject];
          if (v19)
          {
            [v57 addObject:v19];
            v20 = [v19 name];

            if (v20)
            {
              v21 = [v19 name];
              [v56 addObject:v21];
            }
          }
          if ([v15 hasCreationDate])
          {
            [v15 creationDate];
            CFDateRef v23 = CFDateCreate(kCFAllocatorDefault, v22);
            v24 = +[NSDateFormatter localizedStringFromDate:v23 dateStyle:2 timeStyle:0];
            CFRelease(v23);
            if (v24) {
              [v55 addObject:v24];
            }
          }
          if (a3)
          {
            v25 = [v15 details];
            v26 = [v25 localizedTitle];

            if (v26)
            {
              v27 = [v15 notification];
              *a3 = [v27 localizedTitle];
            }
            v28 = [v15 notification];
            v29 = [v28 localizedText];

            if (v29)
            {
              v37 = [v15 notification];
              id *v54 = [v37 localizedText];

              v30 = v55;
              v36 = v10;
              goto LABEL_45;
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v58 objects:v62 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    v30 = v55;
    if ([v55 count])
    {
      v31 = [v55 objectAtIndexedSubscript:0];
      if ((char *)[v55 count] - 3 > (char *)0xFFFFFFFFFFFFFFFDLL)
      {
        v36 = v31;
      }
      else
      {
        unint64_t v32 = 1;
        do
        {
          v33 = +[NSBundle mainBundle];
          v34 = [v33 localizedStringForKey:@", <date>", @"localized string not found", 0 value table];
          v35 = [v55 objectAtIndexedSubscript:v32];
          v36 = [v31 stringByAppendingFormat:v34, v35];

          ++v32;
          v31 = v36;
        }
        while ((char *)v32 < (char *)[v55 count] - 1);
      }
      if ((unint64_t)[v55 count] > 1)
      {
        v38 = +[NSBundle mainBundle];
        v39 = [v38 localizedStringForKey:@" and <date>" value:@"localized string not found" table:0];
        v40 = [v55 lastObject];
        uint64_t v41 = [v36 stringByAppendingFormat:v39, v40];

        v36 = (void *)v41;
      }
    }
    else
    {
      v36 = 0;
    }
    switch((unint64_t)[v56 count])
    {
      case 0uLL:
        id v42 = [v55 count];
        id v43 = [v57 count];
        if (v42)
        {
          v44 = +[NSBundle mainBundle];
          v45 = v44;
          if ((unint64_t)v43 < 2) {
            CFStringRef v46 = @"The issue reported on <date> has been addressed. [push]";
          }
          else {
            CFStringRef v46 = @"The issues reported on <date> have been addressed. [push]";
          }
          v47 = [v44 localizedStringForKey:v46 value:@"localized string not found" table:0];
          v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v36);
          goto LABEL_43;
        }
        v52 = +[NSBundle mainBundle];
        v45 = v52;
        if ((unint64_t)v43 < 2) {
          CFStringRef v53 = @"The issue reported has been addressed. [push]";
        }
        else {
          CFStringRef v53 = @"The issues reported have been addressed. [push]";
        }
        v50 = [v52 localizedStringForKey:v53 value:@"localized string not found" table:0];
        goto LABEL_44;
      case 1uLL:
        v45 = +[NSBundle mainBundle];
        v47 = [v45 localizedStringForKey:@"The issue report related to <place> has been addressed. [push]" value:@"localized string not found" table:0];
        v48 = [v56 objectAtIndexedSubscript:0];
        v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v48);
        goto LABEL_42;
      case 2uLL:
        v45 = +[NSBundle mainBundle];
        v47 = [v45 localizedStringForKey:@"The issue reports related to <place1> and <place2> have been addressed. [push]" value:@"localized string not found" table:0];
        v48 = [v56 objectAtIndexedSubscript:0];
        v49 = [v56 objectAtIndexedSubscript:1];
        uint64_t v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v48, v49);
        goto LABEL_41;
      case 3uLL:
        v45 = +[NSBundle mainBundle];
        v47 = [v45 localizedStringForKey:@"The issue reports related to <place1>, <place2> and <count> other location have been addressed. [push]", @"localized string not found", 0 value table];
        v48 = [v56 objectAtIndexedSubscript:0];
        v49 = [v56 objectAtIndexedSubscript:1];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v47, v48, v49, 1);
        goto LABEL_40;
      default:
        v45 = +[NSBundle mainBundle];
        v47 = [v45 localizedStringForKey:@"The issue reports related to <place1>, <place2> and <count> other locations have been addressed. [push]", @"localized string not found", 0 value table];
        v48 = [v56 objectAtIndexedSubscript:0];
        v49 = [v56 objectAtIndexedSubscript:1];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v47, v48, v49, (char *)[v56 count] - 2);
        uint64_t v51 = LABEL_40:;
LABEL_41:
        v50 = (void *)v51;

LABEL_42:
LABEL_43:

LABEL_44:
        id v18 = v50;
        id *v54 = v18;
        break;
    }
LABEL_45:
  }
}

- (BOOL)getSingleServerSideAlertTitle:(id *)a3 message:(id *)a4 messageIsSameAsNotificationTitle:(BOOL *)a5
{
  if ([(GEORPProblemStatusResponse *)self problemStatusCount] == (id)1)
  {
    id v9 = [(GEORPProblemStatusResponse *)self problemStatusAtIndex:0];
    v10 = [v9 notification];
    id v11 = [v10 localizedText];

    id v12 = [v11 length];
    BOOL v13 = v12 != 0;
    if (v12)
    {
      if (a3)
      {
        v14 = [v9 notification];
        *a3 = [v14 localizedTitle];
      }
      if (a4) {
        *a4 = v11;
      }
      if (a5)
      {
        v15 = [v9 notification];
        v16 = [v15 localizedText];
        *a5 = [v11 isEqual:v16];
      }
    }
  }
  else
  {
    if (a5) {
      *a5 = 0;
    }
    if (a3) {
      *a3 = 0;
    }
    BOOL v13 = 0;
    if (a4) {
      *a4 = 0;
    }
  }
  return v13;
}

- (BOOL)canDisplayAdditionalUI
{
  return [(GEORPProblemStatusResponse *)self problemStatusCount] == (id)1;
}

- (void)displayAdditionalUIOnViewController:(id)a3
{
  id v4 = a3;
  if ([(GEORPProblemStatusResponse *)self canDisplayAdditionalUI]
    && [(GEORPProblemStatusResponse *)self problemStatusCount] == (id)1)
  {
    [(GEORPProblemStatusResponse *)self _displayDedicatedFixedProblemViewController:v4];
  }
}

- (void)_displayDedicatedFixedProblemViewController:(id)a3
{
  id v4 = a3;
  if (MapsFeature_IsEnabled_RAPSydney())
  {
    v5 = [_TtC4Maps31RAPNotificationDetailsViewModel alloc];
    v6 = [(GEORPProblemStatusResponse *)self problemStatus];
    v7 = [v6 firstObject];
    v8 = [(RAPNotificationDetailsViewModel *)v5 initWithProblemStatus:v7];

    id v9 = [[RAPNotificationDetailsViewController alloc] initWithViewModel:v8 report:0 question:0];
    id v10 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v9];
    [v10 setModalPresentationStyle:2];
    [v4 _maps_topMostPresentViewController:v10 animated:1 completion:0];
  }
  else
  {
    v8 = +[RAPFixedProblemNavigationController fixedProblemNavigationControllerWithProblemStatusResponse:self];
    [(RAPNotificationDetailsViewModel *)v8 setModalPresentationStyle:2];
    objc_initWeak(&location, v8);
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    BOOL v13 = sub_1005C29D4;
    v14 = &unk_1012E6708;
    objc_copyWeak(&v15, &location);
    [(RAPNotificationDetailsViewModel *)v8 setDoneHandler:&v11];
    [v4 _maps_topMostPresentViewController:v8 animated:1 completion:0 v11, v12, v13, v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (BOOL)writeToDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[RAPNotification isValidNotificationID:v6])
  {
    v7 = +[RAPNotification filenameForNotificationID:v6];
    v8 = +[RAPNotification notificationCachePath];
    id v9 = [v8 stringByAppendingPathComponent:v7];

    if (v9)
    {
      id v10 = [(GEORPProblemStatusResponse *)self data];
      unsigned __int8 v11 = [v10 writeToFile:v9 options:1 error:a4];
    }
    else
    {
      if (!a4)
      {
        unsigned __int8 v11 = 0;
        goto LABEL_9;
      }
      id v10 = +[RAPNotification errorDomain];
      +[NSError errorWithDomain:v10 code:-1 userInfo:0];
      unsigned __int8 v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_9:
    goto LABEL_10;
  }
  if (!a4)
  {
    unsigned __int8 v11 = 0;
    goto LABEL_11;
  }
  v7 = +[RAPNotification errorDomain];
  +[NSError errorWithDomain:v7 code:-2 userInfo:0];
  unsigned __int8 v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

LABEL_11:
  return v11;
}

+ (GEORPProblemStatusResponse)problemStatusResponseWithNotificationID:(id)a3
{
  id v3 = a3;
  if (+[RAPNotification isValidNotificationID:v3])
  {
    id v4 = +[RAPNotification filenameForNotificationID:v3];
    v5 = +[RAPNotification notificationCachePath];
    id v6 = [v5 stringByAppendingPathComponent:v4];

    if (v6)
    {
      id v7 = [objc_alloc((Class)NSData) initWithContentsOfFile:v6];
      if (v7) {
        id v8 = [objc_alloc((Class)GEORPProblemStatusResponse) initWithData:v7];
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return (GEORPProblemStatusResponse *)v8;
}

@end