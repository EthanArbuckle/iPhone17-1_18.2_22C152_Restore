@interface MKApp
- (BOOL)isFree;
- (BOOL)isSupported:(int64_t)a3;
- (BOOL)isiPadApp;
- (BOOL)isiPhoneApp;
- (BOOL)isiPodApp;
- (MKApp)initWithBundleIdentifier:(id)a3 appStoreIdentifier:(id)a4 isFree:(BOOL)a5;
- (MKApp)initWithJSONData:(id)a3;
- (NSString)appStoreIdentifier;
- (NSString)bundleIdentifier;
- (NSString)category;
- (NSString)developer;
- (NSString)iconURL;
- (NSString)iconURLForAppStore;
- (NSString)iconURLForiPad;
- (NSString)iconURLForiPadPro;
- (NSString)iconURLForiPhone2x;
- (NSString)iconURLForiPhone3x;
- (NSString)name;
- (void)setAppStoreIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDeveloper:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setIconURLForAppStore:(id)a3;
- (void)setIconURLForiPad:(id)a3;
- (void)setIconURLForiPadPro:(id)a3;
- (void)setIconURLForiPhone2x:(id)a3;
- (void)setIconURLForiPhone3x:(id)a3;
- (void)setIsFree:(BOOL)a3;
- (void)setIsiPadApp:(BOOL)a3;
- (void)setIsiPhoneApp:(BOOL)a3;
- (void)setIsiPodApp:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation MKApp

- (MKApp)initWithJSONData:(id)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v78.receiver = self;
  v78.super_class = (Class)MKApp;
  v5 = [(MKApp *)&v78 init];
  if (!v5) {
    goto LABEL_57;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_56;
  }
  uint64_t v6 = objc_msgSend(v4, "mk_stringForKey:", @"id");
  if (!v6) {
    goto LABEL_56;
  }
  v7 = (void *)v6;
  v8 = objc_msgSend(v4, "mk_dictionaryForKey:", @"attributes");
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, "mk_arrayForKey:", @"deviceFamilies");
    if (!v10)
    {
      int v20 = 1;
      goto LABEL_55;
    }
    v11 = [MEMORY[0x263EFFA08] setWithArray:v10];
    -[MKApp setIsiPhoneApp:](v5, "setIsiPhoneApp:", [v11 containsObject:@"iphone"]);
    -[MKApp setIsiPadApp:](v5, "setIsiPadApp:", [v11 containsObject:@"ipad"]);
    -[MKApp setIsiPodApp:](v5, "setIsiPodApp:", [v11 containsObject:@"ipod"]);
    v12 = objc_msgSend(v9, "mk_dictionaryForKey:", @"platformAttributes");
    v13 = v12;
    if (!v12)
    {
      int v20 = 1;
LABEL_54:

LABEL_55:
      if (v20) {
        goto LABEL_56;
      }
LABEL_57:
      v56 = v5;
      goto LABEL_58;
    }
    v14 = objc_msgSend(v12, "mk_dictionaryForKey:", @"ios");
    v15 = v14;
    if (!v14)
    {
      int v20 = 1;
LABEL_53:

      goto LABEL_54;
    }
    uint64_t v16 = objc_msgSend(v14, "mk_stringForKey:", @"bundleId");
    v17 = v15;
    v18 = (void *)v16;
    v69 = v17;
    v19 = objc_msgSend(v17, "mk_arrayForKey:", @"offers");
    int v20 = 1;
    v68 = v18;
    if (v18)
    {
      v15 = v69;
      if (v19)
      {
        v63 = v13;
        v64 = v11;
        v65 = v10;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v62 = v19;
        id v21 = v19;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v74 objects:v82 count:16];
        v66 = v7;
        v67 = v9;
        if (v22)
        {
          uint64_t v23 = *(void *)v75;
          while (2)
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v75 != v23) {
                objc_enumerationMutation(v21);
              }
              v25 = *(void **)(*((void *)&v74 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v26 = objc_msgSend(v25, "mk_stringForKey:", @"type");
                v27 = [v26 lowercaseString];

                v28 = objc_msgSend(v25, "mk_numberForKey:", @"price");
                if (v28 && ([v27 isEqualToString:@"get"] & 1) != 0)
                {
                  [v28 floatValue];
                  uint64_t v22 = v29 == 0.0;

                  goto LABEL_27;
                }
              }
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v74 objects:v82 count:16];
            if (v22) {
              continue;
            }
            break;
          }
