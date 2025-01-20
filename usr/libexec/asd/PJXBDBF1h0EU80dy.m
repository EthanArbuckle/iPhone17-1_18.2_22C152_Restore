@interface PJXBDBF1h0EU80dy
+ (BOOL)canSerialize:(id)a3;
+ (PJXBDBF1h0EU80dy)sharedInstance;
- (ASCoreDataManager)coreDataManager;
- (BOOL)updateGeoCodeForAddresses:(id)a3 locations:(id)a4 error:(id *)a5;
- (NSManagedObjectContext)managedObjectContext;
- (PJXBDBF1h0EU80dy)init;
- (PJXBDBF1h0EU80dy)initWithCoreDataManager:(id)a3;
- (id)YKIcrg8ijyspX6ho:(id)a3 forVersion:(unsigned int)a4;
- (id)YKIcrg8ijyspX6ho:(id)a3 forVersion:(unsigned int)a4 entityName:(id)a5;
- (id)canonicalStringForAddress:(id)a3;
- (id)evrtH713YbFfEOzk:(id)a3 error:(id *)a4;
- (id)f55HW2T4cquHq2nn:(id)a3;
- (id)f9CcEr7NPHjNuSLf:(id)a3 error:(id *)a4;
- (id)fetchAllBindings;
- (id)fetchGeoCodingsForAddresses:(id)a3;
- (id)rKKialn8e4bTPAC9:(id)a3 error:(id *)a4;
- (id)removeAllGeocodings;
- (id)removeRavioli;
- (id)retrieveLegacyRavioliWithCoreDataManager:(id)a3;
- (id)spi_managedObjectContext;
- (id)tuV7J33gT8DSDOWz:(unint64_t)a3 forDFVersion:(unsigned int)a4;
- (int64_t)ax7Szgk7yfiKNgSDError:(id *)a3;
- (int64_t)nYOW3DfIUVSEf2Hm:(id)a3 rTZQrPNUbDSIifrh:(id *)a4;
- (void)c94QZ147F1UWY71l:(id)a3 jkjlhN0UgO78kW6q:(id)a4 error:(id *)a5;
- (void)cZK3HwMuoGcCgDQI;
- (void)commitWithBindings:(id)a3 clearingExistingBindings:(BOOL)a4;
- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4;
- (void)eWV8dPJG0p0nc2lk:(NSDictionary *)a3 completionHandler:(id)a4;
- (void)mFzG243uOJXw4ZYk:(id)a3 rTTHO3ihFn7EUCni:(id)a4 hxew30JsWWGJaBoM:(id)a5;
- (void)naB577x5bWPDZyct:(NSString *)a3 completionHandler:(id)a4;
- (void)qSbwrv1Q3SgLu8BN:(_KUwyEjpVZR65eUyl *)a3 gXKoR0dNwQUyaeOl:(unsigned int)a4 lEWFPyiFIAJ2uoyd:(id)a5;
- (void)r2wriXQ3o6jv840j:(_KUwyEjpVZR65eUyl *)a3 gXKoR0dNwQUyaeOl:(unsigned int)a4 lEWFPyiFIAJ2uoyd:(id)a5;
- (void)removeAllBindings;
- (void)setManagedObjectContext:(id)a3;
- (void)vWMDLV5jN1a2h2p2:(NSDictionary *)a3 completionHandler:(id)a4;
@end

@implementation PJXBDBF1h0EU80dy

+ (PJXBDBF1h0EU80dy)sharedInstance
{
  if (qword_1006A5DD0 != -1) {
    dispatch_once(&qword_1006A5DD0, &stru_10065F278);
  }
  v2 = (void *)qword_1006A5DC8;

  return (PJXBDBF1h0EU80dy *)v2;
}

- (PJXBDBF1h0EU80dy)init
{
  v3 = +[ASCoreDataManager sharedInstance];
  coreDataManager = self->_coreDataManager;
  self->_coreDataManager = v3;

  v5 = [(ASCoreDataManager *)self->_coreDataManager gFJw2BGPtEQWyLz5];
  managedObjectContext = self->_managedObjectContext;
  self->_managedObjectContext = v5;

  return self;
}

- (PJXBDBF1h0EU80dy)initWithCoreDataManager:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_coreDataManager, a3);
  v6 = [(ASCoreDataManager *)self->_coreDataManager gFJw2BGPtEQWyLz5];
  managedObjectContext = self->_managedObjectContext;
  self->_managedObjectContext = v6;

  return self;
}

