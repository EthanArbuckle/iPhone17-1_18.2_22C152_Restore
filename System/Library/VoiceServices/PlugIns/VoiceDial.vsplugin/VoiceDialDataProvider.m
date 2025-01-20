@interface VoiceDialDataProvider
- (BOOL)_sequenceNumberIsValid:(int)a3;
- (BOOL)_shouldUseCompositeNamesOnly;
- (BOOL)getValue:(id *)a3 weight:(int64_t *)a4 atIndex:(int64_t)a5 forClassWithIdentifier:(id)a6 inModelWithIdentifier:(id)a7;
- (BOOL)isCacheValidityIdentifierValid:(id)a3;
- (OS_dispatch_queue)serialQueue;
- (VoiceDialDataProvider)init;
- (id)_facetimeLabels;
- (id)_namesSource;
- (id)_phoneLabels;
- (id)cacheValidityIdentifier;
- (id)phoneticValueAtIndex:(int64_t)a3 forClassWithIdentifier:(id)a4 inModelWithIdentifier:(id)a5;
- (int64_t)_totalPeople;
- (int64_t)valueCountForClassWithIdentifier:(id)a3 inModelWithIdentifier:(id)a4;
- (void)_addressBook;
- (void)_handleAddressBookChanged;
- (void)_voiceDialRecordAtIndex:(int64_t)a3;
- (void)beginReportingChanges;
- (void)dealloc;
- (void)getLabels:(id *)a3 andWeightedLabels:(id *)a4 ForABProperty:(int)a5;
- (void)stopReportingChanges;
@end

@implementation VoiceDialDataProvider

- (VoiceDialDataProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)VoiceDialDataProvider;
  v2 = [(VoiceDialDataProvider *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, (dispatch_qos_class_t)2u, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mobilephone.VoiceDialDataProvider", v4);
    v6 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v5;

    *((void *)v2 + 9) = -1;
    *(_OWORD *)(v2 + 56) = xmmword_22A5F7A40;
    if (MGGetBoolAnswer()) {
      v2[104] |= 4u;
    }
    v7 = [MEMORY[0x263F3BAD8] sharedInstance];
    [v7 addListenerID:@"com.apple.voicedial" forService:0];
  }
  return (VoiceDialDataProvider *)v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F3BAD8] sharedInstance];
  [v3 removeListenerID:@"com.apple.voicedial" forService:0];

  addressBook = self->_addressBook;
  if (addressBook)
  {
    ABAddressBookUnregisterExternalChangeCallback(addressBook, (ABExternalChangeCallback)_VoiceDialAddressBookChangedCallBack, self);
    CFRelease(self->_addressBook);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  }
  people = self->_people;
  if (people) {
    CFRelease(people);
  }
  lastDatabaseUUID = self->_lastDatabaseUUID;
  if (lastDatabaseUUID) {
    CFRelease(lastDatabaseUUID);
  }
  v8.receiver = self;
  v8.super_class = (Class)VoiceDialDataProvider;
  [(VoiceDialDataProvider *)&v8 dealloc];
}

- (void)_addressBook
{
  result = self->_addressBook;
  if (!result)
  {
    CFErrorRef error = 0;
    v4 = (void *)ABAddressBookCreateWithOptions(0, &error);
    self->_addressBook = v4;
    if (!v4)
    {
      dispatch_queue_t v5 = PHDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(VoiceDialResultHandler *)(uint64_t *)&error _addressBook];
      }
    }
    if (error) {
      CFRelease(error);
    }
    return self->_addressBook;
  }
  return result;
}

- (id)_namesSource
{
  namesSource = self->_namesSource;
  if (!namesSource)
  {
    v4 = VSPreferencesCopySpokenLanguageIdentifier();
    dispatch_queue_t v5 = +[VoiceDialNameDataSource nameDataSourceForLanguageIdentifier:v4];
    v6 = self->_namesSource;
    self->_namesSource = v5;

    [(VoiceDialNameDataSource *)self->_namesSource setUseCompositeNamesOnly:[(VoiceDialDataProvider *)self _shouldUseCompositeNamesOnly]];
    namesSource = self->_namesSource;
  }

  return namesSource;
}

