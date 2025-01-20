@interface PROLegacyPluginManager
+ (id)pluginManager;
- (PROLegacyPluginManager)init;
- (id)apiForProtocol:(id)a3;
- (int)addPluginProtocol:(id)a3;
- (int)addPluginSearchDirectory:(id)a3;
- (int)getBundlePath:(id *)a3 forPluginClassName:(id)a4;
- (int)getNumPluginsForProtocol:(id)a3;
- (int)getPluginClass:(Class *)a3 forPluginClassName:(id)a4;
- (int)getPluginClass:(Class *)a3 forPluginDisplayName:(id)a4;
- (int)getPluginClass:(Class *)a3 forPluginDisplayName:(id)a4 forProtocol:(id)a5;
- (int)getPluginClassNames:(id)a3 forGroupName:(id)a4;
- (int)getPluginClassNames:(id)a3 forGroupName:(id)a4 forProtocol:(id)a5;
- (int)getPluginClassNames:(id)a3 forProtocol:(id)a4;
- (int)getPluginDisplayNames:(id)a3 forGroupName:(id)a4;
- (int)getPluginDisplayNames:(id)a3 forGroupName:(id)a4 forProtocol:(id)a5;
- (int)getPluginDisplayNames:(id)a3 forProtocol:(id)a4;
- (int)getPluginGroupNames:(id)a3;
- (int)getPluginGroupNames:(id)a3 forProtocol:(id)a4;
- (int)getPluginInfoDictionaries:(id)a3 forProtocol:(id)a4;
- (int)loadPluginClass:(Class *)a3 withName:(id)a4 fromBundlePath:(id)a5;
- (int)registerBundle:(id)a3 withPluginDictionaryList:(id)a4;
- (int)registerBundleDynamic:(id)a3;
- (int)registerPluginWithDictionary:(id)a3 withClassName:(id)a4 withBundle:(id)a5 withProtocolName:(id)a6;
- (int)removeApiForProtocol:(id)a3;
- (int)scanForPluginsInDirectory:(id)a3;
- (int)setApiObject:(id)a3 forProtocol:(id)a4;
- (int)setApiObjects:(id)a3 forProtocols:(id)a4;
- (int)setPluginSearchDirectories:(id)a3;
- (void)dealloc;
- (void)localizeKey:(id)a3 withDefault:(id)a4 forPlugin:(id)a5 fromBundle:(id)a6;
@end

@implementation PROLegacyPluginManager

+ (id)pluginManager
{
  id result = (id)sharedPluginManager;
  if (!sharedPluginManager)
  {
    id result = objc_alloc_init((Class)a1);
    sharedPluginManager = (uint64_t)result;
  }
  return result;
}

- (PROLegacyPluginManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)PROLegacyPluginManager;
  v2 = [(PROLegacyPluginManager *)&v4 init];
  if (v2)
  {
    v2->_pluginRegistry = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_apiRegistry = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
    v2->_pluginProtocols = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_pluginSearchDirectories = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)dealloc
{
  apiRegistry = self->_apiRegistry;
  if (apiRegistry)
  {
    CFRelease(apiRegistry);
    self->_apiRegistry = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)PROLegacyPluginManager;
  [(PROLegacyPluginManager *)&v4 dealloc];
}

- (int)addPluginProtocol:(id)a3
{
  if (!a3) {
    return 7;
  }
  Name = (char *)protocol_getName((Protocol *)a3);
  if (([(NSMutableArray *)self->_pluginProtocols containsObject:Name] & 1) == 0) {
    [(NSMutableArray *)self->_pluginProtocols addObject:Name];
  }

  return 0;
}

- (int)addPluginSearchDirectory:(id)a3
{
  if (!a3) {
    return 7;
  }
  -[NSMutableArray addObject:](self->_pluginSearchDirectories, "addObject:");
  return 0;
}

- (int)setPluginSearchDirectories:(id)a3
{
  if (!a3) {
    return 7;
  }
  if (![a3 count]) {
    return 8;
  }
  [(NSMutableArray *)self->_pluginSearchDirectories removeAllObjects];
  [(NSMutableArray *)self->_pluginSearchDirectories addObjectsFromArray:a3];
  return 0;
}