- (id)YKIcrg8ijyspX6ho:(id)a3 forVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v4 == 1) {
    CFStringRef v7 = @"DB_C56902430";
  }
  else {
    CFStringRef v7 = @"DB_R101288420";
  }
  v8 = [(PJXBDBF1h0EU80dy *)self YKIcrg8ijyspX6ho:v6 forVersion:v4 entityName:v7];

  return v8;
}

- (id)YKIcrg8ijyspX6ho:(id)a3 forVersion:(unsigned int)a4 entityName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[NSFetchRequest fetchRequestWithEntityName:v9];
  v11 = v10;
  if (v8) {
    [v10 setPredicate:v8];
  }
  if ([&off_1006885E0 containsObject:v9])
  {
    v12 = +[NSSortDescriptor sortDescriptorWithKey:@"presentTime" ascending:0];
    v48 = v12;
    v13 = +[NSArray arrayWithObjects:&v48 count:1];
    [v11 setSortDescriptors:v13];
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10001FF28;
  v40 = sub_10001FF38;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_10001FF28;
  v34 = sub_10001FF38;
  id v35 = 0;
  managedObjectContext = self->_managedObjectContext;
  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = sub_10001FF40;
  v25 = &unk_10065F2A0;
  v28 = &v30;
  v26 = self;
  id v15 = v11;
  id v27 = v15;
  v29 = &v36;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:&v22];
  v16 = (void *)v31[5];
  if (!v16)
  {
    v17 = (id)qword_1006AD1A0;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = [v37[5] localizedDescription:v22, v23, v24, v25, v26];
      v21 = [(id)v37[5] userInfo];
      *(_DWORD *)buf = 67109634;
      unsigned int v43 = a4;
      __int16 v44 = 2112;
      v45 = v20;
      __int16 v46 = 2112;
      v47 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error fetching objects for entity v%d: %@\n%@", buf, 0x1Cu);
    }
    v16 = (void *)v31[5];
  }
  id v18 = v16;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v18;
}

- (id)removeRavioli
{
  v3 = +[NSFetchRequest fetchRequestWithEntityName:@"DB_R115061196"];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10001FF28;
  v16 = sub_10001FF38;
  id v17 = 0;
  managedObjectContext = self->_managedObjectContext;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100020108;
  v8[3] = &unk_10065F2C8;
  id v9 = v3;
  v10 = self;
  v11 = &v12;
  id v5 = v3;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v6;
}

- (id)tuV7J33gT8DSDOWz:(unint64_t)a3 forDFVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10001FF28;
  uint64_t v23 = sub_10001FF38;
  id v24 = 0;
  id v6 = +[NSPredicate predicateWithFormat:@"queryKey == %lld", a3];
  CFStringRef v7 = [(PJXBDBF1h0EU80dy *)self YKIcrg8ijyspX6ho:v6 forVersion:v4];
  id v8 = [v7 finalResult];

  managedObjectContext = self->_managedObjectContext;
  if (v4 == 1)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100020440;
    v17[3] = &unk_10065F2F0;
    v10 = (id *)v18;
    v18[0] = v8;
    v18[1] = &v19;
    id v11 = v8;
    [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v17];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100020638;
    v15[3] = &unk_10065F2F0;
    v10 = (id *)v16;
    v16[0] = v8;
    v16[1] = &v19;
    id v12 = v8;
    [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v15];
  }

  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void)cZK3HwMuoGcCgDQI
{
  if ([(NSManagedObjectContext *)self->_managedObjectContext hasChanges])
  {
    [(NSManagedObjectContext *)self->_managedObjectContext setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    managedObjectContext = self->_managedObjectContext;
    id v14 = 0;
    unsigned __int8 v4 = [(NSManagedObjectContext *)managedObjectContext save:&v14];
    id v5 = v14;
    if ((v4 & 1) == 0)
    {
      id v6 = qword_1006AD1A0;
      if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
        sub_10055D690((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
      }
      id v13 = qword_1006AD1A0;
      if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
        sub_10055D618((uint64_t)v5, v13);
      }
    }
  }
}

- (id)spi_managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)r2wriXQ3o6jv840j:(_KUwyEjpVZR65eUyl *)a3 gXKoR0dNwQUyaeOl:(unsigned int)a4 lEWFPyiFIAJ2uoyd:(id)a5
{
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8 && ([v8 rEI50SHLlVc37Bvu] & 1) != 0)
  {
    managedObjectContext = self->_managedObjectContext;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000209E8;
    v11[3] = &unk_10065F318;
    v11[4] = self;
    id v12 = v9;
    id v13 = a3;
    unsigned int v14 = a4;
    [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v11];
  }
}

