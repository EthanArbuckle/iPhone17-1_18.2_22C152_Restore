@interface SFDeviceRegulatoryAttributes
+ (NSCalendar)_calendar;
+ (NSDictionary)_yearCodeToStartDateLookup;
+ (NSISO8601DateFormatter)_dateFormatter;
+ (NSString)_weekCodeLookup;
+ (SFDeviceRegulatoryAttributes)currentDeviceAttributes;
+ (id)getRegulatoryAttributes;
+ (void)getRegulatoryAttributes;
- (NSDate)_resolvedManufacturingDate;
- (NSDate)_resolvedStartingWeek;
- (NSDate)manufacturingDate;
- (NSString)_resolvedCountryOfOrigin;
- (NSString)_resolvedIndiaBISNumber;
- (NSString)plantCode;
- (NSString)serialNumber;
- (SFDeviceRegulatoryAttributes)initWithRegulatoryAttributes:(id)a3 serialNumber:(id)a4;
- (UIImage)_resolvedRegulatoryImage;
- (UIImage)regulatoryImage;
- (unint64_t)monthOfManufacture;
- (unint64_t)weekOfManufacture;
- (unint64_t)yearForWeekOfManufacture;
- (unint64_t)yearOfManufacture;
- (void)_resolveCountryOfOrigin:(id)a3;
- (void)_resolveDeviceAttributes:(id)a3;
- (void)_resolveIndiaBISRegulatoryNumber:(id)a3;
- (void)_resolveManufacturingDateRelatedFields:(id)a3;
- (void)_resolveRegulatoryImage:(id)a3;
- (void)set_resolvedCountryOfOrigin:(id)a3;
- (void)set_resolvedIndiaBISNumber:(id)a3;
- (void)set_resolvedManufacturingDate:(id)a3;
- (void)set_resolvedRegulatoryImage:(id)a3;
- (void)set_resolvedStartingWeek:(id)a3;
@end

@implementation SFDeviceRegulatoryAttributes

- (SFDeviceRegulatoryAttributes)initWithRegulatoryAttributes:(id)a3 serialNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFDeviceRegulatoryAttributes;
  v8 = [(SFDeviceRegulatoryAttributes *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    serialNumber = v8->_serialNumber;
    v8->_serialNumber = (NSString *)v9;

    [(SFDeviceRegulatoryAttributes *)v8 _resolveDeviceAttributes:v6];
  }

  return v8;
}

+ (SFDeviceRegulatoryAttributes)currentDeviceAttributes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SFDeviceRegulatoryAttributes_currentDeviceAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentDeviceAttributes_onceToken != -1) {
    dispatch_once(&currentDeviceAttributes_onceToken, block);
  }
  v2 = (void *)currentDeviceAttributes__currentDeviceAttributes;
  return (SFDeviceRegulatoryAttributes *)v2;
}

void __55__SFDeviceRegulatoryAttributes_currentDeviceAttributes__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) getRegulatoryAttributes];
  v2 = (void *)MGCopyAnswer();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithRegulatoryAttributes:v5 serialNumber:v2];
  v4 = (void *)currentDeviceAttributes__currentDeviceAttributes;
  currentDeviceAttributes__currentDeviceAttributes = v3;
}

- (void)_resolveDeviceAttributes:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v11 = 0;
    id v6 = 0;
    objc_super v12 = 0;
    goto LABEL_17;
  }
  id v6 = [v4 objectForKeyedSubscript:@"RegulatoryInfo"];
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"RegulatoryInfo"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = (void *)MEMORY[0x263F08900];
      v10 = [v5 objectForKeyedSubscript:@"RegulatoryInfo"];
      id v21 = 0;
      id v6 = [v9 JSONObjectWithData:v10 options:0 error:&v21];
      id v11 = v21;

      goto LABEL_8;
    }
    id v6 = 0;
  }
  id v11 = 0;
LABEL_8:
  objc_super v12 = [v5 objectForKeyedSubscript:@"RegulatoryImages"];
  if (v12)
  {
    v13 = [v5 objectForKeyedSubscript:@"RegulatoryImages"];
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) == 0)
    {
      objc_super v12 = 0;
      if (!v11) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
    objc_super v12 = [v5 objectForKeyedSubscript:@"RegulatoryImages"];
  }
  if (!v11) {
    goto LABEL_17;
  }
LABEL_14:
  v15 = SFLogForCategory(3uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[SFDeviceRegulatoryAttributes _resolveDeviceAttributes:]();
  }

