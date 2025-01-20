@interface PDUAppDisclosureStyle
+ (id)styleWithApplication:(id)a3;
+ (id)styleWithBundle:(id)a3;
- (PDUAppDisclosureStyle)initWithBundle:(id)a3;
- (UIColor)tintColor;
- (int64_t)_styleFromString:(id)a3;
- (int64_t)interfaceStyle;
- (void)_fetchStyleWithBundle:(id)a3;
@end

@implementation PDUAppDisclosureStyle

- (PDUAppDisclosureStyle)initWithBundle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDUAppDisclosureStyle;
  v5 = [(PDUAppDisclosureStyle *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(PDUAppDisclosureStyle *)v5 _fetchStyleWithBundle:v4];
    v7 = v6;
  }

  return v6;
}

+ (id)styleWithBundle:(id)a3
{
  id v3 = a3;
  id v4 = (void *)styleWithBundle__styleCache;
  if (!styleWithBundle__styleCache)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    v6 = (void *)styleWithBundle__styleCache;
    styleWithBundle__styleCache = (uint64_t)v5;

    [(id)styleWithBundle__styleCache setCountLimit:8];
    id v4 = (void *)styleWithBundle__styleCache;
  }
  v7 = [v3 bundleIdentifier];
  v8 = [v4 objectForKey:v7];

  if (!v8)
  {
    v8 = [[PDUAppDisclosureStyle alloc] initWithBundle:v3];
    objc_super v9 = (void *)styleWithBundle__styleCache;
    v10 = [v3 bundleIdentifier];
    [v9 setObject:v8 forKey:v10];
  }
  return v8;
}

+ (id)styleWithApplication:(id)a3
{
  id v4 = (void *)MEMORY[0x263F086E0];
  id v5 = [a3 URL];
  v6 = [v4 bundleWithURL:v5];

  v7 = [a1 styleWithBundle:v6];

  return v7;
}

- (int64_t)_styleFromString:(id)a3
{
  id v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"dark"]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = [v3 isEqualToString:@"light"];
  }

  return v4;
}

- (void)_fetchStyleWithBundle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F1CBE0]);
  v6 = [v4 bundleURL];
  v7 = [MEMORY[0x263F1C5C0] currentDevice];
  v8 = objc_msgSend(v5, "initWithURL:idiom:error:", v6, objc_msgSend(v7, "userInterfaceIdiom"), 0);

  objc_super v9 = [v8 colorNamed:@"PrivacyDisclosureTintColor" withTraitCollection:0];
  tintColor = self->_tintColor;
  self->_tintColor = v9;

  if (!self->_tintColor)
  {
    v11 = [v8 colorNamed:@"AccentColor" withTraitCollection:0];
    v12 = self->_tintColor;
    self->_tintColor = v11;

    if (!self->_tintColor)
    {
      v13 = [v4 infoDictionary];
      v14 = [v13 objectForKeyedSubscript:@"NSAccentColorName"];

      if (v14)
      {
        v15 = [v8 colorNamed:v14 withTraitCollection:0];
        v16 = self->_tintColor;
        self->_tintColor = v15;
      }
    }
  }
  v17 = [v4 infoDictionary];
  v18 = [v17 objectForKeyedSubscript:@"UIUserInterfaceStyle"];

  int64_t v19 = [(PDUAppDisclosureStyle *)self _styleFromString:v18];
  self->_interfaceStyle = v19;
  if (!self->_tintColor || !v19)
  {
    v20 = [v4 bundleIdentifier];
    v21 = PDUGetBundle();
    v22 = v21;
    if (v21)
    {
      v23 = [v21 URLForResource:@"AppDisclosureData" withExtension:@"json"];
      if (v23)
      {
        id v40 = 0;
        v24 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v23 options:1 error:&v40];
        id v25 = v40;
        v26 = v25;
        if (v24 && !v25)
        {
          id v39 = 0;
          v27 = [MEMORY[0x263F08900] JSONObjectWithData:v24 options:0 error:&v39];
          id v28 = v39;
          v26 = v28;
          if (v27 && !v28)
          {
            v38 = v27;
            v29 = [v27 objectForKeyedSubscript:v20];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v34 = v29;
              id v37 = v29;
              uint64_t v30 = [v37 objectForKeyedSubscript:@"tint"];
              objc_opt_class();
              v36 = (void *)v30;
              if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_tintColor)
              {
                objc_msgSend(MEMORY[0x263F1C550], "pdu_colorWithString:", v30);
                v31 = (UIColor *)objc_claimAutoreleasedReturnValue();
                v32 = self->_tintColor;
                self->_tintColor = v31;
              }
              v33 = objc_msgSend(v37, "objectForKeyedSubscript:", @"appearance", v34);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_interfaceStyle) {
                self->_interfaceStyle = [(PDUAppDisclosureStyle *)self _styleFromString:v33];
              }

              v29 = v35;
            }

            v27 = v38;
          }
        }
      }
    }
  }
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void).cxx_destruct
{
}

@end