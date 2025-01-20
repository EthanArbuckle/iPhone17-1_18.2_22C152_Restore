@interface UIAlertController
+ (id)_maps_alertControllerForTicketedSegments:(id)a3;
+ (id)_maps_confirmationAlertControllerForBlockingTrip:(id)a3 userInterfaceIdiom:(int64_t)a4 completion:(id)a5;
+ (id)_maps_confirmationAlertControllerForBlockingTripInSummary:(id)a3 userInterfaceIdiom:(int64_t)a4 completion:(id)a5;
+ (id)_maps_confirmationAlertControllerForDeletingCollections:(id)a3 userInterfaceIdiom:(int64_t)a4 completion:(id)a5;
+ (id)clusteredVehiclesSelectionAlertControllerForClusteredSegment:(id)a3 completion:(id)a4;
@end

@implementation UIAlertController

+ (id)_maps_confirmationAlertControllerForBlockingTripInSummary:(id)a3 userInterfaceIdiom:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = [a3 sharedTrips];
  v10 = [v9 firstObject];

  v11 = [a1 _maps_confirmationAlertControllerForBlockingTrip:v10 userInterfaceIdiom:a4 completion:v8];

  return v11;
}

+ (id)_maps_confirmationAlertControllerForBlockingTrip:(id)a3 userInterfaceIdiom:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"[Share ETA] Alert's title when blocking a trip" value:@"localized string not found" table:0];
  v11 = [v8 senderName];

  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);

  v13 = +[UIAlertController alertControllerWithTitle:v12 message:0 preferredStyle:a4 == 5];
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"[Share ETA] Block alert's confirm button title" value:@"localized string not found" table:0];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1003FD1A4;
  v26[3] = &unk_1012E6E08;
  id v16 = v7;
  id v27 = v16;
  v17 = +[UIAlertAction actionWithTitle:v15 style:2 handler:v26];

  [v17 setAccessibilityIdentifier:@"SharedTripBlockAction"];
  [v13 addAction:v17];
  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"[Share ETA] Block alert's cancel button title" value:@"localized string not found" table:0];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1003FD1B8;
  v24[3] = &unk_1012E6E08;
  id v25 = v16;
  id v20 = v16;
  v21 = +[UIAlertAction actionWithTitle:v19 style:1 handler:v24];

  [v21 setAccessibilityIdentifier:@"SharedTripCancelAction"];
  [v13 addAction:v21];
  [v13 setPreferredAction:v21];
  v22 = [v13 view];
  [v22 setAccessibilityIdentifier:@"SharedTripDeleteAlert"];

  return v13;
}

+ (id)clusteredVehiclesSelectionAlertControllerForClusteredSegment:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Transit_Clustered_Vehicle_Action_Sheet_Cancel" value:@"localized string not found" table:0];
  v10 = +[UIAlertAction _actionWithTitle:v9 image:0 style:1 handler:0 shouldDismissHandler:&stru_1012E9D40];

  [v7 addAction:v10];
  v11 = [v5 clusteredRouteVehicleInfoItems];
  id v12 = [v11 count];
  id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];
  id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];
  id v15 = objc_alloc_init((Class)NSMutableArray);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0x7FFFFFFFFFFFFFFFLL;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10041F594;
  v30[3] = &unk_1012E9D90;
  id v16 = v13;
  id v31 = v16;
  id v17 = v14;
  id v32 = v17;
  id v18 = v15;
  id v33 = v18;
  id v19 = v5;
  id v34 = v19;
  id v20 = v6;
  id v36 = v20;
  id v21 = v7;
  id v35 = v21;
  v37 = v38;
  [v11 enumerateObjectsUsingBlock:v30];
  v22 = +[UIAlertAction _maps_alertActionsForTransitLinesWithNames:v16 artworks:v17 selectionHandlers:v18];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10041F8F8;
  v27[3] = &unk_1012E9DB8;
  v29 = v38;
  id v23 = v21;
  id v28 = v23;
  [v22 enumerateObjectsUsingBlock:v27];
  v24 = v28;
  id v25 = v23;

  _Block_object_dispose(v38, 8);

  return v25;
}

