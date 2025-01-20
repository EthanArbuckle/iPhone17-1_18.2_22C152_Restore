@interface TMLDictionary
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (NSArray)keys;
- (NSDictionary)dictionary;
- (TMLDictionary)init;
- (TMLDictionary)initWithDictionary:(id)a3;
- (id)get:(id)a3;
- (id)union:(id)a3;
- (unint64_t)count;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)set:(id)a3 value:(id)a4;
- (void)setDictionary:(id)a3;
@end

@implementation TMLDictionary

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, v3, @"dictionary"))
  {
    objc_msgSend_set(MEMORY[0x263EFFA08], v4, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_268A059C0 != -1) {
      dispatch_once(&qword_268A059C0, &unk_26ECEE548);
    }
    id v6 = (id)qword_268A059B8;
  }
  return v6;
}

- (TMLDictionary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8 = (TMLDictionary *)objc_msgSend_init(self, v5, v6);
  if (v8 && objc_msgSend_count(v4, v7, v9)) {
    objc_msgSend_setDictionary_(v8->_dictionary, v10, v11, v4);
  }

  return v8;
}

- (TMLDictionary)init
{
  v6.receiver = self;
  v6.super_class = (Class)TMLDictionary;
  v2 = [(TMLDictionary *)&v6 init];
  if (v2)
  {
    double v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;
  }
  return v2;
}

- (void)setDictionary:(id)a3
{
  objc_msgSend_setDictionary_(self->_dictionary, a2, v3, a3);
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_dictionary, a2, v2);
}

- (NSArray)keys
{
  return (NSArray *)objc_msgSend_allKeys(self->_dictionary, a2, v2);
}

- (id)get:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_dictionary, a2, v3, a3);
}

- (void)set:(id)a3 value:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_objectForKeyedSubscript_(self->_dictionary, v8, v9, v6);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (v10 != v7 && (objc_msgSend_isEqual_(v10, v11, v12, v7) & 1) == 0)
  {
    objc_msgSend_willChangeValueForKey_(self, v14, v15, @"dictionary");
    objc_msgSend_setObject_forKeyedSubscript_(self->_dictionary, v16, v17, v7, v6);
    objc_msgSend_didChangeValueForKey_(self, v18, v19, @"dictionary");
    v25[0] = v6;
    v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v20, v21, v25, 1);
    objc_msgSend_emitTMLSignal_withArguments_(self, v23, v24, @"modified", v22);
  }
}

- (id)union:(id)a3
{
  dictionary = self->_dictionary;
  id v4 = a3;
  id v7 = objc_msgSend_mutableCopy(dictionary, v5, v6);
  objc_msgSend_addEntriesFromDictionary_(v7, v8, v9, v4);

  return v7;
}

- (void)removeObjectForKey:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_willChangeValueForKey_(self, v5, v6, @"dictionary");
  objc_msgSend_removeObjectForKey_(self->_dictionary, v7, v8, v4);
  objc_msgSend_didChangeValueForKey_(self, v9, v10, @"dictionary");
  v16[0] = v4;
  v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v11, v12, v16, 1);

  objc_msgSend_emitTMLSignal_withArguments_(self, v14, v15, @"modified", v13);
}

- (void)removeAllObjects
{
  objc_msgSend_willChangeValueForKey_(self, a2, v2, @"dictionary");
  objc_msgSend_removeAllObjects(self->_dictionary, v4, v5);
  objc_msgSend_didChangeValueForKey_(self, v6, v7, @"dictionary");
  objc_msgSend_emitTMLSignal_withArguments_(self, v8, v9, @"modified", 0);
}

- (NSDictionary)dictionary
{
  return &self->_dictionary->super;
}

- (void).cxx_destruct
{
}

@end