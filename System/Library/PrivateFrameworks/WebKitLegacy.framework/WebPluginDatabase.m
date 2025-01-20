@interface WebPluginDatabase
+ (id)_defaultPlugInPaths;
+ (id)sharedDatabase;
+ (id)sharedDatabaseIfExists;
+ (void)closeSharedDatabase;
+ (void)setAdditionalWebPlugInPaths:(id)a3;
- (BOOL)isMIMETypeRegistered:(id)a3;
- (WebPluginDatabase)init;
- (id)_plugInPaths;
- (id)_scanForNewPlugins;
- (id)pluginForExtension:(id)a3;
- (id)pluginForMIMEType:(id)a3;
- (id)plugins;
- (void)_addPlugin:(id)a3;
- (void)_removePlugin:(id)a3;
- (void)addPluginInstanceView:(id)a3;
- (void)close;
- (void)dealloc;
- (void)destroyAllPluginInstanceViews;
- (void)refresh;
- (void)removePluginInstanceView:(id)a3;
- (void)removePluginInstanceViewsFor:(id)a3;
- (void)setPlugInPaths:(id)a3;
@end

@implementation WebPluginDatabase

+ (id)sharedDatabase
{
  if (byte_1EB3A967D)
  {
    id result = (id)qword_1EB3A9698;
    if (qword_1EB3A9698) {
      return result;
    }
  }
  else
  {
    qword_1EB3A9698 = 0;
    byte_1EB3A967D = 1;
  }
  v4 = objc_alloc_init(WebPluginDatabase);
  v5 = (const void *)qword_1EB3A9698;
  qword_1EB3A9698 = (uint64_t)v4;
  if (v5)
  {
    CFRelease(v5);
    v4 = (WebPluginDatabase *)qword_1EB3A9698;
  }
  -[WebPluginDatabase setPlugInPaths:](v4, "setPlugInPaths:", [a1 _defaultPlugInPaths]);
  [(id)qword_1EB3A9698 refresh];
  return (id)qword_1EB3A9698;
}

+ (id)sharedDatabaseIfExists
{
  if (byte_1EB3A967D == 1) {
    return (id)qword_1EB3A9698;
  }
  id result = 0;
  qword_1EB3A9698 = 0;
  byte_1EB3A967D = 1;
  return result;
}

+ (void)closeSharedDatabase
{
  if (byte_1EB3A967D == 1)
  {
    v2 = (void *)qword_1EB3A9698;
  }
  else
  {
    v2 = 0;
    qword_1EB3A9698 = 0;
    byte_1EB3A967D = 1;
  }
  [v2 close];
}

