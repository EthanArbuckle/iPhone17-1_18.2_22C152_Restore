@interface NSSWatchFaceCoordinator
- (NPSDomainAccessor)domainAccessor;
- (NPSManager)npsManager;
- (NSDictionary)selectedFocusFaces;
- (NSString)previousFaceIdentifier;
- (NTKPersistentFaceCollection)collection;
- (id)_currentDeviceUUID;
- (id)completion;
- (id)faceLibraryCollection;
- (id)selectedFocusModeIdentifiersForWatchFaceIdentifier:(id)a3;
- (void)_loadFocusFaces;
- (void)_saveFocusFaces;
- (void)_switchBackToExistingWatchFaceWithIdentifier:(id)a3 ifFaceStillSelected:(id)a4;
- (void)_switchToNewWatchFaceWithIdentifier:(id)a3;
- (void)_switchToWatchFaceWithIdentifier:(id)a3 saveExistingFaceState:(BOOL)a4 abortIfNotCurrent:(id)a5;
- (void)faceCollectionDidLoad:(id)a3;
- (void)focusModeDidEnd:(id)a3;
- (void)focusModeDidStart:(id)a3;
- (void)processCollectionAndFinish:(id)a3;
- (void)selectWatchFaceIdentifier:(id)a3 forFocusModeIdentifier:(id)a4;
- (void)setCollection:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDomainAccessor:(id)a3;
- (void)setNpsManager:(id)a3;
- (void)setPreviousFaceIdentifier:(id)a3;
- (void)setSelectedFocusFaces:(id)a3;
- (void)watchFacesForCurrentDeviceWithCompletion:(id)a3;
@end

@implementation NSSWatchFaceCoordinator

- (void)watchFacesForCurrentDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[NSSWatchFaceCoordinator watchFacesForCurrentDeviceWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  id v6 = objc_retainBlock(v4);
  id completion = self->_completion;
  self->_id completion = v6;

  v8 = [(NSSWatchFaceCoordinator *)self faceLibraryCollection];
  unsigned int v9 = [v8 hasLoaded];
  v10 = NSSLogForType();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NTKPersistentFaceCollection is loaded, moving to process", (uint8_t *)&v12, 2u);
    }

    [(NSSWatchFaceCoordinator *)self processCollectionAndFinish:v8];
  }
  else
  {
    if (v11)
    {
      int v12 = 138412290;
      v13 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NTKPersistentFaceCollection was not loaded, waiting for collection loading: %@", (uint8_t *)&v12, 0xCu);
    }

    [v8 addObserver:self];
  }
}

- (id)_currentDeviceUUID
{
  v2 = +[CLKDevice currentDevice];
  v3 = [v2 nrDevice];
  id v4 = [v3 pairingID];

  return v4;
}

- (id)faceLibraryCollection
{
  v3 = [(NSSWatchFaceCoordinator *)self _currentDeviceUUID];
  id v4 = [(NTKPersistentFaceCollection *)self->_collection deviceUUID];
  unsigned __int8 v5 = [v4 isEqual:v3];

  collection = self->_collection;
  if (!collection || (v5 & 1) == 0)
  {
    if (collection) {
      char v7 = v5;
    }
    else {
      char v7 = 1;
    }
    if (collection) {
      CFStringRef v8 = 0;
    }
    else {
      CFStringRef v8 = @"_collection is nil";
    }
    if ((v7 & 1) == 0)
    {
      [(NTKPersistentFaceCollection *)collection removeObserver:self];
      CFStringRef v8 = @"uuid has changed";
    }
    unsigned int v9 = NSSLogForType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      CFStringRef v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NTKPersistentFaceCollection creation: creating a new collection because %@", (uint8_t *)&v15, 0xCu);
    }

    id v10 = objc_alloc((Class)NTKPersistentFaceCollection);
    BOOL v11 = (NTKPersistentFaceCollection *)[v10 initWithCollectionIdentifier:NTKCollectionIdentifierLibraryFaces deviceUUID:v3];
    int v12 = self->_collection;
    self->_collection = v11;

    collection = self->_collection;
  }
  v13 = collection;

  return v13;
}

