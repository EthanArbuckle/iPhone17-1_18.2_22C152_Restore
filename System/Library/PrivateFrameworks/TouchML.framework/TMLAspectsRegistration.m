@interface TMLAspectsRegistration
+ (id)keyForClassNamed:(id)a3 signalName:(id)a4 advice:(int)a5;
+ (id)keyForProtocolNamed:(id)a3 signalName:(id)a4 advice:(int)a5;
+ (id)keysForObject:(id)a3 withMetaObjects:(id)a4 signalName:(id)a5 advice:(int)a6;
+ (id)shared;
- (TMLAspectsRegistration)init;
- (id)aspectsForObject:(id)a3 signalName:(id)a4 advice:(int)a5;
- (id)aspectsWithKey:(id)a3;
- (id)aspectsWithKeys:(id)a3;
- (id)storageForKey:(id)a3 createIfMissing:(BOOL)a4;
- (id)strongAspectsFromArray:(id)a3;
- (void)registerAspect:(id)a3 withKey:(id)a4;
- (void)unregisterAspect:(id)a3 withKey:(id)a4;
@end

@implementation TMLAspectsRegistration

+ (id)shared
{
  if (qword_268A05650 != -1) {
    dispatch_once(&qword_268A05650, &unk_26ECEB9D8);
  }
  v2 = (void *)qword_268A05648;
  return v2;
}

- (TMLAspectsRegistration)init
{
  v8.receiver = self;
  v8.super_class = (Class)TMLAspectsRegistration;
  v3 = [(TMLAspectsRegistration *)&v8 init];
  if (v3)
  {
    uint64_t v5 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x263F08968], v2, v4);
    registeredAspects = v3->_registeredAspects;
    v3->_registeredAspects = (NSMapTable *)v5;
  }
  return v3;
}

- (id)storageForKey:(id)a3 createIfMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10 = objc_msgSend_objectForKey_(self->_registeredAspects, v7, v8, v6);
  if (v10) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = !v4;
  }
  if (!v12)
  {
    v10 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v9, v11, 3);
    objc_msgSend_setObject_forKey_(self->_registeredAspects, v13, v14, v10, v6);
  }

  return v10;
}

- (void)registerAspect:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  objc_msgSend_storageForKey_createIfMissing_(self, v7, v8, a4, 1);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  double v11 = objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v9, v10, v6);

  objc_msgSend_addObject_(v14, v12, v13, v11);
}

- (void)unregisterAspect:(id)a3 withKey:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v10 = objc_msgSend_storageForKey_createIfMissing_(self, v8, v9, v7, 0);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, 0.0, &v26, v30, 16);
  if (!v12) {
    goto LABEL_17;
  }
  uint64_t v15 = v12;
  v25 = self;
  v16 = 0;
  uint64_t v17 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v27 != v17) {
        objc_enumerationMutation(v10);
      }
      v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      uint64_t v20 = objc_msgSend_object(v19, v13, v14);
      v23 = (void *)v20;
      if (v20) {
        BOOL v24 = v20 == (void)v6;
      }
      else {
        BOOL v24 = 1;
      }
      if (!v24)
      {
        if (!v16)
        {
          v16 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v21, v22, 3);
        }
        objc_msgSend_addObject_(v16, v21, v22, v19);
      }
    }
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, v14, &v26, v30, 16);
  }
  while (v15);
  self = v25;
  if (v16)
  {
    objc_msgSend_setObject_forKey_(v25->_registeredAspects, v13, v14, v16, v7);
  }
  else
  {
LABEL_17:
    objc_msgSend_removeObjectForKey_(self->_registeredAspects, v13, v14, v7);
  }
}

- (id)strongAspectsFromArray:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_count(v3, v4, v5))
  {
    double v8 = (void *)MEMORY[0x263EFF980];
    uint64_t v9 = objc_msgSend_count(v3, v6, v7);
    uint64_t v12 = objc_msgSend_arrayWithCapacity_(v8, v10, v11, v9);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_23982EEB8;
    v20[3] = &unk_264DAB5C0;
    id v21 = v12;
    id v13 = v12;
    objc_msgSend_enumerateObjectsUsingBlock_(v3, v14, v15, v20);
    objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v16, v17, v13);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = v3;
  }

  return v18;
}

- (id)aspectsWithKey:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_registeredAspects, a2, v3, a3);
}

