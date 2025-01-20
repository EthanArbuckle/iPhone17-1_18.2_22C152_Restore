@interface MRDBrowsableContentAPICoordinator
- (MRDBrowsableContentAPICoordinator)init;
- (id)applicationsSupportingAPIs:(unsigned int)a3;
- (unsigned)supportedAPIsForApplication:(id)a3;
- (void)setSupportedAPIs:(unsigned int)a3 forApplication:(id)a4;
@end

@implementation MRDBrowsableContentAPICoordinator

- (MRDBrowsableContentAPICoordinator)init
{
  v10.receiver = self;
  v10.super_class = (Class)MRDBrowsableContentAPICoordinator;
  v2 = [(MRDBrowsableContentAPICoordinator *)&v10 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    v4 = [v3 dictionaryForKey:@"MRDBrowsableContentAPICoordinatorPersistence"];
    v5 = (NSMutableDictionary *)[v4 mutableCopy];
    persistenceDictionary = v2->_persistenceDictionary;
    v2->_persistenceDictionary = v5;

    if (!v2->_persistenceDictionary)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v8 = v2->_persistenceDictionary;
      v2->_persistenceDictionary = v7;
    }
    if (([v3 BOOLForKey:@"MRDBrowsableContentAPICoordinatorStoredCaseSensitive"] & 1) == 0)
    {
      [v3 removeObjectForKey:@"MRDBrowsableContentAPICoordinatorPersistence"];
      [v3 setBool:1 forKey:@"MRDBrowsableContentAPICoordinatorStoredCaseSensitive"];
      [(NSMutableDictionary *)v2->_persistenceDictionary removeAllObjects];
    }
  }
  return v2;
}

- (unsigned)supportedAPIsForApplication:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_persistenceDictionary objectForKey:a3];
  v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

- (void)setSupportedAPIs:(unsigned int)a3 forApplication:(id)a4
{
  if (a4)
  {
    uint64_t v4 = *(void *)&a3;
    persistenceDictionary = self->_persistenceDictionary;
    id v7 = a4;
    v8 = +[NSNumber numberWithUnsignedInt:v4];
    [(NSMutableDictionary *)persistenceDictionary setObject:v8 forKey:v7];

    id v9 = +[NSUserDefaults standardUserDefaults];
    [v9 setObject:self->_persistenceDictionary forKey:@"MRDBrowsableContentAPICoordinatorPersistence"];
  }
}

- (id)applicationsSupportingAPIs:(unsigned int)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  persistenceDictionary = self->_persistenceDictionary;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035894;
  v9[3] = &unk_100416E08;
  unsigned int v11 = a3;
  id v7 = v5;
  id v10 = v7;
  [(NSMutableDictionary *)persistenceDictionary enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

- (void).cxx_destruct
{
}

@end