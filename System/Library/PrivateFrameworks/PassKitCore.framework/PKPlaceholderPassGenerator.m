@interface PKPlaceholderPassGenerator
+ (id)addManifestIfNecessaryToPass:(id)a3;
+ (id)manifestForDirectory:(id)a3 error:(id *)a4;
+ (id)manifestSignatureForDirectory:(id)a3 passCertificate:(id)a4 appleWWDRCertificate:(id)a5 certificatePassword:(id)a6 error:(id *)a7;
- (NSArray)associatedApplicationIdentifiers;
- (NSMutableDictionary)passContent;
- (NSString)primaryAccountIdentifier;
- (NSString)serialNumber;
- (PKPlaceholderPassGenerator)initWithPassTemplate:(id)a3 error:(id *)a4;
- (id)generateAndSignPassWithPassCertificate:(id)a3 appleWWDRCertificate:(id)a4 certificatePassword:(id)a5 error:(id *)a6;
- (id)generatePass;
- (id)passTypeIdentifier;
- (int64_t)updatePassUpgradeRequestsWithBlock:(id)a3;
- (int64_t)updatePaymentApplicationsWithBlock:(id)a3;
- (void)_updatePassURLsConfigrationPassUrl:(id)a3;
- (void)insertPassField:(id)a3;
- (void)insertPaymentApplication:(id)a3;
- (void)setAssociatedApplicationIdentifiers:(id)a3;
- (void)setPassContent:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPrimaryAccountIdentifier:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setUpdatePassRemoteAssetConfigrationsWithBlock:(id)a3;
@end

@implementation PKPlaceholderPassGenerator

+ (id)manifestForDirectory:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 URLByStandardizingPath];
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v35 = (void *)v5;
  v7 = [v6 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:0 errorHandler:0];
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v9)
  {

    goto LABEL_22;
  }
  uint64_t v10 = v9;
  v29 = a4;
  v30 = v6;
  id v11 = 0;
  uint64_t v12 = *(void *)v43;
  uint64_t v13 = *MEMORY[0x1E4F1C670];
  uint64_t v33 = *MEMORY[0x1E4F1C670];
  id v34 = v8;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v43 != v12) {
        objc_enumerationMutation(v8);
      }
      if (!v11)
      {
        v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v40 = 0;
        id v41 = 0;
        int v16 = [v15 getResourceValue:&v41 forKey:v13 error:&v40];
        id v17 = v41;
        id v11 = v40;
        if (v16 && [v17 BOOLValue])
        {
          v18 = [v15 URLByStandardizingPath];
          v37 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v18];
          v19 = [v37 SHA1Hash];
          v38 = [v19 hexEncoding];

          v20 = [v35 pathComponents];
          v21 = [v18 pathComponents];
          v36 = v20;
          uint64_t v22 = [v20 count];
          v23 = objc_msgSend(v21, "subarrayWithRange:", v22, objc_msgSend(v21, "count") - v22);
          v24 = [NSString pathWithComponents:v23];
          if (v24)
          {
            v25 = [@"manifest" stringByAppendingPathExtension:@"json"];
            if ([v24 isEqualToString:v25])
            {
            }
            else
            {
              char v32 = [v24 isEqualToString:@"signature"];

              if ((v32 & 1) == 0) {
                [v31 setObject:v38 forKeyedSubscript:v24];
              }
            }
          }

          uint64_t v13 = v33;
          id v8 = v34;
        }
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
  }
  while (v10);

  a4 = v29;
  v6 = v30;
  if (!v11)
  {
LABEL_22:
    id v39 = 0;
    v26 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v31 options:1 error:&v39];
    id v11 = v39;
    if (!a4) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v26 = 0;
  if (v29) {
LABEL_23:
  }
    *a4 = v11;
LABEL_24:
  if (v11) {
    id v27 = 0;
  }
  else {
    id v27 = v26;
  }

  return v27;
}