- (void)qSbwrv1Q3SgLu8BN:(_KUwyEjpVZR65eUyl *)a3 gXKoR0dNwQUyaeOl:(unsigned int)a4 lEWFPyiFIAJ2uoyd:(id)a5
{
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8 && ([v8 rEI50SHLlVc37Bvu] & 1) != 0)
  {
    managedObjectContext = self->_managedObjectContext;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100020C70;
    v11[3] = &unk_10065F318;
    v11[4] = self;
    id v12 = v9;
    id v13 = a3;
    unsigned int v14 = a4;
    [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v11];
  }
}

- (int64_t)ax7Szgk7yfiKNgSDError:(id *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  managedObjectContext = self->_managedObjectContext;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100021030;
  v6[3] = &unk_10065F2F0;
  v6[4] = self;
  v6[5] = &v7;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v6];
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (int64_t)nYOW3DfIUVSEf2Hm:(id)a3 rTZQrPNUbDSIifrh:(id *)a4
{
  id v6 = a3;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  __int16 v44 = sub_10001FF28;
  v45 = sub_10001FF38;
  id v46 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = sub_10001FF28;
  v39 = sub_10001FF38;
  id v40 = 0;
  uint64_t v7 = [v6 objectForKey:@"all"];
  unsigned int v8 = [v7 BOOLValue];

  uint64_t v9 = objc_opt_new();
  uint64_t v10 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v54 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ALL = %d", buf, 8u);
  }
  managedObjectContext = self->_managedObjectContext;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100021764;
  v31[3] = &unk_10065F340;
  v31[4] = self;
  id v12 = v9;
  char v34 = v8;
  id v32 = v12;
  v33 = &v47;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v31];

  id v13 = self->_managedObjectContext;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100021A2C;
  v29[3] = &unk_10065F368;
  char v30 = v8;
  v29[4] = self;
  v29[5] = &v41;
  v29[6] = &v47;
  [(NSManagedObjectContext *)v13 performBlockAndWait:v29];
  BOOL v14 = v42[5] != 0;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  v16 = self->_managedObjectContext;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100021C70;
  v28[3] = &unk_10065F390;
  v28[4] = self;
  v28[5] = &v35;
  v28[6] = &v47;
  [(NSManagedObjectContext *)v16 performBlockAndWait:v28];

  if (v14)
  {
    id v17 = [objc_alloc((Class)NSString) initWithFormat:@"Error cleaning up cache. V1: %@, V2: %@-%@", @"OK", @"ERROR", @"OK"];
    NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
    id v52 = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    uint64_t v19 = v18;
    if (v42[5] || v36[5])
    {
      id v20 = [v18 mutableCopy];
      uint64_t v21 = v20;
      uint64_t v22 = v42[5];
      if (v22) {
        [v20 setValue:v22 forKey:@"CacheV2ErrorDetail"];
      }
      uint64_t v23 = v36[5];
      if (v23) {
        [v21 setValue:v23 forKey:@"CacheV2UniqueErrorDetail"];
      }
    }
    else
    {
      uint64_t v21 = v18;
    }
    id v24 = +[NSString stringWithUTF8String:off_100697600];
    id v25 = [v21 copy];
    *a4 = +[NSError errorWithDomain:v24 code:-27109 userInfo:v25];
  }
  int64_t v26 = v48[3];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v26;
}

+ (BOOL)canSerialize:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)f55HW2T4cquHq2nn:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_10001FF28;
  id v18 = sub_10001FF38;
  id v19 = 0;
  id v13 = 0;
  id v5 = [(PJXBDBF1h0EU80dy *)self rKKialn8e4bTPAC9:v4 error:&v13];
  id v6 = v13;
  if (v5)
  {
    managedObjectContext = self->_managedObjectContext;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002234C;
    v10[3] = &unk_10065F3B8;
    id v12 = &v14;
    id v11 = v5;
    [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v10];
    id v8 = (id)v15[5];
  }
  else
  {
    id v8 = 0;
  }

  _Block_object_dispose(&v14, 8);

  return v8;
}