- (id)pluginForMIMEType:(id)a3
{
  id v15 = 0;
  id v16 = 0;
  uint64_t v4 = [a3 lowercaseString];
  v5 = (void *)[(NSMutableDictionary *)self->plugins objectEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (!v6)
  {
    id v11 = 0;
    goto LABEL_18;
  }
  v7 = (WebBasePluginPackage *)v6;
  do
  {
    MEMORY[0x1E4E442D0](&v14, v4);
    BOOL v9 = [(WebBasePluginPackage *)v7 supportsMIMEType:&v14];
    v10 = v14;
    v14 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
      {
        WTF::StringImpl::destroy(v10, v8);
        if (!v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
      *(_DWORD *)v10 -= 2;
    }
    if (!v9) {
      goto LABEL_3;
    }
LABEL_10:
    PluginPackageCandidates::update(&v15, v7);
LABEL_3:
    v7 = (WebBasePluginPackage *)[v5 nextObject];
  }
  while (v7);
  id v11 = v15;
  if (v15)
  {
    id v12 = v15;
    if (![v15 isQuickTimePlugIn]) {
      return v12;
    }
  }
  id v12 = v16;
  if (!v16)
  {
LABEL_18:
    if (v11) {
      return v11;
    }
    return 0;
  }
  if ([v16 isQuickTimePlugIn] && v11) {
    return v11;
  }
  return v12;
}

- (id)pluginForExtension:(id)a3
{
  id v16 = 0;
  id v17 = 0;
  uint64_t v4 = [a3 lowercaseString];
  v5 = (void *)[(NSMutableDictionary *)self->plugins objectEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (!v6)
  {
    id v11 = 0;
    goto LABEL_18;
  }
  v7 = (WebBasePluginPackage *)v6;
  do
  {
    MEMORY[0x1E4E442D0](&v15, v4);
    BOOL v9 = [(WebBasePluginPackage *)v7 supportsExtension:&v15];
    v10 = v15;
    id v15 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
      {
        WTF::StringImpl::destroy(v10, v8);
        if (!v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
      *(_DWORD *)v10 -= 2;
    }
    if (!v9) {
      goto LABEL_3;
    }
LABEL_10:
    PluginPackageCandidates::update(&v16, v7);
LABEL_3:
    v7 = (WebBasePluginPackage *)[v5 nextObject];
  }
  while (v7);
  id v11 = v16;
  if (v16 && ![v16 isQuickTimePlugIn]) {
    return v11;
  }
  id v12 = v17;
  if (v17)
  {
    if (([v17 isQuickTimePlugIn] & (v11 != 0)) == 0) {
      return v12;
    }
    return v11;
  }
LABEL_18:
  if (!v11)
  {
    v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F290B0], "sharedMappings"), "MIMETypeForExtension:", v4);
    if ([v13 length]) {
      return [(WebPluginDatabase *)self pluginForMIMEType:v13];
    }
    else {
      return 0;
    }
  }
  return v11;
}

- (id)plugins
{
  return (id)[(NSMutableDictionary *)self->plugins allValues];
}

+ (void)setAdditionalWebPlugInPaths:(id)a3
{
  if (byte_1EB3A967E == 1)
  {
    if ((id)qword_1EB3A96A0 == a3) {
      return;
    }
  }
  else
  {
    qword_1EB3A96A0 = 0;
    byte_1EB3A967E = 1;
    if (!a3) {
      return;
    }
  }
  uint64_t v3 = [a3 copy];
  if (byte_1EB3A967E)
  {
    uint64_t v4 = (const void *)qword_1EB3A96A0;
    qword_1EB3A96A0 = v3;
    if (v4)
    {
      CFRelease(v4);
    }
  }
  else
  {
    byte_1EB3A967E = 1;
    qword_1EB3A96A0 = v3;
  }
}

- (void)setPlugInPaths:(id)a3
{
  plugInPaths = self->plugInPaths;
  if (plugInPaths != a3)
  {

    self->plugInPaths = (NSArray *)[a3 copy];
  }
}

- (void)close
{
  uint64_t v3 = objc_msgSend(-[WebPluginDatabase plugins](self, "plugins"), "objectEnumerator");
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    uint64_t v5 = v4;
    do
    {
      [(WebPluginDatabase *)self _removePlugin:v5];
      uint64_t v5 = [v3 nextObject];
    }
    while (v5);
  }

  self->plugins = 0;
}