LABEL_17:
  [(SFDeviceRegulatoryAttributes *)self _resolveManufacturingDateRelatedFields:v6];
  [(SFDeviceRegulatoryAttributes *)self _resolveIndiaBISRegulatoryNumber:v6];
  [(SFDeviceRegulatoryAttributes *)self _resolveCountryOfOrigin:v6];
  v16 = [MEMORY[0x263F08AB0] processInfo];
  v17 = [v16 environment];
  v18 = [v17 objectForKeyedSubscript:@"XCTestBundlePath"];

  if (v18
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v18 containsString:@"SettingsFoundation"])
  {
    v19 = (UIImage *)objc_opt_new();
    resolvedRegulatoryImage = self->__resolvedRegulatoryImage;
    self->__resolvedRegulatoryImage = v19;
  }
  else
  {
    [(SFDeviceRegulatoryAttributes *)self _resolveRegulatoryImage:v12];
  }
}

- (void)_resolveManufacturingDateRelatedFields:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"manufacturingDate"];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 objectForKeyedSubscript:@"manufacturingDate"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = [v4 objectForKeyedSubscript:@"manufacturingDate"];
      v10 = +[SFDeviceRegulatoryAttributes _dateFormatter];
      id v11 = [v10 dateFromString:v9];

      resolvedManufacturingDate = self->__resolvedManufacturingDate;
      self->__resolvedManufacturingDate = v11;
      v13 = v11;

      char v14 = +[SFDeviceRegulatoryAttributes _calendar];
      self->_yearForWeekOfManufacture = [v14 component:4 fromDate:v13];

      v15 = +[SFDeviceRegulatoryAttributes _calendar];
      self->_yearOfManufacture = [v15 component:4 fromDate:v13];

      v16 = +[SFDeviceRegulatoryAttributes _calendar];
      self->_monthOfManufacture = [v16 component:8 fromDate:v13];

      v17 = +[SFDeviceRegulatoryAttributes _calendar];
      unint64_t v18 = [v17 component:0x2000 fromDate:v13];

      self->_weekOfManufacture = v18;
LABEL_12:

      goto LABEL_13;
    }
  }
  v19 = SFLogForCategory(3uLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[SFDeviceRegulatoryAttributes _resolveManufacturingDateRelatedFields:]();
  }

  v20 = [(SFDeviceRegulatoryAttributes *)self serialNumber];
  uint64_t v21 = [v20 length];

  if (v21 == 12)
  {
    v22 = [(SFDeviceRegulatoryAttributes *)self serialNumber];
    uint64_t v9 = objc_msgSend(v22, "substringWithRange:", 3, 1);

    v23 = [(SFDeviceRegulatoryAttributes *)self serialNumber];
    v24 = objc_msgSend(v23, "substringWithRange:", 4, 1);

    v25 = +[SFDeviceRegulatoryAttributes _yearCodeToStartDateLookup];
    v26 = [v25 objectForKeyedSubscript:v9];

    if (v26)
    {
      v27 = +[SFDeviceRegulatoryAttributes _yearCodeToStartDateLookup];
      v28 = [v27 objectForKeyedSubscript:v9];

      v29 = +[SFDeviceRegulatoryAttributes _weekCodeLookup];
      uint64_t v30 = [v29 rangeOfString:v24];
      uint64_t v32 = v31;

      if (v32 == 1)
      {
        v33 = +[SFDeviceRegulatoryAttributes _calendar];
        v34 = [v33 components:0x2000 fromDate:v28];

        objc_msgSend(v34, "setWeekOfYear:", objc_msgSend(v34, "weekOfYear") + v30);
        v35 = +[SFDeviceRegulatoryAttributes _calendar];
        v36 = [v35 dateByAddingUnit:0x2000 value:v30 toDate:v28 options:1];
        resolvedStartingWeek = self->__resolvedStartingWeek;
        self->__resolvedStartingWeek = v36;

        v38 = +[SFDeviceRegulatoryAttributes _calendar];
        v39 = [(SFDeviceRegulatoryAttributes *)self _resolvedStartingWeek];
        self->_yearForWeekOfManufacture = [v38 component:0x4000 fromDate:v39];

        v40 = +[SFDeviceRegulatoryAttributes _calendar];
        v41 = [(SFDeviceRegulatoryAttributes *)self _resolvedStartingWeek];
        self->_yearOfManufacture = [v40 component:4 fromDate:v41];

        v42 = +[SFDeviceRegulatoryAttributes _calendar];
        v43 = [(SFDeviceRegulatoryAttributes *)self _resolvedStartingWeek];
        self->_monthOfManufacture = [v42 component:8 fromDate:v43];

        v44 = +[SFDeviceRegulatoryAttributes _calendar];
        v45 = [(SFDeviceRegulatoryAttributes *)self _resolvedStartingWeek];
        self->_weekOfManufacture = [v44 component:0x2000 fromDate:v45];
      }
    }

    goto LABEL_12;
  }
