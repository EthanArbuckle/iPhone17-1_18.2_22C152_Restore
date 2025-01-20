@interface MediaSession
- (BOOL)isRegisteredForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4;
- (MediaSession)init;
- (NSMutableDictionary)registrations;
- (NSSet)lastKnownSupportedCommands;
- (id)lastKnownAttributeValueForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4;
- (id)notifiableAttributeIDs:(id)a3 entityID:(unsigned __int8)a4;
- (id)registrationForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4;
- (unsigned)loadedAttributeID;
- (unsigned)loadedEntityID;
- (void)setLastKnownAttributeValue:(id)a3 attributeID:(unsigned __int8)a4 entityID:(unsigned __int8)a5;
- (void)setLastKnownSupportedCommands:(id)a3;
- (void)setLoadedAttributeID:(unsigned __int8)a3;
- (void)setLoadedEntityID:(unsigned __int8)a3;
- (void)setRegisteredAttributeIDs:(id)a3 entityID:(unsigned __int8)a4;
- (void)setRegistrations:(id)a3;
@end

@implementation MediaSession

- (MediaSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)MediaSession;
  v2 = [(MediaSession *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registrations = v2->_registrations;
    v2->_registrations = v3;

    v2->_loadedEntityID = -1;
    v2->_loadedAttributeID = -1;
  }
  return v2;
}

- (void)setRegisteredAttributeIDs:(id)a3 entityID:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [v6 count];
  v8 = [(MediaSession *)self registrations];
  v9 = +[NSNumber numberWithUnsignedChar:v4];
  if (v7)
  {
    unsigned int v24 = v4;
    v10 = [v8 objectForKeyedSubscript:v9];

    v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v25 = v6;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v18 = [v10 objectForKeyedSubscript:v17];
          v19 = v18;
          if (v18) {
            v20 = v18;
          }
          else {
            v20 = objc_alloc_init(MediaRegistration);
          }
          v21 = v20;

          [v11 setObject:v21 forKeyedSubscript:v17];
        }
        id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }

    v22 = [(MediaSession *)self registrations];
    v23 = +[NSNumber numberWithUnsignedChar:v24];
    [v22 setObject:v11 forKeyedSubscript:v23];

    id v6 = v25;
  }
  else
  {
    [v8 removeObjectForKey:v9];
  }
}

- (id)notifiableAttributeIDs:(id)a3 entityID:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(MediaSession *)self registrations];
  v8 = +[NSNumber numberWithUnsignedChar:v4];
  v9 = [v7 objectForKeyedSubscript:v8];

  v10 = +[NSMutableSet set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v17 = [v9 objectForKeyedSubscript:v16];
        if (v17) {
          [v10 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  return v10;
}

- (BOOL)isRegisteredForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4
{
  uint64_t v4 = [(MediaSession *)self registrationForAttributeID:a3 entityID:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)setLastKnownAttributeValue:(id)a3 attributeID:(unsigned __int8)a4 entityID:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = [(MediaSession *)self registrationForAttributeID:v6 entityID:v5];
  [v9 setLastKnownAttributeValue:v8];
}

- (id)lastKnownAttributeValueForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4
{
  uint64_t v4 = [(MediaSession *)self registrationForAttributeID:a3 entityID:a4];
  uint64_t v5 = [v4 lastKnownAttributeValue];

  return v5;
}

- (id)registrationForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v6 = [(MediaSession *)self registrations];
  id v7 = +[NSNumber numberWithUnsignedChar:v4];
  id v8 = [v6 objectForKeyedSubscript:v7];
  id v9 = +[NSNumber numberWithUnsignedChar:v5];
  v10 = [v8 objectForKeyedSubscript:v9];

  return v10;
}

- (NSSet)lastKnownSupportedCommands
{
  return self->_lastKnownSupportedCommands;
}

- (void)setLastKnownSupportedCommands:(id)a3
{
}

- (unsigned)loadedEntityID
{
  return self->_loadedEntityID;
}

- (void)setLoadedEntityID:(unsigned __int8)a3
{
  self->_loadedEntityID = a3;
}

- (unsigned)loadedAttributeID
{
  return self->_loadedAttributeID;
}

- (void)setLoadedAttributeID:(unsigned __int8)a3
{
  self->_loadedAttributeID = a3;
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);

  objc_storeStrong((id *)&self->_lastKnownSupportedCommands, 0);
}

@end