- (WebPluginDatabase)init
{
  v4.receiver = self;
  v4.super_class = (Class)WebPluginDatabase;
  v2 = [(WebPluginDatabase *)&v4 init];
  if (v2)
  {
    v2->registeredMIMETypes = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->pluginInstanceViews = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebPluginDatabase;
  [(WebPluginDatabase *)&v3 dealloc];
}

- (void)refresh
{
  objc_super v3 = (void *)MEMORY[0x1E4E4B3F0](self, a2);
  if (!self->plugins) {
    self->plugins = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:12];
  }
  id v4 = [(WebPluginDatabase *)self _scanForNewPlugins];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->plugins objectEnumerator];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    uint64_t v8 = v7;
    do
    {
      if (([v4 containsObject:v8] & 1) == 0) {
        [v5 addObject:v8];
      }
      [v4 removeObject:v8];
      uint64_t v8 = [v6 nextObject];
    }
    while (v8);
  }
  BOOL v9 = (void *)[v5 objectEnumerator];
  uint64_t v10 = [v9 nextObject];
  if (v10)
  {
    uint64_t v11 = v10;
    do
    {
      [(WebPluginDatabase *)self _removePlugin:v11];
      uint64_t v11 = [v9 nextObject];
    }
    while (v11);
  }
  id v12 = objc_msgSend(v4, "objectEnumerator", v11);
  uint64_t v13 = [v12 nextObject];
  if (v13)
  {
    uint64_t v14 = v13;
    do
    {
      [(WebPluginDatabase *)self _addPlugin:v14];
      uint64_t v14 = [v12 nextObject];
    }
    while (v14);
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v16 = (void *)[(NSMutableDictionary *)self->plugins objectEnumerator];
  while (1)
  {
    id v17 = (void *)[v16 nextObject];
    if (!v17) {
      break;
    }
    uint64_t v18 = [v17 pluginInfo];
    if (*(_DWORD *)(v18 + 36))
    {
      uint64_t v19 = 0;
      unint64_t v20 = 0;
      do
      {
        if (*(void *)(*(void *)(v18 + 24) + v19)) {
          v21 = (__CFString *)WTF::StringImpl::operator NSString *();
        }
        else {
          v21 = &stru_1F3C7DA90;
        }
        [v15 addObject:v21];
        ++v20;
        v19 += 32;
      }
      while (v20 < *(unsigned int *)(v18 + 36));
    }
  }
  v22 = (void *)[v15 objectEnumerator];
  while (1)
  {
    uint64_t v23 = [v22 nextObject];
    if (!v23) {
      break;
    }
    [(NSMutableSet *)self->registeredMIMETypes addObject:v23];
    if (!+[WebView canShowMIMETypeAsHTML:v23])
    {
      id v24 = [(WebPluginDatabase *)self pluginForMIMEType:v23];
      if (([v24 isJavaPlugIn] & 1) == 0
        && (![v24 isQuickTimePlugIn]
         || !objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 0), "objectForKey:", v23)))
      {
        if (byte_1EB3A967D == 1)
        {
          if ((WebPluginDatabase *)qword_1EB3A9698 == self) {
            goto LABEL_31;
          }
        }
        else
        {
          qword_1EB3A9698 = 0;
          byte_1EB3A967D = 1;
          if (!self) {
LABEL_31:
          }
            +[WebView _registerPluginMIMEType:v23];
        }
      }
    }
  }
  if (v15) {
    CFRelease(v15);
  }
}

- (BOOL)isMIMETypeRegistered:(id)a3
{
  return [(NSMutableSet *)self->registeredMIMETypes containsObject:a3];
}

- (void)addPluginInstanceView:(id)a3
{
}

- (void)removePluginInstanceView:(id)a3
{
}

- (void)removePluginInstanceViewsFor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->pluginInstanceViews count])
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "frameView"), "documentView");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v6 = objc_msgSend(v5, "subviews", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 == v9)
            {
              uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
              if (!+[WebPluginController isPlugInView:v11]) {
                continue;
              }
            }
            else
            {
              objc_enumerationMutation(v6);
              uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
              if (!+[WebPluginController isPlugInView:v11]) {
                continue;
              }
            }
            [(NSMutableSet *)self->pluginInstanceViews removeObject:v11];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)destroyAllPluginInstanceViews
{
  v2 = objc_msgSend((id)-[NSMutableSet allObjects](self->pluginInstanceViews, "allObjects"), "objectEnumerator");
  uint64_t v3 = [v2 nextObject];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      if (+[WebPluginController isPlugInView:v4]) {
        objc_msgSend((id)objc_msgSend(v4, "superview"), "performSelector:", sel__destroyAllWebPlugins);
      }
      id v4 = (void *)[v2 nextObject];
    }
    while (v4);
  }
}