LABEL_13:
}

- (void)_resolveIndiaBISRegulatoryNumber:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"elabel"];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 objectForKeyedSubscript:@"elabel"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = [v4 objectForKeyedSubscript:@"elabel"];
      if (v9)
      {
        v10 = v9;
        uint64_t v11 = [v9 objectForKeyedSubscript:@"bis"];
        if (v11
          && (objc_super v12 = (void *)v11,
              [v10 objectForKeyedSubscript:@"bis"],
              v13 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char v14 = objc_opt_isKindOfClass(),
              v13,
              v12,
              (v14 & 1) != 0))
        {
          v15 = [v10 objectForKeyedSubscript:@"bis"];
          uint64_t v16 = [v15 objectForKeyedSubscript:@"regulatory"];
          if (v16)
          {
            v17 = (void *)v16;
            unint64_t v18 = [v10 objectForKeyedSubscript:@"bis"];
            v19 = [v18 objectForKeyedSubscript:@"regulatory"];
            objc_opt_class();
            char v20 = objc_opt_isKindOfClass();

            if (v20)
            {
              uint64_t v21 = [v10 objectForKeyedSubscript:@"bis"];
              v22 = [v21 objectForKeyedSubscript:@"regulatory"];

              resolvedIndiaBISNumber = self->__resolvedIndiaBISNumber;
              self->__resolvedIndiaBISNumber = v22;

              goto LABEL_12;
            }
          }
          else
          {
          }
          uint64_t v40 = [v10 objectForKeyedSubscript:@"bis"];
          if (!v40) {
            goto LABEL_33;
          }
          v41 = (void *)v40;
          v42 = [v10 objectForKeyedSubscript:@"bis"];
          v43 = [v42 objectForKeyedSubscript:@"regulatory"];

          if (!v43)
          {
            uint64_t v32 = SFLogForCategory(3uLL);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              -[SFDeviceRegulatoryAttributes _resolveIndiaBISRegulatoryNumber:].cold.4();
            }
          }
          else
          {
LABEL_33:
            uint64_t v32 = SFLogForCategory(3uLL);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
              -[SFDeviceRegulatoryAttributes _resolveIndiaBISRegulatoryNumber:]();
            }
          }
        }
        else
        {
          uint64_t v32 = SFLogForCategory(3uLL);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            -[SFDeviceRegulatoryAttributes _resolveIndiaBISRegulatoryNumber:]();
          }
        }

        goto LABEL_12;
      }
    }
  }
  v24 = SFLogForCategory(3uLL);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[SFDeviceRegulatoryAttributes _resolveIndiaBISRegulatoryNumber:]();
  }

  v10 = 0;
LABEL_12:
  p_resolvedIndiaBISNumber = &self->__resolvedIndiaBISNumber;
  if (self->__resolvedIndiaBISNumber) {
    goto LABEL_26;
  }
  v26 = [(SFDeviceRegulatoryAttributes *)self plantCode];

  if (v26)
  {
    v27 = (void *)MGCopyAnswer();
    v28 = NSDictionary;
    v29 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
    uint64_t v30 = NSString;
    if (v27)
    {
      uint64_t v31 = [v27 lowercaseString];
    }
    else
    {
      uint64_t v31 = &stru_26C60E030;
    }
    v33 = [v30 stringWithFormat:@"IndiaBISMappings~%@.plist", v31];
    v34 = [v29 stringByAppendingPathComponent:v33];
    v35 = [v28 dictionaryWithContentsOfFile:v34];

    if (v27) {
    v36 = [(SFDeviceRegulatoryAttributes *)self plantCode];
    }
    v37 = [v35 objectForKey:v36];

    if (v37) {
      objc_storeStrong((id *)p_resolvedIndiaBISNumber, v37);
    }
  }
  if (*p_resolvedIndiaBISNumber)
  {
LABEL_26:
    v38 = SFLogForCategory(3uLL);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *p_resolvedIndiaBISNumber;
      *(_DWORD *)buf = 136315394;
      v45 = "-[SFDeviceRegulatoryAttributes _resolveIndiaBISRegulatoryNumber:]";
      __int16 v46 = 2112;
      v47 = v39;
      _os_log_impl(&dword_2154D9000, v38, OS_LOG_TYPE_DEFAULT, "%{Public}s: BIS e-label: '%{Public}@'", buf, 0x16u);
    }
  }
}