- (int)setApiObject:(id)a3 forProtocol:(id)a4
{
  int result = 7;
  if (a3)
  {
    if (a4)
    {
      Name = protocol_getName((Protocol *)a4);
      CFDictionarySetValue(self->_apiRegistry, Name, a3);
      return 0;
    }
  }
  return result;
}

- (int)setApiObjects:(id)a3 forProtocols:(id)a4
{
  objc_super v4 = self;
  LODWORD(self) = 7;
  if (a3)
  {
    if (a4)
    {
      self = (PROLegacyPluginManager *)[a3 count];
      if (self)
      {
        uint64_t v7 = 0;
        unsigned int v8 = 1;
        do
        {
          Name = protocol_getName((Protocol *)[a4 objectAtIndex:v7]);
          CFDictionarySetValue(v4->_apiRegistry, Name, (const void *)[a3 objectAtIndex:v7]);
          uint64_t v7 = v8;
        }
        while ([a3 count] > (unint64_t)v8++);
        LODWORD(self) = 0;
      }
    }
  }
  return (int)self;
}

- (id)apiForProtocol:(id)a3
{
  Name = protocol_getName((Protocol *)a3);
  apiRegistry = self->_apiRegistry;

  return (id)CFDictionaryGetValue(apiRegistry, Name);
}

- (int)removeApiForProtocol:(id)a3
{
  Name = protocol_getName((Protocol *)a3);
  if (!CFDictionaryGetValue(self->_apiRegistry, Name)) {
    return 15;
  }
  CFDictionaryRemoveValue(self->_apiRegistry, Name);
  return 0;
}

- (void)localizeKey:(id)a3 withDefault:(id)a4 forPlugin:(id)a5 fromBundle:(id)a6
{
  v10 = objc_msgSend(a5, "objectForKey:");
  v11 = v10;
  if (v10 && (int v12 = [v10 isEqual:&stru_1F119C770], v13 = v11, !v12)
    || a4 && (v14 = [a4 isEqual:&stru_1F119C770], id v13 = a4, (v14 & 1) == 0))
  {
    uint64_t v15 = [a6 localizedStringForKey:v13 value:v13 table:0];
    if ((void *)v15 != v11)
    {
      [a5 setObject:v15 forKey:a3];
    }
  }
}

- (int)registerPluginWithDictionary:(id)a3 withClassName:(id)a4 withBundle:(id)a5 withProtocolName:(id)a6
{
  v11 = (void *)[(NSMutableDictionary *)self->_pluginRegistry objectForKey:a6];
  if (v11)
  {
    int v12 = v11;
    if ([v11 objectForKey:a4])
    {
      printf("PROPluginManager: WARNING: Class name [%s] already registered. Processing bundle [%s]\n", (const char *)[a4 UTF8String], (const char *)objc_msgSend((id)objc_msgSend(a5, "bundlePath"), "UTF8String"));
      return 3;
    }
  }
  else
  {
    int v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_pluginRegistry setObject:v12 forKey:a6];
  }
  char v14 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  [(PROLegacyPluginManager *)self localizeKey:@"groupName" withDefault:0 forPlugin:v14 fromBundle:a5];
  [(PROLegacyPluginManager *)self localizeKey:@"displayName" withDefault:a4 forPlugin:v14 fromBundle:a5];
  [(PROLegacyPluginManager *)self localizeKey:@"infoString" withDefault:0 forPlugin:v14 fromBundle:a5];
  [(PROLegacyPluginManager *)self localizeKey:@"helpURL" withDefault:0 forPlugin:v14 fromBundle:a5];
  [(PROLegacyPluginManager *)self localizeKey:@"vendorName" withDefault:0 forPlugin:v14 fromBundle:a5];
  objc_msgSend(v14, "setObject:forKey:", objc_msgSend(a5, "bundlePath"), @"bundlePath");
  [v12 setObject:v14 forKey:a4];
  return 0;
}