- (void)getLabels:(id *)a3 andWeightedLabels:(id *)a4 ForABProperty:(int)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy_;
  v63 = __Block_byref_object_dispose_;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  id v58 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy_;
  v51[4] = __Block_byref_object_dispose_;
  id v52 = 0;
  if (!a3)
  {
    v22 = 0;
    id v23 = 0;
    v24 = 0;
    id v25 = 0;
    id v11 = 0;
    id v6 = 0;
    goto LABEL_72;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v7 = [(VoiceDialDataProvider *)self _addressBook];
  objc_super v8 = [(VoiceDialDataProvider *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__VoiceDialDataProvider_getLabels_andWeightedLabels_ForABProperty___block_invoke;
  block[3] = &unk_264881A58;
  block[4] = v51;
  block[5] = &v53;
  block[6] = &v59;
  block[7] = v7;
  dispatch_sync(v8, block);

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v9 = (id)v60[5];
  v10 = 0;
  id v11 = 0;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v46 objects:v66 count:16];
  if (!v12) {
    goto LABEL_19;
  }
  uint64_t v13 = *(void *)v47;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v47 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      v16 = (void *)v54[5];
      if (v16)
      {
        uint64_t v17 = [v16 objectForKey:*(void *)(*((void *)&v46 + 1) + 8 * i)];

        if (v17) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      id v18 = v15;
      if (v18)
      {
        uint64_t v17 = (uint64_t)v18;
        if (!v11) {
          id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        }
        [v11 addObject:v17];
LABEL_15:
        [v6 addObject:v17];
        v10 = (void *)v17;
        continue;
      }
      v10 = 0;
    }
    uint64_t v12 = [v9 countByEnumeratingWithState:&v46 objects:v66 count:16];
  }
  while (v12);
LABEL_19:

  v19 = (void *)v54[5];
  if (!v19)
  {

    id v20 = (id)*MEMORY[0x263F24550];
    goto LABEL_24;
  }
  id v20 = (id)*MEMORY[0x263F24550];
  v21 = [v19 objectForKey:*MEMORY[0x263F24550]];

  if (v21)
  {
LABEL_28:
    [v6 addObject:v21];
  }
  else
  {
LABEL_24:
    id v20 = v20;
    if (v20)
    {
      if (!v11) {
        id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      }
      [v11 addObject:v20];
      v21 = v20;
      goto LABEL_28;
    }
    v21 = 0;
  }
  v26 = (void *)v54[5];
  if (!v26)
  {

    v27 = (void *)*MEMORY[0x263F24560];
    goto LABEL_34;
  }
  v27 = (void *)*MEMORY[0x263F24560];
  id v28 = [v26 objectForKey:*MEMORY[0x263F24560]];

  if (v28)
  {
LABEL_38:
    [v6 addObject:v28];
  }
  else
  {
LABEL_34:
    id v28 = v27;
    if (v28)
    {
      if (!v11) {
        id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      }
      [v11 addObject:v28];
      goto LABEL_38;
    }
  }
  v29 = (void *)v54[5];
  if (!v29)
  {

    v30 = (void *)*MEMORY[0x263F24340];
    goto LABEL_43;
  }
  v30 = (void *)*MEMORY[0x263F24340];
  id v31 = [v29 objectForKey:*MEMORY[0x263F24340]];

  if (v31)
  {
LABEL_47:
    [v6 addObject:v31];
  }
  else
  {
LABEL_43:
    id v31 = v30;
    if (v31)
    {
      if (!v11) {
        id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      }
      [v11 addObject:v31];
      goto LABEL_47;
    }
  }
  v32 = (void *)v54[5];
  if (!v32)
  {

    v33 = (void *)*MEMORY[0x263F245F0];
    goto LABEL_52;
  }
  v33 = (void *)*MEMORY[0x263F245F0];
  id v25 = [v32 objectForKey:*MEMORY[0x263F245F0]];

  if (v25)
  {
LABEL_56:
    [v6 addObject:v25];
  }
  else
  {
LABEL_52:
    id v25 = v33;
    if (v25)
    {
      if (!v11) {
        id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      }
      [v11 addObject:v25];
      goto LABEL_56;
    }
  }
  [v11 removeObject:v20];
  v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v22 = (void *)VSRecognitionModelCopyLanguageResourceURL();

  if (v22 && (v35 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v22]) != 0)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v23 = v35;
    v24 = 0;
    uint64_t v36 = [v23 countByEnumeratingWithState:&v42 objects:v65 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(v23);
          }
          uint64_t v39 = [v23 objectForKey:*(void *)(*((void *)&v42 + 1) + 8 * j)];

          v24 = (void *)v39;
          if (v39) {
            [v6 addObjectsFromArray:v39];
          }
        }
        uint64_t v36 = [v23 countByEnumeratingWithState:&v42 objects:v65 count:16];
      }
      while (v36);
    }
  }
  else
  {
    id v23 = 0;
    v24 = 0;
  }
  *a3 = [v6 allObjects];
  if (a4)
  {
    id v11 = v11;
    *a4 = v11;
  }