LABEL_27:
          v7 = v66;
          v9 = v67;
          v15 = v69;
        }

        uint64_t v30 = objc_msgSend(v9, "mk_stringForKey:", @"name");
        uint64_t v31 = objc_msgSend(v9, "mk_stringForKey:", @"artistName");
        uint64_t v32 = objc_msgSend(v9, "mk_stringForKey:", @"genreDisplayName");
        [(MKApp *)v5 setBundleIdentifier:v68];
        [(MKApp *)v5 setAppStoreIdentifier:v7];
        [(MKApp *)v5 setIsFree:v22];
        v61 = (void *)v30;
        [(MKApp *)v5 setName:v30];
        v60 = (void *)v31;
        [(MKApp *)v5 setDeveloper:v31];
        v59 = (void *)v32;
        [(MKApp *)v5 setCategory:v32];
        v58 = objc_msgSend(v15, "mk_dictionaryForKey:", @"artwork");
        v33 = objc_msgSend(v58, "mk_stringForKey:", @"url");
        v80[0] = @"{h}";
        v80[1] = @"{c}";
        v81[0] = @"{w}";
        v81[1] = @"bb";
        v80[2] = @"{f}";
        v81[2] = @"png";
        [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:3];
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = [v34 countByEnumeratingWithState:&v70 objects:v79 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v71;
          do
          {
            uint64_t v38 = 0;
            v39 = v33;
            do
            {
              if (*(void *)v71 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v40 = *(void *)(*((void *)&v70 + 1) + 8 * v38);
              v41 = [v34 objectForKeyedSubscript:v40];
              v33 = [v39 stringByReplacingOccurrencesOfString:v40 withString:v41];

              ++v38;
              v39 = v33;
            }
            while (v36 != v38);
            uint64_t v36 = [v34 countByEnumeratingWithState:&v70 objects:v79 count:16];
          }
          while (v36);
        }

        v42 = [&unk_26DF7A578 stringValue];
        v43 = [v33 stringByReplacingOccurrencesOfString:@"{w}" withString:v42];
        [(MKApp *)v5 setIconURLForiPhone3x:v43];

        v44 = [&unk_26DF7A590 stringValue];
        v45 = [v33 stringByReplacingOccurrencesOfString:@"{w}" withString:v44];
        [(MKApp *)v5 setIconURLForiPhone2x:v45];

        v46 = [&unk_26DF7A5A8 stringValue];
        v47 = [v33 stringByReplacingOccurrencesOfString:@"{w}" withString:v46];
        [(MKApp *)v5 setIconURLForiPadPro:v47];

        v48 = [&unk_26DF7A5C0 stringValue];
        v49 = [v33 stringByReplacingOccurrencesOfString:@"{w}" withString:v48];
        [(MKApp *)v5 setIconURLForiPad:v49];

        v50 = [&unk_26DF7A5D8 stringValue];
        v51 = [v33 stringByReplacingOccurrencesOfString:@"{w}" withString:v50];
        [(MKApp *)v5 setIconURLForAppStore:v51];

        v52 = objc_alloc_init(MKDevice);
        uint64_t v53 = [(MKDevice *)v52 iconSize];

        if (v53 <= 166)
        {
          v10 = v65;
          if (v53 != 120)
          {
            BOOL v54 = v53 == 152;
            v7 = v66;
            v9 = v67;
            if (!v54) {
              goto LABEL_51;
            }
            uint64_t v55 = 88;
            goto LABEL_50;
          }
          uint64_t v55 = 72;
        }
        else
        {
          v10 = v65;
          if (v53 != 167)
          {
            v9 = v67;
            if (v53 == 180)
            {
              uint64_t v55 = 64;
              v7 = v66;
            }
            else
            {
              BOOL v54 = v53 == 1024;
              v7 = v66;
              if (!v54) {
                goto LABEL_51;
              }
              uint64_t v55 = 96;
            }
LABEL_50:
            [(MKApp *)v5 setIconURL:*(Class *)((char *)&v5->super.isa + v55)];
LABEL_51:

            int v20 = 0;
            v13 = v63;
            v11 = v64;
            v15 = v69;
            v19 = v62;
            goto LABEL_52;
          }
          uint64_t v55 = 80;
        }
        v7 = v66;
        v9 = v67;
        goto LABEL_50;
      }
    }
    else
    {
      v15 = v69;
    }