- (void)_resolveCountryOfOrigin:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"countryOfOrigin"];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 objectForKeyedSubscript:@"countryOfOrigin"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = [v4 objectForKeyedSubscript:@"countryOfOrigin"];
      if (v9)
      {
        v10 = v9;
        uint64_t v11 = [v9 objectForKeyedSubscript:@"assembledIn"];
        if (v11
          && (objc_super v12 = (void *)v11,
              [v10 objectForKeyedSubscript:@"assembledIn"],
              v13 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char v14 = objc_opt_isKindOfClass(),
              v13,
              v12,
              (v14 & 1) != 0))
        {
          v15 = [v10 objectForKeyedSubscript:@"assembledIn"];
          SF_LocalizedStringForCountryOfOriginAssembledIn(v15);
          uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v20 = [v10 objectForKeyedSubscript:@"madeIn"];
          if (!v20
            || (uint64_t v21 = (void *)v20,
                [v10 objectForKeyedSubscript:@"madeIn"],
                v22 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                char v23 = objc_opt_isKindOfClass(),
                v22,
                v21,
                (v23 & 1) == 0))
          {
            v15 = SFLogForCategory(3uLL);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[SFDeviceRegulatoryAttributes _resolveCountryOfOrigin:]();
            }
            goto LABEL_21;
          }
          v15 = [v10 objectForKeyedSubscript:@"madeIn"];
          SF_LocalizedStringForCountryOfOriginMadeIn(v15);
          uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        resolvedCountryOfOrigin = self->__resolvedCountryOfOrigin;
        self->__resolvedCountryOfOrigin = v16;

LABEL_21:
        goto LABEL_10;
      }
    }
  }
  v17 = SFLogForCategory(3uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[SFDeviceRegulatoryAttributes _resolveCountryOfOrigin:]();
  }

  v10 = 0;
LABEL_10:
  if (self->__resolvedCountryOfOrigin)
  {
    unint64_t v18 = SFLogForCategory(3uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->__resolvedCountryOfOrigin;
      int v25 = 136315394;
      v26 = "-[SFDeviceRegulatoryAttributes _resolveCountryOfOrigin:]";
      __int16 v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_2154D9000, v18, OS_LOG_TYPE_DEFAULT, "%{Public}s: Country of Origin e-label: '%{Public}@'", (uint8_t *)&v25, 0x16u);
    }
  }
}

- (void)_resolveRegulatoryImage:(id)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v31 = SFLogForCategory(3uLL);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:](v31);
    }

    goto LABEL_61;
  }
  uint64_t v5 = (void *)MGCopyAnswer();
  id v6 = (void *)MGCopyAnswer();
  v59 = [v5 stringByAppendingFormat:@"-%@", v6];
  uint64_t v7 = [v5 length];
  v8 = SFLogForCategory(3uLL);
  uint64_t v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:](v9);
    }
    goto LABEL_59;
  }
  v56 = self;
  v57 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v90 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
    __int16 v91 = 2112;
    v92 = v59;
    _os_log_impl(&dword_2154D9000, v9, OS_LOG_TYPE_DEFAULT, "%{Public}s: Looking for Lockdown Regulatory Image '%@'", buf, 0x16u);
  }

  v10 = [MEMORY[0x263F1C920] mainScreen];
  [v10 scale];
  double v12 = v11;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v58 = v4;
  id obj = v4;
  uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v88 count:16];
  char v14 = v59;
  if (!v13)
  {
LABEL_35:

    self = v56;
    id v6 = v57;
    id v4 = v58;
    goto LABEL_57;
  }
  uint64_t v15 = v13;
  uint64_t v16 = *(void *)v63;
  v60 = v5;
LABEL_7:
  uint64_t v17 = 0;
  while (1)
  {
    if (*(void *)v63 != v16) {
      objc_enumerationMutation(obj);
    }
    unint64_t v18 = *(void **)(*((void *)&v62 + 1) + 8 * v17);
    v19 = [v18 objectForKey:@"ImageId"];
    uint64_t v20 = SFLogForCategory(3uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
      __int16 v91 = 2112;
      v92 = v19;
      _os_log_impl(&dword_2154D9000, v20, OS_LOG_TYPE_DEFAULT, "%{Public}s: Candidate Lockdown Regulatory Image '%@'", buf, 0x16u);
    }

    if ([v5 caseInsensitiveCompare:v19] && objc_msgSend(v14, "caseInsensitiveCompare:", v19)) {
      goto LABEL_33;
    }
    CFDataRef v21 = [v18 objectForKey:@"ImageData"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v29 = SFLogForCategory(3uLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        [(SFDeviceRegulatoryAttributes *)v82 _resolveRegulatoryImage:v29];
      }

      goto LABEL_32;
    }
    v22 = CGImageSourceCreateWithData(v21, 0);
    if (!v22)
    {
      uint64_t v30 = SFLogForCategory(3uLL);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        [(SFDeviceRegulatoryAttributes *)v84 _resolveRegulatoryImage:v30];
      }

      goto LABEL_31;
    }
    char v23 = v22;
    size_t Count = CGImageSourceGetCount(v22);
    if (Count) {
      break;
    }
    v28 = SFLogForCategory(3uLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
      __int16 v91 = 2112;
      v92 = v19;
      _os_log_error_impl(&dword_2154D9000, v28, OS_LOG_TYPE_ERROR, "%{Public}s: Empty Lockdown Regulatory Image '%{Public}@'", buf, 0x16u);
    }
    char v14 = v59;