LABEL_72:
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
}

void __67__VoiceDialDataProvider_getLabels_andWeightedLabels_ForABProperty___block_invoke(void *a1)
{
  uint64_t v2 = MEMORY[0x22A6CE3A0]();
  uint64_t v3 = *(void *)(a1[4] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(a1[4] + 8) + 40);
  if (v5) {
    id v6 = (void *)ABAddressBookCopyLocalizedStringsForLanguageArray();
  }
  else {
    id v6 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v6);
  if (v5) {

  }
  uint64_t v7 = a1[7];
  if (v7) {
    objc_super v8 = (void *)ABAddressBookCopyAllLabelsForProperty();
  }
  else {
    objc_super v8 = 0;
  }
  id v9 = v8;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v8);
  if (v7)
  {
  }
}

- (id)_phoneLabels
{
  phoneLabels = self->_phoneLabels;
  if (!phoneLabels)
  {
    id v10 = 0;
    id v11 = 0;
    [(VoiceDialDataProvider *)self getLabels:&v11 andWeightedLabels:&v10 ForABProperty:*MEMORY[0x263F24570]];
    v4 = (NSArray *)v11;
    uint64_t v5 = (NSSet *)v10;
    id v6 = self->_phoneLabels;
    self->_phoneLabels = v4;
    uint64_t v7 = v4;

    weightedPhoneLabels = self->_weightedPhoneLabels;
    self->_weightedPhoneLabels = v5;

    phoneLabels = self->_phoneLabels;
  }

  return phoneLabels;
}

- (id)_facetimeLabels
{
  facetimeLabels = self->_facetimeLabels;
  if (facetimeLabels)
  {
    v4 = 0;
    uint64_t v5 = 0;
    id v6 = 0;
    id v7 = 0;
    id v8 = 0;
    id v9 = 0;
  }
  else
  {
    id v16 = 0;
    id v17 = 0;
    [(VoiceDialDataProvider *)self getLabels:&v17 andWeightedLabels:&v16 ForABProperty:*MEMORY[0x263F24570]];
    id v6 = v17;
    id v8 = v16;
    id v14 = 0;
    id v15 = 0;
    [(VoiceDialDataProvider *)self getLabels:&v15 andWeightedLabels:&v14 ForABProperty:*MEMORY[0x263F243C8]];
    id v7 = v15;
    id v9 = v14;
    v4 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v6];
    [v4 addObjectsFromArray:v7];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:v8];
    [v5 unionSet:v9];
    id v10 = [v4 allObjects];
    id v11 = self->_facetimeLabels;
    self->_facetimeLabels = v10;

    objc_storeStrong((id *)&self->_weightedFacetimeLabels, v5);
    facetimeLabels = self->_facetimeLabels;
  }
  uint64_t v12 = facetimeLabels;

  return v12;
}