- (int)registerBundle:(id)a3 withPluginDictionaryList:(id)a4
{
  unint64_t v7 = [a4 count];
  if (v7)
  {
    uint64_t v8 = 0;
    while (1)
    {
      v9 = (void *)[a4 objectAtIndex:v8];
      if (v9)
      {
        v10 = v9;
        uint64_t v11 = [v9 objectForKey:@"className"];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = [v10 objectForKey:@"protocolName"];
          if (v13)
          {
            uint64_t v14 = v13;
            LODWORD(v9) = [(NSMutableArray *)self->_pluginProtocols containsObject:v13];
            if (v9) {
              LODWORD(v9) = [(PROLegacyPluginManager *)self registerPluginWithDictionary:v10 withClassName:v12 withBundle:a3 withProtocolName:v14];
            }
            goto LABEL_11;
          }
          objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
          printf("PROPluginManager: ERROR: Missing [protocolName] entry for item [%d] in bundle [%s]\n");
        }
        else
        {
          objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
          printf("PROPluginManager:  ERROR: Missing [className] entry for item [%d] in bundle [%s]\n");
        }
        LODWORD(v9) = 0;
      }
LABEL_11:
      if (++v8 >= v7 || v9) {
        return (int)v9;
      }
    }
  }
  LODWORD(v9) = 0;
  return (int)v9;
}

- (int)registerBundleDynamic:(id)a3
{
  return 21;
}

- (int)loadPluginClass:(Class *)a3 withName:(id)a4 fromBundlePath:(id)a5
{
  uint64_t v8 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:a5];
  if (v8)
  {
    [v8 load];
    v9 = NSClassFromString((NSString *)a4);
    *a3 = v9;
    if (v9) {
      return 0;
    }
    [a4 UTF8String];
    [a5 UTF8String];
    printf("PROPluginManager: ERROR: Class [%s]  not found in bundle [%s]\n");
  }
  else
  {
    [a5 UTF8String];
    printf("PROPluginManager: ERROR: Unable to open bundle [%s]\n");
  }
  return 5;
}

- (int)scanForPluginsInDirectory:(id)a3
{
  if (a3)
  {
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "enumeratorAtPath:", a3);
    uint64_t v6 = [v5 nextObject];
    if (v6)
    {
      unint64_t v7 = (void *)v6;
      while (!objc_msgSend((id)objc_msgSend(v7, "pathExtension"), "isEqualToString:", @"bundle"))
      {
LABEL_15:
        uint64_t v6 = [v5 nextObject];
        unint64_t v7 = (void *)v6;
        if (!v6) {
          return v6;
        }
      }
      uint64_t v8 = [a3 stringByAppendingPathComponent:v7];
      v9 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:v8];
      v10 = (void *)[v9 infoDictionary];
      uint64_t v11 = (void *)[v10 objectForKey:@"ProPlugPluginList"];
      uint64_t v12 = (void *)[v10 objectForKey:@"ProPlugDynamicRegistration"];
      if (v12)
      {
        if (([v12 BOOLValue] & 1) == 0 && v11)
        {
          if (![v11 count]) {
            goto LABEL_14;
          }
          goto LABEL_12;
        }
      }
      else if (v11 && [v11 count])
      {
LABEL_12:
        [(PROLegacyPluginManager *)self registerBundle:v9 withPluginDictionaryList:v11];
LABEL_14:
        [v5 skipDescendents];
        goto LABEL_15;
      }
      [(PROLegacyPluginManager *)self registerBundleDynamic:v9];
      goto LABEL_14;
    }
  }
  else
  {
    LODWORD(v6) = 7;
  }
  return v6;
}

- (int)getNumPluginsForProtocol:(id)a3
{
  v3 = (void *)[(NSMutableDictionary *)self->_pluginRegistry objectForKey:protocol_getName((Protocol *)a3)];
  if (v3) {
    LODWORD(v3) = [v3 count];
  }
  return (int)v3;
}

- (int)getPluginDisplayNames:(id)a3 forProtocol:(id)a4
{
  objc_super v4 = self;
  LODWORD(self) = 7;
  if (a3 && a4)
  {
    uint64_t v6 = (void *)[(NSMutableDictionary *)v4->_pluginRegistry objectForKey:protocol_getName((Protocol *)a4)];
    if (v6)
    {
      unint64_t v7 = (void *)[v6 objectEnumerator];
      for (self = (PROLegacyPluginManager *)[v7 nextObject];
            self;
            self = (PROLegacyPluginManager *)[v7 nextObject])
      {
        uint64_t v8 = [(PROLegacyPluginManager *)self objectForKey:@"displayName"];
        if (v8) {
          [a3 addObject:v8];
        }
      }
    }
    else
    {
      LODWORD(self) = 17;
    }
  }
  return (int)self;
}