+ (id)_maps_alertControllerForTicketedSegments:(id)a3
{
  id v3 = a3;
  v4 = +[MKMapService sharedService];
  [v4 captureUserAction:7014 onTarget:606 eventValue:0];

  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"Transit_Get_Tickets_Action_Sheet_Title" value:@"localized string not found" table:0];
  id v7 = +[UIAlertController alertControllerWithTitle:v6 message:0 preferredStyle:0];

  id v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Transit_Get_Tickets_Action_Sheet_Cancel" value:@"localized string not found" table:0];
  uint64_t v10 = +[UIAlertAction _actionWithTitle:v9 image:0 style:1 handler:0 shouldDismissHandler:&stru_1012FFDF0];

  id v27 = (void *)v10;
  [v7 addAction:v10];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  id v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v16 = [v15 ticketingUrl];
        id v17 = +[NSCharacterSet URLQueryAllowedCharacterSet];
        id v18 = [v16 stringByAddingPercentEncodingWithAllowedCharacters:v17];

        id v19 = +[NSURL URLWithString:v18];
        uint64_t v20 = [v15 segmentName];
        id v21 = (void *)v20;
        if (v20) {
          CFStringRef v22 = (const __CFString *)v20;
        }
        else {
          CFStringRef v22 = &stru_101324E70;
        }
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1008E28D4;
        v29[3] = &unk_1012E9640;
        id v30 = v18;
        id v31 = v19;
        id v23 = v19;
        id v24 = v18;
        id v25 = +[UIAlertAction actionWithTitle:v22 style:0 handler:v29];

        [v7 addAction:v25];
      }
      id v12 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
  }

  return v7;
}

+ (id)_maps_confirmationAlertControllerForDeletingCollections:(id)a3 userInterfaceIdiom:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [v8 count];
  uint64_t v10 = +[NSBundle mainBundle];
  id v11 = v10;
  if (v9 == (id)1)
  {
    id v12 = [v10 localizedStringForKey:@"[Collections] Alert's title when deleting a guide" value:@"localized string not found" table:0];
    uint64_t v13 = [v8 firstObject];

    uint64_t v14 = [v13 title];
    id v15 = (void *)v14;
    CFStringRef v16 = &stru_101324E70;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v16);

    id v18 = 0;
  }
  else
  {
    id v19 = [v10 localizedStringForKey:@"[Collections] Alert's title when deleting guides" value:@"localized string not found" table:0];
    id v17 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, [v8 count]);

    id v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"[Collections] Alert's subtitle when deleting guides" value:@"localized string not found" table:0];
    id v20 = [v8 count];

    id v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v20);
  }

  id v21 = +[UIAlertController alertControllerWithTitle:v17 message:v18 preferredStyle:a4 == 5];
  CFStringRef v22 = +[NSBundle mainBundle];
  id v23 = [v22 localizedStringForKey:@"[Collection] Alert's delete button title" value:@"localized string not found" table:0];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100A8A578;
  v34[3] = &unk_1012E6E08;
  id v24 = v7;
  id v35 = v24;
  id v25 = +[UIAlertAction actionWithTitle:v23 style:2 handler:v34];

  [v25 setAccessibilityIdentifier:@"CollectionDeleteAction"];
  [v21 addAction:v25];
  v26 = +[NSBundle mainBundle];
  id v27 = [v26 localizedStringForKey:@"[Collection] Alert's cancel button title" value:@"localized string not found" table:0];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100A8A58C;
  v32[3] = &unk_1012E6E08;
  id v33 = v24;
  id v28 = v24;
  v29 = +[UIAlertAction actionWithTitle:v27 style:1 handler:v32];

  [v29 setAccessibilityIdentifier:@"CollectionCancelAction"];
  [v21 addAction:v29];
  [v21 setPreferredAction:v29];
  id v30 = [v21 view];
  [v30 setAccessibilityIdentifier:@"CollectionDeleteAlert"];

  return v21;
}

@end