+ (id)addManifestIfNecessaryToPass:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 dataAccessor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    ErrorWithCodeAndDescription(0, @"Pass must have file data accessory");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v6 = [v3 dataAccessor];
  v7 = [v6 fileURL];
  id v8 = [v7 URLByAppendingPathComponent:@"signature" isDirectory:0];
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = [v8 path];
  int v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v3 uniqueID];
      *(_DWORD *)buf = 138412290;
      id v27 = v13;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Pass with unique ID %@ already has a signature; we will not attempt to add a manifest.",
        buf,
        0xCu);
    }
    id v14 = 0;
    goto LABEL_19;
  }
  v15 = [@"manifest" stringByAppendingPathExtension:@"json"];
  uint64_t v12 = [v7 URLByAppendingPathComponent:v15 isDirectory:0];

  int v16 = [v12 path];
  char v17 = [v9 fileExistsAtPath:v16];

  if (v17)
  {
    v18 = PKLogFacilityTypeGetObject(0);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:
      uint64_t v22 = 0;
      goto LABEL_17;
    }
    v19 = [v3 uniqueID];
    *(_DWORD *)buf = 138412290;
    id v27 = v19;
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Pass with unique ID %@ already has a manifest; we will not generate a new one.",
      buf,
      0xCu);
LABEL_15:

    goto LABEL_16;
  }
  id v25 = 0;
  v18 = +[PKPlaceholderPassGenerator manifestForDirectory:v7 error:&v25];
  id v20 = v25;
  if (!v20)
  {
    id v24 = 0;
    [v18 writeToURL:v12 options:0 error:&v24];
    id v21 = v24;
    if (v21)
    {
      uint64_t v22 = v21;
LABEL_17:

      id v14 = v22;
      goto LABEL_18;
    }
    v19 = PKManifestHash(v7);
    [v3 setManifestHash:v19];
    goto LABEL_15;
  }
  id v14 = v20;

LABEL_18:
LABEL_19:

LABEL_20:
  return v14;
}

+ (id)manifestSignatureForDirectory:(id)a3 passCertificate:(id)a4 appleWWDRCertificate:(id)a5 certificatePassword:(id)a6 error:(id *)a7
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  CFDataRef v12 = (const __CFData *)a4;
  CFDataRef v13 = (const __CFData *)a5;
  id v14 = a6;
  if (v12 && v13)
  {
    CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    SecCertificateRef v16 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v13);
    CFArrayRef items = 0;
    if (v14)
    {
      uint64_t v34 = *MEMORY[0x1E4F3B9E8];
      v35[0] = v14;
      CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    }
    else
    {
      CFDictionaryRef v17 = (const __CFDictionary *)MEMORY[0x1E4F1CC08];
    }
    OSStatus v19 = SecPKCS12Import(v12, v17, &items);
    if (v16) {
      BOOL v20 = v19 == 0;
    }
    else {
      BOOL v20 = 0;
    }
    if (!v20 || CFArrayGetCount(items) != 1)
    {
      if (a7)
      {
        ErrorWithCodeAndDescription(0, @"Error importing certificates.");
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v28 = 0;
      v18 = 0;
      if (!v16) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items, 0);
    CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4F3B9F0]);
    uint64_t v22 = *MEMORY[0x1E4F3B938];
    v33[0] = *MEMORY[0x1E4F1CFD0];
    uint64_t v23 = *MEMORY[0x1E4F3B920];
    v32[0] = v22;
    v32[1] = v23;
    SecCertificateRef v31 = v16;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    v33[1] = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

    CFMutableDataRef Mutable = CFDataCreateMutable(v15, 0);
    int v27 = SecCMSCreateSignedData();
    if (v27)
    {
      if (a7)
      {
        ErrorWithCodeAndDescription(v27, @"Error signing manifest.");
        uint64_t v28 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        if (!Mutable) {
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v28 = 0;
        if (!Mutable) {
          goto LABEL_25;
        }
      }
    }
    else
    {
      uint64_t v28 = [(__CFData *)Mutable copy];
      if (!Mutable)
      {
LABEL_25:

LABEL_26:
        CFRelease(v16);
        v18 = (void *)v28;
LABEL_27:

        goto LABEL_28;
      }
    }
    CFRelease(Mutable);
    goto LABEL_25;
  }
  if (a7)
  {
    ErrorWithCodeAndDescription(0, @"No certificates provided.");
    v18 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_28:

  return v18;
}

