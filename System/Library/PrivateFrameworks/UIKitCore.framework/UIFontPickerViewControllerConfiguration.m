@interface UIFontPickerViewControllerConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (NSPredicate)filterPredicateForFilteredLanguages:(NSArray *)filteredLanguages;
- (BOOL)_hideSearchBar;
- (BOOL)_includeDefaultFont;
- (BOOL)_matchesLanguageList:(id)a3;
- (BOOL)_showsSectionIndexBar;
- (BOOL)displayUsingSystemFont;
- (BOOL)includeFaces;
- (BOOL)isEqual:(id)a3;
- (NSArray)_allowedLanguages;
- (NSArray)_clientRecentFonts;
- (NSPredicate)filteredLanguagesPredicate;
- (NSString)_filterFamilyName;
- (NSString)debugDescription;
- (NSXPCListenerEndpoint)_clientFontContextEndpoint;
- (UIColor)_tintColor;
- (UIFontDescriptorSymbolicTraits)filteredTraits;
- (UIFontPickerViewControllerConfiguration)initWithBSXPCCoder:(id)a3;
- (UIFontPickerViewControllerConfiguration)initWithCoder:(id)a3;
- (id)_serializedPredicate;
- (id)_swiftPredicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_setClientRecentFonts:(id)a3;
- (void)_setHideSearchBar:(BOOL)a3;
- (void)_setPredicateFromData:(id)a3;
- (void)_setTintColor:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayUsingSystemFont:(BOOL)displayUsingSystemFont;
- (void)setFilteredLanguagesPredicate:(NSPredicate *)filteredLanguagesPredicate;
- (void)setFilteredTraits:(UIFontDescriptorSymbolicTraits)filteredTraits;
- (void)setIncludeFaces:(BOOL)includeFaces;
- (void)set_allowedLanguages:(id)a3;
- (void)set_clientFontContextEndpoint:(id)a3;
- (void)set_filterFamilyName:(id)a3;
- (void)set_includeDefaultFont:(BOOL)a3;
- (void)set_showsSectionIndexBar:(BOOL)a3;
- (void)set_swiftPredicate:(id)a3;
@end

@implementation UIFontPickerViewControllerConfiguration

- (BOOL)_matchesLanguageList:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_186A1EB3C();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  char v6 = sub_1859D9E4C(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (id)_serializedPredicate
{
  v2 = self;
  uint64_t v3 = sub_1859DA1C4();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    char v6 = 0;
  }
  else
  {
    char v6 = (void *)sub_186A1D66C();
    sub_1858F36AC(v3, v5);
  }
  return v6;
}

