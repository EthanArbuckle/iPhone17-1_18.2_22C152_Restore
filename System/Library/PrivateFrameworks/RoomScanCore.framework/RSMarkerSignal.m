@interface RSMarkerSignal
- (NSArray)markers;
- (RSMarkerSignal)init;
- (RSMarkerSignal)initWithDictionary:(id)a3;
- (id)dictionaryRepresentation;
@end

@implementation RSMarkerSignal

- (void).cxx_destruct
{
}

- (NSArray)markers
{
  return self->_markers;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  v7 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = self->_markers;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v19, v23, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v8);
        }
        v15 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v19 + 1) + 8 * i), v10, v11, (void)v19);
        objc_msgSend_addObject_(v7, v16, (uint64_t)v15);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v19, v23, 16);
    }
    while (v12);
  }

  objc_msgSend_setObject_forKey_(v4, v17, (uint64_t)v7, @"markers");

  return v4;
}

- (RSMarkerSignal)initWithDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)RSMarkerSignal;
  uint64_t v6 = [(RSMarkerSignal *)&v32 init];
  if (v6)
  {
    v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"markers");
    BOOL v8 = v7 == 0;

    if (!v8)
    {
      objc_msgSend_objectForKeyedSubscript_(v4, v9, @"markers");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }

      objc_msgSend_array(MEMORY[0x263EFF980], v12, v13);
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v15 = v11;
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v28, v33, 16);
      if (v17)
      {
        uint64_t v18 = *(void *)v29;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * v19);
            long long v21 = [RS3DMarker alloc];
            v23 = objc_msgSend_initWithDictionary_(v21, v22, v20, (void)v28);
            objc_msgSend_addObject_(v14, v24, (uint64_t)v23);

            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v25, (uint64_t)&v28, v33, 16);
        }
        while (v17);
      }

      markers = v6->_markers;
      v6->_markers = v14;
    }
  }

  return v6;
}

- (RSMarkerSignal)init
{
  v8.receiver = self;
  v8.super_class = (Class)RSMarkerSignal;
  id v4 = [(RSMarkerSignal *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    markers = v4->_markers;
    v4->_markers = (NSArray *)v5;
  }
  return v4;
}

@end