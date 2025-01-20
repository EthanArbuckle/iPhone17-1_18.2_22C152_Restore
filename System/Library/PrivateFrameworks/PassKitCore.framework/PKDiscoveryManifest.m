@interface PKDiscoveryManifest
+ (BOOL)supportsSecureCoding;
+ (id)manifestFromURL:(id)a3;
- (BOOL)isMiniCardsAllowed;
- (NSArray)discoveryItems;
- (NSArray)rules;
- (PKDiscoveryManifest)initWithCoder:(id)a3;
- (PKDiscoveryManifest)initWithDictionary:(id)a3;
- (PKDiscoveryManifest)initWithVersion:(int64_t)a3 rules:(id)a4 discoveryItems:(id)a5 engagementMessagesMetadata:(id)a6;
- (PKDiscoveryMessagesMetadata)messagesMetadata;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKDiscoveryManifest

+ (id)manifestFromURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:1 error:&v15];
  id v4 = v15;
  if (!v4)
  {
    id v14 = 0;
    v6 = [objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v14];
    id v8 = v14;
    if (v8)
    {
      id v5 = v8;
      v9 = PKLogFacilityTypeGetObject(0x10uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v5;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to create unarchiver from data for Discovery Manifest with error: %@", buf, 0xCu);
      }
      v7 = 0;
    }
    else
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = *MEMORY[0x1E4F284E8];
      id v13 = 0;
      v7 = [v6 decodeTopLevelObjectOfClass:v11 forKey:v12 error:&v13];
      id v5 = v13;
      if (!v5) {
        goto LABEL_10;
      }
      v9 = PKLogFacilityTypeGetObject(0x10uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v5;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to decode archived Discovery Manifest with error: %@", buf, 0xCu);
      }
    }

    goto LABEL_10;
  }
  id v5 = v4;
  v6 = PKLogFacilityTypeGetObject(0x10uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Failed to read archive data for Discovery Manifest with error: %@", buf, 0xCu);
  }
  v7 = 0;
LABEL_10:

  return v7;
}

- (PKDiscoveryManifest)initWithDictionary:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)PKDiscoveryManifest;
  id v5 = [(PKDiscoveryManifest *)&v64 init];
  if (!v5) {
    goto LABEL_46;
  }
  v5->_version = [v4 PKIntegerForKey:@"version"];
  v5->_miniCardsAllowed = [v4 PKBoolForKey:@"miniCardsAllowed"];
  id v6 = [v4 objectForKey:@"rules"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      *(_DWORD *)buf = 138543618;
      v68 = v32;
      __int16 v69 = 2114;
      v70 = v34;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected array and received %{public}@", buf, 0x16u);
    }