- (void)_setPredicateFromData:(id)a3
{
  uint64_t v3 = a3;
  if (a3)
  {
    unint64_t v4 = self;
    id v5 = v3;
    uint64_t v3 = (void *)sub_186A1D67C();
    unint64_t v7 = v6;
  }
  else
  {
    v8 = self;
    unint64_t v7 = 0xF000000000000000;
  }
  sub_1859DA470((uint64_t)v3, v7);
  sub_1858F36AC((uint64_t)v3, v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setIncludeFaces:", -[UIFontPickerViewControllerConfiguration includeFaces](self, "includeFaces"));
  objc_msgSend(v5, "setDisplayUsingSystemFont:", -[UIFontPickerViewControllerConfiguration displayUsingSystemFont](self, "displayUsingSystemFont"));
  objc_msgSend(v5, "setFilteredTraits:", -[UIFontPickerViewControllerConfiguration filteredTraits](self, "filteredTraits"));
  unint64_t v6 = [(UIFontPickerViewControllerConfiguration *)self filteredLanguagesPredicate];
  unint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setFilteredLanguagesPredicate:v7];

  v8 = [(UIFontPickerViewControllerConfiguration *)self _allowedLanguages];
  v9 = (void *)[v8 copyWithZone:a3];
  objc_msgSend(v5, "set_allowedLanguages:", v9);

  v10 = [(UIFontPickerViewControllerConfiguration *)self _swiftPredicate];
  v11 = (void *)[v10 copyWithZone:a3];
  objc_msgSend(v5, "set_swiftPredicate:", v11);

  objc_msgSend(v5, "_setHideSearchBar:", -[UIFontPickerViewControllerConfiguration _hideSearchBar](self, "_hideSearchBar"));
  v12 = [(UIFontPickerViewControllerConfiguration *)self _tintColor];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 _setTintColor:v13];

  objc_msgSend(v5, "set_includeDefaultFont:", -[UIFontPickerViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"));
  v14 = [(UIFontPickerViewControllerConfiguration *)self _filterFamilyName];
  objc_msgSend(v5, "set_filterFamilyName:", v14);

  objc_msgSend(v5, "set_showsSectionIndexBar:", -[UIFontPickerViewControllerConfiguration _showsSectionIndexBar](self, "_showsSectionIndexBar"));
  v15 = [(UIFontPickerViewControllerConfiguration *)self _clientFontContextEndpoint];
  objc_msgSend(v5, "set_clientFontContextEndpoint:", v15);

  v16 = [(UIFontPickerViewControllerConfiguration *)self _clientRecentFonts];
  [v5 _setClientRecentFonts:v16];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v7 = (UIFontPickerViewControllerConfiguration *)a3;
  if (v7 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      BOOL v9 = [(UIFontPickerViewControllerConfiguration *)self includeFaces];
      if (v9 != [(UIFontPickerViewControllerConfiguration *)v8 includeFaces]
        || (BOOL v10 = [(UIFontPickerViewControllerConfiguration *)self displayUsingSystemFont],
            v10 != [(UIFontPickerViewControllerConfiguration *)v8 displayUsingSystemFont])
        || (UIFontDescriptorSymbolicTraits v11 = [(UIFontPickerViewControllerConfiguration *)self filteredTraits],
            v11 != [(UIFontPickerViewControllerConfiguration *)v8 filteredTraits]))
      {
        char v14 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v12 = [(UIFontPickerViewControllerConfiguration *)self filteredLanguagesPredicate];
      if (v12
        || ([(UIFontPickerViewControllerConfiguration *)v8 filteredLanguagesPredicate],
            (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v3 = [(UIFontPickerViewControllerConfiguration *)self filteredLanguagesPredicate];
        unint64_t v4 = [(UIFontPickerViewControllerConfiguration *)v8 filteredLanguagesPredicate];
        if (![v3 isEqual:v4])
        {
          char v14 = 0;
LABEL_54:

LABEL_55:
          if (!v12) {

          }
          goto LABEL_13;
        }
        int v13 = 1;
      }
      else
      {
        int v13 = 0;
      }
      v16 = [(UIFontPickerViewControllerConfiguration *)self _allowedLanguages];
      if (v16
        || ([(UIFontPickerViewControllerConfiguration *)v8 _allowedLanguages],
            (v66 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v17 = [(UIFontPickerViewControllerConfiguration *)self _allowedLanguages];
        v71 = [(UIFontPickerViewControllerConfiguration *)v8 _allowedLanguages];
        if (!objc_msgSend(v17, "isEqualToArray:"))
        {
          char v14 = 0;
          goto LABEL_50;
        }
        v65 = v17;
        int v69 = 1;
      }
      else
      {
        v66 = 0;
        int v69 = 0;
      }
      v70 = [(UIFontPickerViewControllerConfiguration *)self _swiftPredicate];
      if (!v70)
      {
        v62 = [(UIFontPickerViewControllerConfiguration *)v8 _swiftPredicate];
        if (!v62)
        {
          LODWORD(v63) = v13;
          v24 = v5;
          v62 = 0;
          int v64 = 0;
LABEL_34:
          BOOL v25 = [(UIFontPickerViewControllerConfiguration *)self _hideSearchBar];
          if (v25 != [(UIFontPickerViewControllerConfiguration *)v8 _hideSearchBar])
          {
            char v14 = 0;
            id v5 = v24;
            goto LABEL_44;
          }
          [(UIFontPickerViewControllerConfiguration *)self _tintColor];
          v68 = id v5 = v24;
          if (v68
            || ([(UIFontPickerViewControllerConfiguration *)v8 _tintColor],
                (v58 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v26 = [(UIFontPickerViewControllerConfiguration *)self _tintColor];
            v27 = [(UIFontPickerViewControllerConfiguration *)v8 _tintColor];
            if (([v26 isEqual:v27] & 1) == 0)
            {

              if (v68) {
              else
              }

              char v14 = 0;
LABEL_44:
              int v13 = (int)v63;
              if ((v64 & 1) == 0)
              {
LABEL_46:
                if (!v70) {

                }
                if (!v69)
                {
LABEL_51:
                  if (!v16) {

                  }
                  if (!v13) {
                    goto LABEL_55;
                  }
                  goto LABEL_54;
                }
                v17 = v65;
LABEL_50:

                goto LABEL_51;
              }
LABEL_45:

              goto LABEL_46;
            }
            v56 = v27;
            v57 = v26;
            v24 = v5;
            int v59 = 1;
          }
          else
          {
            v58 = 0;
            int v59 = 0;
          }
          BOOL v28 = [(UIFontPickerViewControllerConfiguration *)self _includeDefaultFont];
          if (v28 != [(UIFontPickerViewControllerConfiguration *)v8 _includeDefaultFont])
          {
            char v14 = 0;
            id v5 = v24;
            int v13 = (int)v63;
            goto LABEL_80;
          }
          [(UIFontPickerViewControllerConfiguration *)self _filterFamilyName];
          v55 = id v5 = v24;
          if (v55
            || ([(UIFontPickerViewControllerConfiguration *)v8 _filterFamilyName],
                (v53 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            uint64_t v29 = [(UIFontPickerViewControllerConfiguration *)self _filterFamilyName];
            int v13 = (int)v63;
            if (!v29)
            {
              char v14 = 0;
              goto LABEL_100;
            }
            v54 = (void *)v29;
            uint64_t v30 = [(UIFontPickerViewControllerConfiguration *)v8 _filterFamilyName];
            if (v30)
            {
              v52 = (void *)v30;
              uint64_t v31 = [(UIFontPickerViewControllerConfiguration *)self _filterFamilyName];
              uint64_t v32 = [(UIFontPickerViewControllerConfiguration *)v8 _filterFamilyName];
              v51 = (void *)v31;
              v33 = (void *)v31;
              v34 = (void *)v32;
              if ([v33 isEqualToString:v32])
              {
                v48 = v34;
                v50 = v5;
                int v49 = 1;
                goto LABEL_72;
              }
            }
            if (v55) {

            }
            else {
            char v14 = 0;
            }
LABEL_80:
            if ((v59 & 1) == 0) {
              goto LABEL_82;
            }
            goto LABEL_81;
          }
          v50 = v24;
          v53 = 0;
          int v49 = 0;
          int v13 = (int)v63;
LABEL_72:
          BOOL v35 = [(UIFontPickerViewControllerConfiguration *)self _showsSectionIndexBar];
          if (v35 != [(UIFontPickerViewControllerConfiguration *)v8 _showsSectionIndexBar])
          {
            char v14 = 0;
            goto LABEL_98;
          }
          v36 = [(UIFontPickerViewControllerConfiguration *)self _clientFontContextEndpoint];
          if (v36
            || ([(UIFontPickerViewControllerConfiguration *)v8 _clientFontContextEndpoint],
                (v45 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v37 = [(UIFontPickerViewControllerConfiguration *)self _clientFontContextEndpoint];
            v63 = [(UIFontPickerViewControllerConfiguration *)v8 _clientFontContextEndpoint];
            if ((objc_msgSend(v37, "isEqual:") & 1) == 0)
            {
              char v14 = 0;
              goto LABEL_90;
            }
            v47 = v36;
            int v46 = 1;
            [(UIFontPickerViewControllerConfiguration *)self _clientRecentFonts];
          }
          else
          {
            v47 = 0;
            v45 = 0;
            int v46 = 0;
            [(UIFontPickerViewControllerConfiguration *)self _clientRecentFonts];
          v39 = };
          v40 = [(UIFontPickerViewControllerConfiguration *)v8 _clientRecentFonts];
          char v14 = [v39 isEqual:v40];

          if (!v46)
          {
            if (v47) {
              v41 = v47;
            }
            else {
              v41 = v45;
            }

LABEL_98:
            id v5 = v50;
            if ((v49 & 1) == 0) {
              goto LABEL_100;
            }
            goto LABEL_99;
          }
          v36 = v47;
          v37 = v44;
LABEL_90:

          if (!v36) {
          id v5 = v50;
          }
          if (!v49)
          {
LABEL_100:
            v42 = v55;
            if (!v55)
            {

              v42 = 0;
            }

            if (!v59)
            {
LABEL_82:
              v38 = v68;
              if (!v68)
              {

                v38 = 0;
              }

              if (!v64) {
                goto LABEL_46;
              }
              goto LABEL_45;
            }
LABEL_81:

            goto LABEL_82;
          }
LABEL_99:

          goto LABEL_100;
        }
      }
      v67 = v12;
      v18 = v4;
      v19 = v16;
      v20 = v3;
      int v21 = v13;
      v22 = [(UIFontPickerViewControllerConfiguration *)self _serializedPredicate];
      v23 = [(UIFontPickerViewControllerConfiguration *)v8 _serializedPredicate];
      if ([v22 isEqualToData:v23])
      {
        v60 = v22;
        v61 = v23;
        LODWORD(v63) = v21;
        v24 = v5;
        int v64 = 1;
        uint64_t v3 = v20;
        v16 = v19;
        unint64_t v4 = v18;
        v12 = v67;
        goto LABEL_34;
      }

      if (v70)
      {

        char v14 = 0;
        int v13 = v21;
        if (v69)
        {
          v17 = v65;
LABEL_31:
          uint64_t v3 = v20;
          v16 = v19;
          unint64_t v4 = v18;
          v12 = v67;
          goto LABEL_50;
        }
      }
      else
      {

        char v14 = 0;
        v17 = v65;
        int v13 = v21;
        if (v69) {
          goto LABEL_31;
        }
      }
      uint64_t v3 = v20;
      v16 = v19;
      unint64_t v4 = v18;
      v12 = v67;
      goto LABEL_51;
    }
    char v14 = 0;
  }
LABEL_14:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration includeFaces](self, "includeFaces"), @"IncludesFaces");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration displayUsingSystemFont](self, "displayUsingSystemFont"), @"DisplaySystemFont");
  objc_msgSend(v4, "encodeInt32:forKey:", -[UIFontPickerViewControllerConfiguration filteredTraits](self, "filteredTraits"), @"FilteredTraits");
  id v5 = [(UIFontPickerViewControllerConfiguration *)self _allowedLanguages];
  [v4 encodeObject:v5 forKey:@"AllowedLanguages"];

  unint64_t v6 = [(UIFontPickerViewControllerConfiguration *)self _serializedPredicate];
  [v4 encodeObject:v6 forKey:@"SerializedPredicate"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _hideSearchBar](self, "_hideSearchBar"), @"HideSearchBar");
  unint64_t v7 = [(UIFontPickerViewControllerConfiguration *)self _tintColor];
  [v4 encodeObject:v7 forKey:@"TintColor"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"), @"IncludesDefaultFont");
  v8 = [(UIFontPickerViewControllerConfiguration *)self _filterFamilyName];
  [v4 encodeObject:v8 forKey:@"FilterFamilyNameCodingKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _showsSectionIndexBar](self, "_showsSectionIndexBar"), @"ShowsSectionIndexBarCodingKey");
  BOOL v9 = [(UIFontPickerViewControllerConfiguration *)self _clientFontContextEndpoint];
  [v4 encodeObject:v9 forKey:@"ClientFontContextEndpointCodingKey"];

  id v10 = [(UIFontPickerViewControllerConfiguration *)self _clientRecentFonts];
  [v4 encodeObject:v10 forKey:@"ClientRecentFontsCodingKey"];
}

- (UIFontPickerViewControllerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIFontPickerViewControllerConfiguration;
  id v5 = [(UIFontPickerViewControllerConfiguration *)&v14 init];
  if (v5)
  {
    -[UIFontPickerViewControllerConfiguration setIncludeFaces:](v5, "setIncludeFaces:", [v4 decodeBoolForKey:@"IncludesFaces"]);
    -[UIFontPickerViewControllerConfiguration setDisplayUsingSystemFont:](v5, "setDisplayUsingSystemFont:", [v4 decodeBoolForKey:@"DisplaySystemFont"]);
    -[UIFontPickerViewControllerConfiguration setFilteredTraits:](v5, "setFilteredTraits:", [v4 decodeInt32ForKey:@"FilteredTraits"]);
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AllowedLanguages"];
    [(UIFontPickerViewControllerConfiguration *)v5 set_allowedLanguages:v6];

    unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SerializedPredicate"];
    [(UIFontPickerViewControllerConfiguration *)v5 _setPredicateFromData:v7];

    -[UIFontPickerViewControllerConfiguration _setHideSearchBar:](v5, "_setHideSearchBar:", [v4 decodeBoolForKey:@"HideSearchBar"]);
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TintColor"];
    [(UIFontPickerViewControllerConfiguration *)v5 _setTintColor:v8];

    -[UIFontPickerViewControllerConfiguration set_includeDefaultFont:](v5, "set_includeDefaultFont:", [v4 decodeBoolForKey:@"IncludesDefaultFont"]);
    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FilterFamilyNameCodingKey"];
    [(UIFontPickerViewControllerConfiguration *)v5 set_filterFamilyName:v9];

    -[UIFontPickerViewControllerConfiguration set_showsSectionIndexBar:](v5, "set_showsSectionIndexBar:", [v4 decodeBoolForKey:@"ShowsSectionIndexBarCodingKey"]);
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClientFontContextEndpointCodingKey"];
    [(UIFontPickerViewControllerConfiguration *)v5 set_clientFontContextEndpoint:v10];

    if (qword_1EB262100 != -1) {
      dispatch_once(&qword_1EB262100, &__block_literal_global_411);
    }
    id v11 = (id)_MergedGlobals_1176;
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"ClientRecentFontsCodingKey"];
    [(UIFontPickerViewControllerConfiguration *)v5 _setClientRecentFonts:v12];
  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration includeFaces](self, "includeFaces"), @"IncludesFaces");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration displayUsingSystemFont](self, "displayUsingSystemFont"), @"DisplaySystemFont");
  objc_msgSend(v4, "encodeInt64:forKey:", -[UIFontPickerViewControllerConfiguration filteredTraits](self, "filteredTraits"), @"FilteredTraits");
  id v5 = [(UIFontPickerViewControllerConfiguration *)self _allowedLanguages];
  [v4 encodeCollection:v5 forKey:@"AllowedLanguages"];

  unint64_t v6 = [(UIFontPickerViewControllerConfiguration *)self _serializedPredicate];
  [v4 encodeObject:v6 forKey:@"SerializedPredicate"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _hideSearchBar](self, "_hideSearchBar"), @"HideSearchBar");
  unint64_t v7 = [(UIFontPickerViewControllerConfiguration *)self _tintColor];
  [v4 encodeObject:v7 forKey:@"TintColor"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"), @"IncludesDefaultFont");
  v8 = [(UIFontPickerViewControllerConfiguration *)self _filterFamilyName];
  [v4 encodeObject:v8 forKey:@"FilterFamilyNameCodingKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _showsSectionIndexBar](self, "_showsSectionIndexBar"), @"ShowsSectionIndexBarCodingKey");
  BOOL v9 = [(UIFontPickerViewControllerConfiguration *)self _clientFontContextEndpoint];
  [v4 encodeObject:v9 forKey:@"ClientFontContextEndpointCodingKey"];

  id v10 = [(UIFontPickerViewControllerConfiguration *)self _clientRecentFonts];
  [v4 encodeCollection:v10 forKey:@"ClientRecentFontsCodingKey"];
}

- (UIFontPickerViewControllerConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIFontPickerViewControllerConfiguration;
  id v5 = [(UIFontPickerViewControllerConfiguration *)&v15 init];
  if (v5)
  {
    -[UIFontPickerViewControllerConfiguration setIncludeFaces:](v5, "setIncludeFaces:", [v4 decodeBoolForKey:@"IncludesFaces"]);
    -[UIFontPickerViewControllerConfiguration setDisplayUsingSystemFont:](v5, "setDisplayUsingSystemFont:", [v4 decodeBoolForKey:@"DisplaySystemFont"]);
    -[UIFontPickerViewControllerConfiguration setFilteredTraits:](v5, "setFilteredTraits:", [v4 decodeInt64ForKey:@"FilteredTraits"]);
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"AllowedLanguages"];
    [(UIFontPickerViewControllerConfiguration *)v5 set_allowedLanguages:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SerializedPredicate"];
    [(UIFontPickerViewControllerConfiguration *)v5 _setPredicateFromData:v8];

    -[UIFontPickerViewControllerConfiguration _setHideSearchBar:](v5, "_setHideSearchBar:", [v4 decodeBoolForKey:@"HideSearchBar"]);
    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TintColor"];
    [(UIFontPickerViewControllerConfiguration *)v5 _setTintColor:v9];

    -[UIFontPickerViewControllerConfiguration set_includeDefaultFont:](v5, "set_includeDefaultFont:", [v4 decodeBoolForKey:@"IncludesDefaultFont"]);
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FilterFamilyNameCodingKey"];
    [(UIFontPickerViewControllerConfiguration *)v5 set_filterFamilyName:v10];

    -[UIFontPickerViewControllerConfiguration set_showsSectionIndexBar:](v5, "set_showsSectionIndexBar:", [v4 decodeBoolForKey:@"ShowsSectionIndexBarCodingKey"]);
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClientFontContextEndpointCodingKey"];
    [(UIFontPickerViewControllerConfiguration *)v5 set_clientFontContextEndpoint:v11];

    uint64_t v12 = objc_opt_class();
    int v13 = [v4 decodeCollectionOfClass:v12 containingClass:objc_opt_class() forKey:@"ClientRecentFontsCodingKey"];
    [(UIFontPickerViewControllerConfiguration *)v5 _setClientRecentFonts:v13];
  }
  return v5;
}

+ (NSPredicate)filterPredicateForFilteredLanguages:(NSArray *)filteredLanguages
{
  uint64_t v3 = filteredLanguages;
  if ([(NSArray *)v3 count])
  {
    id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %@ IN SELF", v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NSPredicate *)v4;
}

- (void)setFilteredLanguagesPredicate:(NSPredicate *)filteredLanguagesPredicate
{
  v8 = filteredLanguagesPredicate;
  objc_storeStrong((id *)&self->_filteredLanguagesPredicate, filteredLanguagesPredicate);
  if (v8)
  {
    id v5 = [MEMORY[0x1E4F1CA20] supportedLanguages];
    uint64_t v6 = [v5 allObjects];
    unint64_t v7 = [v6 filteredArrayUsingPredicate:v8];
    [(UIFontPickerViewControllerConfiguration *)self set_allowedLanguages:v7];
  }
  else
  {
    [(UIFontPickerViewControllerConfiguration *)self set_allowedLanguages:0];
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(UIFontPickerViewControllerConfiguration *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  v2 = [(UIFontPickerViewControllerConfiguration *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_includeFaces withName:@"includeFaces"];
  id v5 = (id)[v3 appendBool:self->_displayUsingSystemFont withName:@"displayUsingSystemFont"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(UIFontPickerViewControllerConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(UIFontPickerViewControllerConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  uint64_t v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__UIFontPickerViewControllerConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E52D9F98;
  id v7 = v6;
  id v12 = v7;
  int v13 = self;
  id v8 = (id)[v7 modifyBody:v11];
  id v9 = v7;

  return v9;
}

void __81__UIFontPickerViewControllerConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__UIFontPickerViewControllerConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __81__UIFontPickerViewControllerConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"includeFaces"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 9) withName:@"displayUsingSystemFont"];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = _UIFontDescriptorDescriptionForSymbolicTraits(*(_DWORD *)(*(void *)(a1 + 40) + 16));
  [v4 appendString:v5 withName:@"filteredTraits"];

  uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 24);
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v6 description];
    [v7 appendString:v8 withName:@"filteredLanguagesPredicate"];
  }
}

- (BOOL)includeFaces
{
  return self->_includeFaces;
}

- (void)setIncludeFaces:(BOOL)includeFaces
{
  self->_includeFaces = includeFaces;
}

- (BOOL)displayUsingSystemFont
{
  return self->_displayUsingSystemFont;
}

- (void)setDisplayUsingSystemFont:(BOOL)displayUsingSystemFont
{
  self->_displayUsingSystemFont = displayUsingSystemFont;
}

- (UIFontDescriptorSymbolicTraits)filteredTraits
{
  return self->_filteredTraits;
}

- (void)setFilteredTraits:(UIFontDescriptorSymbolicTraits)filteredTraits
{
  self->_filteredTraits = filteredTraits;
}

- (NSPredicate)filteredLanguagesPredicate
{
  return self->_filteredLanguagesPredicate;
}

- (NSArray)_allowedLanguages
{
  return self->__allowedLanguages;
}

- (void)set_allowedLanguages:(id)a3
{
}

- (id)_swiftPredicate
{
  return self->__swiftPredicate;
}

- (void)set_swiftPredicate:(id)a3
{
}

- (BOOL)_hideSearchBar
{
  return self->__hideSearchBar;
}

- (void)_setHideSearchBar:(BOOL)a3
{
  self->__hideSearchBar = a3;
}

- (UIColor)_tintColor
{
  return self->__tintColor;
}

- (void)_setTintColor:(id)a3
{
}

- (BOOL)_includeDefaultFont
{
  return self->__includeDefaultFont;
}

- (void)set_includeDefaultFont:(BOOL)a3
{
  self->__includeDefaultFont = a3;
}

- (NSString)_filterFamilyName
{
  return self->__filterFamilyName;
}

- (void)set_filterFamilyName:(id)a3
{
}

- (BOOL)_showsSectionIndexBar
{
  return self->__showsSectionIndexBar;
}

- (void)set_showsSectionIndexBar:(BOOL)a3
{
  self->__showsSectionIndexBar = a3;
}

- (NSXPCListenerEndpoint)_clientFontContextEndpoint
{
  return self->__clientFontContextEndpoint;
}

- (void)set_clientFontContextEndpoint:(id)a3
{
}

- (NSArray)_clientRecentFonts
{
  return self->__clientRecentFonts;
}

- (void)_setClientRecentFonts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clientRecentFonts, 0);
  objc_storeStrong((id *)&self->__clientFontContextEndpoint, 0);
  objc_storeStrong((id *)&self->__filterFamilyName, 0);
  objc_storeStrong((id *)&self->__tintColor, 0);
  objc_storeStrong(&self->__swiftPredicate, 0);
  objc_storeStrong((id *)&self->__allowedLanguages, 0);
  objc_storeStrong((id *)&self->_filteredLanguagesPredicate, 0);
}

@end