- (PKPlaceholderPassGenerator)initWithPassTemplate:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = [(PKPlaceholderPassGenerator *)self init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_templateDirectory, a3);
    id v16 = 0;
    uint64_t v10 = [[PKFileDataAccessor alloc] initWithFileURL:v7 error:&v16];
    id v11 = v16;
    CFDataRef v12 = +[PKObject createWithValidatedFileDataAccessor:v10];
    templatePass = v9->_templatePass;
    v9->_templatePass = v12;

    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v11 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v11;
LABEL_4:
  if (v11) {
    id v14 = 0;
  }
  else {
    id v14 = v9;
  }

  return v14;
}

- (NSMutableDictionary)passContent
{
  passContent = self->_passContent;
  if (!passContent)
  {
    v4 = [(PKObject *)self->_templatePass dataAccessor];
    uint64_t v5 = [v4 dictionary];
    v6 = (NSMutableDictionary *)[v5 mutableCopy];
    id v7 = self->_passContent;
    self->_passContent = v6;

    passContent = self->_passContent;
  }
  return passContent;
}

- (id)passTypeIdentifier
{
  v2 = [(PKPlaceholderPassGenerator *)self passContent];
  id v3 = [v2 objectForKeyedSubscript:@"passTypeIdentifier"];

  return v3;
}

- (void)setPassTypeIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PKPlaceholderPassGenerator *)self passContent];
    [v5 setObject:v4 forKeyedSubscript:@"passTypeIdentifier"];
  }
}

- (NSString)serialNumber
{
  v2 = [(PKPlaceholderPassGenerator *)self passContent];
  id v3 = [v2 objectForKeyedSubscript:@"serialNumber"];

  return (NSString *)v3;
}

- (void)setSerialNumber:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PKPlaceholderPassGenerator *)self passContent];
    [v5 setObject:v4 forKeyedSubscript:@"serialNumber"];
  }
}

- (NSString)primaryAccountIdentifier
{
  v2 = [(PKPlaceholderPassGenerator *)self passContent];
  id v3 = [v2 objectForKeyedSubscript:@"primaryAccountIdentifier"];

  return (NSString *)v3;
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = [(PKPlaceholderPassGenerator *)self passContent];
    [v5 setObject:v8 forKeyedSubscript:@"primaryAccountIdentifier"];
    if ((unint64_t)[v8 length] < 5)
    {
      id v6 = v8;
    }
    else
    {
      objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v8, "length") - 4);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v7 = v6;
    [v5 setObject:v6 forKeyedSubscript:@"primaryAccountSuffix"];

    id v4 = v8;
  }
}

- (NSArray)associatedApplicationIdentifiers
{
  v2 = [(PKPlaceholderPassGenerator *)self passContent];
  id v3 = [v2 objectForKeyedSubscript:@"associatedApplicationIdentifiers"];

  return (NSArray *)v3;
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PKPlaceholderPassGenerator *)self passContent];
    [v5 setObject:v4 forKeyedSubscript:@"associatedApplicationIdentifiers"];
  }
}

- (void)insertPassField:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PKPlaceholderPassGenerator *)self passContent];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v6 = [&unk_1EE22B2B8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v28;
      while (2)
      {
        uint64_t v10 = 0;
        id v11 = v8;
        do
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(&unk_1EE22B2B8);
          }
          id v8 = *(id *)(*((void *)&v27 + 1) + 8 * v10);

          CFDataRef v12 = [v5 objectForKey:v8];
          CFDataRef v13 = (void *)[v12 mutableCopy];

          if (v13)
          {
            uint64_t v14 = [v4 type];
            BOOL v20 = _PKEnumValueToString(v14, @"PKPassFieldType", @"PKPassFieldTypeHeader, PKPassFieldTypePrimary, PKPassFieldTypeSecondary, PKPassFieldTypeAuxiliary, PKPassFieldTypeBack", v15, v16, v17, v18, v19, 0);
            if (v20)
            {
              id v21 = [v13 objectForKey:v20];
              uint64_t v22 = (void *)[v21 mutableCopy];
              uint64_t v23 = v22;
              if (v22) {
                id v24 = v22;
              }
              else {
                id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              id v25 = v24;

              v26 = [v4 asDictionary];
              [v25 addObject:v26];

              [v13 setObject:v25 forKeyedSubscript:v20];
              [v5 setObject:v13 forKeyedSubscript:v8];
            }
            id v8 = v13;
            goto LABEL_17;
          }
          ++v10;
          id v11 = v8;
        }
        while (v7 != v10);
        uint64_t v7 = [&unk_1EE22B2B8 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v7) {
          continue;
        }
        break;
      }
