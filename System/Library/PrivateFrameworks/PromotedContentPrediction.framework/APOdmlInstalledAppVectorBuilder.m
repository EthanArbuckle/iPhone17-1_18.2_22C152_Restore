@interface APOdmlInstalledAppVectorBuilder
- (APOdmlInstalledAppVectorBuilder)initWithVersion:(id)a3 lookbackPeriod:(id)a4 maxQueryElements:(id)a5 task:(id)a6 exponentialDecayConstant:(id)a7 weightByDuration:(id)a8 isCounterfactual:(BOOL)a9;
- (NSMutableDictionary)bundleIDtoAppInfo;
- (double)weightForEvents:(id)a3;
- (id)_installedStoreAppEnumerator;
- (id)eventName;
- (id)eventsBetween:(id)a3 and:(id)a4;
- (id)retrieveFilteredEvents:(id)a3;
- (void)buildBundleIDtoAdamIDCache:(id)a3;
- (void)setBundleIDtoAppInfo:(id)a3;
@end

@implementation APOdmlInstalledAppVectorBuilder

- (APOdmlInstalledAppVectorBuilder)initWithVersion:(id)a3 lookbackPeriod:(id)a4 maxQueryElements:(id)a5 task:(id)a6 exponentialDecayConstant:(id)a7 weightByDuration:(id)a8 isCounterfactual:(BOOL)a9
{
  v16.receiver = self;
  v16.super_class = (Class)APOdmlInstalledAppVectorBuilder;
  v11 = [(APOdmlVectorBuilder *)&v16 initWithVersion:a3 lookbackPeriod:a4 maxQueryElements:a5 task:a6 exponentialDecayConstant:a7 weightByDuration:a8 isCounterfactual:a9];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v9, v10);
    bundleIDtoAppInfo = v11->_bundleIDtoAppInfo;
    v11->_bundleIDtoAppInfo = (NSMutableDictionary *)v12;
  }
  return v11;
}

- (id)eventsBetween:(id)a3 and:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v44 = a4;
  v8 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v6, v7);
  context = (void *)MEMORY[0x1C1864650]();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v11 = objc_msgSend__installedStoreAppEnumerator(self, v9, v10);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v46, v50, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(v11);
        }
        v19 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v20 = objc_msgSend_bundleIdentifier(v19, v14, v15);

        if (v20)
        {
          v21 = objc_msgSend_iTunesMetadata(v19, v14, v15);
          uint64_t v24 = objc_msgSend_storeItemIdentifier(v21, v22, v23);

          v25 = [APOdmlAppInfo alloc];
          v28 = objc_msgSend_bundleIdentifier(v19, v26, v27);
          v30 = objc_msgSend_initWithBundleID_adamID_(v25, v29, (uint64_t)v28, v24);

          objc_msgSend_addObject_(v8, v31, (uint64_t)v30);
          v34 = objc_msgSend_bundleIDtoAppInfo(self, v32, v33);
          v37 = objc_msgSend_bundleIdentifier(v19, v35, v36);
          objc_msgSend_setObject_forKeyedSubscript_(v34, v38, (uint64_t)v30, v37);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v46, v50, 16);
    }
    while (v16);
  }

  v41 = objc_msgSend_allObjects(v8, v39, v40);

  return v41;
}

- (void)buildBundleIDtoAdamIDCache:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v24, v28, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_bundleID(v12, v7, v8);
        uint64_t v16 = objc_msgSend_adamIDtoBundleID(self, v14, v15);
        uint64_t v17 = NSNumber;
        uint64_t v20 = objc_msgSend_adamID(v12, v18, v19);
        v22 = objc_msgSend_numberWithUnsignedLongLong_(v17, v21, v20);
        objc_msgSend_setObject_forKeyedSubscript_(v16, v23, (uint64_t)v13, v22);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v24, v28, 16);
    }
    while (v9);
  }
}

- (double)weightForEvents:(id)a3
{
  return 1.0;
}

- (id)retrieveFilteredEvents:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_bundleIDtoAppInfo(self, v5, v6);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v4);

  if (v9)
  {
    v30 = v9;
    uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)&v30, 1);
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v13 = objc_msgSend_events(self, v10, v11, 0);
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v26, v32, 16);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v13);
          }
          v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v22 = objc_msgSend_bundleID(v21, v16, v17);
          char isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)v4);

          if (isEqualToString)
          {
            v31 = v21;
            uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)&v31, 1);

            goto LABEL_13;
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v26, v32, 16);
        if (v18) {
          continue;
        }
        break;
      }
    }

    uint64_t v12 = 0;
  }
LABEL_13:

  return v12;
}

- (id)_installedStoreAppEnumerator
{
  v2 = objc_msgSend_enumeratorWithOptions_(MEMORY[0x1E4F223C8], a2, 0);
  objc_msgSend_setFilter_(v2, v3, (uint64_t)&unk_1F14FE6F8);

  return v2;
}

- (id)eventName
{
  return @"InstalledAppEvent";
}

- (NSMutableDictionary)bundleIDtoAppInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBundleIDtoAppInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end