- (void)processCollectionAndFinish:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 numberOfFaces];
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v4];
  id v6 = [v3 selectedFace];
  char v7 = [v3 uuidForFace:v6];

  CFStringRef v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v7 UUIDString];
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NTKPersistentFaceCollection creation: selectedFaceidentifier %@", buf, 0xCu);
  }
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      BOOL v11 = [v3 faceAtIndex:i];
      id v12 = objc_alloc_init((Class)NSSWatchFace);
      v13 = [v3 uuidForFace:v11];
      [v12 setFaceIdentifier:v13];
      v14 = [v11 name];
      [v12 setFaceDisplayName:v14];

      objc_msgSend(v12, "setIsActive:", objc_msgSend(v7, "isEqual:", v13));
      int v15 = [(NSSWatchFaceCoordinator *)self selectedFocusModeIdentifiersForWatchFaceIdentifier:v13];
      [v12 setSelectedFocusModeIdentifiers:v15];

      [v5 addObject:v12];
    }
  }
  CFStringRef v16 = NSSLogForType();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NTKPersistentFaceCollection finished, calling completion", buf, 2u);
  }

  v17 = [(NSSWatchFaceCoordinator *)self completion];
  ((void (**)(void, id, void))v17)[2](v17, v5, 0);

  id completion = self->_completion;
  self->_id completion = 0;
}

- (void)faceCollectionDidLoad:(id)a3
{
  id v4 = (NTKPersistentFaceCollection *)a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    CFStringRef v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NTKPersistentFaceCollection loaded, moving to process: %@", (uint8_t *)&v7, 0xCu);
  }

  if (self->_collection == v4)
  {
    [(NSSWatchFaceCoordinator *)self processCollectionAndFinish:v4];
  }
  else
  {
    id v6 = NSSLogForType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100022370(v6);
    }
  }
}

- (NSDictionary)selectedFocusFaces
{
  selectedFocusFaces = self->_selectedFocusFaces;
  if (!selectedFocusFaces)
  {
    [(NSSWatchFaceCoordinator *)self _loadFocusFaces];
    selectedFocusFaces = self->_selectedFocusFaces;
  }
  return selectedFocusFaces;
}

- (NPSDomainAccessor)domainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    id v4 = NSSLogForType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: Init new domain accessor", buf, 2u);
    }

    id v5 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanosystemsettings"];
    id v6 = self->_domainAccessor;
    self->_domainAccessor = v5;

    domainAccessor = self->_domainAccessor;
  }
  int v7 = [(NPSDomainAccessor *)domainAccessor pairingID];
  CFStringRef v8 = [(NSSWatchFaceCoordinator *)self _currentDeviceUUID];
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = NSSLogForType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: Active device changed, recreating domain accessor", v15, 2u);
    }

    BOOL v11 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanosystemsettings"];
    id v12 = self->_domainAccessor;
    self->_domainAccessor = v11;
  }
  v13 = self->_domainAccessor;
  return v13;
}

- (NPSManager)npsManager
{
  npsManager = self->_npsManager;
  if (!npsManager)
  {
    id v4 = (NPSManager *)objc_alloc_init((Class)NPSManager);
    id v5 = self->_npsManager;
    self->_npsManager = v4;

    npsManager = self->_npsManager;
  }
  return npsManager;
}

- (void)_loadFocusFaces
{
  id v3 = NSSLogForType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    CFStringRef v16 = "-[NSSWatchFaceCoordinator _loadFocusFaces]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  id v4 = [(NSSWatchFaceCoordinator *)self domainAccessor];
  id v5 = [v4 synchronize];

  id v6 = NSSLogForType();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000223B4(v5);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: Successfully synced domain accessor", (uint8_t *)&v15, 2u);
  }

  CFStringRef v8 = [(NSSWatchFaceCoordinator *)self domainAccessor];
  unsigned __int8 v9 = [v8 objectForKey:@"SelectedFocusFaces"];

  if (!v9) {
    unsigned __int8 v9 = (NSDictionary *)objc_opt_new();
  }
  selectedFocusFaces = self->_selectedFocusFaces;
  self->_selectedFocusFaces = v9;
  BOOL v11 = v9;

  id v12 = +[NSUserDefaults standardUserDefaults];
  v13 = [v12 objectForKey:@"PreviousFaceIdentifier"];
  previousFaceIdentifier = self->_previousFaceIdentifier;
  self->_previousFaceIdentifier = v13;
}

- (void)_saveFocusFaces
{
  id v3 = NSSLogForType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v15 = "-[NSSWatchFaceCoordinator _saveFocusFaces]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:self->_previousFaceIdentifier forKey:@"PreviousFaceIdentifier"];
  id v5 = [(NSSWatchFaceCoordinator *)self domainAccessor];
  [v5 setObject:self->_selectedFocusFaces forKey:@"SelectedFocusFaces"];

  id v6 = [(NSSWatchFaceCoordinator *)self domainAccessor];
  int v7 = [v6 synchronize];

  CFStringRef v8 = NSSLogForType();
  unsigned __int8 v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000223B4(v7);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: Successfully synced domain accessor", buf, 2u);
  }

  id v10 = [(NSSWatchFaceCoordinator *)self npsManager];
  CFStringRef v13 = @"SelectedFocusFaces";
  BOOL v11 = +[NSArray arrayWithObjects:&v13 count:1];
  id v12 = +[NSSet setWithArray:v11];
  [v10 synchronizeNanoDomain:@"com.apple.nanosystemsettings" keys:v12];
}

