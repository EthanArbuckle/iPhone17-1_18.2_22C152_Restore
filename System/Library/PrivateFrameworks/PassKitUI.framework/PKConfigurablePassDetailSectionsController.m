@interface PKConfigurablePassDetailSectionsController
- (BOOL)_validateField:(id)a3;
- (BOOL)hasArbitraryInfoField:(id)a3;
- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4;
- (BOOL)useBridgeStyle;
- (NSArray)sectionIdentifiers;
- (PKConfigurablePassDetailSectionsController)init;
- (PKConfigurablePassDetailSectionsController)initWithPaymentPass:(id)a3 clientReservedIdentifiers:(id)a4;
- (PKConfigurablePassDetailSectionsController)initWithPaymentPass:(id)a3 forSelectSections:(id)a4;
- (PKConfigurablePassDetailSectionsControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)_initWithPaymentPass:(id)a3 visibleSectionIdentifiers:(id)a4 clientReservedIdentifiers:(id)a5 renderUnclaimedFields:(BOOL)a6;
- (id)allSectionIdentifiers;
- (id)sectionForIdentifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)titleForFooterInSectionIdentifier:(id)a3;
- (id)titleForHeaderInSectionIdentifier:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setUseBridgeStyle:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKConfigurablePassDetailSectionsController

- (PKConfigurablePassDetailSectionsController)init
{
  return 0;
}

- (PKConfigurablePassDetailSectionsController)initWithPaymentPass:(id)a3 clientReservedIdentifiers:(id)a4
{
  return (PKConfigurablePassDetailSectionsController *)[(PKConfigurablePassDetailSectionsController *)self _initWithPaymentPass:a3 visibleSectionIdentifiers:0 clientReservedIdentifiers:a4 renderUnclaimedFields:1];
}

- (PKConfigurablePassDetailSectionsController)initWithPaymentPass:(id)a3 forSelectSections:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithArray:v7];

  v10 = [(PKConfigurablePassDetailSectionsController *)self _initWithPaymentPass:v8 visibleSectionIdentifiers:v9 clientReservedIdentifiers:0 renderUnclaimedFields:0];
  return v10;
}

