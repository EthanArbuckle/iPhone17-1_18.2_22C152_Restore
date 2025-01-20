@interface MapsDragDestinationHandler
- (BOOL)_handleString:(id)a3 nearCoordinate:(CLLocationCoordinate2D)a4;
- (BOOL)allowsSameSceneDrops;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)handleCalendarEvents:(id)a3;
- (BOOL)handleMapItems:(id)a3;
- (BOOL)handleStrings:(id)a3;
- (BOOL)handleURLs:(id)a3;
- (BOOL)handleVCards:(id)a3;
- (MapsDragDestinationHandler)init;
- (MapsDragDestinationHandlerDelegate)delegate;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (void)beginDrop:(id)a3;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)endDrop:(id)a3;
- (void)performDrop:(id)a3 finishingAtLocation:(CGPoint)a4 inView:(id)a5;
- (void)setAllowsSameSceneDrops:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MapsDragDestinationHandler

- (MapsDragDestinationHandler)init
{
  v13.receiver = self;
  v13.super_class = (Class)MapsDragDestinationHandler;
  v2 = [(MapsDragDestinationHandler *)&v13 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    v4 = +[MKMapItem readableTypeIdentifiersForItemProvider];
    [v3 addObjectsFromArray:v4];

    v5 = +[MapsDropVCardReader readableTypeIdentifiersForItemProvider];
    [v3 addObjectsFromArray:v5];

    v6 = +[MapsDropCalendarEventReader readableTypeIdentifiersForItemProvider];
    [v3 addObjectsFromArray:v6];

    v7 = +[NSURL readableTypeIdentifiersForItemProvider];
    [v3 addObjectsFromArray:v7];

    v8 = +[NSString readableTypeIdentifiersForItemProvider];
    [v3 addObjectsFromArray:v8];

    v9 = [UTTypeVCard identifier];
    [v3 addObject:v9];

    v10 = (NSArray *)[v3 copy];
    validDropTypes = v2->_validDropTypes;
    v2->_validDropTypes = v10;
  }
  return v2;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[UIApplication sharedMapsDelegate];
  v9 = [v8 chromeViewController];
  v10 = [v9 topIOSBasedContext];
  v11 = [v8 appCoordinator];
  v12 = [v11 baseModeController];

  if (v10 == v12)
  {
    v14 = [v7 localDragSession];

    v15 = [v7 localDragSession];
    v16 = [v15 localContext];

    if (v16)
    {
      v17 = [v6 view];
      v18 = [v17 window];
      v19 = [v18 windowScene];
      v20 = [v16 windowScene];
      BOOL v21 = v19 != v20;
    }
    else
    {
      BOOL v21 = 0;
    }
    if ([(MapsDragDestinationHandler *)self allowsSameSceneDrops] || !v14 || v21) {
      unsigned __int8 v13 = [v7 hasItemsConformingToTypeIdentifiers:self->_validDropTypes];
    }
    else {
      unsigned __int8 v13 = 0;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  v4 = +[UIApplication sharedMapsDelegate];
  v5 = [v4 chromeViewController];
  id v6 = [v5 topIOSBasedContext];
  id v7 = [v4 appCoordinator];
  v8 = [v7 baseModeController];
  BOOL v9 = v6 == v8;

  id v10 = [objc_alloc((Class)UIDropProposal) initWithDropOperation:2 * v9];

  return v10;
}

- (void)beginDrop:(id)a3
{
  v4 = (OS_dispatch_group *)dispatch_group_create();
  analyticsGroup = self->_analyticsGroup;
  self->_analyticsGroup = v4;

  id v6 = +[MKMapService sharedService];
  [v6 captureUserAction:17004 onTarget:0 eventValue:0 placeActionDetails:0];
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 view];
  [v6 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  id v13 = [v7 view];

  -[MapsDragDestinationHandler performDrop:finishingAtLocation:inView:](self, "performDrop:finishingAtLocation:inView:", v6, v13, v10, v12);
}

- (void)performDrop:(id)a3 finishingAtLocation:(CGPoint)a4 inView:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v9 = a3;
  id v10 = a5;
  analyticsGroup = self->_analyticsGroup;
  if (analyticsGroup)
  {
    self->_dropLocation.CGFloat x = x;
    self->_dropLocation.CGFloat y = y;
    self->_dropConcluded = 1;
    double v12 = analyticsGroup;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3032000000;
    v71[3] = sub_100103DCC;
    v71[4] = sub_100104770;
    id v72 = 0;
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x3032000000;
    v69[3] = sub_100103DCC;
    v69[4] = sub_100104770;
    id v70 = 0;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2020000000;
    char v68 = 0;
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x3032000000;
    v65[3] = sub_100103DCC;
    v65[4] = sub_100104770;
    id v66 = 0;
    id v13 = dispatch_group_create();
    if ([v9 canLoadObjectsOfClass:objc_opt_class()])
    {
      dispatch_group_enter(v13);
      dispatch_group_enter(v12);
      uint64_t v14 = objc_opt_class();
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1005E6748;
      v59[3] = &unk_1012F19F8;
      v62 = v67;
      v59[4] = self;
      v63 = v71;
      v64 = v69;
      v60 = v13;
      v61 = v12;
      id v15 = [v9 loadObjectsOfClass:v14 completion:v59];
    }
    v16 = dispatch_group_create();
    if ([v9 canLoadObjectsOfClass:objc_opt_class()])
    {
      dispatch_group_enter(v16);
      dispatch_group_enter(v12);
      uint64_t v17 = objc_opt_class();
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1005E681C;
      v51[3] = &unk_1012F19A8;
      v52 = v13;
      v53 = self;
      v56 = v67;
      v57 = v69;
      v58 = v65;
      v54 = v16;
      v55 = v12;
      id v18 = [v9 loadObjectsOfClass:v17 completion:v51];
    }
    v19 = dispatch_group_create();
    if ([v9 canLoadObjectsOfClass:objc_opt_class()])
    {
      dispatch_group_enter(v19);
      dispatch_group_enter(v12);
      uint64_t v20 = objc_opt_class();
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1005E69EC;
      v43[3] = &unk_1012F19A8;
      v44 = v16;
      v45 = self;
      v48 = v67;
      v49 = v69;
      v50 = v65;
      v46 = v19;
      v47 = v12;
      id v21 = [v9 loadObjectsOfClass:v20 completion:v43];
    }
    v22 = dispatch_group_create();
    if ([v9 canLoadObjectsOfClass:objc_opt_class()])
    {
      dispatch_group_enter(v22);
      dispatch_group_enter(v12);
      uint64_t v23 = objc_opt_class();
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1005E6BB8;
      v35[3] = &unk_1012F19A8;
      v36 = v19;
      v37 = self;
      v40 = v67;
      v41 = v69;
      v42 = v65;
      v38 = v22;
      v39 = v12;
      id v24 = [v9 loadObjectsOfClass:v23 completion:v35];
    }
    if ([v9 canLoadObjectsOfClass:objc_opt_class()])
    {
      dispatch_group_enter(v12);
      uint64_t v25 = objc_opt_class();
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1005E6D88;
      v28[3] = &unk_1012F19F8;
      v32 = v67;
      v33 = v65;
      v29 = v22;
      v30 = self;
      v34 = v69;
      v31 = v12;
      id v26 = [v9 loadObjectsOfClass:v25 completion:v28];
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1005E6EF8;
    v27[3] = &unk_1012F1A20;
    v27[4] = v65;
    v27[5] = v67;
    v27[6] = v69;
    v27[7] = v71;
    dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, v27);

    _Block_object_dispose(v65, 8);
    _Block_object_dispose(v67, 8);
    _Block_object_dispose(v69, 8);

    _Block_object_dispose(v71, 8);
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
}

- (void)endDrop:(id)a3
{
  id v6 = a3;
  if (!self->_dropConcluded)
  {
    analyticsGroup = self->_analyticsGroup;
    if (analyticsGroup) {
      dispatch_group_notify(analyticsGroup, (dispatch_queue_t)&_dispatch_main_q, &stru_1012F1A40);
    }
  }
  self->_dropLocation = CGPointZero;
  self->_dropConcluded = 0;
  v5 = self->_analyticsGroup;
  self->_analyticsGroup = 0;
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  return 0;
}

- (BOOL)handleMapItems:(id)a3
{
  v4 = [a3 firstObject];
  if (v4)
  {
    v5 = [(MapsDragDestinationHandler *)self delegate];
    [v5 mapsDragDestinationHandler:self didReceiveMapItem:v4];
  }
  return v4 != 0;
}

- (BOOL)handleVCards:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) contacts:v14];
        id v10 = [v9 firstObject];

        if (v10)
        {
          double v12 = [(MapsDragDestinationHandler *)self delegate];
          unsigned __int8 v11 = [v12 mapsDragDestinationHandler:self didReceiveVCard:v10];

          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)handleCalendarEvents:(id)a3
{
  id v4 = a3;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1005E7868;
  v61[3] = &unk_1012F1A68;
  v61[4] = self;
  id v5 = objc_retainBlock(v61);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v6 = v4;
  id v41 = [v6 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v41)
  {
    v39 = self;
    uint64_t v7 = *(void *)v58;
    double longitude = kCLLocationCoordinate2DInvalid.longitude;
    v46 = (uint64_t (**)(void, id))v5;
    v44 = v6;
    uint64_t v40 = *(void *)v58;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v58 != v7) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v57 + 1) + 8 * v9);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        v42 = v10;
        uint64_t v43 = v9;
        unsigned __int8 v11 = [v10 calendar];
        double v12 = [v11 components];

        id obj = v12;
        id v48 = [v12 countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (v48)
        {
          uint64_t v13 = *(void *)v54;
          uint64_t v45 = *(void *)v54;
          do
          {
            long long v14 = 0;
            do
            {
              if (*(void *)v54 != v13) {
                objc_enumerationMutation(obj);
              }
              long long v15 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v14);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v16 = v15;
                long long v17 = [v16 x_apple_activity];
                id v18 = [v17 firstObject];

                if (v18)
                {
                  id v19 = [v18 value];
                  if (v19
                    && (+[_MKURLParser isValidMapURL:v19] & 1) != 0)
                  {
                    id v63 = v19;
                    v37 = +[NSArray arrayWithObjects:&v63 count:1];
                    [(MapsDragDestinationHandler *)v39 handleURLs:v37];
                    goto LABEL_46;
                  }
                }
                long long v51 = 0u;
                long long v52 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                uint64_t v20 = [v16 components];
                id v21 = [v20 countByEnumeratingWithState:&v49 objects:v62 count:16];
                if (v21)
                {
                  id v22 = v21;
                  uint64_t v23 = *(void *)v50;
LABEL_18:
                  uint64_t v24 = 0;
                  while (1)
                  {
                    if (*(void *)v50 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    uint64_t v25 = *(void **)(*((void *)&v49 + 1) + 8 * v24);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v26 = [v25 x_apple_structured_location];
                      if (v26) {
                        break;
                      }
                    }
                    if (v22 == (id)++v24)
                    {
                      id v22 = [v20 countByEnumeratingWithState:&v49 objects:v62 count:16];
                      if (v22) {
                        goto LABEL_18;
                      }
                      goto LABEL_25;
                    }
                  }
                  id v19 = (id)v26;

                  id v5 = v46;
                  if (v46[2](v46, v19)) {
                    goto LABEL_47;
                  }
                }
                else
                {
LABEL_25:

                  v27 = [v16 summary];
                  id v19 = [v27 length];

                  if (v19)
                  {
                    id v19 = [(MapsDragDestinationHandler *)v39 delegate];
                    v37 = [v16 summary];
                    [v19 mapsDragDestinationHandler:v39 didReceiveString:v37 nearCoordinate:kCLLocationCoordinate2DInvalid.latitude longitude];
                    id v5 = v46;
                    goto LABEL_46;
                  }
                  id v5 = v46;
                }

                uint64_t v13 = v45;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_34;
                }
                id v28 = v15;
                id v18 = [v28 x_apple_structured_location];
                if (v18)
                {
                  if (((uint64_t (*)(void *, void *))v5[2])(v5, v18)) {
                    goto LABEL_48;
                  }
                }
                else
                {
                  v29 = [v28 location];
                  id v30 = [v29 length];

                  if (v30)
                  {
                    id v19 = [(MapsDragDestinationHandler *)v39 delegate];
                    v37 = [v28 location];
                    [v19 mapsDragDestinationHandler:v39 didReceiveString:v37 nearCoordinate:CLLocationCoordinate2DMake(kCLLocationCoordinate2DInvalid.latitude, longitude)];
LABEL_46:

LABEL_47:
LABEL_48:

                    BOOL v36 = 1;
                    id v6 = v44;
                    goto LABEL_49;
                  }
                  id v18 = 0;
                }
              }

LABEL_34:
              long long v14 = (char *)v14 + 1;
            }
            while (v14 != v48);
            id v31 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
            id v48 = v31;
          }
          while (v31);
        }

        v32 = [v42 data];
        id v33 = objc_alloc((Class)NSString);
        v34 = [v42 data];
        id v35 = [v33 initWithData:v34 encoding:4];
        NSLog(@"No calendar data was found in this .ics data:\n%@\n%@", v32, v35);

        id v6 = v44;
        uint64_t v9 = v43 + 1;
        uint64_t v7 = v40;
      }
      while ((id)(v43 + 1) != v41);
      BOOL v36 = 0;
      id v41 = [v44 countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (!v41) {
        goto LABEL_49;
      }
    }
  }
  BOOL v36 = 0;
