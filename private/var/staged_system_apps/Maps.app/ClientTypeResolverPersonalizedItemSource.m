@interface ClientTypeResolverPersonalizedItemSource
- (AddressBookManager)addressBookManager;
- (BOOL)hasObjectWithType:(int)a3;
- (BOOL)homeAndWorkEnabled;
- (ClientTypeResolverPersonalizedItemSource)initWithAddressBookManager:(id)a3 locationOfInterestManager:(id)a4;
- (CoreRoutineLocationOfInterestManager)locationOfInterestManager;
- (id)cachedAddressWithType:(int)a3;
- (id)cachedLOIWithType:(int)a3;
- (id)cachedObjectWithType:(int)a3;
- (id)knownTypes;
- (void)addressOrLOIWithType:(int)a3 completion:(id)a4;
- (void)objectWithType:(int)a3 completion:(id)a4;
- (void)setAddressBookManager:(id)a3;
- (void)setLocationOfInterestManager:(id)a3;
@end

@implementation ClientTypeResolverPersonalizedItemSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationOfInterestManager, 0);

  objc_storeStrong((id *)&self->_addressBookManager, 0);
}

- (BOOL)hasObjectWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!-[ClientTypeResolverSource typeIsValid:](self, "typeIsValid:")) {
    return 0;
  }
  v5 = [(ClientTypeResolverPersonalizedItemSource *)self cachedAddressWithType:v3];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [(ClientTypeResolverPersonalizedItemSource *)self cachedLOIWithType:v3];
    BOOL v6 = v7 != 0;
  }
  return v6;
}

- (id)cachedObjectWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!+[AddressBookManager addressBookAllowed]
    || ![(ClientTypeResolverPersonalizedItemSource *)self homeAndWorkEnabled]
    || ![(ClientTypeResolverSource *)self typeIsValid:v3])
  {
    goto LABEL_9;
  }
  if (v3 != 6)
  {
    if (v3 == 2)
    {
      v12 = [(ClientTypeResolverPersonalizedItemSource *)self addressBookManager];
      BOOL v6 = [v12 meCardWorkAddress];

      if (!v6)
      {
        v7 = [(ClientTypeResolverPersonalizedItemSource *)self locationOfInterestManager];
        v8 = [v7 workLOIs];
        goto LABEL_18;
      }
      goto LABEL_16;
    }
    if (v3 == 1)
    {
      v5 = [(ClientTypeResolverPersonalizedItemSource *)self addressBookManager];
      BOOL v6 = [v5 meCardHomeAddress];

      if (!v6)
      {
        v7 = [(ClientTypeResolverPersonalizedItemSource *)self locationOfInterestManager];
        v8 = [v7 homeLOIs];
LABEL_18:
        v14 = v8;
        v9 = [v8 firstObject];

        id v13 = 0;
        goto LABEL_19;
      }
      goto LABEL_16;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v11 = [(ClientTypeResolverPersonalizedItemSource *)self addressBookManager];
  BOOL v6 = [v11 meCardSchoolAddress];

  if (!v6)
  {
    v7 = [(ClientTypeResolverPersonalizedItemSource *)self locationOfInterestManager];
    v8 = [v7 schoolLOIs];
    goto LABEL_18;
  }
LABEL_16:
  id v13 = v6;
  v9 = v13;
LABEL_19:

LABEL_10:

  return v9;
}

- (id)knownTypes
{
  return &off_1013ADDE8;
}

- (BOOL)homeAndWorkEnabled
{
  return GEOConfigGetBOOL();
}

- (AddressBookManager)addressBookManager
{
  return self->_addressBookManager;
}

- (CoreRoutineLocationOfInterestManager)locationOfInterestManager
{
  return self->_locationOfInterestManager;
}

- (id)cachedAddressWithType:(int)a3
{
  uint64_t v3 = [(ClientTypeResolverPersonalizedItemSource *)self cachedObjectWithType:*(void *)&a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)cachedLOIWithType:(int)a3
{
  uint64_t v3 = [(ClientTypeResolverPersonalizedItemSource *)self cachedObjectWithType:*(void *)&a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (ClientTypeResolverPersonalizedItemSource)initWithAddressBookManager:(id)a3 locationOfInterestManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ClientTypeResolverPersonalizedItemSource;
  v9 = [(ClientTypeResolverPersonalizedItemSource *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_addressBookManager, a3);
    objc_storeStrong((id *)&v10->_locationOfInterestManager, a4);
    locationOfInterestManager = v10->_locationOfInterestManager;
    v12 = +[NSSet setWithArray:&off_1013ADDD0];
    [(CoreRoutineLocationOfInterestManager *)locationOfInterestManager monitorLOIsOfTypes:v12];
  }
  return v10;
}

- (void)objectWithType:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v6)
  {
    if (+[AddressBookManager addressBookAllowed]
      && [(ClientTypeResolverPersonalizedItemSource *)self homeAndWorkEnabled]
      && [(ClientTypeResolverSource *)self typeIsValid:v4])
    {
      objc_initWeak(&location, self);
      id v7 = [(ClientTypeResolverPersonalizedItemSource *)self addressBookManager];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100710AB8;
      v8[3] = &unk_1012F6568;
      objc_copyWeak(&v10, &location);
      int v11 = v4;
      v8[4] = self;
      id v9 = v6;
      [v7 performBlockAfterFirstCollection:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)addressOrLOIWithType:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1007110D8;
    v8[3] = &unk_1012F6590;
    id v9 = v6;
    [(ClientTypeResolverPersonalizedItemSource *)self objectWithType:v4 completion:v8];
  }
}

- (void)setAddressBookManager:(id)a3
{
}

- (void)setLocationOfInterestManager:(id)a3
{
}

@end