LABEL_32:

    goto LABEL_33;
  }
  v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v6 = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v61;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v61 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v60 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v35 = PKLogFacilityTypeGetObject(0x10uLL);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = (objc_class *)objc_opt_class();
            v37 = NSStringFromClass(v36);
            v38 = (objc_class *)objc_opt_class();
            v39 = NSStringFromClass(v38);
            *(_DWORD *)buf = 138543618;
            v68 = v37;
            __int16 v69 = 2114;
            v70 = v39;
            _os_log_impl(&dword_190E10000, v35, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
          }
          goto LABEL_32;
        }
        id v13 = [[PKRule alloc] initWithDictionary:v12];
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = [v7 copy];
  rules = v5->_rules;
  v5->_rules = (NSArray *)v14;

  v16 = [v4 objectForKey:@"discoveryItems"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v57;
      obuint64_t j = v17;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v57 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v56 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            p_super = PKLogFacilityTypeGetObject(0x10uLL);
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
            {
              v45 = (objc_class *)objc_opt_class();
              v46 = NSStringFromClass(v45);
              v47 = (objc_class *)objc_opt_class();
              v48 = NSStringFromClass(v47);
              *(_DWORD *)buf = 138543618;
              v68 = v46;
              __int16 v69 = 2114;
              v70 = v48;
              _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
            }
            int v29 = 1;
            v27 = obj;
            v24 = v55;
            goto LABEL_43;
          }
          v23 = [[PKDiscoveryItem alloc] initWithDictionary:v22];
          if (v23) {
            [v55 addObject:v23];
          }
        }
        id v17 = obj;
        uint64_t v19 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    v24 = v55;
    uint64_t v25 = [v55 copy];
    discoveryItems = v5->_discoveryItems;
    v5->_discoveryItems = (NSArray *)v25;

    v27 = [v4 objectForKey:@"engagementMessagesMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v27)
      {
        int v29 = 0;
        goto LABEL_44;
      }
      v28 = [[PKDiscoveryMessagesMetadata alloc] initWithDictionary:v27];
      int v29 = 0;
      p_super = &v5->_messagesMetadata->super;
      v5->_messagesMetadata = v28;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(0x10uLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (objc_class *)objc_opt_class();
        v50 = NSStringFromClass(v49);
        v51 = (objc_class *)objc_opt_class();
        v52 = NSStringFromClass(v51);
        *(_DWORD *)buf = 138543618;
        v68 = v50;
        __int16 v69 = 2114;
        v70 = v52;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
      int v29 = 1;
    }
LABEL_43:

LABEL_44:
    goto LABEL_45;
  }
  v24 = PKLogFacilityTypeGetObject(0x10uLL);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v41 = (objc_class *)objc_opt_class();
    v42 = NSStringFromClass(v41);
    v43 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v43);
    *(_DWORD *)buf = 138543618;
    v68 = v42;
    __int16 v69 = 2114;
    v70 = v44;
    _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected array and received %{public}@", buf, 0x16u);
  }
  int v29 = 1;
LABEL_45:

  if (!v29)
  {
LABEL_46:
    v40 = v5;
    goto LABEL_47;
  }
LABEL_33:
  v40 = 0;
LABEL_47:

  return v40;
}

- (PKDiscoveryManifest)initWithVersion:(int64_t)a3 rules:(id)a4 discoveryItems:(id)a5 engagementMessagesMetadata:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKDiscoveryManifest;
  uint64_t v14 = [(PKDiscoveryManifest *)&v17 init];
  id v15 = v14;
  if (v14)
  {
    v14->_version = a3;
    objc_storeStrong((id *)&v14->_rules, a4);
    objc_storeStrong((id *)&v15->_discoveryItems, a5);
    objc_storeStrong((id *)&v15->_messagesMetadata, a6);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiscoveryManifest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKDiscoveryManifest;
  id v5 = [(PKDiscoveryManifest *)&v19 init];
  if (v5)
  {
    v5->_version = [v4 decodeIntegerForKey:@"version"];
    v5->_miniCardsAllowed = [v4 decodeBoolForKey:@"miniCardsAllowed"];
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"discoveryItems"];
    discoveryItems = v5->_discoveryItems;
    v5->_discoveryItems = (NSArray *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"rules"];
    rules = v5->_rules;
    v5->_rules = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"engagementMessagesMetadata"];
    messagesMetadata = v5->_messagesMetadata;
    v5->_messagesMetadata = (PKDiscoveryMessagesMetadata *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeBool:self->_miniCardsAllowed forKey:@"miniCardsAllowed"];
  [v5 encodeObject:self->_discoveryItems forKey:@"discoveryItems"];
  [v5 encodeObject:self->_rules forKey:@"rules"];
  [v5 encodeObject:self->_messagesMetadata forKey:@"engagementMessagesMetadata"];
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isMiniCardsAllowed
{
  return self->_miniCardsAllowed;
}

- (NSArray)rules
{
  return self->_rules;
}

- (NSArray)discoveryItems
{
  return self->_discoveryItems;
}

- (PKDiscoveryMessagesMetadata)messagesMetadata
{
  return self->_messagesMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesMetadata, 0);
  objc_storeStrong((id *)&self->_discoveryItems, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

@end