@interface UserProfileLinkGarageProvider
+ (id)sharedInstance;
- (BOOL)hasUnpairedVehicles;
- (GEOObserverHashTable)observers;
- (UserProfileLinkGarageProvider)init;
- (VGVirtualGarage)virtualGarage;
- (id)createUserProfileLink;
- (id)retrieveSubtitleText;
- (int64_t)userProfileLinkType;
- (void)_loadGarage;
- (void)_loadUnpairedVehicles;
- (void)_updateLinkAndNotifyObservers:(BOOL)a3;
- (void)setHasUnpairedVehicles:(BOOL)a3;
- (void)setVirtualGarage:(id)a3;
- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation UserProfileLinkGarageProvider

+ (id)sharedInstance
{
  if (qword_10160EC68 != -1) {
    dispatch_once(&qword_10160EC68, &stru_1012E9538);
  }
  v2 = (void *)qword_10160EC60;

  return v2;
}

- (UserProfileLinkGarageProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)UserProfileLinkGarageProvider;
  v2 = [(UserProfileLinkGarageProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(UserProfileLinkGarageProvider *)v2 _loadGarage];
    uint64_t v4 = +[VGVirtualGarageService sharedService];
    garageService = v3->_garageService;
    v3->_garageService = (VGVirtualGarageService *)v4;

    [(VGVirtualGarageService *)v3->_garageService registerObserver:v3];
  }
  return v3;
}

- (id)createUserProfileLink
{
  v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[User Profile My Vehicles] Vehicles" value:@"localized string not found" table:0];

  v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  v6 = [v5 fontDescriptorWithSymbolicTraits:2];
  objc_super v7 = +[UIFont fontWithDescriptor:v6 size:15.0];

  v8 = +[UIImage systemImageNamed:@"car.fill"];
  v9 = +[UIImageSymbolConfiguration configurationWithFont:v7];
  v10 = [v8 imageWithConfiguration:v9];

  v11 = [[UserProfileLink alloc] initWithTitle:v4 icon:v10];
  newLink = self->_newLink;
  self->_newLink = v11;

  [(UserProfileLink *)self->_newLink setUserProfileLinkType:[(UserProfileLinkGarageProvider *)self userProfileLinkType]];
  v13 = [(UserProfileLinkGarageProvider *)self retrieveSubtitleText];
  [(UserProfileLink *)self->_newLink setSubtitle:v13];

  v14 = self->_newLink;
  return v14;
}

- (int64_t)userProfileLinkType
{
  return 5;
}

- (id)retrieveSubtitleText
{
  if ((MapsFeature_IsEnabled_EVRouting() & 1) != 0 || MapsFeature_IsEnabled_Alberta())
  {
    v3 = [(VGVirtualGarage *)self->_virtualGarage vehicles];
    BOOL v4 = [v3 count] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  int IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta();
  v6 = [(VGVirtualGarage *)self->_virtualGarage selectedVehicle];
  objc_super v7 = v6;
  if (!IsEnabled_Alberta || v4)
  {
    v9 = [v6 displayName];
  }
  else
  {
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"[User Profile Vehicles] Add" value:@"localized string not found" table:0];
  }

  return v9;
}

- (void)_loadGarage
{
  objc_initWeak(&location, self);
  v3 = +[VGVirtualGarageService sharedService];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1004089BC;
  v4[3] = &unk_1012E9560;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 virtualGarageGetGarageWithReply:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_loadUnpairedVehicles
{
  objc_initWeak(&location, self);
  v3 = +[VGVirtualGarageService sharedService];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100408C48;
  v4[3] = &unk_1012E7418;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 virtualGarageGetListOfUnpairedVehiclesWithReply:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    BOOL v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___UserProfileLinkDataProvidingObserver queue:0];
    id v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)_updateLinkAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(UserProfileLinkGarageProvider *)self retrieveSubtitleText];
  id v5 = [(UserProfileLink *)self->_newLink subtitle];
  unsigned __int8 v6 = [v5 isEqualToString:v7];

  if ((v6 & 1) == 0)
  {
    [(UserProfileLink *)self->_newLink setSubtitle:v7];
    if (v3) {
      [(GEOObserverHashTable *)self->_observers dataDidUpdateForUserProfileLinkType:[(UserProfileLinkGarageProvider *)self userProfileLinkType]];
    }
  }
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4 = a3;
  if (([(VGVirtualGarage *)self->_virtualGarage isEqual:v4] & 1) == 0)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100408FD8;
    v5[3] = &unk_1012E9340;
    objc_copyWeak(&v7, &location);
    v5[4] = self;
    id v6 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(UserProfileLinkGarageProvider *)self hasUnpairedVehicles];
  id v7 = [v5 count];

  [(UserProfileLinkGarageProvider *)self setHasUnpairedVehicles:v7 != 0];
  if (v6 != [(UserProfileLinkGarageProvider *)self hasUnpairedVehicles])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100409108;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (VGVirtualGarage)virtualGarage
{
  return self->_virtualGarage;
}

- (void)setVirtualGarage:(id)a3
{
}

- (BOOL)hasUnpairedVehicles
{
  return self->_hasUnpairedVehicles;
}

- (void)setHasUnpairedVehicles:(BOOL)a3
{
  self->_hasUnpairedVehicles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_garageService, 0);

  objc_storeStrong((id *)&self->_newLink, 0);
}

@end