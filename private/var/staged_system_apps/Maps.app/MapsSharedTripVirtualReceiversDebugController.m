@interface MapsSharedTripVirtualReceiversDebugController
+ (id)navigationDestinationTitle;
- (void)_addSectionWithTitle:(id)a3 forMapsSharing:(BOOL)a4 defaultName:(id)a5 contactBuilder:(id)a6;
- (void)prepareContent;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MapsSharedTripVirtualReceiversDebugController

+ (id)navigationDestinationTitle
{
  return @"Virtual Receivers";
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MapsSharedTripVirtualReceiversDebugController;
  [(MapsDebugValuesViewController *)&v5 viewWillAppear:a3];
  [(MapsDebugValuesViewController *)self rebuildSections];
  v4 = +[MSPSharedTripService sharedInstance];
  [v4 addSendingObserver:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MapsSharedTripVirtualReceiversDebugController;
  [(MapsSharedTripVirtualReceiversDebugController *)&v5 viewDidDisappear:a3];
  v4 = +[MSPSharedTripService sharedInstance];
  [v4 removeSendingObserver:self];
}

- (void)prepareContent
{
  v23.receiver = self;
  v23.super_class = (Class)MapsSharedTripVirtualReceiversDebugController;
  [(MapsDebugValuesViewController *)&v23 prepareContent];
  if (MSPSharedTripSharingAvailable())
  {
    objc_initWeak(&location, self);
    v2 = +[MSPSharedTripService sharedInstance];
    v3 = [v2 receivers];
    v13 = sub_100099700(v3, &stru_101319D00);

    if ([v13 count])
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v4 = v13;
      id v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v19;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v19 != v6) {
              objc_enumerationMutation(v4);
            }
            v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            v9 = [v8 displayName];
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472;
            v16[2] = sub_100B7D574;
            v16[3] = &unk_101317E08;
            v16[4] = v8;
            objc_copyWeak(&v17, &location);
            id v10 = [(MapsDebugValuesViewController *)self addSectionWithTitle:v9 content:v16];

            objc_destroyWeak(&v17);
          }
          id v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
        }
        while (v5);
      }
    }
    else
    {
      id v12 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Virtual Receivers" content:&stru_101319D20];
    }
    [(MapsSharedTripVirtualReceiversDebugController *)self _addSectionWithTitle:@"Maps", 1, @"Maps Receiver", &stru_101319DB0, v13 forMapsSharing defaultName contactBuilder];
    [(MapsSharedTripVirtualReceiversDebugController *)self _addSectionWithTitle:@"iMessage" forMapsSharing:0 defaultName:@"iMessage Receiver" contactBuilder:&stru_101319DD0];
    [(MapsSharedTripVirtualReceiversDebugController *)self _addSectionWithTitle:@"SMS" forMapsSharing:0 defaultName:@"SMS Receiver" contactBuilder:&stru_101319DF0];
    [(MapsSharedTripVirtualReceiversDebugController *)self _addSectionWithTitle:@"RCS" forMapsSharing:0 defaultName:@"RCS Receiver" contactBuilder:&stru_101319E10];

    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_101319CC0];
  }
}

- (void)_addSectionWithTitle:(id)a3 forMapsSharing:(BOOL)a4 defaultName:(id)a5 contactBuilder:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100B7DD4C;
  v16[3] = &unk_101319F20;
  id v13 = v11;
  id v17 = v13;
  BOOL v20 = a4;
  id v14 = v12;
  id v18 = v14;
  objc_copyWeak(&v19, &location);
  id v15 = [(MapsDebugValuesViewController *)self addSectionWithTitle:v10 content:v16];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

@end