LABEL_49:

  return v36;
}

- (BOOL)handleURLs:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(MapsDragDestinationHandler *)self delegate];
        LOBYTE(v9) = [v10 mapsDragDestinationHandler:self didReceiveURL:v9];

        if (v9)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)handleStrings:(id)a3
{
  id v4 = a3;
  uint64_t v31 = 0;
  uint64_t v5 = DDScannerCreate();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v6)
  {
    BOOL v21 = 0;
    goto LABEL_24;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v28;
  double longitude = kCLLocationCoordinate2DInvalid.longitude;
  uint64_t v23 = *(void *)v28;
  uint64_t v24 = v5;
LABEL_3:
  uint64_t v10 = 0;
  id v25 = v7;
  while (1)
  {
    if (*(void *)v28 != v8) {
      objc_enumerationMutation(obj);
    }
    uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * v10);
    if (!v5 || !DDScannerScanString()) {
      goto LABEL_17;
    }
    CFArrayRef v12 = (const __CFArray *)DDScannerCopyResultsWithOptions();
    CFIndex Count = CFArrayGetCount(v12);
    if (Count >= 1) {
      break;
    }
LABEL_16:
    CFRelease(v12);
    uint64_t v8 = v23;
    uint64_t v5 = v24;
    id v7 = v25;
LABEL_17:
    if (-[MapsDragDestinationHandler _handleString:nearCoordinate:](self, "_handleString:nearCoordinate:", v11, kCLLocationCoordinate2DInvalid.latitude, longitude))
    {
      goto LABEL_23;
    }
    if ((id)++v10 == v7)
    {
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      BOOL v21 = 0;
      if (!v7) {
        goto LABEL_24;
      }
      goto LABEL_3;
    }
  }
  CFIndex v14 = Count;
  CFIndex v15 = 0;
  while (1)
  {
    CFArrayGetValueAtIndex(v12, v15);
    long long v16 = DDResultGetMatchedString();
    if (DDResultGetCategory() != 1 || ![v16 length]) {
      goto LABEL_15;
    }
    uint64_t v17 = +[NSURL URLWithString:v16];
    id v18 = (void *)v17;
    if (v17)
    {
      uint64_t v32 = v17;
      id v19 = +[NSArray arrayWithObjects:&v32 count:1];
      unsigned __int8 v20 = [(MapsDragDestinationHandler *)self handleURLs:v19];

      if (v20) {
        break;
      }
    }

LABEL_15:
    if (v14 == ++v15) {
      goto LABEL_16;
    }
  }

  CFRelease(v12);
LABEL_23:
  BOOL v21 = 1;
LABEL_24:

  return v21;
}

- (BOOL)_handleString:(id)a3 nearCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v7 = a3;
  uint64_t v8 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  unint64_t UInteger = GEOConfigGetUInteger();
  uint64_t v10 = [v7 stringByTrimmingCharactersInSet:v8];

  if ((unint64_t)[v10 length] > UInteger)
  {
    id v11 = [v10 rangeOfComposedCharacterSequencesForRange:0];
    uint64_t v13 = [v10 substringWithRange:v11, v12];

    uint64_t v10 = (void *)v13;
  }
  id v14 = [v10 length];
  if (v14)
  {
    CFIndex v15 = [(MapsDragDestinationHandler *)self delegate];
    [v15 mapsDragDestinationHandler:self didReceiveString:v10 nearCoordinate:latitude, longitude];
  }
  return v14 != 0;
}

- (MapsDragDestinationHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsDragDestinationHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowsSameSceneDrops
{
  return self->_allowsSameSceneDrops;
}

- (void)setAllowsSameSceneDrops:(BOOL)a3
{
  self->_allowsSameSceneDrops = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analyticsGroup, 0);

  objc_storeStrong((id *)&self->_validDropTypes, 0);
}

@end