LABEL_30:

    CFRelease(v23);
LABEL_31:
    uint64_t v5 = v60;
LABEL_32:

LABEL_33:
    if (v15 == ++v17)
    {
      uint64_t v15 = [obj countByEnumeratingWithState:&v62 objects:v88 count:16];
      if (v15) {
        goto LABEL_7;
      }
      goto LABEL_35;
    }
  }
  size_t v25 = Count;
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v23, 0, 0);
  __int16 v27 = ImageAtIndex;
  if (v25 != 2)
  {
    char v14 = v59;
    if (ImageAtIndex)
    {
      v45 = (UIImage *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:ImageAtIndex scale:0 orientation:v12];
      CGImageRelease(v27);
      CFRelease(v23);
      v34 = SFLogForCategory(3uLL);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v90 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
        __int16 v91 = 2112;
        v92 = v19;
        _os_log_impl(&dword_2154D9000, v34, OS_LOG_TYPE_DEFAULT, "%{Public}s: Matched Lockdown Regulatory Image '%@'", buf, 0x16u);
      }
LABEL_48:
      self = v56;
      id v6 = v57;
      id v4 = v58;
      goto LABEL_56;
    }
    v28 = SFLogForCategory(3uLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
      __int16 v91 = 2112;
      v92 = v19;
      _os_log_error_impl(&dword_2154D9000, v28, OS_LOG_TYPE_ERROR, "%{Public}s: Failed decoding Lockdown Regulatory Image '%{Public}@'", buf, 0x16u);
    }
    goto LABEL_30;
  }
  CGImageRef v32 = CGImageSourceCreateImageAtIndex(v23, 1uLL, 0);
  v33 = v32;
  if (v27 && v32)
  {
    v34 = [objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v27 scale:0 orientation:v12];
    v55 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v33 scale:0 orientation:v12];
    v54 = [MEMORY[0x263F1CB00] currentTraitCollection];
    v35 = [MEMORY[0x263F1CB00] traitCollectionWithDisplayScale:v12];
    image = v33;
    id v36 = objc_alloc_init(MEMORY[0x263F1C6B8]);
    v37 = (void *)MEMORY[0x263F1CB00];
    v87[0] = v35;
    v38 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
    v87[1] = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:2];
    uint64_t v40 = [v37 traitCollectionWithTraitsFromCollections:v39];
    [v36 registerImage:v34 withTraitCollection:v40];

    v41 = (void *)MEMORY[0x263F1CB00];
    v86[0] = v35;
    v42 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
    v86[1] = v42;
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:2];
    v44 = [v41 traitCollectionWithTraitsFromCollections:v43];
    [v36 registerImage:v55 withTraitCollection:v44];

    v45 = [v36 imageWithTraitCollection:v54];
    CGImageRelease(v27);
    CGImageRelease(image);
    CFRelease(v23);
    __int16 v46 = SFLogForCategory(3uLL);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
      __int16 v91 = 2112;
      v92 = v19;
      _os_log_impl(&dword_2154D9000, v46, OS_LOG_TYPE_DEFAULT, "%{Public}s: Matched style-sensitive Lockdown Regulatory Image '%{Public}@'", buf, 0x16u);
    }

    goto LABEL_48;
  }
  if (v27) {
    CGImageRelease(v27);
  }
  id v6 = v57;
  id v4 = v58;
  if (v33) {
    CGImageRelease(v33);
  }
  CFRelease(v23);
  v34 = SFLogForCategory(3uLL);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    -[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:].cold.4();
  }
  v45 = 0;
  self = v56;
LABEL_56:
  uint64_t v5 = v60;

  if (v45) {
    goto LABEL_60;
  }
LABEL_57:
  uint64_t v9 = SFLogForCategory(3uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v90 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
    __int16 v91 = 2112;
    v92 = v59;
    _os_log_impl(&dword_2154D9000, v9, OS_LOG_TYPE_DEFAULT, "%{Public}s: No matching Lockdown Regulatory Image for '%{Public}@'", buf, 0x16u);
  }
LABEL_59:

  v45 = 0;