LABEL_52:

    goto LABEL_53;
  }

LABEL_56:
  v56 = 0;
LABEL_58:

  return v56;
}

- (MKApp)initWithBundleIdentifier:(id)a3 appStoreIdentifier:(id)a4 isFree:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MKApp;
  v10 = [(MKApp *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(MKApp *)v10 setBundleIdentifier:v8];
    [(MKApp *)v11 setAppStoreIdentifier:v9];
    [(MKApp *)v11 setIsFree:v5];
  }

  return v11;
}

- (BOOL)isSupported:(int64_t)a3
{
  if (a3 == 3) {
    return [(MKApp *)self isiPodApp];
  }
  if (a3 == 2) {
    return [(MKApp *)self isiPadApp];
  }
  return a3 == 1 && [(MKApp *)self isiPhoneApp];
}

- (BOOL)isFree
{
  return self->_isFree;
}

- (void)setIsFree:(BOOL)a3
{
  self->_isFree = a3;
}

- (BOOL)isiPhoneApp
{
  return self->_isiPhoneApp;
}

- (void)setIsiPhoneApp:(BOOL)a3
{
  self->_isiPhoneApp = a3;
}

- (BOOL)isiPadApp
{
  return self->_isiPadApp;
}

- (void)setIsiPadApp:(BOOL)a3
{
  self->_isiPadApp = a3;
}

- (BOOL)isiPodApp
{
  return self->_isiPodApp;
}

- (void)setIsiPodApp:(BOOL)a3
{
  self->_isiPodApp = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)appStoreIdentifier
{
  return self->_appStoreIdentifier;
}

- (void)setAppStoreIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)developer
{
  return self->_developer;
}

- (void)setDeveloper:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSString)iconURLForiPhone3x
{
  return self->_iconURLForiPhone3x;
}

- (void)setIconURLForiPhone3x:(id)a3
{
}

- (NSString)iconURLForiPhone2x
{
  return self->_iconURLForiPhone2x;
}

- (void)setIconURLForiPhone2x:(id)a3
{
}

- (NSString)iconURLForiPadPro
{
  return self->_iconURLForiPadPro;
}

- (void)setIconURLForiPadPro:(id)a3
{
}

- (NSString)iconURLForiPad
{
  return self->_iconURLForiPad;
}

- (void)setIconURLForiPad:(id)a3
{
}

- (NSString)iconURLForAppStore
{
  return self->_iconURLForAppStore;
}

- (void)setIconURLForAppStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconURLForAppStore, 0);
  objc_storeStrong((id *)&self->_iconURLForiPad, 0);
  objc_storeStrong((id *)&self->_iconURLForiPadPro, 0);
  objc_storeStrong((id *)&self->_iconURLForiPhone2x, 0);
  objc_storeStrong((id *)&self->_iconURLForiPhone3x, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_developer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_appStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end