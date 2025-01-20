@interface PKProviderForCapabilityMap
- (NSArray)capabilities;
- (NSMapTable)underlyingMapping;
- (PKProviderForCapabilityMap)init;
- (id)capabilityForIdentifier:(id)a3;
- (id)providerForCapability:(id)a3;
- (unint64_t)count;
- (void)addCapability:(id)a3 provider:(id)a4;
- (void)enumerateCapabilities:(id)a3;
- (void)enumerateInTopologicalOrderWithContext:(id)a3 enumerator:(id)a4;
- (void)removeCapability:(id)a3;
@end

@implementation PKProviderForCapabilityMap

- (PKProviderForCapabilityMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKProviderForCapabilityMap;
  v2 = [(PKProviderForCapabilityMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMapTable *)+[NSMapTable pk_createStrongPointerPersonalityToStrongObjects];
    mapping = v2->_mapping;
    v2->_mapping = v3;
  }
  return v2;
}

- (void)enumerateCapabilities:(id)a3
{
  v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  v5 = [(NSMapTable *)self->_mapping keyEnumerator];
  objc_super v6 = 0;
  do
  {
    v7 = v6;
    objc_super v6 = [v5 nextObject];

    if (!v6) {
      break;
    }
    v8 = [(NSMapTable *)self->_mapping objectForKey:v6];
    unsigned __int8 v10 = 0;
    v4[2](v4, v6, v8, &v10);
    int v9 = v10;
  }
  while (!v9);
}

- (void)enumerateInTopologicalOrderWithContext:(id)a3 enumerator:(id)a4
{
  id v38 = a3;
  v37 = (void (**)(id, void *, void *, unsigned char *))a4;
  v41 = self;
  objc_super v6 = [(PKProviderForCapabilityMap *)self capabilities];
  v7 = [v6 sortedArrayUsingComparator:&stru_100751600];

  id v40 = objc_alloc_init((Class)NSMutableDictionary);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v8 = v7;
  id v42 = [v8 countByEnumeratingWithState:&v75 objects:v82 count:16];
  if (v42)
  {
    uint64_t v39 = *(void *)v76;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v76 != v39)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(v8);
          uint64_t v9 = v10;
        }
        uint64_t v45 = v9;
        v11 = *(void **)(*((void *)&v75 + 1) + 8 * v9);
        location = [v11 identifier];
        id v12 = objc_alloc_init((Class)NSMutableArray);
        [v40 setObject:v12 forKeyedSubscript:location];
        id obj = [(PKProviderForCapabilityMap *)v41 providerForCapability:v11];
        if (objc_opt_respondsToSelector())
        {
          v13 = [obj associatedRequirementsForRequirement:v11 context:v38];
          v43 = v13;
          v14 = v13;
          if (v13)
          {
            id v15 = [v13 count];
            v14 = v43;
            if (v15)
            {
              long long v74 = 0u;
              long long v73 = 0u;
              long long v72 = 0u;
              long long v71 = 0u;
              id v16 = v43;
              id v17 = [v16 countByEnumeratingWithState:&v71 objects:v81 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v72;
                do
                {
                  for (i = 0; i != v17; i = (char *)i + 1)
                  {
                    if (*(void *)v72 != v18) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v20 = *(void *)(*((void *)&v71 + 1) + 8 * i);
                    v70[0] = _NSConcreteStackBlock;
                    v70[1] = 3221225472;
                    v70[2] = sub_100441458;
                    v70[3] = &unk_100751628;
                    v70[4] = v20;
                    v21 = objc_msgSend(v8, "pk_firstObjectPassingTest:", v70);
                    v22 = [v21 identifier];
                    [v12 safelyAddObject:v22];
                  }
                  id v17 = [v16 countByEnumeratingWithState:&v71 objects:v81 count:16];
                }
                while (v17);
              }

              v14 = v43;
            }
          }
        }
        uint64_t v9 = v45 + 1;
      }
      while ((id)(v45 + 1) != v42);
      id v42 = [v8 countByEnumeratingWithState:&v75 objects:v82 count:16];
    }
    while (v42);
  }

  id v23 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v64 = 0;
  v65 = (id *)&v64;
  uint64_t v66 = 0x3042000000;
  v67 = sub_100020DDC;
  v68 = sub_1000211E0;
  id v69 = 0;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100441464;
  v59[3] = &unk_100751650;
  id v46 = objc_alloc_init((Class)NSMutableSet);
  id v60 = v46;
  id v44 = v40;
  id v61 = v44;
  v63 = &v64;
  id v24 = v23;
  id v62 = v24;
  v25 = objc_retainBlock(v59);
  objc_storeWeak(v65 + 5, v25);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v26 = v8;
  id v27 = [v26 countByEnumeratingWithState:&v55 objects:v80 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v56;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v56 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)j) identifier];
        ((void (*)(void *, void *))v25[2])(v25, v30);
      }
      id v27 = [v26 countByEnumeratingWithState:&v55 objects:v80 count:16];
    }
    while (v27);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obja = v24;
  id v31 = [obja countByEnumeratingWithState:&v51 objects:v79 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v52;
LABEL_29:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v52 != v32) {
        objc_enumerationMutation(obja);
      }
      v34 = [(PKProviderForCapabilityMap *)v41 capabilityForIdentifier:*(void *)(*((void *)&v51 + 1) + 8 * v33)];
      v35 = [(NSMapTable *)v41->_mapping objectForKey:v34];
      char v50 = 0;
      v37[2](v37, v34, v35, &v50);
      BOOL v36 = v50 == 0;

      if (!v36) {
        break;
      }
      if (v31 == (id)++v33)
      {
        id v31 = [obja countByEnumeratingWithState:&v51 objects:v79 count:16];
        if (v31) {
          goto LABEL_29;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v64, 8);
  objc_destroyWeak(&v69);
}

- (NSMapTable)underlyingMapping
{
  id v2 = [(NSMapTable *)self->_mapping copy];
  return (NSMapTable *)v2;
}

- (NSArray)capabilities
{
  id v2 = [(NSMapTable *)self->_mapping keyEnumerator];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (unint64_t)count
{
  return [(NSMapTable *)self->_mapping count];
}

- (id)providerForCapability:(id)a3
{
  return [(NSMapTable *)self->_mapping objectForKey:a3];
}

- (id)capabilityForIdentifier:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100441778;
  v14 = sub_100441788;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100441790;
  v7[3] = &unk_100751678;
  id v4 = a3;
  id v8 = v4;
  uint64_t v9 = &v10;
  [(PKProviderForCapabilityMap *)self enumerateCapabilities:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)addCapability:(id)a3 provider:(id)a4
{
}

- (void)removeCapability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end