- (id)aspectsWithKeys:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, 0.0, &v22, v26, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    double v10 = 0;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v4);
        }
        id v13 = objc_msgSend_aspectsWithKey_(self, v7, v8, *(void *)(*((void *)&v22 + 1) + 8 * i));
        if (objc_msgSend_count(v13, v14, v15))
        {
          if (!v10)
          {
            double v10 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v16, v17, 2);
          }
          objc_msgSend_addObjectsFromArray_(v10, v16, v17, v13);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, v8, &v22, v26, 16);
    }
    while (v9);
  }
  else
  {
    double v10 = 0;
  }
  if (objc_msgSend_count(v10, v7, v8))
  {
    uint64_t v20 = objc_msgSend_strongAspectsFromArray_(self, v18, v19, v10);
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (id)aspectsForObject:(id)a3 signalName:(id)a4 advice:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_count(self->_registeredAspects, v10, v11))
  {
    double v14 = objc_msgSend_metaObjects(v8, v12, v13);
    double v17 = objc_msgSend_keysForObject_withMetaObjects_signalName_advice_(TMLAspectsRegistration, v15, v16, v8, v14, v9, v5);
    uint64_t v20 = objc_msgSend_aspectsWithKeys_(self, v18, v19, v17);
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

+ (id)keyForProtocolNamed:(id)a3 signalName:(id)a4 advice:(int)a5
{
  double v7 = (void *)MEMORY[0x263F089D8];
  id v8 = a4;
  id v9 = a3;
  uint64_t v12 = objc_msgSend_stringWithString_(v7, v10, v11, @"P");
  objc_msgSend_appendString_(v12, v13, v14, v9);

  objc_msgSend_appendString_(v12, v15, v16, @".");
  objc_msgSend_appendString_(v12, v17, v18, v8);

  objc_msgSend_appendString_(v12, v19, v20, @":");
  if (a5) {
    objc_msgSend_appendString_(v12, v21, v22, @"A");
  }
  else {
    objc_msgSend_appendString_(v12, v21, v22, @"B");
  }
  long long v25 = objc_msgSend_stringWithString_(NSString, v23, v24, v12);

  return v25;
}

+ (id)keyForClassNamed:(id)a3 signalName:(id)a4 advice:(int)a5
{
  double v7 = (void *)MEMORY[0x263F089D8];
  id v8 = a4;
  id v9 = a3;
  uint64_t v12 = objc_msgSend_stringWithString_(v7, v10, v11, @"C");
  objc_msgSend_appendString_(v12, v13, v14, v9);

  objc_msgSend_appendString_(v12, v15, v16, @".");
  objc_msgSend_appendString_(v12, v17, v18, v8);

  objc_msgSend_appendString_(v12, v19, v20, @":");
  if (a5) {
    objc_msgSend_appendString_(v12, v21, v22, @"A");
  }
  else {
    objc_msgSend_appendString_(v12, v21, v22, @"B");
  }
  long long v25 = objc_msgSend_stringWithString_(NSString, v23, v24, v12);

  return v25;
}

+ (id)keysForObject:(id)a3 withMetaObjects:(id)a4 signalName:(id)a5 advice:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v14 = objc_msgSend_orderedSetWithCapacity_(MEMORY[0x263EFF9B0], v12, v13, 4);
  unint64_t v15 = 0x26B876000uLL;
  double v18 = objc_msgSend_keyForClassNamed_signalName_advice_(TMLAspectsRegistration, v16, v17, @"*", v11, v6);
  objc_msgSend_addObject_(v14, v19, v20, v18);

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v21 = v10;
  uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, v23, &v75, v80, 16);
  if (!v70)
  {

LABEL_20:
    v57 = (objc_class *)objc_opt_class();
    v58 = NSStringFromClass(v57);
    v61 = objc_msgSend_keyForClassNamed_signalName_advice_((void *)(v15 + 1712), v59, v60, v58, v11, v6);
    objc_msgSend_addObject_(v14, v62, v63, v61);

    goto LABEL_21;
  }
  id v66 = v9;
  obuint64_t j = v21;
  char v68 = 0;
  uint64_t v69 = *(void *)v76;
  do
  {
    for (uint64_t i = 0; i != v70; ++i)
    {
      if (*(void *)v76 != v69) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void **)(*((void *)&v75 + 1) + 8 * i);
      long long v28 = objc_msgSend_type(v27, v24, v25);

      if (v28)
      {
        v30 = objc_opt_class();
        v33 = objc_msgSend_type(v27, v31, v32);
        v36 = objc_msgSend_keyForClassNamed_signalName_advice_(v30, v34, v35, v33, v11, v6);
        objc_msgSend_addObject_(v14, v37, v38, v36);

        char v68 = 1;
      }
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      v39 = objc_msgSend_implements(v27, v29, 0.0);
      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, v41, &v71, v79, 16);
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v72;
        do
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v72 != v44) {
              objc_enumerationMutation(v39);
            }
            uint64_t v46 = *(void *)(*((void *)&v71 + 1) + 8 * j);
            v47 = objc_opt_class();
            v50 = objc_msgSend_keyForProtocolNamed_signalName_advice_(v47, v48, v49, v46, v11, v6);
            objc_msgSend_addObject_(v14, v51, v52, v50);
          }
          uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v53, v54, &v71, v79, 16);
        }
        while (v43);
      }
    }
    id v21 = obj;
    uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, v25, &v75, v80, 16);
  }
  while (v70);

  id v9 = v66;
  unint64_t v15 = 0x26B876000;
  if ((v68 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_21:
  v64 = objc_msgSend_array(v14, v55, v56);

  return v64;
}

- (void).cxx_destruct
{
}

@end