- (int64_t)_totalPeople
{
  int64_t result = self->_totalPeople;
  if (result == -1)
  {
    v4 = [(VoiceDialDataProvider *)self _addressBook];
    uint64_t v5 = [(VoiceDialDataProvider *)self serialQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__VoiceDialDataProvider__totalPeople__block_invoke;
    v6[3] = &unk_264881A80;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(v5, v6);

    return self->_totalPeople;
  }
  return result;
}

const void *__37__VoiceDialDataProvider__totalPeople__block_invoke(uint64_t a1)
{
  int64_t result = *(const void **)(a1 + 40);
  if (result)
  {
    int64_t result = (const void *)ABAddressBookGetPersonCount(result);
    *(void *)(*(void *)(a1 + 32) + 72) = result;
  }
  return result;
}

- (void)_voiceDialRecordAtIndex:(int64_t)a3
{
  int64_t v5 = [(VoiceDialDataProvider *)self _totalPeople];
  uint64_t v6 = v5 - a3;
  if (v5 <= a3) {
    return 0;
  }
  id v7 = [(VoiceDialDataProvider *)self _addressBook];
  int64_t result = self->_people;
  if (result)
  {
    int64_t location = self->_peopleRange.location;
    if (location == -1 || location <= a3 && self->_peopleRange.length + location > a3) {
      return (void *)CFArrayGetValueAtIndex((CFArrayRef)result, a3 - self->_peopleRange.location);
    }
    CFRelease(result);
    self->_people = 0;
    if (!v7)
    {
      int64_t v17 = 50;
      if (v6 < 50) {
        int64_t v17 = v6;
      }
      self->_peopleRange.length = v17;
      p_length = &self->_peopleRange.length;
      self->_peopleRange.int64_t location = a3;
      goto LABEL_22;
    }
    id v10 = [(VoiceDialDataProvider *)self serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__VoiceDialDataProvider__voiceDialRecordAtIndex___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v7;
    dispatch_sync(v10, block);

    int64_t result = self->_people;
    if (result) {
      return (void *)CFArrayGetValueAtIndex((CFArrayRef)result, a3 - self->_peopleRange.location);
    }
    int64_t v11 = 50;
    if (v6 < 50) {
      int64_t v11 = v6;
    }
    self->_peopleRange.length = v11;
    p_length = &self->_peopleRange.length;
    self->_peopleRange.int64_t location = a3;
  }
  else
  {
    int64_t v13 = 50;
    if (v6 < 50) {
      int64_t v13 = v6;
    }
    self->_peopleRange.length = v13;
    p_length = &self->_peopleRange.length;
    self->_peopleRange.int64_t location = a3;
    if (!v7) {
      goto LABEL_22;
    }
  }
  id v14 = [(VoiceDialDataProvider *)self serialQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __49__VoiceDialDataProvider__voiceDialRecordAtIndex___block_invoke_2;
  v18[3] = &unk_264881A80;
  v18[4] = self;
  v18[5] = v7;
  dispatch_sync(v14, v18);

  people = self->_people;
  if (!people)
  {
LABEL_22:
    int64_t *p_length = 0;
LABEL_23:
    int64_t result = 0;
    self->_people = 0;
    return result;
  }
  CFIndex Count = CFArrayGetCount(people);
  self->_peopleRange.length = Count;
  int64_t result = self->_people;
  if (!Count)
  {
    if (result) {
      CFRelease(result);
    }
    goto LABEL_23;
  }
  if (result) {
    return (void *)CFArrayGetValueAtIndex((CFArrayRef)result, a3 - self->_peopleRange.location);
  }
  return result;
}

void __49__VoiceDialDataProvider__voiceDialRecordAtIndex___block_invoke()
{
}

uint64_t __49__VoiceDialDataProvider__voiceDialRecordAtIndex___block_invoke_2(uint64_t a1)
{
  uint64_t result = ABCopyArrayOfPeopleAtOffset();
  *(void *)(*(void *)(a1 + 32) + 16) = result;
  return result;
}

- (int64_t)valueCountForClassWithIdentifier:(id)a3 inModelWithIdentifier:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", @"label", a4))
  {
    if ((*(unsigned char *)&self->_voiceDialProviderFlags & 4) != 0) {
      [(VoiceDialDataProvider *)self _facetimeLabels];
    }
    else {
    uint64_t v6 = [(VoiceDialDataProvider *)self _phoneLabels];
    }
    int64_t v7 = [v6 count];
  }
  else
  {
    int64_t v5 = [(VoiceDialDataProvider *)self _totalPeople];
    uint64_t v6 = [(VoiceDialDataProvider *)self _namesSource];
    int64_t v7 = [v6 personNameCount] * v5;
  }

  return v7;
}

- (BOOL)getValue:(id *)a3 weight:(int64_t *)a4 atIndex:(int64_t)a5 forClassWithIdentifier:(id)a6 inModelWithIdentifier:(id)a7
{
  if (![a6 isEqualToString:@"label"])
  {
    int64_t v11 = [(VoiceDialDataProvider *)self _namesSource];
    unint64_t v12 = [v11 personNameCount];
    int64_t v13 = [(VoiceDialDataProvider *)self _voiceDialRecordAtIndex:a5 / v12];
    if (v13)
    {
      id v20 = 0;
      [v11 getName:&v20 phoneticName:0 atIndex:a5 % v12 forPerson:v13];
      id v14 = v20;
    }
    else
    {
      id v14 = 0;
    }
    id v15 = 0;
    id v17 = 0;
    int64_t v18 = 0;
    if (!a3) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_voiceDialProviderFlags & 4) != 0) {
    [(VoiceDialDataProvider *)self _facetimeLabels];
  }
  else {
  id v15 = [(VoiceDialDataProvider *)self _phoneLabels];
  }
  uint64_t v16 = 48;
  if ((*(unsigned char *)&self->_voiceDialProviderFlags & 4) == 0) {
    uint64_t v16 = 40;
  }
  id v17 = *(id *)((char *)&self->super.isa + v16);
  if (v15 && [v15 count] > (unint64_t)a5)
  {
    id v14 = [v15 objectAtIndex:a5];
    int64_t v11 = 0;
    if ([v17 containsObject:v14]) {
      int64_t v18 = -15;
    }
    else {
      int64_t v18 = 0;
    }
    if (!a3) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  id v14 = 0;
  int64_t v18 = 0;
  int64_t v11 = 0;
  if (a3) {
LABEL_20:
  }
    *a3 = v14;
LABEL_21:
  if (a4) {
    *a4 = v18;
  }

  return v14 != 0;
}

- (id)phoneticValueAtIndex:(int64_t)a3 forClassWithIdentifier:(id)a4 inModelWithIdentifier:(id)a5
{
  if ([a4 isEqualToString:@"name"])
  {
    int64_t v7 = [(VoiceDialDataProvider *)self _namesSource];
    unint64_t v8 = [v7 personNameCount];
    id v9 = [(VoiceDialDataProvider *)self _voiceDialRecordAtIndex:a3 / v8];
    if (v9)
    {
      id v12 = 0;
      [v7 getName:0 phoneticName:&v12 atIndex:a3 % v8 forPerson:v9];
      id v10 = v12;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
    int64_t v7 = 0;
  }

  return v10;
}

- (BOOL)_shouldUseCompositeNamesOnly
{
  unsigned int voiceDialProviderFlags = self->_voiceDialProviderFlags;
  if ((voiceDialProviderFlags & 1) == 0)
  {
    CFPreferencesAppSynchronize(@"com.apple.voicedial");
    if (CFPreferencesGetAppBooleanValue(@"CompositeNameOnly", @"com.apple.voicedial", 0)) {
      int v4 = 3;
    }
    else {
      int v4 = 1;
    }
    unsigned int voiceDialProviderFlags = v4 | *(unsigned char *)&self->_voiceDialProviderFlags & 0xFC;
    *(unsigned char *)&self->_unsigned int voiceDialProviderFlags = voiceDialProviderFlags;
  }
  return (voiceDialProviderFlags >> 1) & 1;
}

- (id)cacheValidityIdentifier
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int64_t v11 = __Block_byref_object_copy_;
  id v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  uint64_t v3 = [(VoiceDialDataProvider *)self _addressBook];
  int v4 = [(VoiceDialDataProvider *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__VoiceDialDataProvider_cacheValidityIdentifier__block_invoke;
  block[3] = &unk_264881AC8;
  block[4] = self;
  void block[5] = &v8;
  block[6] = v3;
  dispatch_sync(v4, block);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __48__VoiceDialDataProvider_cacheValidityIdentifier__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = (const void *)ABAddressBookCopyUniqueIdentifier();
    uint64_t SequenceNumber = ABAddressBookGetSequenceNumber();
    uint64_t CompositeNameFormatForRecord = ABPersonGetCompositeNameFormatForRecord(0);
    if (v2)
    {
      uint64_t v5 = CompositeNameFormatForRecord;
      int64_t v11 = (void *)[objc_alloc(NSNumber) initWithInt:SequenceNumber];
      uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v5];
      int64_t v7 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(*(id *)(a1 + 32), "_shouldUseCompositeNamesOnly"));
      uint64_t v8 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v2, @"dbid", v11, @"seq", v6, @"name-order", v7, @"comp-only", 0);
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      CFRelease(v2);
    }
  }
}