+ (id)_defaultPlugInPaths
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_plugInPaths
{
  if (byte_1EB3A967D == 1)
  {
    if ((WebPluginDatabase *)qword_1EB3A9698 != self) {
      return self->plugInPaths;
    }
  }
  else
  {
    qword_1EB3A9698 = 0;
    byte_1EB3A967D = 1;
    if (self) {
      return self->plugInPaths;
    }
  }
  if (byte_1EB3A967E)
  {
    if (!qword_1EB3A96A0) {
      return self->plugInPaths;
    }
    uint64_t v3 = (void *)[(NSArray *)self->plugInPaths mutableCopy];
    id v4 = v3;
    if (byte_1EB3A967E == 1)
    {
      uint64_t v5 = qword_1EB3A96A0;
    }
    else
    {
      uint64_t v5 = 0;
      qword_1EB3A96A0 = 0;
      byte_1EB3A967E = 1;
    }
    [v3 addObjectsFromArray:v5];
    uint64_t v6 = (void *)CFMakeCollectable(v4);
    return v6;
  }
  else
  {
    qword_1EB3A96A0 = 0;
    byte_1EB3A967E = 1;
    return self->plugInPaths;
  }
}

- (void)_addPlugin:(id)a3
{
  if (*(void *)[a3 path]) {
    uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v5 = &stru_1F3C7DA90;
  }
  [(NSMutableDictionary *)self->plugins setObject:a3 forKey:v5];
  [a3 wasAddedToPluginDatabase:self];
}

- (void)_removePlugin:(id)a3
{
  uint64_t v5 = [a3 pluginInfo];
  if (*(_DWORD *)(v5 + 36))
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    while (1)
    {
      if (*(void *)(*(void *)(v6 + 24) + v7))
      {
        uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
        if (![(NSMutableSet *)self->registeredMIMETypes containsObject:v9]) {
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v9 = &stru_1F3C7DA90;
        if (![(NSMutableSet *)self->registeredMIMETypes containsObject:&stru_1F3C7DA90])goto LABEL_4; {
      }
        }
      if (byte_1EB3A967D != 1) {
        break;
      }
      if ((WebPluginDatabase *)qword_1EB3A9698 == self) {
        goto LABEL_11;
      }
LABEL_3:
      [(NSMutableSet *)self->registeredMIMETypes removeObject:v9];
LABEL_4:
      ++v8;
      v7 += 32;
      if (v8 >= *(unsigned int *)(v6 + 36)) {
        goto LABEL_14;
      }
    }
    qword_1EB3A9698 = 0;
    byte_1EB3A967D = 1;
    if (self) {
      goto LABEL_3;
    }
LABEL_11:
    +[WebView _unregisterPluginMIMEType:v9];
    goto LABEL_3;
  }
LABEL_14:
  if (*(void *)[a3 path])
  {
    uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (!a3) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v10 = &stru_1F3C7DA90;
  if (a3) {
LABEL_16:
  }
    CFRetain(a3);
LABEL_17:
  [(NSMutableDictionary *)self->plugins removeObjectForKey:v10];
  [a3 wasRemovedFromPluginDatabase:self];
  if (a3)
  {
    CFRelease(a3);
  }
}

- (id)_scanForNewPlugins
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  id v4 = objc_msgSend(-[WebPluginDatabase _plugInPaths](self, "_plugInPaths"), "objectEnumerator");
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  while (1)
  {
    uint64_t v7 = (void *)[v4 nextObject];
    if (!v7) {
      break;
    }
    unint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v7, 0), "objectEnumerator");
    while (1)
    {
      uint64_t v9 = [v8 nextObject];
      if (!v9) {
        break;
      }
      if (([v5 containsObject:v9] & 1) == 0)
      {
        [v5 addObject:v9];
        uint64_t v10 = [v7 stringByAppendingPathComponent:v9];
        if ([(NSMutableDictionary *)self->plugins objectForKey:v10]
          || +[WebBasePluginPackage pluginWithPath:v10])
        {
          objc_msgSend(v3, "addObject:");
        }
      }
    }
  }
  if (v5) {
    CFRelease(v5);
  }
  return v3;
}

@end