LABEL_17:
    }
  }
}

- (void)insertPaymentApplication:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v15 = v4;
    id v5 = [(PKPlaceholderPassGenerator *)self passContent];
    int v6 = [v15 isAuxiliary];
    uint64_t v7 = (id *)&PKPassKeyAuxiliaryPaymentApplications;
    if (!v6) {
      uint64_t v7 = (id *)&PKPassKeyPaymentApplications;
    }
    id v8 = *v7;
    uint64_t v9 = [v5 objectForKey:v8];
    uint64_t v10 = (void *)[v9 mutableCopy];
    id v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    CFDataRef v13 = v12;

    uint64_t v14 = [v15 asDictionary];
    [v13 addObject:v14];

    [v5 setObject:v13 forKeyedSubscript:v8];
    id v4 = v15;
  }
}

- (int64_t)updatePaymentApplicationsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__PKPlaceholderPassGenerator_updatePaymentApplicationsWithBlock___block_invoke;
    aBlock[3] = &unk_1E56F22C0;
    id v16 = v4;
    int v6 = (uint64_t (**)(void *, void *, void))_Block_copy(aBlock);
    uint64_t v7 = [(PKPlaceholderPassGenerator *)self passContent];
    id v8 = [v7 objectForKey:@"paymentApplications"];
    uint64_t v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = [v7 objectForKey:@"auxiliaryPaymentApplications"];
    id v11 = (void *)[v10 mutableCopy];

    uint64_t v12 = v6[2](v6, v9, 0);
    int64_t v13 = v6[2](v6, v11, 1) + v12;
    [v7 setObject:v9 forKeyedSubscript:@"paymentApplications"];
    [v7 setObject:v11 forKeyedSubscript:@"auxiliaryPaymentApplications"];
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

uint64_t __65__PKPlaceholderPassGenerator_updatePaymentApplicationsWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = 0;
  if ([v5 count])
  {
    unint64_t v8 = 0;
    do
    {
      char v27 = 0;
      uint64_t v9 = [PKPaymentApplication alloc];
      uint64_t v10 = [v5 objectAtIndexedSubscript:v8];
      id v11 = [(PKPaymentApplication *)v9 initWithPaymentApplicationDictionary:v10 auxiliaryApplication:a3];

      if (v11)
      {
        uint64_t v12 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        int64_t v13 = (void *)v12;
        if (v12) {
          BOOL v14 = 0;
        }
        else {
          BOOL v14 = v27 == 0;
        }
        if (!v14) {
          ++v7;
        }
        if (v12) {
          id v15 = (PKPaymentApplication *)v12;
        }
        else {
          id v15 = v11;
        }
        [v6 addObject:v15];
      }
      ++v8;
    }
    while (v8 < [v5 count]);
  }
  [v5 removeAllObjects];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "asDictionary", (void)v23);
        [v5 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }

  return v7;
}

