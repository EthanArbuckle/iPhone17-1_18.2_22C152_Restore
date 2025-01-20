@interface TUIntentController
+ (id)tu_INPersonHandleForTUHandle:(id)a3 label:(id)a4;
+ (id)tu_INPersonsFromHandle:(id)a3 contacts:(id)a4;
+ (int64_t)tu_INPersonHandleTypeForTUHandleType:(int64_t)a3;
- (TUHandleContactProvider)contactProvider;
- (TUIntentController)initWithContactProvider:(id)a3;
- (id)personsByHandleForHandles:(id)a3;
- (id)startCallIntentByHandleForHandles:(id)a3 capability:(int64_t)a4 destinationType:(int64_t)a5;
- (id)voicemailStartCallIntentByHandleForHandles:(id)a3;
@end

@implementation TUIntentController

- (TUIntentController)initWithContactProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIntentController;
  v6 = [(TUIntentController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contactProvider, a3);
  }

  return v7;
}

- (id)voicemailStartCallIntentByHandleForHandles:(id)a3
{
  return [(TUIntentController *)self startCallIntentByHandleForHandles:a3 capability:1 destinationType:3];
}

- (id)personsByHandleForHandles:(id)a3
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = *MEMORY[0x1E4F1AEE0];
  v30[0] = *MEMORY[0x1E4F1AE08];
  v30[1] = v6;
  v7 = [MEMORY[0x1E4F28F30] descriptorForUsedKeys];
  v30[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];

  objc_super v9 = [(TUIntentController *)self contactProvider];
  id v28 = 0;
  v23 = (void *)v8;
  v10 = objc_msgSend(v9, "tu_contactsByHandleForHandles:keyDescriptors:error:", v4, v8, &v28);
  id v22 = v28;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v17 = objc_opt_class();
        v18 = objc_msgSend(v10, "objectForKeyedSubscript:", v16, v22);
        v19 = objc_msgSend(v17, "tu_INPersonsFromHandle:contacts:", v16, v18);
        [v5 setObject:v19 forKeyedSubscript:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v13);
  }

  v20 = (void *)[v5 copy];

  return v20;
}

- (id)startCallIntentByHandleForHandles:(id)a3 capability:(int64_t)a4 destinationType:(int64_t)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
  objc_super v9 = [(TUIntentController *)self personsByHandleForHandles:v8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [v9 objectForKeyedSubscript:v13];
        uint64_t v27 = 0;
        id v28 = &v27;
        uint64_t v29 = 0x2050000000;
        v15 = (void *)getINStartCallIntentClass_softClass;
        uint64_t v30 = getINStartCallIntentClass_softClass;
        if (!getINStartCallIntentClass_softClass)
        {
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __getINStartCallIntentClass_block_invoke;
          v26[3] = &unk_1E58E5F90;
          v26[4] = &v27;
          __getINStartCallIntentClass_block_invoke((uint64_t)v26);
          v15 = (void *)v28[3];
        }
        uint64_t v16 = v15;
        _Block_object_dispose(&v27, 8);
        v17 = (void *)[[v16 alloc] initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:a5 contacts:v14 callCapability:a4];
        if (v17) {
          [v21 setObject:v17 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v10);
  }

  v18 = (void *)[v21 copy];

  return v18;
}

+ (int64_t)tu_INPersonHandleTypeForTUHandleType:(int64_t)a3
{
  if (a3 == 3) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

+ (id)tu_INPersonHandleForTUHandle:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(a1, "tu_INPersonHandleTypeForTUHandleType:", objc_msgSend(v6, "type"));
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  objc_super v9 = (void *)getINPersonHandleClass_softClass;
  uint64_t v20 = getINPersonHandleClass_softClass;
  if (!getINPersonHandleClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getINPersonHandleClass_block_invoke;
    v16[3] = &unk_1E58E5F90;
    v16[4] = &v17;
    __getINPersonHandleClass_block_invoke((uint64_t)v16);
    objc_super v9 = (void *)v18[3];
  }
  uint64_t v10 = v9;
  _Block_object_dispose(&v17, 8);
  id v11 = [v10 alloc];
  uint64_t v12 = [v6 normalizedValue];
  if (v12)
  {
    uint64_t v13 = (void *)[v11 initWithValue:v12 type:v8 label:v7];
  }
  else
  {
    uint64_t v14 = [v6 value];
    uint64_t v13 = (void *)[v11 initWithValue:v14 type:v8 label:v7];
  }

  return v13;
}