- (id)canonicalStringForAddress:(id)a3
{
  id v3 = a3;
  id v4 = [v3 ISOCountryCode];
  id v5 = [v3 country];
  id v6 = [v3 postalCode];
  uint64_t v7 = [v3 state];
  id v8 = [v3 subAdministrativeArea];
  uint64_t v9 = [v3 city];
  uint64_t v10 = [v3 subLocality];
  id v11 = [v3 street];
  id v12 = +[NSString stringWithFormat:@"%@€%@€%@€%@€%@€%@€%@€%@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)removeAllGeocodings
{
  id v3 = +[ASGeoCodeCacheEntry fetchRequest];
  id v4 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v3];
  [v4 setResultType:1];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10001FF28;
  id v25 = sub_10001FF38;
  id v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_10001FF28;
  v19[4] = sub_10001FF38;
  id v20 = 0;
  managedObjectContext = self->_managedObjectContext;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_1000227E4;
  uint64_t v14 = &unk_10065F2A0;
  id v17 = v19;
  id v15 = self;
  id v6 = v4;
  id v16 = v6;
  id v18 = &v21;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:&v11];
  uint64_t v7 = (void *)v22[5];
  if (v7)
  {
    id v8 = (id)qword_1006AD1A0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [v22[5] localizedDescription:v11, v12, v13, v14, v15];
      objc_claimAutoreleasedReturnValue();
      [(id)v22[5] userInfo];
      objc_claimAutoreleasedReturnValue();
      sub_10055D7D8();
    }

    uint64_t v7 = (void *)v22[5];
  }
  id v9 = v7;

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (BOOL)updateGeoCodeForAddresses:(id)a3 locations:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 count];
  if (v10 != [v9 count])
  {
    id v13 = +[NSString stringWithUTF8String:off_100697600];
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = @"Mismatched location and address counts.";
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v16 = +[NSError errorWithDomain:v13 code:-27109 userInfo:v14];
LABEL_7:
    BOOL v15 = 0;
    *a5 = v16;
    goto LABEL_8;
  }
  if ((unint64_t)[v8 count] > 0x1E || !objc_msgSend(v8, "count"))
  {
    id v13 = +[NSString stringWithUTF8String:off_100697600];
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"Invalid update size - min 1, max 30.";
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v16 = +[NSError errorWithDomain:v13 code:-27109 userInfo:v14];
    goto LABEL_7;
  }
  id v11 = +[NSDate now];
  uint64_t v12 = self->_managedObjectContext;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_100022B6C;
  v18[3] = &unk_10065F3E0;
  id v19 = v12;
  id v20 = v8;
  id v21 = v9;
  uint64_t v22 = self;
  id v23 = v11;
  id v13 = v11;
  uint64_t v14 = v12;
  [(NSManagedObjectContext *)v14 performBlock:v18];

  BOOL v15 = 1;
LABEL_8:

  return v15;
}

- (id)fetchGeoCodingsForAddresses:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = self->_managedObjectContext;
  uint64_t v7 = +[NSDate now];
  Class Class = objc_getClass("ASGeoCodeResult");
  if (Class)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002329C;
    v14[3] = &unk_10065F408;
    id v15 = v4;
    id v16 = self;
    id v9 = v6;
    id v17 = v9;
    id v10 = v5;
    id v18 = v10;
    Class v20 = Class;
    id v19 = v7;
    [(NSManagedObjectContext *)v9 performBlockAndWait:v14];
    if ([v10 count])
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000235C8;
      v13[3] = &unk_10065F430;
      v13[4] = self;
      [(NSManagedObjectContext *)v9 performBlock:v13];
    }
    id v11 = v10;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055D910();
    }
    id v11 = 0;
  }

  return v11;
}

- (id)fetchAllBindings
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  managedObjectContext = self->_managedObjectContext;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1000236B0;
  id v11 = &unk_10065F458;
  uint64_t v12 = self;
  id v5 = v3;
  id v13 = v5;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:&v8];
  id v6 = [v5 copy:v8, v9, v10, v11, v12];

  return v6;
}