- (int)getPluginClassNames:(id)a3 forProtocol:(id)a4
{
  objc_super v4 = self;
  LODWORD(self) = 7;
  if (a3 && a4)
  {
    uint64_t v6 = (void *)[(NSMutableDictionary *)v4->_pluginRegistry objectForKey:protocol_getName((Protocol *)a4)];
    if (v6)
    {
      unint64_t v7 = (void *)[v6 objectEnumerator];
      for (self = (PROLegacyPluginManager *)[v7 nextObject];
            self;
            self = (PROLegacyPluginManager *)[v7 nextObject])
      {
        uint64_t v8 = [(PROLegacyPluginManager *)self objectForKey:@"className"];
        if (v8) {
          [a3 addObject:v8];
        }
      }
    }
    else
    {
      LODWORD(self) = 17;
    }
  }
  return (int)self;
}

- (int)getPluginGroupNames:(id)a3
{
  return [(PROLegacyPluginManager *)self getPluginGroupNames:a3 forProtocol:0];
}

- (int)getPluginGroupNames:(id)a3 forProtocol:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      i = (void *)[(NSMutableDictionary *)self->_pluginRegistry objectForKey:protocol_getName((Protocol *)a4)];
      if (i)
      {
        uint64_t v6 = (void *)[i objectEnumerator];
        for (i = (void *)[v6 nextObject]; i; i = objc_msgSend(v6, "nextObject"))
        {
          uint64_t v7 = [i objectForKey:@"groupName"];
          if (v7)
          {
            uint64_t v8 = v7;
            if (([a3 containsObject:v7] & 1) == 0) {
              [a3 addObject:v8];
            }
          }
        }
      }
    }
    else
    {
      v9 = (void *)[(NSMutableDictionary *)self->_pluginRegistry objectEnumerator];
      for (i = (void *)[v9 nextObject]; i; i = objc_msgSend(v9, "nextObject"))
      {
        v10 = (void *)[i objectEnumerator];
        for (j = v10; ; v10 = j)
        {
          uint64_t v12 = (void *)[v10 nextObject];
          if (!v12) {
            break;
          }
          uint64_t v13 = [v12 objectForKey:@"groupName"];
          if (v13)
          {
            uint64_t v14 = v13;
            if (([a3 containsObject:v13] & 1) == 0) {
              [a3 addObject:v14];
            }
          }
        }
      }
    }
  }
  else
  {
    LODWORD(i) = 7;
  }
  return (int)i;
}

- (int)getPluginClassNames:(id)a3 forGroupName:(id)a4
{
  return [(PROLegacyPluginManager *)self getPluginClassNames:a3 forGroupName:0];
}

- (int)getPluginClassNames:(id)a3 forGroupName:(id)a4 forProtocol:(id)a5
{
  if (!a3)
  {
    LODWORD(i) = 7;
    return (int)i;
  }
  if (a5)
  {
    i = (void *)[(NSMutableDictionary *)self->_pluginRegistry objectForKey:protocol_getName((Protocol *)a5)];
    if (!i) {
      return (int)i;
    }
    uint64_t v8 = (void *)[i objectEnumerator];
    uint64_t v9 = [v8 nextObject];
    v10 = (void *)v9;
    if (a4)
    {
      if (v9)
      {
        do
        {
          uint64_t v11 = (void *)[v10 objectForKey:@"groupName"];
          if (v11 && [v11 isEqualToString:a4]) {
            objc_msgSend(a3, "addObject:", objc_msgSend(v10, "objectForKey:", @"className"));
          }
          i = (void *)[v8 nextObject];
          v10 = i;
        }
        while (i);
        return (int)i;
      }
LABEL_31:
      LODWORD(i) = 0;
      return (int)i;
    }
    if (!v9) {
      goto LABEL_31;
    }
    do
    {
      if (![v10 objectForKey:@"groupName"]) {
        objc_msgSend(a3, "addObject:", objc_msgSend(v10, "objectForKey:", @"className"));
      }
      i = (void *)[v8 nextObject];
      v10 = i;
    }
    while (i);
  }
  else
  {
    uint64_t v12 = (void *)[(NSMutableDictionary *)self->_pluginRegistry objectEnumerator];
    for (i = (void *)[v12 nextObject]; i; i = objc_msgSend(v12, "nextObject"))
    {
      uint64_t v13 = (void *)[i objectEnumerator];
      uint64_t v14 = [v13 nextObject];
      uint64_t v15 = (void *)v14;
      if (a4)
      {
        if (v14)
        {
          do
          {
            v16 = (void *)[v15 objectForKey:@"groupName"];
            if (v16 && [v16 isEqualToString:a4]) {
              objc_msgSend(a3, "addObject:", objc_msgSend(v15, "objectForKey:", @"className"));
            }
            uint64_t v15 = (void *)[v13 nextObject];
          }
          while (v15);
        }
      }
      else if (v14)
      {
        do
        {
          if (![v15 objectForKey:@"groupName"]) {
            objc_msgSend(a3, "addObject:", objc_msgSend(v15, "objectForKey:", @"className"));
          }
          uint64_t v15 = (void *)[v13 nextObject];
        }
        while (v15);
      }
    }
  }
  return (int)i;
}

