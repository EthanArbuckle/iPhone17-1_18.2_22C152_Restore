@interface TMLJSONObject
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (id)tmlPropertyWithKeyPath:(id)a3;
- (BOOL)internalSetJSON:(id)a3;
- (NSData)DATA;
- (NSDictionary)rawJSON;
- (NSString)STRING;
- (TMLJSONObject)initWithSchema:(id)a3;
- (TMLJSONObject)initWithSchema:(id)a3 json:(id)a4;
- (TMLJSONSchema)SCHEMA;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rawValueForKeyPath:(id)a3 dictionary:(id)a4;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (void)internalValidateJSON:(id)a3 completion:(id)a4;
- (void)notifyAllObservers;
- (void)setDATA:(id)a3;
- (void)setRawJSON:(id)a3;
- (void)setRawJSONSync:(id)a3;
- (void)setSTRING:(id)a3;
- (void)tmlAddObserver:(id)a3 forKeyPath:(id)a4 callback:(id)a5;
- (void)tmlRemoveObserver:(id)a3 forKeyPath:(id)a4;
- (void)validateJSON:(id)a3 completion:(id)a4;
@end

@implementation TMLJSONObject

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, v5, @"rawJSON")) {
    LOBYTE(v8) = 0;
  }
  else {
    int v8 = objc_msgSend_isEqualToString_(v3, v6, v7, @"SCHEMA") ^ 1;
  }

  return v8;
}

+ (id)tmlPropertyWithKeyPath:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, v5, @"rawJSON") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v6, v7, @"SCHEMA") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v8, v9, @"DATA") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v10, v11, @"STRING") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v14 = [TMLPropertyDescriptor alloc];
    v17 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v15, v16, @".", @"/");
    v20 = objc_msgSend_lastPathComponent(v17, v18, v19);
    v12 = objc_msgSend_initWithName_type_attributes_(v14, v21, v22, v20, 16, 0);
  }
  return v12;
}

- (TMLJSONObject)initWithSchema:(id)a3
{
  return (TMLJSONObject *)objc_msgSend_initWithSchema_json_(self, a2, v3, a3, 0);
}

- (TMLJSONObject)initWithSchema:(id)a3 json:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TMLJSONObject;
  double v9 = [(TMLJSONObject *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_SCHEMA, a3);
    objc_storeStrong((id *)&v10->_rawJSON, a4);
    if (v10->_SCHEMA)
    {
      id v11 = objc_alloc(MEMORY[0x263EFF9A0]);
      uint64_t v14 = objc_msgSend_initWithCapacity_(v11, v12, v13, 16);
      derived = v10->_derived;
      v10->_derived = (NSMutableDictionary *)v14;
    }
    else
    {
      derived = v10->_derived;
      v10->_derived = 0;
    }
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_msgSend_allocWithZone_(TMLJSONObject, a2, v3, a3);
  SCHEMA = self->_SCHEMA;
  double v9 = objc_msgSend_rawJSON(self, v7, v8);
  v12 = objc_msgSend_initWithSchema_json_(v5, v10, v11, SCHEMA, v9);

  return v12;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, v5, @"rawJSON") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v6, v7, @"SCHEMA") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v6, v7, @"DATA") & 1) != 0
    || objc_msgSend_isEqualToString_(v3, v6, v7, @"STRING"))
  {
    objc_msgSend_set(MEMORY[0x263EFFA08], v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_268A057D0 != -1) {
      dispatch_once(&qword_268A057D0, &unk_26ECEC488);
    }
    id v8 = (id)qword_268A057C8;
  }
  double v9 = v8;

  return v9;
}

- (void)setRawJSON:(id)a3
{
}

- (void)setRawJSONSync:(id)a3
{
  objc_msgSend_validateJSON_completion_(self, a2, v3, a3, 0);
}

- (BOOL)internalSetJSON:(id)a3
{
  v6 = (NSDictionary *)a3;
  rawJSON = self->_rawJSON;
  if (rawJSON == v6 || (objc_msgSend_isEqualToDictionary_(rawJSON, v5, v7, v6) & 1) != 0)
  {
    BOOL v11 = 0;
  }
  else
  {
    objc_msgSend_willChangeValueForKey_(self, v9, v10, @"rawJSON");
    objc_storeStrong((id *)&self->_rawJSON, a3);
    objc_msgSend_didChangeValueForKey_(self, v12, v13, @"rawJSON");
    double v16 = objc_msgSend_allValues(self->_derived, v14, v15);
    objc_msgSend_makeObjectsPerformSelector_withObject_(v16, v17, v18, sel_setRawJSON_, 0);

    objc_msgSend_notifyAllObservers(self, v19, v20);
    objc_msgSend_emitTMLSignal_withArguments_(self, v21, v22, @"modified", 0);
    BOOL v11 = 1;
  }

  return v11;
}

- (void)validateJSON:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (v8)
  {
    double v10 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_239855DDC;
    block[3] = &unk_264DAB6F0;
    block[4] = self;
    id v12 = v6;
    id v13 = v8;
    dispatch_async(v10, block);
  }
  else
  {
    objc_msgSend_internalValidateJSON_completion_(self, v7, v9, v6, 0);
  }
}