- (BOOL)_sequenceNumberIsValid:(int)a3
{
  if (![(VoiceDialDataProvider *)self _addressBook]) {
    return 1;
  }
  CFDictionaryRef v3 = (const __CFDictionary *)ABAddressBookCopyChangesSinceSequenceNumber();
  if (!v3) {
    return 1;
  }
  CFDictionaryRef v4 = v3;
  if (CFDictionaryGetValue(v3, (const void *)*MEMORY[0x263F242C8])
    || MGGetBoolAnswer() && CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F242D0]))
  {
    BOOL v5 = 0;
  }
  else if (MGGetBoolAnswer())
  {
    BOOL v5 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F242C0]) == 0;
  }
  else
  {
    BOOL v5 = 1;
  }
  CFRelease(v4);
  return v5;
}

- (BOOL)isCacheValidityIdentifierValid:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  id v22 = 0;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKey:@"dbid"];
    if (v6)
    {
      int64_t v7 = [(VoiceDialDataProvider *)self _addressBook];
      uint64_t v8 = [(VoiceDialDataProvider *)self serialQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__VoiceDialDataProvider_isCacheValidityIdentifierValid___block_invoke;
      block[3] = &unk_264881AF0;
      v19 = v7;
      uint64_t v20 = v6;
      id v14 = v25;
      id v15 = v23;
      id v12 = v5;
      id v13 = self;
      uint64_t v16 = v26;
      id v17 = v21;
      int64_t v18 = &v28;
      dispatch_sync(v8, block);
    }
  }
  char v9 = *((unsigned char *)v29 + 24);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  return v9;
}

