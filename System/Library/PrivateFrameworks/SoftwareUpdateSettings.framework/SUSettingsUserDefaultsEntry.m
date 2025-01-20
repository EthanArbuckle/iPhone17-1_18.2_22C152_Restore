@interface SUSettingsUserDefaultsEntry
- (NSString)entryDescription;
- (NSString)key;
- (SUSettingsUserDefaultsEntry)initWithType:(int64_t)a3 key:(id)a4 description:(id)a5;
- (id)initBoolEntryWithKey:(id)a3 description:(id)a4;
- (id)initNumberEntryWithKey:(id)a3 description:(id)a4;
- (id)initStringEntryWithKey:(id)a3 description:(id)a4;
- (int64_t)type;
@end

@implementation SUSettingsUserDefaultsEntry

- (SUSettingsUserDefaultsEntry)initWithType:(int64_t)a3 key:(id)a4 description:(id)a5
{
  v15 = self;
  SEL v14 = a2;
  int64_t v13 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  v5 = v15;
  v15 = 0;
  v10.receiver = v5;
  v10.super_class = (Class)SUSettingsUserDefaultsEntry;
  v9 = [(SUSettingsUserDefaultsEntry *)&v10 init];
  v15 = v9;
  objc_storeStrong((id *)&v15, v9);
  if (v9)
  {
    v15->_type = v13;
    objc_storeStrong((id *)&v15->_key, location);
    objc_storeStrong((id *)&v15->_entryDescription, v11);
  }
  v7 = v15;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (id)initBoolEntryWithKey:(id)a3 description:(id)a4
{
  objc_super v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  objc_super v10 = 0;
  objc_super v10 = [(SUSettingsUserDefaultsEntry *)v4 initWithType:0 key:location[0] description:v8];
  v7 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (id)initNumberEntryWithKey:(id)a3 description:(id)a4
{
  objc_super v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  objc_super v10 = 0;
  objc_super v10 = [(SUSettingsUserDefaultsEntry *)v4 initWithType:1 key:location[0] description:v8];
  v7 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (id)initStringEntryWithKey:(id)a3 description:(id)a4
{
  objc_super v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  objc_super v10 = 0;
  objc_super v10 = [(SUSettingsUserDefaultsEntry *)v4 initWithType:2 key:location[0] description:v8];
  v7 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)entryDescription
{
  return self->_entryDescription;
}

- (void).cxx_destruct
{
}

@end