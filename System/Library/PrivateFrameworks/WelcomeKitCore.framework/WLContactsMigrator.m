@interface WLContactsMigrator
+ (id)contentType;
- (BOOL)accountBased;
- (BOOL)storeRecordDataInDatabase;
- (BOOL)wantsSegmentedDownloads;
- (CNContactStore)contactStore;
- (WLContactsMigrator)init;
- (WLFeaturePayload)featurePayload;
- (id)_vcardDataWithoutCustomFieldsFromVcardData:(id)a3;
- (id)contentType;
- (id)dataType;
- (id)importWillBegin;
- (void)addWorkingTime:(unint64_t)a3;
- (void)enable;
- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4;
- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6;
- (void)setContactStore:(id)a3;
- (void)setEstimatedDataSize:(unint64_t)a3;
- (void)setFeaturePayload:(id)a3;
- (void)setState:(id)a3;
@end

@implementation WLContactsMigrator

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4 = a3;
  if (![v4 itemSize]) {
    [v4 setItemSize:512];
  }
}

- (WLContactsMigrator)init
{
  v5.receiver = self;
  v5.super_class = (Class)WLContactsMigrator;
  v2 = [(WLContactsMigrator *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFEA58]);
    [(WLContactsMigrator *)v2 setContactStore:v3];
  }
  return v2;
}

- (void)enable
{
  p_featurePayload = &self->_featurePayload;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setEnabled:1];

  id v4 = objc_loadWeakRetained((id *)p_featurePayload);
  [v4 setState:@"enabled"];
}

- (void)setState:(id)a3
{
  p_featurePayload = &self->_featurePayload;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  [WeakRetained setState:v4];
}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:a3];
}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);
}

+ (id)contentType
{
  return @"contacts";
}

- (id)contentType
{
  return +[WLContactsMigrator contentType];
}

- (id)dataType
{
  return +[WLContactsMigrator contentType];
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (id)importWillBegin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:0];

  return 0;
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(id, uint64_t, id))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

  id v11 = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(v11, "setSize:", objc_msgSend(v11, "size") + objc_msgSend(v8, "length"));

  if (![v8 length])
  {
    id v14 = 0;
    uint64_t v23 = 0;
    v12 = v8;
    if (!v9) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  v12 = [(WLContactsMigrator *)self _vcardDataWithoutCustomFieldsFromVcardData:v8];

  id v37 = 0;
  v13 = [MEMORY[0x263EFEA70] contactsWithData:v12 error:&v37];
  id v14 = v37;
  if (![v13 count] || v14)
  {
    v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
    _WLLog();

    if (!v14)
    {
      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F86308];
      uint64_t v38 = *MEMORY[0x263F08320];
      v39 = @"Can't make contact with contact data";
      v26 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1, self, v29, 0);
      id v14 = [v24 errorWithDomain:v25 code:1 userInfo:v26];
    }
    uint64_t v23 = 0;
  }
  else
  {
    v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    _WLLog();

    id v15 = objc_alloc_init(MEMORY[0x263EFEB48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v31 = v13;
    id v16 = v13;
    uint64_t v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v40, 16, self, v27);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * i) mutableCopy];
          [v15 addContact:v21 toContainerWithIdentifier:0];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v18);
    }

    _WLLog();
    contactStore = self->_contactStore;
    id v32 = 0;
    uint64_t v23 = -[CNContactStore executeSaveRequest:error:](contactStore, "executeSaveRequest:error:", v15, &v32, self);
    id v14 = v32;
    v28 = [NSNumber numberWithBool:v23];
    _WLLog();

    if (v23)
    {
      v13 = v31;
      if (!v14)
      {
        uint64_t v23 = 1;
        goto LABEL_20;
      }
    }
    else
    {
      v13 = v31;
    }
  }
  v30 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
  _WLLog();

LABEL_20:
  if (v9) {
LABEL_21:
  }
    v9[2](v9, v23, v14);
LABEL_22:
}

- (id)_vcardDataWithoutCustomFieldsFromVcardData:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  v6 = v4;
  if ([v5 rangeOfString:@"BEGIN:VCARD\r\n", 1, 0, objc_msgSend(@"BEGIN:VCARD\r\n", "length") options range] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
    _WLLog();

    long long v33 = v5;
    id v8 = objc_msgSend(v5, "mutableCopy", self, v7, v31);
    uint64_t v9 = [v8 length];
    uint64_t v10 = 0;
    for (char i = 0; ; char i = 1)
    {
      v26 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v10, v9);
      _WLLog();

      uint64_t v12 = objc_msgSend(v8, "rangeOfString:options:range:", @"\r\nX-ANDROID-CUSTOM", 1, v10, v9, self, v26);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v10 = v12;
      uint64_t v14 = v13;
      v27 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v12, v13);
      _WLLog();

      uint64_t v15 = v10 + v14;
      uint64_t v16 = objc_msgSend(v8, "length", self, v27);
      uint64_t v17 = v16 - v15;
      v28 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v15, v16 - v15);
      _WLLog();

      uint64_t v18 = objc_msgSend(v8, "rangeOfString:options:range:", @"\r\n", 1, v15, v17, self, v28);
      if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v20 = v18;
      uint64_t v21 = v19;
      v29 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v18, v19);
      _WLLog();

      uint64_t v22 = objc_msgSend(@"\r\n", "length", self, v29) + v10;
      uint64_t v23 = v20 + v21 - v22;
      v30 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v22, v23);
      _WLLog();

      objc_msgSend(v8, "replaceCharactersInRange:withString:", v22, v23, &stru_26DF81F20, self, v30);
      uint64_t v9 = [v8 length] - v10;
    }
    v6 = v4;
    if (i)
    {
      v6 = [v8 dataUsingEncoding:4];

      v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      id v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
      _WLLog();
    }
    _WLLog();

    objc_super v5 = v33;
  }

  return v6;
}

- (WLFeaturePayload)featurePayload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  return (WLFeaturePayload *)WeakRetained;
}

- (void)setFeaturePayload:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_featurePayload);
}

@end