- (id)selectedFocusModeIdentifiersForWatchFaceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSSWatchFaceCoordinator *)self selectedFocusFaces];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100021168;
  v11[3] = &unk_1000351D8;
  id v12 = v4;
  id v6 = (id)objc_opt_new();
  id v13 = v6;
  id v7 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];
  CFStringRef v8 = v13;
  id v9 = v6;

  return v9;
}

- (void)selectWatchFaceIdentifier:(id)a3 forFocusModeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    int v15 = "-[NSSWatchFaceCoordinator selectWatchFaceIdentifier:forFocusModeIdentifier:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  id v9 = [(NSSWatchFaceCoordinator *)self selectedFocusFaces];
  id v10 = [v9 mutableCopy];

  if (v6)
  {
    BOOL v11 = [v6 UUIDString];
    [v10 setObject:v11 forKey:v7];
  }
  else
  {
    [v10 removeObjectForKey:v7];
  }
  id v12 = (NSDictionary *)[v10 copy];
  selectedFocusFaces = self->_selectedFocusFaces;
  self->_selectedFocusFaces = v12;

  [(NSSWatchFaceCoordinator *)self _saveFocusFaces];
}

- (void)focusModeDidStart:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: Focus mode did start (%@)", (uint8_t *)&v10, 0xCu);
  }

  [(NSSWatchFaceCoordinator *)self _loadFocusFaces];
  id v6 = [(NSSWatchFaceCoordinator *)self selectedFocusFaces];
  id v7 = [v6 objectForKey:v4];
  CFStringRef v8 = NSSLogForType();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: Focus has face selection: %@", (uint8_t *)&v10, 0xCu);
    }

    [(NSSWatchFaceCoordinator *)self _switchToNewWatchFaceWithIdentifier:v7];
  }
  else
  {
    if (v9)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: No face selection for this focus mode", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)focusModeDidEnd:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: Focus mode did end (%@)", (uint8_t *)&v11, 0xCu);
  }

  [(NSSWatchFaceCoordinator *)self _loadFocusFaces];
  id v6 = [(NSSWatchFaceCoordinator *)self selectedFocusFaces];
  id v7 = [v6 objectForKey:v4];
  if (self->_previousFaceIdentifier)
  {
    CFStringRef v8 = NSSLogForType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      previousFaceIdentifier = self->_previousFaceIdentifier;
      int v11 = 138412290;
      id v12 = previousFaceIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: Restoring previous face identifier: %@", (uint8_t *)&v11, 0xCu);
    }

    [(NSSWatchFaceCoordinator *)self _switchBackToExistingWatchFaceWithIdentifier:self->_previousFaceIdentifier ifFaceStillSelected:v7];
    int v10 = self->_previousFaceIdentifier;
    self->_previousFaceIdentifier = 0;

    [(NSSWatchFaceCoordinator *)self _saveFocusFaces];
  }
}

- (void)_switchToNewWatchFaceWithIdentifier:(id)a3
{
}

- (void)_switchBackToExistingWatchFaceWithIdentifier:(id)a3 ifFaceStillSelected:(id)a4
{
}

- (void)_switchToWatchFaceWithIdentifier:(id)a3 saveExistingFaceState:(BOOL)a4 abortIfNotCurrent:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int v10 = NSSLogForType();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[NSSWatchFaceCoordinator _switchToWatchFaceWithIdentifier:saveExistingFaceState:abortIfNotCurrent:]";
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s - identifier: %@ saveFace: %{BOOL}d", buf, 0x1Cu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000217DC;
  v13[3] = &unk_100035200;
  id v14 = v8;
  id v15 = v9;
  CFStringRef v16 = self;
  BOOL v17 = v6;
  id v11 = v9;
  id v12 = v8;
  [(NSSWatchFaceCoordinator *)self watchFacesForCurrentDeviceWithCompletion:v13];
}

- (NTKPersistentFaceCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void)setDomainAccessor:(id)a3
{
}

- (void)setNpsManager:(id)a3
{
}

- (void)setSelectedFocusFaces:(id)a3
{
}

- (NSString)previousFaceIdentifier
{
  return self->_previousFaceIdentifier;
}

- (void)setPreviousFaceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousFaceIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedFocusFaces, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end