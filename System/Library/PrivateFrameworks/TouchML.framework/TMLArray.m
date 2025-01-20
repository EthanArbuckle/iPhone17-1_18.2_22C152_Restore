@interface TMLArray
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (NSArray)array;
- (TMLArray)init;
- (TMLArray)initWithArray:(id)a3;
- (id)get:(unint64_t)a3;
- (unint64_t)count;
- (void)append:(id)a3;
- (void)remove:(unint64_t)a3;
- (void)removeAllObjects;
- (void)set:(unint64_t)a3 value:(id)a4;
- (void)setArray:(id)a3;
@end

@implementation TMLArray

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, v3, @"array"))
  {
    objc_msgSend_set(MEMORY[0x263EFFA08], v4, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_268A057C0 != -1) {
      dispatch_once(&qword_268A057C0, &unk_26ECEBF98);
    }
    id v6 = (id)qword_268A057B8;
  }
  return v6;
}

- (TMLArray)initWithArray:(id)a3
{
  id v4 = a3;
  v8 = (TMLArray *)objc_msgSend_init(self, v5, v6);
  if (v8 && objc_msgSend_count(v4, v7, v9)) {
    objc_msgSend_addObjectsFromArray_(v8->_array, v10, v11, v4);
  }

  return v8;
}

- (TMLArray)init
{
  v6.receiver = self;
  v6.super_class = (Class)TMLArray;
  v2 = [(TMLArray *)&v6 init];
  if (v2)
  {
    double v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    array = v2->_array;
    v2->_array = v3;
  }
  return v2;
}

- (void)setArray:(id)a3
{
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_array, a2, v2);
}

- (id)get:(unint64_t)a3
{
  if (objc_msgSend_count(self->_array, a2, v3) <= a3)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend_objectAtIndexedSubscript_(self->_array, v6, v7, a3);
  }
  return v8;
}

- (void)set:(unint64_t)a3 value:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (objc_msgSend_count(self->_array, v7, v8) <= a3)
  {
    if (objc_msgSend_count(self->_array, v9, v10) == a3) {
      objc_msgSend_append_(self, v23, v24, v6);
    }
  }
  else
  {
    objc_msgSend_willChangeValueForKey_(self, v9, v10, @"array");
    objc_msgSend_replaceObjectAtIndex_withObject_(self->_array, v11, v12, a3, v6);
    objc_msgSend_didChangeValueForKey_(self, v13, v14, @"array");
    v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v15, v16, a3);
    v25[0] = v17;
    v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v25, 1);
    objc_msgSend_emitTMLSignal_withArguments_(self, v21, v22, @"modified", v20);
  }
}

- (void)append:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_willChangeValueForKey_(self, v5, v6, @"array");
  objc_msgSend_addObject_(self->_array, v7, v8, v4);

  objc_msgSend_didChangeValueForKey_(self, v9, v10, @"array");
  double v11 = NSNumber;
  uint64_t v14 = objc_msgSend_count(self->_array, v12, v13);
  v17 = objc_msgSend_numberWithUnsignedInteger_(v11, v15, v16, v14 - 1);
  v23[0] = v17;
  v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, v19, v23, 1);
  objc_msgSend_emitTMLSignal_withArguments_(self, v21, v22, @"modified", v20);
}

- (void)remove:(unint64_t)a3
{
  if (objc_msgSend_count(self->_array, a2, v3) > a3)
  {
    objc_msgSend_willChangeValueForKey_(self, v6, v7, @"array");
    objc_msgSend_removeObjectAtIndex_(self->_array, v8, v9, a3);
    objc_msgSend_didChangeValueForKey_(self, v10, v11, @"array");
  }
}

- (void)removeAllObjects
{
  objc_msgSend_willChangeValueForKey_(self, a2, v2, @"array");
  objc_msgSend_removeAllObjects(self->_array, v4, v5);
  objc_msgSend_didChangeValueForKey_(self, v6, v7, @"array");
}

- (NSArray)array
{
  return &self->_array->super;
}

- (void).cxx_destruct
{
}

@end