- (int)getPluginDisplayNames:(id)a3 forGroupName:(id)a4
{
  return [(PROLegacyPluginManager *)self getPluginDisplayNames:a3 forGroupName:a4 forProtocol:0];
}

- (int)getPluginDisplayNames:(id)a3 forGroupName:(id)a4 forProtocol:(id)a5
{
  v5 = self;
  LODWORD(self) = 7;
  if (a3 && a4)
  {
    if (a5)
    {
      self = (PROLegacyPluginManager *)[(NSMutableDictionary *)v5->_pluginRegistry objectForKey:protocol_getName((Protocol *)a5)];
      if (self)
      {
        uint64_t v8 = (void *)[(PROLegacyPluginManager *)self objectEnumerator];
        self = (PROLegacyPluginManager *)[v8 nextObject];
        if (self)
        {
          uint64_t v9 = self;
          do
          {
            v10 = (void *)[(PROLegacyPluginManager *)v9 objectForKey:@"groupName"];
            if (v10 && [v10 isEqualToString:a4]) {
              objc_msgSend(a3, "addObject:", -[PROLegacyPluginManager objectForKey:](v9, "objectForKey:", @"displayName"));
            }
            self = (PROLegacyPluginManager *)[v8 nextObject];
            uint64_t v9 = self;
          }
          while (self);
        }
      }
    }
    else
    {
      uint64_t v11 = (void *)[(NSMutableDictionary *)v5->_pluginRegistry objectEnumerator];
      for (self = (PROLegacyPluginManager *)[v11 nextObject];
            self;
            self = (PROLegacyPluginManager *)[v11 nextObject])
      {
        uint64_t v12 = (void *)[(PROLegacyPluginManager *)self objectEnumerator];
        uint64_t v13 = [v12 nextObject];
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          do
          {
            uint64_t v15 = (void *)[v14 objectForKey:@"groupName"];
            if (v15 && [v15 isEqualToString:a4]) {
              objc_msgSend(a3, "addObject:", objc_msgSend(v14, "objectForKey:", @"displayName"));
            }
            uint64_t v14 = (void *)[v12 nextObject];
          }
          while (v14);
        }
      }
    }
  }
  return (int)self;
}

- (int)getPluginInfoDictionaries:(id)a3 forProtocol:(id)a4
{
  objc_super v4 = self;
  LODWORD(self) = 7;
  if (a3 && a4)
  {
    uint64_t v6 = (void *)[(NSMutableDictionary *)v4->_pluginRegistry objectForKey:protocol_getName((Protocol *)a4)];
    if (v6)
    {
      uint64_t v7 = (void *)[v6 objectEnumerator];
      self = (PROLegacyPluginManager *)[v7 nextObject];
      if (self)
      {
        uint64_t v8 = self;
        do
        {
          [a3 addObject:v8];
          self = (PROLegacyPluginManager *)[v7 nextObject];
          uint64_t v8 = self;
        }
        while (self);
      }
    }
    else
    {
      LODWORD(self) = 17;
    }
  }
  return (int)self;
}

