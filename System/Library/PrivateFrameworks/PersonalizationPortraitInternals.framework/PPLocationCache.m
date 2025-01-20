@interface PPLocationCache
- (PPLocationCache)initWithLocationStore:(id)a3;
- (id)homeOrWorkAddresses;
- (id)locationForHome;
- (id)locationForWork;
- (void)_refresh;
- (void)invalidate;
@end

@implementation PPLocationCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeOrWorkAddresses, 0);
  objc_storeStrong((id *)&self->_work, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
}

- (void)invalidate
{
  self->_valid = 0;
}

- (void)_refresh
{
  v3 = [(PPLocalLocationStore *)self->_locationStore locationRecordOfCategory:5];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 location];
    p_home = &self->_home;
    home = self->_home;
    self->_home = v5;
  }
  else
  {
    p_home = &self->_home;
    home = self->_home;
    self->_home = 0;
  }

  v8 = [(PPLocalLocationStore *)self->_locationStore locationRecordOfCategory:6];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 location];
    p_work = &self->_work;
    work = self->_work;
    self->_work = v10;
  }
  else
  {
    p_work = &self->_work;
    work = self->_work;
    self->_work = 0;
  }

  v13 = (void *)MEMORY[0x1CB79D060]();
  [(NSMutableSet *)self->_homeOrWorkAddresses removeAllObjects];
  if (self->_home)
  {
    v14 = +[PPLocationSupport streetAddressOfLocation:](PPLocationSupport, "streetAddressOfLocation:");
    v15 = +[PPLocationSupport fullAddressOfLocation:*p_home];
    if (v14)
    {
      homeOrWorkAddresses = self->_homeOrWorkAddresses;
      v17 = [v14 lowercaseString];
      [(NSMutableSet *)homeOrWorkAddresses addObject:v17];
    }
    if (v15)
    {
      v18 = self->_homeOrWorkAddresses;
      v19 = [v15 lowercaseString];
      [(NSMutableSet *)v18 addObject:v19];
    }
  }
  if (*p_work)
  {
    v20 = +[PPLocationSupport streetAddressOfLocation:](PPLocationSupport, "streetAddressOfLocation:");
    v21 = +[PPLocationSupport fullAddressOfLocation:*p_work];
    if (v20)
    {
      v22 = self->_homeOrWorkAddresses;
      v23 = [v20 lowercaseString];
      [(NSMutableSet *)v22 addObject:v23];
    }
    if (v21)
    {
      v24 = self->_homeOrWorkAddresses;
      v25 = [v21 lowercaseString];
      [(NSMutableSet *)v24 addObject:v25];
    }
  }
  self->_valid = 1;
}

- (id)homeOrWorkAddresses
{
  if (!self->_valid) {
    [(PPLocationCache *)self _refresh];
  }
  homeOrWorkAddresses = self->_homeOrWorkAddresses;
  return homeOrWorkAddresses;
}

- (id)locationForWork
{
  if (!self->_valid) {
    [(PPLocationCache *)self _refresh];
  }
  work = self->_work;
  return work;
}

- (id)locationForHome
{
  if (!self->_valid) {
    [(PPLocationCache *)self _refresh];
  }
  home = self->_home;
  return home;
}

- (PPLocationCache)initWithLocationStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPLocationCache;
  v6 = [(PPLocationCache *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_valid = 0;
    objc_storeStrong((id *)&v6->_locationStore, a3);
    uint64_t v8 = objc_opt_new();
    homeOrWorkAddresses = v7->_homeOrWorkAddresses;
    v7->_homeOrWorkAddresses = (NSMutableSet *)v8;
  }
  return v7;
}

@end