void __56__VoiceDialDataProvider_isCacheValidityIdentifierValid___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (v2) {
    uint64_t v2 = ABAddressBookCopyUniqueIdentifier();
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
  CFStringRef v3 = *(const __CFString **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v3)
  {
    if (CFEqual(v3, *(CFStringRef *)(a1 + 96)))
    {
      uint64_t v5 = [*(id *)(a1 + 32) objectForKey:@"seq"];
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      int64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (v8)
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v8 intValue];
        int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        if (v9 == ABAddressBookGetSequenceNumber()
          || [*(id *)(a1 + 40) _sequenceNumberIsValid:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)])
        {
          uint64_t v10 = [*(id *)(a1 + 32) objectForKey:@"name-order"];
          uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
          id v12 = *(void **)(v11 + 40);
          *(void *)(v11 + 40) = v10;

          id v13 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          if (v13)
          {
            int v14 = [v13 unsignedIntValue];
            if (v14 == ABPersonGetCompositeNameFormatForRecord(0))
            {
              char v15 = [*(id *)(a1 + 40) _shouldUseCompositeNamesOnly];
              uint64_t v16 = [*(id *)(a1 + 32) objectForKey:@"comp-only"];
              *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v15 ^ [v16 BOOLValue] ^ 1;
            }
          }
        }
      }
    }
    id v4 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    CFRelease(v4);
  }
}

- (void)beginReportingChanges
{
  CFStringRef v3 = [(VoiceDialDataProvider *)self _addressBook];
  id v4 = [(VoiceDialDataProvider *)self serialQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__VoiceDialDataProvider_beginReportingChanges__block_invoke;
  v5[3] = &unk_264881A80;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);
}