LABEL_60:

  if (!v45)
  {
LABEL_61:
    v47 = (void *)MGCopyAnswer();
    uint64_t v48 = (void *)MGCopyAnswer();
    _SFBuiltInRegulatoryImage(v47, v48);
    v45 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  int v81 = 533419158;
  long long v80 = xmmword_2154EC9E0;
  int v79 = 1106979518;
  long long v78 = xmmword_2154EC9F4;
  int v77 = -1820426635;
  long long v76 = xmmword_2154ECA08;
  int v75 = -937652876;
  long long v74 = xmmword_2154ECA1C;
  int v73 = -609570151;
  long long v72 = xmmword_2154ECA30;
  int v71 = -874769875;
  long long v70 = xmmword_2154ECA44;
  int v69 = 1874287171;
  long long v68 = xmmword_2154ECA58;
  int v67 = -781324731;
  long long v66 = xmmword_2154ECA6C;
  if (MGIsDeviceOneOfType())
  {
    v49 = (void *)MGCopyAnswer();
    v50 = (void *)MGCopyAnswer();
    uint64_t v51 = _SFBuiltInRegulatoryImage(v49, v50);

    v45 = (UIImage *)v51;
  }
  resolvedRegulatoryImage = self->__resolvedRegulatoryImage;
  self->__resolvedRegulatoryImage = v45;
}

+ (id)getRegulatoryAttributes
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v19 = 1;
  uint64_t v2 = container_system_group_path_for_identifier();
  if (!v2)
  {
    id v4 = SFLogForCategory(3uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[SFDeviceRegulatoryAttributes getRegulatoryAttributes];
    }
    goto LABEL_13;
  }
  uint64_t v3 = (char *)v2;
  id v4 = [NSString stringWithUTF8String:v2];
  int v5 = chmod(v3, 0x1FFu);
  free(v3);
  if (v5 && *__error() != 1)
  {
    id v6 = SFLogForCategory(3uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SFDeviceRegulatoryAttributes getRegulatoryAttributes](v6);
    }
  }
  if (!v4)
  {
LABEL_13:
    double v11 = 0;
    goto LABEL_14;
  }
  uint64_t v7 = [v4 stringByAppendingPathComponent:@"Library"];
  v8 = [v7 stringByAppendingPathComponent:@"RegulatoryImages"];
  uint64_t v9 = [v8 stringByAppendingPathComponent:@"regulatory_images.plist"];

  v10 = SFLogForCategory(3uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    CFDataRef v21 = "+[SFDeviceRegulatoryAttributes getRegulatoryAttributes]";
    __int16 v22 = 2112;
    char v23 = v9;
    _os_log_impl(&dword_2154D9000, v10, OS_LOG_TYPE_DEFAULT, "%{Public}s: Lockdown Regulatory Images at '%@'", buf, 0x16u);
  }

  double v11 = [NSDictionary dictionaryWithContentsOfFile:v9];

LABEL_14:
  return v11;
}

- (UIImage)regulatoryImage
{
  uint64_t v3 = [(SFDeviceRegulatoryAttributes *)self _resolvedRegulatoryImage];

  if (v3)
  {
    id v4 = [(SFDeviceRegulatoryAttributes *)self _resolvedRegulatoryImage];
  }
  else
  {
    id v4 = objc_opt_new();
  }
  return (UIImage *)v4;
}

- (NSString)plantCode
{
  uint64_t v3 = [(SFDeviceRegulatoryAttributes *)self serialNumber];
  uint64_t v4 = [v3 length];

  if (v4 == 12)
  {
    int v5 = [(SFDeviceRegulatoryAttributes *)self serialNumber];
    id v6 = objc_msgSend(v5, "substringWithRange:", 0, 3);
  }
  else
  {
    id v6 = 0;
  }
  return (NSString *)v6;
}

+ (NSString)_weekCodeLookup
{
  if (_weekCodeLookup_onceToken != -1) {
    dispatch_once(&_weekCodeLookup_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)_weekCodeLookup___weekCodeLookup;
  return (NSString *)v2;
}

void __47__SFDeviceRegulatoryAttributes__weekCodeLookup__block_invoke()
{
  v0 = (void *)_weekCodeLookup___weekCodeLookup;
  _weekCodeLookup___weekCodeLookup = @"123456789CDFGHJKLMNPQRTVWXY";
}

+ (NSCalendar)_calendar
{
  if (_calendar_onceToken != -1) {
    dispatch_once(&_calendar_onceToken, &__block_literal_global_90);
  }
  uint64_t v2 = (void *)_calendar___calendarForLookup;
  return (NSCalendar *)v2;
}

uint64_t __41__SFDeviceRegulatoryAttributes__calendar__block_invoke()
{
  _calendar___calendarForLookup = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  return MEMORY[0x270F9A758]();
}

+ (NSISO8601DateFormatter)_dateFormatter
{
  if (_dateFormatter_onceToken != -1) {
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_93);
  }
  uint64_t v2 = (void *)_dateFormatter___dateFormatterForISO8601;
  return (NSISO8601DateFormatter *)v2;
}