- (int64_t)updatePassUpgradeRequestsWithBlock:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  if (v4)
  {
    id v5 = [(PKPlaceholderPassGenerator *)self passContent];
    id v6 = objc_msgSend(v5, "objectForKey:");
    uint64_t v7 = (void *)[v6 mutableCopy];

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int64_t v9 = 0;
    if ([v7 count])
    {
      unint64_t v10 = 0;
      do
      {
        char v28 = 0;
        id v11 = [v7 objectAtIndexedSubscript:v10];
        uint64_t v12 = +[PKPassUpgradeRequest passUpgradeRequestFromDictionary:v11];

        if (v12)
        {
          uint64_t v13 = v4[2](v4, v12, &v28);
          BOOL v14 = (void *)v13;
          if (v13) {
            BOOL v15 = 0;
          }
          else {
            BOOL v15 = v28 == 0;
          }
          if (!v15) {
            ++v9;
          }
          if (!v28)
          {
            if (v13) {
              id v16 = (void *)v13;
            }
            else {
              id v16 = v12;
            }
            [v8 addObject:v16];
          }
        }
        ++v10;
      }
      while (v10 < [v7 count]);
    }
    [v7 removeAllObjects];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = [*(id *)(*((void *)&v24 + 1) + 8 * i) asDictionary];
          [v7 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v19);
    }

    [v5 setObject:v7 forKeyedSubscript:@"passUpgrades"];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (void)setUpdatePassRemoteAssetConfigrationsWithBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  id updateUrlsBlock = self->_updateUrlsBlock;
  self->_id updateUrlsBlock = v4;
}

- (void)_updatePassURLsConfigrationPassUrl:(id)a3
{
  v50[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_updateUrlsBlock)
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v6 = *MEMORY[0x1E4F1C628];
    v50[0] = *MEMORY[0x1E4F1C5F8];
    v50[1] = v6;
    v50[2] = *MEMORY[0x1E4F1C680];
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:3];
    id v33 = v4;
    id v8 = [v5 enumeratorAtURL:v4 includingPropertiesForKeys:v7 options:0 errorHandler:0];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v45;
      unint64_t v13 = 0x1E4F1C000uLL;
      uint64_t v34 = *(void *)v45;
      id v35 = v9;
      do
      {
        uint64_t v14 = 0;
        uint64_t v36 = v11;
        do
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v15 = *(void **)(*((void *)&v44 + 1) + 8 * v14);
          id v16 = [v15 pathExtension];
          int v17 = [v16 isEqualToString:@"urls"];

          if (v17)
          {
            uint64_t v18 = (void *)[objc_alloc(*(Class *)(v13 + 2488)) initWithContentsOfURL:v15];
            if (v18)
            {
              uint64_t v19 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v18 options:0 error:0];
              if (v19)
              {
                id v39 = v18;
                v37 = v15;
                id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                long long v40 = 0u;
                long long v41 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                v38 = v19;
                id v21 = v19;
                uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
                if (v22)
                {
                  uint64_t v23 = v22;
                  uint64_t v24 = *(void *)v41;
                  do
                  {
                    for (uint64_t i = 0; i != v23; ++i)
                    {
                      if (*(void *)v41 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      uint64_t v26 = *(void *)(*((void *)&v40 + 1) + 8 * i);
                      long long v27 = [v21 objectForKeyedSubscript:v26];
                      uint64_t v28 = (*((void (**)(void))self->_updateUrlsBlock + 2))();
                      uint64_t v29 = (void *)v28;
                      if (v28) {
                        uint64_t v30 = (void *)v28;
                      }
                      else {
                        uint64_t v30 = v27;
                      }
                      [v20 setObject:v30 forKeyedSubscript:v26];
                    }
                    uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
                  }
                  while (v23);
                }

                SecCertificateRef v31 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v20 options:1 error:0];
                uint64_t v32 = v31;
                if (v31) {
                  [v31 writeToURL:v37 atomically:1];
                }

                uint64_t v12 = v34;
                id v9 = v35;
                uint64_t v11 = v36;
                unint64_t v13 = 0x1E4F1C000;
                uint64_t v19 = v38;
                uint64_t v18 = v39;
              }
            }
          }
          ++v14;
        }
        while (v14 != v11);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v11);
    }

    id v4 = v33;
  }
}

- (id)generatePass
{
  return [(PKPlaceholderPassGenerator *)self generateAndSignPassWithPassCertificate:0 appleWWDRCertificate:0 certificatePassword:0 error:0];
}