- (void)removeAllBindings
{
  id v3 = +[ASBindingKeyVal fetchRequest];
  id v4 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v3];
  [v4 setResultType:1];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10001FF28;
  uint64_t v22 = sub_10001FF38;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  void v16[2] = 0x3032000000;
  v16[3] = sub_10001FF28;
  v16[4] = sub_10001FF38;
  id v17 = 0;
  managedObjectContext = self->_managedObjectContext;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100023B80;
  id v11 = &unk_10065F2A0;
  uint64_t v14 = v16;
  uint64_t v12 = self;
  id v6 = v4;
  id v13 = v6;
  id v15 = &v18;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:&v8];
  if (v19[5])
  {
    uint64_t v7 = (id)qword_1006AD1A0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [v19[5] localizedDescription:v8, v9, v10, v11, v12];
      objc_claimAutoreleasedReturnValue();
      [(id)v19[5] userInfo];
      objc_claimAutoreleasedReturnValue();
      sub_10055D944();
    }
  }
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(&v18, 8);
}

- (void)commitWithBindings:(id)a3 clearingExistingBindings:(BOOL)a4
{
  id v6 = a3;
  managedObjectContext = self->_managedObjectContext;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023CC0;
  v9[3] = &unk_10065F480;
  BOOL v11 = a4;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v9];
}

- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_managedObjectContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100024118;
  v12[3] = &unk_10065F4A8;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v16 = v8;
  uint64_t v9 = v8;
  id v10 = v7;
  id v11 = v6;
  [(NSManagedObjectContext *)v9 performBlock:v12];
}

- (id)evrtH713YbFfEOzk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  CFStringRef v25 = sub_10001FF28;
  NSErrorUserInfoKey v26 = sub_10001FF38;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10001FF28;
  uint64_t v20 = sub_10001FF38;
  id v21 = 0;
  managedObjectContext = self->_managedObjectContext;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100024468;
  v11[3] = &unk_10065F4D0;
  id v12 = v6;
  id v13 = self;
  uint64_t v14 = &v16;
  id v15 = &v22;
  id v8 = v6;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v11];
  *a4 = (id) v17[5];
  id v9 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (void)mFzG243uOJXw4ZYk:(id)a3 rTTHO3ihFn7EUCni:(id)a4 hxew30JsWWGJaBoM:(id)a5
{
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
    sub_10055DA04();
  }
}

- (void)c94QZ147F1UWY71l:(id)a3 jkjlhN0UgO78kW6q:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self->_managedObjectContext;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100024724;
  v13[3] = &unk_10065F4A8;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  [(NSManagedObjectContext *)v10 performBlockAndWait:v13];
}

- (id)f9CcEr7NPHjNuSLf:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  CFStringRef v25 = sub_10001FF28;
  NSErrorUserInfoKey v26 = sub_10001FF38;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10001FF28;
  uint64_t v20 = sub_10001FF38;
  id v21 = 0;
  managedObjectContext = self->_managedObjectContext;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100024AC8;
  v11[3] = &unk_10065F4D0;
  id v12 = v6;
  id v13 = self;
  id v14 = &v22;
  id v15 = &v16;
  id v8 = v6;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v11];
  *a4 = (id) v23[5];
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (id)rKKialn8e4bTPAC9:(id)a3 error:(id *)a4
{
  id v10 = 0;
  id v5 = [(PJXBDBF1h0EU80dy *)self f9CcEr7NPHjNuSLf:a3 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (v6) {
    *a4 = v6;
  }
  id v8 = [[JSONBagRecord alloc] initWithObject:v5];

  return v8;
}

- (id)retrieveLegacyRavioliWithCoreDataManager:(id)a3
{
  id v3 = a3;
  id v4 = [v3 gFJw2BGPtEQWyLz5];
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"DB_R09283478"];
  [v5 setFetchLimit:1];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10001FF28;
  v24[4] = sub_10001FF38;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_10001FF28;
  v22[4] = sub_10001FF38;
  id v23 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10001FF28;
  uint64_t v20 = sub_10001FF38;
  id v21 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100025064;
  v10[3] = &unk_10065F4F8;
  id v13 = v22;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  id v14 = v24;
  id v15 = &v16;
  [v6 performBlockAndWait:v10];
  id v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);

  return v8;
}

- (ASCoreDataManager)coreDataManager
{
  return self->_coreDataManager;
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManagedObjectContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);

  objc_storeStrong((id *)&self->_coreDataManager, 0);
}

- (void)vWMDLV5jN1a2h2p2:(NSDictionary *)a3 completionHandler:(id)a4
{
}

- (void)naB577x5bWPDZyct:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)eWV8dPJG0p0nc2lk:(NSDictionary *)a3 completionHandler:(id)a4
{
}

@end