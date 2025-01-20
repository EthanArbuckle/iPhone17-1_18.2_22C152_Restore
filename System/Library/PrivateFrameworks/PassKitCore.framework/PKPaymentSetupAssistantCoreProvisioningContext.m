@interface PKPaymentSetupAssistantCoreProvisioningContext
- (BOOL)canSelectIndex:(unint64_t)a3;
- (BOOL)selectIndex:(unint64_t)a3;
- (NSArray)setupAssistantCoreCredentials;
- (NSIndexSet)selectedIndices;
- (NSString)description;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentSetupAssistantCoreProvisioningContext)initWithProvisioningController:(id)a3 setupAssistantCredentials:(id)a4 maximumSelectable:(unint64_t)a5;
- (id)availablePaymentCredentials;
- (id)selectedCredentials;
- (void)dealloc;
@end

@implementation PKPaymentSetupAssistantCoreProvisioningContext

- (PKPaymentSetupAssistantCoreProvisioningContext)initWithProvisioningController:(id)a3 setupAssistantCredentials:(id)a4 maximumSelectable:(unint64_t)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v46.receiver = self;
  v46.super_class = (Class)PKPaymentSetupAssistantCoreProvisioningContext;
  v11 = [(PKPaymentSetupAssistantCoreProvisioningContext *)&v46 init];
  v12 = v11;
  if (v11)
  {
    p_provisioningController = (id *)&v11->_provisioningController;
    objc_storeStrong((id *)&v11->_provisioningController, a3);
    p_setupAssistantCoreCredentials = (id *)&v12->_setupAssistantCoreCredentials;
    objc_storeStrong((id *)&v12->_setupAssistantCoreCredentials, a4);
    if ([v10 count] <= a5) {
      a5 = [v10 count];
    }
    v12->_maximumSelectable = a5;
    v15 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    mutableSelectedIndices = v12->_mutableSelectedIndices;
    v12->_mutableSelectedIndices = v15;

    if (PKDisableDynamicSEAllocation())
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v12->_maximumSelectable);
      uint64_t v18 = [v17 mutableCopy];
      v19 = v12->_mutableSelectedIndices;
      v12->_mutableSelectedIndices = (NSMutableIndexSet *)v18;
      goto LABEL_31;
    }
    uint64_t v20 = [*p_setupAssistantCoreCredentials count];
    v17 = [*p_provisioningController storageSnapshot];
    v21 = [*p_provisioningController webService];
    v22 = [v21 targetDevice];
    v19 = [v22 deviceClass];

    if (v20)
    {
      v44 = v17;
      v45 = v19;
      id v41 = v10;
      id v42 = v9;
      uint64_t v23 = 0;
      uint64_t v43 = v20;
      while (1)
      {
        v24 = [*p_setupAssistantCoreCredentials objectAtIndexedSubscript:v23];
        v25 = [v24 credential];

        v26 = [v25 remoteCredential];
        v27 = v26;
        if (!v26 || [v26 status] != 5 || objc_msgSend(v27, "transferType") != 1) {
          goto LABEL_17;
        }
        v28 = [v27 transferableFromDevices];
        v29 = [v28 firstObject];

        v30 = [v29 deviceClass];
        v31 = v30;
        if (v30)
        {
          id v32 = v30;
          id v33 = v45;
          v34 = v33;
          if (v32 == v33)
          {

            uint64_t v20 = v43;
            v17 = v44;
LABEL_17:
            v36 = [v25 appletTypes];
            v29 = v36;
            if (v36 && [v36 count])
            {
              if (![v17 addAppletTypesToSnapshot:v29])
              {

LABEL_30:
                id v10 = v41;
                id v9 = v42;
                v19 = v45;
                break;
              }
            }
            else
            {
              v37 = PKLogFacilityTypeGetObject(0x24uLL);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_190E10000, v37, OS_LOG_TYPE_DEFAULT, "Allowing credential to be selected because no applet type specified", buf, 2u);
              }
            }
            [(NSMutableIndexSet *)v12->_mutableSelectedIndices addIndex:v23];
            goto LABEL_25;
          }
          if (v45)
          {
            char v35 = [v32 isEqualToString:v33];

            uint64_t v20 = v43;
            v17 = v44;
            if ((v35 & 1) == 0) {
              goto LABEL_26;
            }
            goto LABEL_17;
          }

          uint64_t v20 = v43;
          v17 = v44;
        }

LABEL_25:
LABEL_26:

        if (v20 == ++v23) {
          goto LABEL_30;
        }
      }
    }
LABEL_31:

    v38 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v12->_mutableSelectedIndices;
      *(_DWORD *)buf = 138412290;
      v48 = v39;
      _os_log_impl(&dword_190E10000, v38, OS_LOG_TYPE_DEFAULT, "[PKPaymentSetupAssistantCoreProvisioningContext init] - selected: %@", buf, 0xCu);
    }

    [(PKPaymentProvisioningController *)v12->_provisioningController addDelegate:v12];
  }

  return v12;
}