uint64_t __46__SFDeviceRegulatoryAttributes__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F088C0]);
  v1 = (void *)_dateFormatter___dateFormatterForISO8601;
  _dateFormatter___dateFormatterForISO8601 = (uint64_t)v0;

  uint64_t v2 = (void *)_dateFormatter___dateFormatterForISO8601;
  return [v2 setFormatOptions:1907];
}

+ (NSDictionary)_yearCodeToStartDateLookup
{
  if (_yearCodeToStartDateLookup_onceToken != -1) {
    dispatch_once(&_yearCodeToStartDateLookup_onceToken, &__block_literal_global_96);
  }
  uint64_t v2 = (void *)_yearCodeToStartDateLookup___yearCodeToStartDateLookup;
  return (NSDictionary *)v2;
}

void __58__SFDeviceRegulatoryAttributes__yearCodeToStartDateLookup__block_invoke()
{
  v24[20] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  [v0 setDateFormat:@"MM/dd/yyyy"];
  v23[0] = @"P";
  __int16 v22 = [v0 dateFromString:@"12/28/2014"];
  v24[0] = v22;
  v23[1] = @"Q";
  CFDataRef v21 = [v0 dateFromString:@"06/28/2015"];
  v24[1] = v21;
  v23[2] = @"R";
  uint64_t v20 = [v0 dateFromString:@"12/27/2015"];
  v24[2] = v20;
  v23[3] = @"S";
  uint64_t v19 = [v0 dateFromString:@"06/26/2016"];
  v24[3] = v19;
  v23[4] = @"T";
  unint64_t v18 = [v0 dateFromString:@"01/01/2017"];
  v24[4] = v18;
  v23[5] = @"V";
  uint64_t v17 = [v0 dateFromString:@"07/02/2017"];
  v24[5] = v17;
  v23[6] = @"W";
  uint64_t v16 = [v0 dateFromString:@"12/31/2017"];
  v24[6] = v16;
  v23[7] = @"X";
  uint64_t v15 = [v0 dateFromString:@"07/01/2018"];
  v24[7] = v15;
  v23[8] = @"Y";
  uint64_t v14 = [v0 dateFromString:@"12/30/2018"];
  v24[8] = v14;
  v23[9] = @"Z";
  uint64_t v13 = [v0 dateFromString:@"06/30/2019"];
  v24[9] = v13;
  v23[10] = @"C";
  uint64_t v12 = [v0 dateFromString:@"12/29/2019"];
  v24[10] = v12;
  v23[11] = @"D";
  v1 = [v0 dateFromString:@"06/28/2020"];
  v24[11] = v1;
  v23[12] = @"F";
  uint64_t v2 = [v0 dateFromString:@"12/27/2020"];
  v24[12] = v2;
  v23[13] = @"G";
  uint64_t v3 = [v0 dateFromString:@"06/27/2021"];
  v24[13] = v3;
  v23[14] = @"H";
  uint64_t v4 = [v0 dateFromString:@"12/26/2021"];
  v24[14] = v4;
  v23[15] = @"J";
  int v5 = [v0 dateFromString:@"06/26/2022"];
  v24[15] = v5;
  v23[16] = @"K";
  id v6 = [v0 dateFromString:@"01/01/2023"];
  v24[16] = v6;
  v23[17] = @"L";
  uint64_t v7 = [v0 dateFromString:@"07/02/2023"];
  v24[17] = v7;
  v23[18] = @"M";
  v8 = [v0 dateFromString:@"12/31/2023"];
  v24[18] = v8;
  v23[19] = @"N";
  uint64_t v9 = [v0 dateFromString:@"06/30/2024"];
  v24[19] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:20];
  double v11 = (void *)_yearCodeToStartDateLookup___yearCodeToStartDateLookup;
  _yearCodeToStartDateLookup___yearCodeToStartDateLookup = v10;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSDate)manufacturingDate
{
  return self->_manufacturingDate;
}

- (unint64_t)yearForWeekOfManufacture
{
  return self->_yearForWeekOfManufacture;
}

- (unint64_t)yearOfManufacture
{
  return self->_yearOfManufacture;
}

- (unint64_t)monthOfManufacture
{
  return self->_monthOfManufacture;
}

- (unint64_t)weekOfManufacture
{
  return self->_weekOfManufacture;
}