- (id)_initWithPaymentPass:(id)a3 visibleSectionIdentifiers:(id)a4 clientReservedIdentifiers:(id)a5 renderUnclaimedFields:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v66 = a4;
  id v11 = a5;
  v113.receiver = self;
  v113.super_class = (Class)PKConfigurablePassDetailSectionsController;
  v84 = [(PKPaymentPassDetailSectionController *)&v113 init];
  if (v84)
  {
    BOOL v61 = v6;
    id v72 = v11;
    v75 = [v10 passDetailSections];
    id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v67 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    v65 = v10;
    obuint64_t j = [v10 backFieldBuckets];
    uint64_t v13 = [obj countByEnumeratingWithState:&v109 objects:v119 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v81 = *(void *)v110;
      uint64_t v15 = *MEMORY[0x1E4F870C0];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v110 != v81) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v109 + 1) + 8 * i);
          long long v105 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v105 objects:v118 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v106;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v106 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v105 + 1) + 8 * j);
                v24 = [v23 key];
                if ([v24 hasPrefix:v15]) {
                  [v12 setObject:v23 forKey:v24];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v105 objects:v118 count:16];
            }
            while (v20);
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v109 objects:v119 count:16];
      }
      while (v14);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __141__PKConfigurablePassDetailSectionsController__initWithPaymentPass_visibleSectionIdentifiers_clientReservedIdentifiers_renderUnclaimedFields___block_invoke;
    aBlock[3] = &unk_1E59DB138;
    id v64 = v73;
    id v102 = v64;
    id v63 = v70;
    id v103 = v63;
    id v62 = v67;
    id v104 = v62;
    v74 = (void (**)(void *, id, id))_Block_copy(aBlock);
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v25 = v75;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v97 objects:v117 count:16];
    id v11 = v72;
    id v71 = v25;
    if (v26)
    {
      uint64_t v27 = v26;
      id v28 = *(id *)v98;
      id v68 = *(id *)v98;
      do
      {
        uint64_t v29 = 0;
        uint64_t v76 = v27;
        do
        {
          if (*(id *)v98 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v97 + 1) + 8 * v29);
          v31 = [v30 identifier];
          if (v66)
          {
            if (([v66 containsObject:v31] & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if ([v30 isHidden])
          {
            goto LABEL_28;
          }
          if ([v11 containsObject:v31])
          {
LABEL_28:
            id v32 = [v30 rows];
            [v12 removeObjectsForKeys:v32];
            goto LABEL_40;
          }
          v82 = v31;
          id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v93 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id obja = v30;
          v33 = [v30 rows];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v93 objects:v116 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v94;
            do
            {
              for (uint64_t k = 0; k != v35; ++k)
              {
                if (*(void *)v94 != v36) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v38 = *(void *)(*((void *)&v93 + 1) + 8 * k);
                v39 = [v12 objectForKey:v38];
                if (v39 && [(PKConfigurablePassDetailSectionsController *)v84 _validateField:v39])
                {
                  [v12 removeObjectForKey:v38];
                  [v32 addObject:v39];
                }
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v93 objects:v116 count:16];
            }
            while (v35);
          }

          v74[2](v74, obja, v32);
          id v25 = v71;
          id v11 = v72;
          id v28 = v68;
          uint64_t v27 = v76;
          v31 = v82;
LABEL_40:

          ++v29;
        }
        while (v29 != v27);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v97 objects:v117 count:16];
      }
      while (v27);
    }

    v40 = [v12 allKeys];
    v41 = v40;
    id v10 = v65;
    if (v61 && [v40 count])
    {
      id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v69 = [v65 backFieldBuckets];
      id objb = (id)[v69 countByEnumeratingWithState:&v89 objects:v115 count:16];
      if (objb)
      {
        uint64_t v77 = *(void *)v90;
        do
        {
          uint64_t v44 = 0;
          do
          {
            if (*(void *)v90 != v77) {
              objc_enumerationMutation(v69);
            }
            uint64_t v83 = v44;
            v45 = *(void **)(*((void *)&v89 + 1) + 8 * v44);
            long long v85 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            id v46 = v45;
            uint64_t v47 = [v46 countByEnumeratingWithState:&v85 objects:v114 count:16];
            if (v47)
            {
              uint64_t v48 = v47;
              uint64_t v49 = *(void *)v86;
              do
              {
                for (uint64_t m = 0; m != v48; ++m)
                {
                  if (*(void *)v86 != v49) {
                    objc_enumerationMutation(v46);
                  }
                  v51 = *(void **)(*((void *)&v85 + 1) + 8 * m);
                  v52 = [v51 key];
                  if ([v41 containsObject:v52])
                  {
                    [v42 addObject:v51];
                    [v43 addObject:v52];
                  }
                }
                uint64_t v48 = [v46 countByEnumeratingWithState:&v85 objects:v114 count:16];
              }
              while (v48);
            }

            uint64_t v44 = v83 + 1;
          }
          while ((id)(v83 + 1) != objb);
          id objb = (id)[v69 countByEnumeratingWithState:&v89 objects:v115 count:16];
        }
        while (objb);
      }

      v53 = (void *)[objc_alloc(MEMORY[0x1E4F84868]) initWithRows:v43];
      [v53 setInsertAfterSection:@"PassesInGroup"];
      v74[2](v74, v53, v42);

      id v10 = v65;
      id v25 = v71;
      id v11 = v72;
    }
    uint64_t v54 = [v63 copy];
    sectionMap = v84->_sectionMap;
    v84->_sectionMap = (NSDictionary *)v54;

    uint64_t v56 = [v62 copy];
    fieldMap = v84->_fieldMap;
    v84->_fieldMap = (NSDictionary *)v56;

    uint64_t v58 = [v64 copy];
    allSectionIdentifiers = v84->_allSectionIdentifiers;
    v84->_allSectionIdentifiers = (NSArray *)v58;
  }
  return v84;
}

void __141__PKConfigurablePassDetailSectionsController__initWithPaymentPass_visibleSectionIdentifiers_clientReservedIdentifiers_renderUnclaimedFields___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v5 count])
  {
    BOOL v6 = [v9 identifier];
    [*(id *)(a1 + 32) addObject:v6];
    [*(id *)(a1 + 40) setObject:v9 forKey:v6];
    id v7 = *(void **)(a1 + 48);
    id v8 = (void *)[v5 copy];
    [v7 setObject:v8 forKey:v6];
  }
}

- (BOOL)hasArbitraryInfoField:(id)a3
{
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4F870C0];
  if ([v4 hasPrefix:*MEMORY[0x1E4F870C0]])
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v5 stringByAppendingString:v4];
  }
  id v7 = v6;
  id v8 = [(NSDictionary *)self->_fieldMap allValues];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PKConfigurablePassDetailSectionsController_hasArbitraryInfoField___block_invoke;
  v12[3] = &unk_1E59DB188;
  id v13 = v7;
  id v9 = v7;
  char v10 = objc_msgSend(v8, "pk_containsObjectPassingTest:", v12);

  return v10;
}

uint64_t __68__PKConfigurablePassDetailSectionsController_hasArbitraryInfoField___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PKConfigurablePassDetailSectionsController_hasArbitraryInfoField___block_invoke_2;
  v5[3] = &unk_1E59DB160;
  id v6 = *(id *)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "pk_containsObjectPassingTest:", v5);

  return v3;
}

uint64_t __68__PKConfigurablePassDetailSectionsController_hasArbitraryInfoField___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 key];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (id)sectionForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_sectionMap objectForKey:a3];
}