- (int)getBundlePath:(id *)a3 forPluginClassName:(id)a4
{
  int result = 7;
  if (a3 && a4)
  {
    uint64_t v8 = (void *)[(NSMutableDictionary *)self->_pluginRegistry objectEnumerator];
    uint64_t v9 = [v8 nextObject];
    if (v9)
    {
      v10 = (void *)v9;
      do
      {
        uint64_t v11 = (void *)[v10 objectEnumerator];
        while (1)
        {
          uint64_t v12 = (void *)[v11 nextObject];
          if (!v12) {
            break;
          }
          uint64_t v13 = v12;
          if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"className"), "isEqualToString:", a4))
          {
            uint64_t v14 = (void *)[v13 objectForKey:@"bundlePath"];
            int result = 0;
            *a3 = v14;
            return result;
          }
        }
        v10 = (void *)[v8 nextObject];
        int result = 16;
      }
      while (v10);
    }
    else
    {
      return 16;
    }
  }
  return result;
}

- (int)getPluginClass:(Class *)a3 forPluginClassName:(id)a4
{
  int result = 7;
  if (a3 && a4)
  {
    uint64_t v8 = NSClassFromString((NSString *)a4);
    *a3 = v8;
    if (v8)
    {
      return 0;
    }
    else
    {
      uint64_t v9 = (void *)[(NSMutableDictionary *)self->_pluginRegistry objectEnumerator];
      uint64_t v10 = [v9 nextObject];
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        while (2)
        {
          uint64_t v12 = (void *)[v11 objectEnumerator];
          while (1)
          {
            uint64_t v13 = (void *)[v12 nextObject];
            if (!v13) {
              break;
            }
            uint64_t v14 = v13;
            if (objc_msgSend((id)objc_msgSend(v13, "objectForKey:", @"className"), "isEqualToString:", a4))
            {
              uint64_t v15 = [v14 objectForKey:@"bundlePath"];
              return [(PROLegacyPluginManager *)self loadPluginClass:a3 withName:a4 fromBundlePath:v15];
            }
          }
          uint64_t v11 = (void *)[v9 nextObject];
          int result = 16;
          if (v11) {
            continue;
          }
          break;
        }
      }
      else
      {
        return 16;
      }
    }
  }
  return result;
}

- (int)getPluginClass:(Class *)a3 forPluginDisplayName:(id)a4
{
  int result = 7;
  if (a3 && a4)
  {
    uint64_t v8 = (void *)[(NSMutableDictionary *)self->_pluginRegistry objectEnumerator];
    uint64_t v9 = [v8 nextObject];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      while (2)
      {
        uint64_t v11 = (void *)[v10 objectEnumerator];
        while (1)
        {
          uint64_t v12 = (void *)[v11 nextObject];
          if (!v12) {
            break;
          }
          uint64_t v13 = v12;
          if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"displayName"), "isEqualToString:", a4))
          {
            uint64_t v14 = (NSString *)[v13 objectForKey:@"className"];
            uint64_t v15 = NSClassFromString(v14);
            *a3 = v15;
            if (v15) {
              return 0;
            }
            uint64_t v16 = [v13 objectForKey:@"bundlePath"];
            return [(PROLegacyPluginManager *)self loadPluginClass:a3 withName:v14 fromBundlePath:v16];
          }
        }
        uint64_t v10 = (void *)[v8 nextObject];
        int result = 16;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      return 16;
    }
  }
  return result;
}

- (int)getPluginClass:(Class *)a3 forPluginDisplayName:(id)a4 forProtocol:(id)a5
{
  int result = 7;
  if (a3 && a4 && a5)
  {
    uint64_t v9 = (void *)[(NSMutableDictionary *)self->_pluginRegistry objectForKey:protocol_getName((Protocol *)a5)];
    if (v9)
    {
      uint64_t v10 = (void *)[v9 objectEnumerator];
      uint64_t v11 = [v10 nextObject];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        while (1)
        {
          if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"displayName"), "isEqualToString:", a4))
          {
            uint64_t v13 = (NSString *)[v12 objectForKey:@"className"];
            uint64_t v14 = NSClassFromString(v13);
            *a3 = v14;
            if (v14) {
              break;
            }
          }
          uint64_t v12 = (void *)[v10 nextObject];
          if (!v12) {
            return 16;
          }
        }
        uint64_t v15 = [v12 objectForKey:@"bundlePath"];
        return [(PROLegacyPluginManager *)self loadPluginClass:a3 withName:v13 fromBundlePath:v15];
      }
      else
      {
        return 16;
      }
    }
    else
    {
      return 17;
    }
  }
  return result;
}

@end