- (void)dealloc
{
  [(PKPaymentProvisioningController *)self->_provisioningController removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupAssistantCoreProvisioningContext;
  [(PKPaymentSetupAssistantCoreProvisioningContext *)&v3 dealloc];
}

- (BOOL)canSelectIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSArray *)self->_setupAssistantCoreCredentials count];
  int v6 = [(NSMutableIndexSet *)self->_mutableSelectedIndices containsIndex:a3];
  if (PKDynamicSEAllocationFakeFullSE())
  {
    v7 = [(NSArray *)self->_setupAssistantCoreCredentials objectAtIndexedSubscript:a3];
    v8 = [v7 credential];
    id v9 = [v8 appletTypes];

    id v10 = [(PKPaymentProvisioningController *)self->_provisioningController storageSnapshot];
    v11 = v10;
    if (v6)
    {
      [v10 removeAppletTypesFromSnapshot:v9];
      LOBYTE(v6) = 1;
    }
    else
    {
      int v6 = [v10 addAppletTypesToSnapshot:v9];
    }
  }
  else
  {
    unint64_t v12 = [(NSMutableIndexSet *)self->_mutableSelectedIndices count];
    if (v5 <= a3)
    {
      LOBYTE(v6) = 0;
    }
    else if (v12 < self->_maximumSelectable)
    {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (BOOL)selectIndex:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = -[PKPaymentSetupAssistantCoreProvisioningContext canSelectIndex:](self, "canSelectIndex:");
  if (v5)
  {
    int v6 = [(NSMutableIndexSet *)self->_mutableSelectedIndices containsIndex:a3];
    mutableSelectedIndices = self->_mutableSelectedIndices;
    if (v6) {
      [(NSMutableIndexSet *)mutableSelectedIndices removeIndex:a3];
    }
    else {
      [(NSMutableIndexSet *)mutableSelectedIndices addIndex:a3];
    }
    v8 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_mutableSelectedIndices;
      int v16 = 138412290;
      unint64_t v17 = (unint64_t)v14;
      v11 = "[PKPaymentSetupAssistantCoreProvisioningContext selectIndex:] - selected: %@";
      unint64_t v12 = v8;
      uint32_t v13 = 12;
      goto LABEL_9;
    }
  }
  else
  {
    v8 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v9 = [(NSArray *)self->_setupAssistantCoreCredentials count];
      uint64_t v10 = [(NSMutableIndexSet *)self->_mutableSelectedIndices count];
      int v16 = 134218496;
      unint64_t v17 = a3;
      __int16 v18 = 2048;
      NSUInteger v19 = v9;
      __int16 v20 = 2048;
      uint64_t v21 = v10;
      v11 = "Error: Attempting to enable selection of index %lu, within range of (0-%lu). Selected count (%lu). No-Op.";
      unint64_t v12 = v8;
      uint32_t v13 = 32;
LABEL_9:
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
  }

  return v5;
}

- (id)availablePaymentCredentials
{
  objc_super v3 = [(PKPaymentSetupAssistantCoreProvisioningContext *)self selectedCredentials];
  v4 = [(PKPaymentProvisioningController *)self->_provisioningController associatedCredentials];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PKPaymentSetupAssistantCoreProvisioningContext_availablePaymentCredentials__block_invoke;
  v8[3] = &unk_1E56DC118;
  id v9 = v4;
  id v5 = v4;
  int v6 = objc_msgSend(v3, "pk_objectsPassingTest:", v8);

  return v6;
}

uint64_t __77__PKPaymentSetupAssistantCoreProvisioningContext_availablePaymentCredentials__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (NSIndexSet)selectedIndices
{
  v2 = (void *)[(NSMutableIndexSet *)self->_mutableSelectedIndices copy];
  return (NSIndexSet *)v2;
}

- (id)selectedCredentials
{
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableIndexSet count](self->_mutableSelectedIndices, "count"));
  mutableSelectedIndices = self->_mutableSelectedIndices;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __69__PKPaymentSetupAssistantCoreProvisioningContext_selectedCredentials__block_invoke;
  v11 = &unk_1E56DC140;
  id v12 = v3;
  uint32_t v13 = self;
  id v5 = v3;
  [(NSMutableIndexSet *)mutableSelectedIndices enumerateIndexesUsingBlock:&v8];
  int v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

void __69__PKPaymentSetupAssistantCoreProvisioningContext_selectedCredentials__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(*(void *)(a1 + 40) + 24) objectAtIndexedSubscript:a2];
  objc_super v3 = [v4 credential];
  [v2 addObject:v3];
}

- (NSString)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; setupAssistantCredentials: %@; with selected: %@>",
    v5,
    self,
    self->_setupAssistantCoreCredentials,
  int v6 = self->_mutableSelectedIndices);

  return (NSString *)v6;
}

- (NSArray)setupAssistantCoreCredentials
{
  return self->_setupAssistantCoreCredentials;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_setupAssistantCoreCredentials, 0);
  objc_storeStrong((id *)&self->_mutableSelectedIndices, 0);
}

@end