- (NSArray)sectionIdentifiers
{
  if ([(PKPaymentPassDetailSectionController *)self currentSegment]) {
    allSectionIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  else {
    allSectionIdentifiers = self->_allSectionIdentifiers;
  }

  return allSectionIdentifiers;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  id v4 = [(NSDictionary *)self->_fieldMap objectForKeyedSubscript:a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  fieldMap = self->_fieldMap;
  id v11 = a4;
  id v12 = [(NSDictionary *)fieldMap objectForKey:v9];
  uint64_t v13 = [v11 row];

  uint64_t v14 = [v12 objectAtIndex:v13];

  if (v14)
  {
    uint64_t v15 = [v14 valueImage];
    if (v15)
    {
      v16 = (void *)MEMORY[0x1E4FB1818];
      id v17 = v8;
      id v18 = [v15 image];
      id v19 = [v16 imageWithPKImage:v18];

      uint64_t v20 = [v17 dequeueReusableCellWithIdentifier:@"imageViewCell"];

      if (!v20)
      {
        uint64_t v20 = [[PKImageViewCell alloc] initWithReuseIdentifier:@"imageViewCell"];
        [(PKImageViewCell *)v20 setUserInteractionEnabled:0];
        [(PKImageViewCell *)v20 setSelectedBackgroundView:0];
      }
      uint64_t v21 = (void *)MEMORY[0x1E4FB1618];
      v22 = [v15 backgroundColor];
      v23 = objc_msgSend(v21, "pkui_colorWithPKColor:", v22);
      [(PKImageViewCell *)v20 setBackgroundColor:v23];

      [(PKImageViewCell *)v20 setImage:v19];
    }
    else
    {
      BOOL useBridgeStyle = self->_useBridgeStyle;
      id v19 = v9;
      id v25 = v14;
      uint64_t v20 = [v8 dequeueReusableCellWithIdentifier:v19];
      if (!v20) {
        uint64_t v20 = [[PKBackFieldTableCell alloc] initWithBridgeStyle:useBridgeStyle reuseIdentifier:v19];
      }
      [(PKImageViewCell *)v20 setShowLinks:1];
      [(PKImageViewCell *)v20 setField:v25];
    }
    unsigned int v26 = [v14 isDrillInField];
    if (v26) {
      uint64_t v27 = 3;
    }
    else {
      uint64_t v27 = 0;
    }
    [(PKImageViewCell *)v20 setAccessoryType:v26];
    [(PKImageViewCell *)v20 setSelectionStyle:v27];
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_sectionMap objectForKey:a3];
  id v4 = [v3 header];

  return v4;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_sectionMap objectForKey:a3];
  id v4 = [v3 footer];

  return v4;
}

- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  fieldMap = self->_fieldMap;
  id v6 = a3;
  id v7 = [(NSDictionary *)fieldMap objectForKey:a4];
  uint64_t v8 = [v6 row];

  id v9 = [v7 objectAtIndex:v8];

  LOBYTE(v7) = [v9 isDrillInField];
  return (char)v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [(NSDictionary *)self->_fieldMap objectForKey:a5];
  id v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "row"));

  if (v11 && [v11 isDrillInField])
  {
    id v12 = v11;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v14 = [v12 authRequirement];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __98__PKConfigurablePassDetailSectionsController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke;
    v16[3] = &unk_1E59D4810;
    v16[4] = self;
    id v17 = v12;
    id v18 = v8;
    id v19 = v9;
    id v15 = v12;
    [WeakRetained presentAuthRequestForPolicy:v14 completion:v16];
  }
  else
  {
    [v8 deselectRowAtIndexPath:v9 animated:1];
  }
}

void __98__PKConfigurablePassDetailSectionsController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke(void *a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 96));
    [WeakRetained presentPassDetailDrillInForField:a1[5]];
  }
  else
  {
    uint64_t v3 = (void *)a1[6];
    uint64_t v4 = a1[7];
    [v3 deselectRowAtIndexPath:v4 animated:1];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  fieldMap = self->_fieldMap;
  id v7 = a4;
  id v8 = [(NSDictionary *)fieldMap objectForKey:a5];
  uint64_t v9 = [v7 row];

  char v10 = [v8 objectAtIndex:v9];

  id v11 = [v10 valueImage];
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 image];
    uint64_t v14 = v13;
    if (!v13)
    {
      double v17 = 0.0;
LABEL_14:

      goto LABEL_15;
    }
    [v13 size];
    if (v16 <= 184.0) {
      double v17 = v16;
    }
    else {
      double v17 = 184.0;
    }
    if (v15 != *MEMORY[0x1E4F1DB30] || v16 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      goto LABEL_14;
    }
  }
  double v17 = *MEMORY[0x1E4FB2F28];
LABEL_15:

  return v17;
}

- (BOOL)_validateField:(id)a3
{
  uint64_t v3 = [a3 valueImage];
  uint64_t v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 image];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (id)allSectionIdentifiers
{
  return self->_allSectionIdentifiers;
}

- (PKConfigurablePassDetailSectionsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKConfigurablePassDetailSectionsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useBridgeStyle
{
  return self->_useBridgeStyle;
}

- (void)setUseBridgeStyle:(BOOL)a3
{
  self->_BOOL useBridgeStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_fieldMap, 0);

  objc_storeStrong((id *)&self->_sectionMap, 0);
}

@end