- (void)internalValidateJSON:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, uint64_t))a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_msgSend_isValidJSONObject_(MEMORY[0x263F08900], v9, v10, v8))
    {
      id v13 = v8;
      goto LABEL_8;
    }
    id v29 = 0;
    uint64_t v14 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x263F08900], v11, v12, v8, 0, &v29);
    id v15 = v29;
    double v18 = v15;
    if (v14)
    {
      id v28 = v15;
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v16, v17, v14, 0, &v28);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = v28;

      goto LABEL_8;
    }
  }
  id v13 = 0;
LABEL_8:

  if (objc_msgSend_isMainThread(MEMORY[0x263F08B88], v20, v21))
  {
    uint64_t v24 = objc_msgSend_internalSetJSON_(self, v22, v23, v13);
    if (v7) {
      v7[2](v7, v24);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_239856004;
    block[3] = &unk_264DAB6F0;
    block[4] = self;
    id v26 = v13;
    v27 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)setDATA:(id)a3
{
  double v5 = (NSData *)a3;
  DATA = self->_DATA;
  if (DATA != v5 && (objc_msgSend_isEqualToData_(DATA, v4, v6, v5) & 1) == 0)
  {
    double v10 = (NSData *)objc_msgSend_copy(v5, v8, v9);
    BOOL v11 = self->_DATA;
    self->_DATA = v10;

    if (v5)
    {
      uint64_t v14 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_23985618C;
      block[3] = &unk_264DADAC8;
      block[4] = self;
      dispatch_async(v14, block);
    }
    else
    {
      objc_msgSend_internalSetJSON_(self, v12, v13, 0);
    }
  }
}

- (void)setSTRING:(id)a3
{
  v4 = (const char *)a3;
  uint64_t STRING = (uint64_t)self->_STRING;
  if ((const char *)STRING != v4)
  {
    id v15 = (char *)v4;
    uint64_t STRING = objc_msgSend_isEqualToString_((void *)STRING, v4, v5, v4);
    v4 = v15;
    if ((STRING & 1) == 0)
    {
      id v8 = (NSString *)objc_msgSend_copy(v15, v15, v7);
      double v9 = self->_STRING;
      self->_uint64_t STRING = v8;

      double v12 = objc_msgSend_dataUsingEncoding_(v15, v10, v11, 4);
      objc_msgSend_setDATA_(self, v13, v14, v12);

      v4 = v15;
    }
  }
  MEMORY[0x270F9A758](STRING, v4);
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_isEqualToString_(v4, v5, v6, @"rawJSON") & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v7, v8, @"SCHEMA") & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v9, v10, @"DATA") & 1) != 0
    || objc_msgSend_isEqualToString_(v4, v11, v12, @"STRING"))
  {
    v35.receiver = self;
    v35.super_class = (Class)TMLJSONObject;
    id v15 = [(TMLJSONObject *)&v35 valueForKey:v4];
  }
  else
  {
    double v17 = objc_msgSend_valueForKey_(self->_rawJSON, v13, v14, v4);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_objectForKeyedSubscript_(self->_derived, v18, v19, v4);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        double v20 = [TMLJSONObjectDerived alloc];
        id v15 = (id)objc_msgSend_initWithParent_keyPath_(v20, v21, v22, self, v4);
        objc_msgSend_setObject_forKey_(self->_derived, v23, v24, v15, v4);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = objc_msgSend_mutableCopy(v17, v25, v26);
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = sub_2398564A0;
        v31[3] = &unk_264DADAF0;
        id v28 = v27;
        id v32 = v28;
        id v33 = v4;
        v34 = self;
        objc_msgSend_enumerateObjectsUsingBlock_(v28, v29, v30, v31);
        id v15 = v28;
      }
      else
      {
        id v15 = v17;
      }
    }
  }
  return v15;
}

- (id)valueForKeyPath:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_isEqualToString_(v4, v5, v6, @"rawJSON") & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v7, v8, @"SCHEMA") & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v9, v10, @"DATA") & 1) != 0
    || objc_msgSend_isEqualToString_(v4, v11, v12, @"STRING"))
  {
    v45.receiver = self;
    v45.super_class = (Class)TMLJSONObject;
    id v15 = [(TMLJSONObject *)&v45 valueForKeyPath:v4];
  }
  else if (objc_msgSend_hasSuffix_(v4, v13, v14, @".rawJSON"))
  {
    uint64_t v19 = objc_msgSend_length(v4, v17, v18);
    double v22 = objc_msgSend_substringToIndex_(v4, v20, v21, v19 - 8);
    v25 = objc_msgSend_rawValueForKeyPath_dictionary_(self, v23, v24, v22, self->_rawJSON);

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v26 = v25;
    }
    else {
      double v26 = 0;
    }
    id v15 = v26;
  }
  else
  {
    v27 = objc_msgSend_rawValueForKeyPath_dictionary_(self, v17, v18, v4, self->_rawJSON);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_objectForKeyedSubscript_(self->_derived, v28, v29, v4);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        double v30 = [TMLJSONObjectDerived alloc];
        id v15 = (id)objc_msgSend_initWithParent_keyPath_(v30, v31, v32, self, v4);
        objc_msgSend_setObject_forKey_(self->_derived, v33, v34, v15, v4);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = objc_msgSend_mutableCopy(v27, v35, v36);
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = sub_239856834;
        v41[3] = &unk_264DADAF0;
        id v38 = v37;
        id v42 = v38;
        id v43 = v4;
        v44 = self;
        objc_msgSend_enumerateObjectsUsingBlock_(v27, v39, v40, v41);
        id v15 = v38;
      }
      else
      {
        id v15 = v27;
      }
    }
  }
  return v15;
}