- (NSDate)_resolvedManufacturingDate
{
  return self->__resolvedManufacturingDate;
}

- (void)set_resolvedManufacturingDate:(id)a3
{
}

- (NSString)_resolvedIndiaBISNumber
{
  return self->__resolvedIndiaBISNumber;
}

- (void)set_resolvedIndiaBISNumber:(id)a3
{
}

- (NSString)_resolvedCountryOfOrigin
{
  return self->__resolvedCountryOfOrigin;
}

- (void)set_resolvedCountryOfOrigin:(id)a3
{
}

- (UIImage)_resolvedRegulatoryImage
{
  return self->__resolvedRegulatoryImage;
}

- (void)set_resolvedRegulatoryImage:(id)a3
{
}

- (NSDate)_resolvedStartingWeek
{
  return self->__resolvedStartingWeek;
}

- (void)set_resolvedStartingWeek:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resolvedStartingWeek, 0);
  objc_storeStrong((id *)&self->__resolvedRegulatoryImage, 0);
  objc_storeStrong((id *)&self->__resolvedCountryOfOrigin, 0);
  objc_storeStrong((id *)&self->__resolvedIndiaBISNumber, 0);
  objc_storeStrong((id *)&self->__resolvedManufacturingDate, 0);
  objc_storeStrong((id *)&self->_manufacturingDate, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

- (void)_resolveDeviceAttributes:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2154D9000, v0, v1, "%{Public}s: Invalid RegulatoryInfo: '%{Public}@'", v2, v3, v4, v5, 2u);
}

- (void)_resolveManufacturingDateRelatedFields:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2154D9000, v0, v1, "%{Public}s: Empty manufacturingDate entry: '%@'", v2, v3, v4, v5, 2u);
}

- (void)_resolveIndiaBISRegulatoryNumber:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2154D9000, v0, v1, "%{Public}s: Empty elabel entry: '%@'", v2, v3, v4, v5, 2u);
}

- (void)_resolveIndiaBISRegulatoryNumber:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2154D9000, v0, v1, "%{Public}s: Empty BIS entry: '%@'", v2, v3, v4, v5, 2u);
}

- (void)_resolveIndiaBISRegulatoryNumber:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2154D9000, v0, v1, "%{Public}s: Empty BIS Regulatory entry: '%@'", v2, v3, v4, v5, 2u);
}

- (void)_resolveIndiaBISRegulatoryNumber:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2154D9000, v0, v1, "%{Public}s: Invalid BIS format: '%{Public}@'", v2, v3, v4, v5, 2u);
}

- (void)_resolveCountryOfOrigin:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2154D9000, v0, v1, "%{Public}s: No Country of Origin entry: '%@'", v2, v3, v4, v5, 2u);
}

- (void)_resolveCountryOfOrigin:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2154D9000, v0, v1, "%{Public}s: Invalid Country of Origin format: '%{Public}@'", v2, v3, v4, v5, 2u);
}

- (void)_resolveRegulatoryImage:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
  _os_log_debug_impl(&dword_2154D9000, log, OS_LOG_TYPE_DEBUG, "%{Public}s: No Lockdown Regulatory Images in container", (uint8_t *)&v1, 0xCu);
}

- (void)_resolveRegulatoryImage:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
  _os_log_error_impl(&dword_2154D9000, log, OS_LOG_TYPE_ERROR, "%{Public}s: No Lockdown Regulatory Image device model", (uint8_t *)&v1, 0xCu);
}

- (void)_resolveRegulatoryImage:(os_log_t)log .cold.3(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
  _os_log_error_impl(&dword_2154D9000, log, OS_LOG_TYPE_ERROR, "%{Public}s: No Lockdown Regulatory Image source", buf, 0xCu);
}

- (void)_resolveRegulatoryImage:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2154D9000, v0, v1, "%{Public}s: Failed decoding style-sensitive Lockdown Regulatory Image '%{Public}@'", v2, v3, v4, v5, 2u);
}

- (void)_resolveRegulatoryImage:(os_log_t)log .cold.5(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[SFDeviceRegulatoryAttributes _resolveRegulatoryImage:]";
  _os_log_error_impl(&dword_2154D9000, log, OS_LOG_TYPE_ERROR, "%{Public}s: Lockdown Regulatory Image not data", buf, 0xCu);
}

+ (void)getRegulatoryAttributes
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  int v3 = 136315394;
  uint64_t v4 = "+[SFDeviceRegulatoryAttributes getRegulatoryAttributes]";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_2154D9000, a1, OS_LOG_TYPE_ERROR, "%{Public}s: Failed to set permissions on Regulatory Images group path, errno %i", (uint8_t *)&v3, 0x12u);
}

@end