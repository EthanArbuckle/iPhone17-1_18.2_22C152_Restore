@interface SUSUIUpdateAgreementManager
- (SUSUIUpdateAgreementManager)init;
- (id)_queue_agreementDictForDescriptor:(id)a3;
- (int)_queue_agreementDictValueForKey:(id)a3 forDescriptor:(id)a4;
- (int)cellularFeeAgreementStatusForUpdate:(id)a3;
- (int)termsAgreementStatusForUpdate:(id)a3;
- (void)_queue_setAgreementDictValue:(int)a3 forKey:(id)a4 forDescriptor:(id)a5;
- (void)setCellularFeeAgreementStatus:(int)a3 forUpdate:(id)a4;
- (void)setTermsAgreementStatus:(int)a3 forUpdate:(id)a4;
@end

@implementation SUSUIUpdateAgreementManager

- (SUSUIUpdateAgreementManager)init
{
  SEL v10 = a2;
  v11 = 0;
  v9.receiver = self;
  v9.super_class = (Class)SUSUIUpdateAgreementManager;
  v11 = [(SUSUIUpdateAgreementManager *)&v9 init];
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    v2 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    updateAgreementDict = v11->_updateAgreementDict;
    v11->_updateAgreementDict = v2;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.softwareupdatesettings.agreementManagerQueue", v8);
    stateQueue = v11->_stateQueue;
    v11->_stateQueue = (OS_dispatch_queue *)v4;
  }
  v7 = v11;
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (void)setCellularFeeAgreementStatus:(int)a3 forUpdate:(id)a4
{
  v16 = (dispatch_queue_t *)self;
  SEL v15 = a2;
  int v14 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  dispatch_assert_queue_not_V2(v16[2]);
  queue = v16[2];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __71__SUSUIUpdateAgreementManager_setCellularFeeAgreementStatus_forUpdate___block_invoke;
  objc_super v9 = &unk_264843F88;
  SEL v10 = v16;
  int v12 = v14;
  id v11 = location;
  dispatch_sync(queue, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

uint64_t __71__SUSUIUpdateAgreementManager_setCellularFeeAgreementStatus_forUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAgreementDictValue:forKey:forDescriptor:", *(unsigned int *)(a1 + 48), kAgreementDictKeyCellularFee, *(void *)(a1 + 40), a1, a1);
}

- (void)setTermsAgreementStatus:(int)a3 forUpdate:(id)a4
{
  v16 = (dispatch_queue_t *)self;
  SEL v15 = a2;
  int v14 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  dispatch_assert_queue_not_V2(v16[2]);
  queue = v16[2];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __65__SUSUIUpdateAgreementManager_setTermsAgreementStatus_forUpdate___block_invoke;
  objc_super v9 = &unk_264843F88;
  SEL v10 = v16;
  int v12 = v14;
  id v11 = location;
  dispatch_sync(queue, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

uint64_t __65__SUSUIUpdateAgreementManager_setTermsAgreementStatus_forUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAgreementDictValue:forKey:forDescriptor:", *(unsigned int *)(a1 + 48), kAgreementDictKeyTerms, *(void *)(a1 + 40), a1, a1);
}

- (int)cellularFeeAgreementStatusForUpdate:(id)a3
{
  v19 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_not_V2(v19[2]);
  uint64_t v13 = 0;
  int v14 = &v13;
  int v15 = 0x20000000;
  int v16 = 32;
  int v17 = 0;
  queue = v19[2];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  objc_super v9 = __67__SUSUIUpdateAgreementManager_cellularFeeAgreementStatusForUpdate___block_invoke;
  SEL v10 = &unk_264843FB0;
  v12[1] = &v13;
  id v11 = v19;
  v12[0] = location[0];
  dispatch_sync(queue, &v6);
  int v5 = *((_DWORD *)v14 + 6);
  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(location, 0);
  return v5;
}

uint64_t __67__SUSUIUpdateAgreementManager_cellularFeeAgreementStatusForUpdate___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_agreementDictValueForKey:forDescriptor:", kAgreementDictKeyCellularFee, *(void *)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int)termsAgreementStatusForUpdate:(id)a3
{
  v19 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_not_V2(v19[2]);
  uint64_t v13 = 0;
  int v14 = &v13;
  int v15 = 0x20000000;
  int v16 = 32;
  int v17 = 0;
  queue = v19[2];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  objc_super v9 = __61__SUSUIUpdateAgreementManager_termsAgreementStatusForUpdate___block_invoke;
  SEL v10 = &unk_264843FB0;
  v12[1] = &v13;
  id v11 = v19;
  v12[0] = location[0];
  dispatch_sync(queue, &v6);
  int v5 = *((_DWORD *)v14 + 6);
  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(location, 0);
  return v5;
}

uint64_t __61__SUSUIUpdateAgreementManager_termsAgreementStatusForUpdate___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_agreementDictValueForKey:forDescriptor:", kAgreementDictKeyTerms, *(void *)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_queue_agreementDictForDescriptor:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v6->_stateQueue);
  if (location[0]) {
    id v7 = (id)[(NSMutableDictionary *)v6->_updateAgreementDict objectForKeyedSubscript:location[0]];
  }
  else {
    id v7 = 0;
  }
  objc_storeStrong(location, 0);
  v3 = v7;
  return v3;
}

- (void)_queue_setAgreementDictValue:(int)a3 forKey:(id)a4 forDescriptor:(id)a5
{
  int v15 = self;
  SEL v14 = a2;
  unsigned int v13 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v15->_stateQueue);
  if (v11 && location)
  {
    id v9 = [(SUSUIUpdateAgreementManager *)v15 _queue_agreementDictForDescriptor:v11];
    if (v9)
    {
      id v6 = (id)[NSNumber numberWithUnsignedInt:v13];
      objc_msgSend(v9, "setObject:forKeyedSubscript:");
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v5 = (id)[NSNumber numberWithUnsignedInt:v13];
      objc_msgSend(v8, "setObject:forKeyedSubscript:");

      [(NSMutableDictionary *)v15->_updateAgreementDict setObject:v8 forKeyedSubscript:v11];
      objc_storeStrong(&v8, 0);
    }
    objc_storeStrong(&v9, 0);
    int v10 = 0;
  }
  else
  {
    int v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

- (int)_queue_agreementDictValueForKey:(id)a3 forDescriptor:(id)a4
{
  SEL v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v14->_stateQueue);
  id v11 = 0;
  if (v12 && location[0])
  {
    id v9 = (id)[(NSMutableDictionary *)v14->_updateAgreementDict objectForKeyedSubscript:v12];
    if (v9)
    {
      id v4 = (id)[v9 objectForKeyedSubscript:location[0]];
      id v5 = v11;
      id v11 = v4;
    }
    if (v11) {
      int v7 = [v11 integerValue];
    }
    else {
      int v7 = 0;
    }
    int v15 = v7;
    int v10 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    int v15 = 0;
    int v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v15;
}

- (void).cxx_destruct
{
}

@end