- (id)rawValueForKeyPath:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (qword_268A057E8 != -1) {
    dispatch_once(&qword_268A057E8, &unk_26ECEC4C8);
  }
  uint64_t v10 = objc_msgSend_rangeOfCharacterFromSet_(v6, v7, v9, qword_268A057D8);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_tmlValueForKeyPath_(v8, v11, v12, v6);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v14 = v10;
    id v15 = objc_msgSend_substringToIndex_(v6, v11, v12, v10 - 1);
    double v18 = objc_msgSend_tmlValueForKeyPath_(v8, v16, v17, v15);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = qword_268A057E0;
      uint64_t v22 = objc_msgSend_length(v6, v19, v20);
      unint64_t v26 = objc_msgSend_rangeOfCharacterFromSet_options_range_(v6, v23, v24, v21, 0, v14 + 1, v22 - v14 - 2);
      if (v26 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v26 = objc_msgSend_length(v6, v25, v27);
      }
      id v28 = objc_msgSend_substringWithRange_(v6, v25, v27, v14 + 1, v26 + ~v14);
      unint64_t v31 = objc_msgSend_integerValue(v28, v29, v30);
      if (v31 >= objc_msgSend_count(v18, v32, v33))
      {
        id v13 = 0;
      }
      else
      {
        double v36 = objc_msgSend_objectAtIndex_(v18, v34, v35, v31);
        if (v26 >= objc_msgSend_length(v6, v37, v38))
        {
          id v13 = v36;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v41 = objc_msgSend_substringFromIndex_(v6, v39, v40, v26 + 1);
            objc_msgSend_rawValueForKeyPath_dictionary_(self, v42, v43, v41, v36);
            id v13 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v13 = 0;
          }
        }
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  return v13;
}

- (void)tmlAddObserver:(id)a3 forKeyPath:(id)a4 callback:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  uint64_t v10 = (void (**)(id, id, id, void *))a5;
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend_set(MEMORY[0x263EFF9C0], v9, v11);
    id v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = self->_observers;
    self->_observers = v13;

    observers = self->_observers;
  }
  id v15 = [TMLJSONObserverInfo alloc];
  double v18 = objc_msgSend_initWithObserver_keyPath_callback_(v15, v16, v17, v24, v8, v10);
  objc_msgSend_addObject_(observers, v19, v20, v18);

  double v23 = objc_msgSend_valueForKeyPath_(self, v21, v22, v8);
  v10[2](v10, v24, v8, v23);
}

- (void)tmlRemoveObserver:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  observers = self->_observers;
  if (observers)
  {
    uint64_t v17 = 0;
    double v18 = &v17;
    uint64_t v19 = 0x3032000000;
    double v20 = sub_239856E40;
    uint64_t v21 = sub_239856E50;
    id v22 = 0;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_239856E58;
    v13[3] = &unk_264DADB18;
    id v14 = v6;
    id v15 = v7;
    double v16 = &v17;
    objc_msgSend_enumerateObjectsUsingBlock_(observers, v9, v10, v13);
    if (v18[5]) {
      objc_msgSend_removeObject_(self->_observers, v11, v12);
    }

    _Block_object_dispose(&v17, 8);
  }
}

- (void)notifyAllObservers
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (objc_msgSend_count(self->_observers, a2, v2))
  {
    id v6 = objc_msgSend_copy(self->_observers, v4, v5);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = v6;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, v9, &v23, v27, 16);
    if (v10)
    {
      uint64_t v13 = v10;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v7);
          }
          double v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend_keyPath(v16, v11, v12, (void)v23);
          double v20 = objc_msgSend_valueForKeyPath_(self, v18, v19, v17);
          objc_msgSend_notify_(v16, v21, v22, v20);
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, v12, &v23, v27, 16);
      }
      while (v13);
    }
  }
}

- (TMLJSONSchema)SCHEMA
{
  return self->_SCHEMA;
}

- (NSDictionary)rawJSON
{
  return self->_rawJSON;
}

- (NSData)DATA
{
  return self->_DATA;
}

- (NSString)STRING
{
  return self->_STRING;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_STRING, 0);
  objc_storeStrong((id *)&self->_DATA, 0);
  objc_storeStrong((id *)&self->_SCHEMA, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_derived, 0);
  objc_storeStrong((id *)&self->_rawJSON, 0);
}

@end