- (id)generateAndSignPassWithPassCertificate:(id)a3 appleWWDRCertificate:(id)a4 certificatePassword:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v14 = PKTemporaryItemURLWithExtension(@"pkpass", 1);
  PKTemporaryItemPrepareDirectory();
  if (!v14)
  {
    ErrorWithCodeAndDescription(0, @"Invalid temporary directory");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  id v50 = 0;
  char v15 = [v13 removeItemAtURL:v14 error:&v50];
  id v16 = v50;
  id v17 = v16;
  if (v15) {
    goto LABEL_5;
  }
  uint64_t v18 = [v16 domain];
  if (([v18 isEqualToString:*MEMORY[0x1E4F281F8]] & 1) == 0)
  {

LABEL_15:
    int v26 = 0;
    if (!v17) {
      goto LABEL_37;
    }
    goto LABEL_16;
  }
  uint64_t v19 = [v17 code];

  if (v19 != 4) {
    goto LABEL_15;
  }
LABEL_5:

  templateDirectory = self->_templateDirectory;
  id v49 = 0;
  int v21 = [v13 copyItemAtURL:templateDirectory toURL:v14 error:&v49];
  id v22 = v49;
  if (v21) {
    BOOL v23 = v22 == 0;
  }
  else {
    BOOL v23 = 0;
  }
  if (!v23)
  {
    id v17 = v22;
    goto LABEL_36;
  }
  uint64_t v24 = [(PKPlaceholderPassGenerator *)self passContent];
  if (!v24)
  {
    id v29 = ErrorWithCodeAndDescription(0, @"Missing pass.json");
    long long v25 = 0;
LABEL_24:
    uint64_t v30 = PKPassDictionaryURLWithPassURL(v14);
    SecCertificateRef v31 = v25;
    uint64_t v32 = (void *)v30;
    id v47 = 0;
    long long v41 = v31;
    [v31 writeToURL:v30 options:0 error:&v47];
    id v17 = v47;

    if (!v17)
    {
      [(PKPlaceholderPassGenerator *)self _updatePassURLsConfigrationPassUrl:v14];
      id v46 = 0;
      id v33 = [(id)objc_opt_class() manifestForDirectory:v14 error:&v46];
      id v34 = v46;
      id v17 = v34;
      if (v33)
      {
        if (!v34)
        {
          id v39 = [@"manifest" stringByAppendingPathExtension:@"json"];
          [v14 URLByAppendingPathComponent:v39 isDirectory:0];
          v35 = long long v40 = v33;
          id v45 = 0;
          [v40 writeToURL:v35 options:0 error:&v45];
          id v17 = v45;

          id v33 = v40;
          if (!v17 && v10 && v11)
          {
            id v44 = 0;
            uint64_t v36 = [(id)objc_opt_class() manifestSignatureForDirectory:v40 passCertificate:v10 appleWWDRCertificate:v11 certificatePassword:v12 error:&v44];
            id v17 = v44;
            if (!v17)
            {
              v37 = [v14 URLByAppendingPathComponent:@"signature" isDirectory:0];
              id v43 = 0;
              [v36 writeToURL:v37 options:0 error:&v43];
              id v17 = v43;

              id v33 = v40;
            }
          }
        }
      }
    }
    long long v25 = v41;
    goto LABEL_35;
  }
  id v48 = 0;
  long long v25 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v24 options:1 error:&v48];
  id v17 = v48;
  if (!v17) {
    goto LABEL_24;
  }
LABEL_35:

LABEL_36:
  int v26 = 1;
  if (!v17)
  {
LABEL_37:
    id v42 = 0;
    v38 = [[PKFileDataAccessor alloc] initWithFileURL:v14 error:&v42];
    id v17 = v42;
    [(PKFileDataAccessor *)v38 setOwnsFileURL:1];
    id v27 = +[PKObject createWithValidatedFileDataAccessor:v38];

    if (!a6) {
      goto LABEL_20;
    }
LABEL_19:
    *a6 = v17;
    goto LABEL_20;
  }
LABEL_16:
  if (v26) {
    [v13 removeItemAtURL:v14 error:0];
  }
  id v27 = 0;
  if (a6) {
    goto LABEL_19;
  }
LABEL_20:

  return v27;
}

- (void)setPassContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passContent, 0);
  objc_storeStrong(&self->_updateUrlsBlock, 0);
  objc_storeStrong((id *)&self->_templatePass, 0);
  objc_storeStrong((id *)&self->_templateDirectory, 0);
}

@end