+ (id)tu_INPersonsFromHandle:(id)a3 contacts:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = v6;
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count", v6));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v8)
    {
      uint64_t v30 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "tu_labeledValueForHandle:", v5);
          uint64_t v12 = v11;
          if (v11)
          {
            id v13 = v11;
            uint64_t v40 = 0;
            v41 = &v40;
            uint64_t v42 = 0x2020000000;
            uint64_t v14 = (void (*)(id))getINPersonHandleLabelForCNLabeledValueSymbolLoc_ptr;
            v43 = getINPersonHandleLabelForCNLabeledValueSymbolLoc_ptr;
            if (!getINPersonHandleLabelForCNLabeledValueSymbolLoc_ptr)
            {
              uint64_t v35 = MEMORY[0x1E4F143A8];
              uint64_t v36 = 3221225472;
              v37 = __getINPersonHandleLabelForCNLabeledValueSymbolLoc_block_invoke;
              v38 = &unk_1E58E5F90;
              v39 = &v40;
              v15 = (void *)IntentsLibrary();
              uint64_t v16 = dlsym(v15, "INPersonHandleLabelForCNLabeledValue");
              *(void *)(v39[1] + 24) = v16;
              getINPersonHandleLabelForCNLabeledValueSymbolLoc_ptr = *(_UNKNOWN **)(v39[1] + 24);
              uint64_t v14 = (void (*)(id))v41[3];
            }
            _Block_object_dispose(&v40, 8);
            if (!v14) {
              +[TUIntentController tu_INPersonsFromHandle:contacts:]();
            }
            uint64_t v17 = v14(v13);
          }
          else
          {
            uint64_t v17 = 0;
          }
          v18 = objc_msgSend((id)objc_opt_class(), "tu_INPersonHandleForTUHandle:label:", v5, v17);
          if (v10)
          {
            uint64_t v19 = [MEMORY[0x1E4F28F30] componentsForContact:v10];
          }
          else
          {
            uint64_t v19 = 0;
          }
          id v20 = objc_alloc((Class)getINPersonClass());
          v21 = [v10 identifier];
          long long v22 = (void *)[v20 initWithPersonHandle:v18 nameComponents:v19 displayName:0 image:0 contactIdentifier:v21 customIdentifier:0];

          if (v22) {
            [v29 addObject:v22];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v23 = objc_msgSend((id)objc_opt_class(), "tu_INPersonHandleForTUHandle:label:", v5, 0, 0);
    long long v24 = (void *)[objc_alloc((Class)getINPersonClass()) initWithPersonHandle:v23 nameComponents:0 displayName:0 image:0 contactIdentifier:0 customIdentifier:0];
    if (v24)
    {
      uint64_t v29 = [MEMORY[0x1E4F1CA48] arrayWithObject:v24];
    }
    else
    {
      uint64_t v29 = 0;
    }
  }
  long long v25 = (void *)[v29 copy];

  return v25;
}

- (TUHandleContactProvider)contactProvider
{
  return self->_contactProvider;
}

- (void).cxx_destruct
{
}

+ (void)tu_INPersonsFromHandle:contacts:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"INPersonHandleLabel _INPersonHandleLabelForCNLabeledValue(CNLabeledValue *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUIntentController.m", 24, @"%s", dlerror());

  __break(1u);
}

@end