void __46__VoiceDialDataProvider_beginReportingChanges__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 88) = ABAddressBookGetSequenceNumber();
    *(void *)(*(void *)(a1 + 32) + 96) = ABAddressBookCopyUniqueIdentifier();
    ABAddressBookRegisterExternalChangeCallback(*(ABAddressBookRef *)(a1 + 40), (ABExternalChangeCallback)_VoiceDialAddressBookChangedCallBack, *(void **)(a1 + 32));
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_VoiceDialAddressBookPrefsChangedCallBack, @"com.apple.AddressBook.PreferenceChanged", 0, CFNotificationSuspensionBehaviorDrop);
  CFStringRef v3 = *(const void **)(a1 + 32);

  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_VoiceDialPreferencesChangedCallBack, @"com.apple.voicedial.prefschanged", 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)stopReportingChanges
{
  CFNotificationCenterRef DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v4 = [(VoiceDialDataProvider *)self _addressBook];
  uint64_t v5 = [(VoiceDialDataProvider *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__VoiceDialDataProvider_stopReportingChanges__block_invoke;
  block[3] = &unk_264881B18;
  void block[4] = self;
  void block[5] = v4;
  block[6] = DarwinNotifyCenter;
  dispatch_async(v5, block);
}

void __45__VoiceDialDataProvider_stopReportingChanges__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    ABAddressBookUnregisterExternalChangeCallback(v2, (ABExternalChangeCallback)_VoiceDialAddressBookChangedCallBack, *(void **)(a1 + 32));
  }
  CFStringRef v3 = *(void **)(a1 + 32);
  id v4 = (const void *)v3[12];
  if (v4)
  {
    CFRelease(v4);
    *(void *)(*(void *)(a1 + 32) + 96) = 0;
    CFStringRef v3 = *(void **)(a1 + 32);
  }
  CFNotificationCenterRemoveObserver(*(CFNotificationCenterRef *)(a1 + 48), v3, @"com.apple.AddressBook.PreferenceChanged", 0);
  uint64_t v5 = *(__CFNotificationCenter **)(a1 + 48);
  uint64_t v6 = *(const void **)(a1 + 32);

  CFNotificationCenterRemoveObserver(v5, v6, @"com.apple.voicedial.prefschanged", 0);
}

- (void)_handleAddressBookChanged
{
  CFStringRef v3 = [(VoiceDialDataProvider *)self _addressBook];
  id v4 = [(VoiceDialDataProvider *)self serialQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__VoiceDialDataProvider__handleAddressBookChanged__block_invoke;
  v5[3] = &unk_264881A80;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);
}

void __50__VoiceDialDataProvider__handleAddressBookChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (!v2) {
    return;
  }
  uint64_t v3 = *(unsigned int *)(*(void *)(a1 + 32) + 88);
  ABAddressBookRevert(v2);
  CFStringRef v4 = (const __CFString *)ABAddressBookCopyUniqueIdentifier();
  CFStringRef v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  CFStringRef v7 = *(const __CFString **)(v6 + 96);
  if (v4 != v7)
  {
    if (v4) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      goto LABEL_9;
    }
    if (CFStringCompare(v4, v7, 0))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      CFStringRef v7 = *(const __CFString **)(v6 + 96);
LABEL_9:
      if (v7)
      {
        CFRelease(v7);
        uint64_t v6 = *(void *)(a1 + 32);
      }
      *(void *)(v6 + 96) = v5;
      int v9 = *(const void **)(*(void *)(a1 + 32) + 96);
      if (v9) {
        CFRetain(v9);
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 88) = ABAddressBookGetSequenceNumber();
      goto LABEL_14;
    }
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 88) = ABAddressBookGetSequenceNumber();
  uint64_t v10 = *(_DWORD **)(a1 + 32);
  if (v10[22] != v3 && ([v10 _sequenceNumberIsValid:v3] & 1) == 0) {
LABEL_14:
  }
    VSRecognitionModelDataProviderChanged();
  if (v5)
  {
    CFRelease(v5);
  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_namesSource, 0);
  objc_storeStrong((id *)&self->_weightedFacetimeLabels, 0);
  objc_storeStrong((id *)&self->_weightedPhoneLabels, 0);
  objc_storeStrong((id *)&self->_facetimeLabels, 0);

  objc_storeStrong((id *)&self->_phoneLabels, 0);
}

@end