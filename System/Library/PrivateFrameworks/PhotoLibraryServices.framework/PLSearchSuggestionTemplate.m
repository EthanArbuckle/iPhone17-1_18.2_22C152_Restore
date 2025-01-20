@interface PLSearchSuggestionTemplate
+ (BOOL)supportsSecureCoding;
- (BOOL)isDateOnlyTemplate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMeTemplate;
- (NSCalendar)calendar;
- (NSDate)todayDate;
- (NSString)identifier;
- (NSString)suggestionTemplateKey;
- (PLSearchSuggestionTemplate)initWithCoder:(id)a3;
- (PLSearchSuggestionTemplate)initWithSuggestionTemplateKey:(id)a3 firstIndexCategory:(unint64_t)a4 secondIndexCategory:(unint64_t)a5 templateType:(unint64_t)a6 templateContentType:(unint64_t)a7 templateDateType:(unint64_t)a8 styleType:(unint64_t)a9 identifier:(id)a10 todayDate:(id)a11 locale:(id)a12;
- (PSIDateFilter)dateFilter;
- (id)_initWithSuggestionTemplateKey:(id)a3 firstIndexCategory:(unint64_t)a4 secondIndexCategory:(unint64_t)a5 templateType:(unint64_t)a6 templateContentType:(unint64_t)a7 templateDateType:(unint64_t)a8 styleType:(unint64_t)a9 identifier:(id)a10 todayDate:(id)a11 locale:(id)a12;
- (id)description;
- (id)initForTestingWithSuggestionTemplateKey:(id)a3 firstIndexCategory:(unint64_t)a4 secondIndexCategory:(unint64_t)a5 templateType:(unint64_t)a6 templateContentType:(unint64_t)a7 templateDateType:(unint64_t)a8 styleType:(unint64_t)a9 identifier:(id)a10 todayDate:(id)a11 locale:(id)a12;
- (unint64_t)firstIndexCategory;
- (unint64_t)hash;
- (unint64_t)localeSupportType;
- (unint64_t)secondIndexCategory;
- (unint64_t)templateContentType;
- (unint64_t)templateDateType;
- (unint64_t)templateStyleType;
- (unint64_t)templateType;
- (void)encodeWithCoder:(id)a3;
- (void)setDateFilter:(id)a3;
@end

@implementation PLSearchSuggestionTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PLSearchSuggestionTemplate)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionTemplatePropertyKey"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionTemplateFirstIndexCategory"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionTemplateSecondIndexCategory"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionTemplateTemplateType"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionTemplateTemplateContentType"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionTemplateDateType"];
  uint64_t v14 = [v13 unsignedIntegerValue];

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionTemplateStyleType"];
  uint64_t v16 = [v15 unsignedIntegerValue];

  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"PLSearchSuggestionTemplateIdentifier"];

  v18 = [MEMORY[0x1E4F1C9C8] date];
  v19 = [MEMORY[0x1E4F1CA20] currentLocale];
  v20 = [(PLSearchSuggestionTemplate *)self initWithSuggestionTemplateKey:v4 firstIndexCategory:v6 secondIndexCategory:v8 templateType:v10 templateContentType:v12 templateDateType:v14 styleType:v16 identifier:v17 todayDate:v18 locale:v19];

  return v20;
}

- (PLSearchSuggestionTemplate)initWithSuggestionTemplateKey:(id)a3 firstIndexCategory:(unint64_t)a4 secondIndexCategory:(unint64_t)a5 templateType:(unint64_t)a6 templateContentType:(unint64_t)a7 templateDateType:(unint64_t)a8 styleType:(unint64_t)a9 identifier:(id)a10 todayDate:(id)a11 locale:(id)a12
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  if (!v19)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v23 = unint64_t v22 = a8;
    [v23 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplate.m", 34, @"Invalid parameter not satisfying: %@", @"todayDate" object file lineNumber description];

    a8 = v22;
  }
  if (v20)
  {
    if (a9)
    {
LABEL_5:
      self = (PLSearchSuggestionTemplate *)[(PLSearchSuggestionTemplate *)self _initWithSuggestionTemplateKey:v17 firstIndexCategory:a4 secondIndexCategory:a5 templateType:a6 templateContentType:a7 templateDateType:a8 styleType:a9 identifier:v18 todayDate:v19 locale:v20];
      v21 = self;
      goto LABEL_14;
    }
  }
  else
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v24 = unint64_t v29 = a8;
    [v24 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplate.m", 35, @"Invalid parameter not satisfying: %@", @"locale" object file lineNumber description];

    a8 = v29;
    if (a9) {
      goto LABEL_5;
    }
  }
  unint64_t v30 = a8;
  if (!v17)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplate.m", 39, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  v25 = PLServicesLocalizedFrameworkString();
  if ([v25 length] && !objc_msgSend(v25, "isEqualToString:", v17))
  {

    a8 = v30;
    goto LABEL_5;
  }
  v26 = PLSearchBackendInitialSuggestionsGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v17;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_INFO, "Template for key %@ is not available in the current locale", buf, 0xCu);
  }

  v21 = 0;
LABEL_14:

  return v21;
}

- (id)_initWithSuggestionTemplateKey:(id)a3 firstIndexCategory:(unint64_t)a4 secondIndexCategory:(unint64_t)a5 templateType:(unint64_t)a6 templateContentType:(unint64_t)a7 templateDateType:(unint64_t)a8 styleType:(unint64_t)a9 identifier:(id)a10 todayDate:(id)a11 locale:(id)a12
{
  id v16 = a3;
  id v17 = a10;
  id v37 = a11;
  id v18 = a12;
  if (!a4 && (a5 || !a8))
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplate.m", 56, @"Invalid parameter not satisfying: %@", @"secondIndexCategory == PLSearchIndexCategoryNone && templateDateType != PLSearchSuggestionDateTemplateCategoryTypeNone" object file lineNumber description];
  }
  if (a5 | a4 | a8)
  {
    BOOL v19 = a4 != 0;
    if (a4 && a5 && a8)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplate.m", 64, @"Invalid parameter not satisfying: %@", @"templateDateType == PLSearchSuggestionDateTemplateCategoryTypeNone" object file lineNumber description];

      [v17 length];
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplate.m", 60, @"Invalid parameter not satisfying: %@", @"firstIndexCategory != PLSearchIndexCategoryNone || templateDateType != PLSearchSuggestionDateTemplateCategoryTypeNone" object file lineNumber description];

    BOOL v19 = a4 != 0;
  }
  uint64_t v20 = [v17 length];
  if (!v19 && v20)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplate.m", 68, @"Invalid parameter not satisfying: %@", @"firstIndexCategory != PLSearchIndexCategoryNone" object file lineNumber description];
  }
LABEL_11:
  v38.receiver = self;
  v38.super_class = (Class)PLSearchSuggestionTemplate;
  v21 = [(PLSearchSuggestionTemplate *)&v38 init];
  unint64_t v22 = v21;
  if (v21)
  {
    v21->_templateStyleType = a9;
    uint64_t v23 = [v16 copy];
    suggestionTemplateKey = v22->_suggestionTemplateKey;
    v22->_suggestionTemplateKey = (NSString *)v23;

    v22->_firstIndexCategory = a4;
    v22->_secondIndexCategory = a5;
    v22->_templateDateType = a8;
    v22->_templateType = a6;
    v22->_templateContentType = a7;
    objc_storeStrong((id *)&v22->_identifier, a10);
    v22->_localeSupportType = +[PLSearchSuggestionTemplateProvider localeSupportTypeForTemplateWithKey:v16 locale:v18];
    v25 = (void *)MEMORY[0x1E4F1C9A8];
    v26 = [v18 calendarIdentifier];
    uint64_t v27 = [v25 calendarWithIdentifier:v26];
    calendar = v22->_calendar;
    v22->_calendar = (NSCalendar *)v27;

    objc_storeStrong((id *)&v22->_todayDate, a11);
  }

  return v22;
}

- (unint64_t)templateContentType
{
  return self->_templateContentType;
}

- (NSString)suggestionTemplateKey
{
  return self->_suggestionTemplateKey;
}

- (unint64_t)secondIndexCategory
{
  return self->_secondIndexCategory;
}

- (BOOL)isDateOnlyTemplate
{
  char v3 = [(PLSearchSuggestionTemplate *)self templateType];
  unint64_t v4 = [(PLSearchSuggestionTemplate *)self templateType] & 2 | v3 & 1;
  unint64_t v5 = [(PLSearchSuggestionTemplate *)self templateDateType];
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  return !v6;
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)firstIndexCategory
{
  return self->_firstIndexCategory;
}

- (unint64_t)templateDateType
{
  return self->_templateDateType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dateFilter, 0);
  objc_storeStrong((id *)&self->_suggestionTemplateKey, 0);
}

- (NSDate)todayDate
{
  return self->_todayDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (unint64_t)localeSupportType
{
  return self->_localeSupportType;
}

- (unint64_t)templateStyleType
{
  return self->_templateStyleType;
}

- (void)setDateFilter:(id)a3
{
}

- (id)initForTestingWithSuggestionTemplateKey:(id)a3 firstIndexCategory:(unint64_t)a4 secondIndexCategory:(unint64_t)a5 templateType:(unint64_t)a6 templateContentType:(unint64_t)a7 templateDateType:(unint64_t)a8 styleType:(unint64_t)a9 identifier:(id)a10 todayDate:(id)a11 locale:(id)a12
{
  id v17 = a3;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  if (v17)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplate.m", 212, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    if (v19) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplate.m", 213, @"Invalid parameter not satisfying: %@", @"todayDate" object file lineNumber description];

LABEL_3:
  if (!v20)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLSearchSuggestionTemplate.m", 214, @"Invalid parameter not satisfying: %@", @"locale" object file lineNumber description];
  }
  id v21 = [(PLSearchSuggestionTemplate *)self _initWithSuggestionTemplateKey:v17 firstIndexCategory:a4 secondIndexCategory:a5 templateType:a6 templateContentType:a7 templateDateType:a8 styleType:a9 identifier:v18 todayDate:v19 locale:v20];

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  suggestionTemplateKey = self->_suggestionTemplateKey;
  id v11 = a3;
  [v11 encodeObject:suggestionTemplateKey forKey:@"PLSearchSuggestionTemplatePropertyKey"];
  unint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_firstIndexCategory];
  [v11 encodeObject:v5 forKey:@"PLSearchSuggestionTemplateFirstIndexCategory"];

  BOOL v6 = [NSNumber numberWithUnsignedInteger:self->_secondIndexCategory];
  [v11 encodeObject:v6 forKey:@"PLSearchSuggestionTemplateSecondIndexCategory"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_templateType];
  [v11 encodeObject:v7 forKey:@"PLSearchSuggestionTemplateTemplateType"];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_templateContentType];
  [v11 encodeObject:v8 forKey:@"PLSearchSuggestionTemplateTemplateContentType"];

  v9 = [NSNumber numberWithUnsignedInteger:self->_templateDateType];
  [v11 encodeObject:v9 forKey:@"PLSearchSuggestionTemplateDateType"];

  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_templateStyleType];
  [v11 encodeObject:v10 forKey:@"PLSearchSuggestionTemplateStyleType"];

  [v11 encodeObject:self->_identifier forKey:@"PLSearchSuggestionTemplateIdentifier"];
}

- (id)description
{
  char v3 = NSString;
  unint64_t templateType = self->_templateType;
  suggestionTemplateKey = self->_suggestionTemplateKey;
  BOOL v6 = PLDebugStringForSearchIndexCategory(self->_firstIndexCategory);
  v7 = PLDebugStringForSearchIndexCategory(self->_secondIndexCategory);
  unint64_t v8 = self->_templateContentType - 1;
  if (v8 > 8) {
    v9 = @"PLSearchSuggestionTemplateContentTypeNone";
  }
  else {
    v9 = off_1E58723D8[v8];
  }
  unint64_t v10 = self->_templateDateType - 1;
  if (v10 > 8) {
    id v11 = @"PLSearchSuggestionDateTemplateCategoryTypeNone";
  }
  else {
    id v11 = off_1E5862470[v10];
  }
  uint64_t v12 = v11;
  dateFilter = self->_dateFilter;
  identifier = self->_identifier;
  BOOL v15 = [(PLSearchSuggestionTemplate *)self isMeTemplate];
  id v16 = @"NO";
  if (v15) {
    id v16 = @"YES";
  }
  id v17 = [v3 stringWithFormat:@"Key: %@, templateType: %tu, firstCategory: %@, secondCategory: %@, contentType:%@, dateType: %@, date filter: %@, identifier: %@, isMeTemplate: %@", suggestionTemplateKey, templateType, v6, v7, v9, v12, dateFilter, identifier, v16];

  return v17;
}

- (unint64_t)hash
{
  char v3 = [(PLSearchSuggestionTemplate *)self suggestionTemplateKey];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(PLSearchSuggestionTemplate *)self firstIndexCategory];
  unint64_t v6 = v5 ^ [(PLSearchSuggestionTemplate *)self secondIndexCategory] ^ v4;
  unint64_t v7 = [(PLSearchSuggestionTemplate *)self templateType];
  unint64_t v8 = v7 ^ [(PLSearchSuggestionTemplate *)self templateDateType];
  v9 = [(PLSearchSuggestionTemplate *)self identifier];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  unint64_t v11 = [(PLSearchSuggestionTemplate *)self templateContentType];
  uint64_t v12 = [(PLSearchSuggestionTemplate *)self dateFilter];
  unint64_t v13 = v10 ^ v11 ^ [v12 hash];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PLSearchSuggestionTemplate *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      id v6 = [(PLSearchSuggestionTemplate *)self suggestionTemplateKey];
      id v7 = [(PLSearchSuggestionTemplate *)v5 suggestionTemplateKey];
      if (v6 == v7)
      {
      }
      else
      {
        unint64_t v8 = v7;
        char v9 = [v6 isEqual:v7];

        if ((v9 & 1) == 0) {
          goto LABEL_16;
        }
      }
      unint64_t v11 = [(PLSearchSuggestionTemplate *)self firstIndexCategory];
      if (v11 == [(PLSearchSuggestionTemplate *)v5 firstIndexCategory])
      {
        unint64_t v12 = [(PLSearchSuggestionTemplate *)self secondIndexCategory];
        if (v12 == [(PLSearchSuggestionTemplate *)v5 secondIndexCategory])
        {
          unint64_t v13 = [(PLSearchSuggestionTemplate *)self templateType];
          if (v13 == [(PLSearchSuggestionTemplate *)v5 templateType])
          {
            unint64_t v14 = [(PLSearchSuggestionTemplate *)self templateContentType];
            if (v14 == [(PLSearchSuggestionTemplate *)v5 templateContentType])
            {
              unint64_t v15 = [(PLSearchSuggestionTemplate *)self templateDateType];
              if (v15 == [(PLSearchSuggestionTemplate *)v5 templateDateType])
              {
                id v16 = [(PLSearchSuggestionTemplate *)self identifier];
                id v17 = [(PLSearchSuggestionTemplate *)v5 identifier];
                if (v16 == v17) {
                  char v10 = 1;
                }
                else {
                  char v10 = [v16 isEqualToString:v17];
                }

                goto LABEL_17;
              }
            }
          }
        }
      }
LABEL_16:
      char v10 = 0;
LABEL_17:

      goto LABEL_18;
    }
    char v10 = 0;
  }
LABEL_18:

  return v10;
}

- (BOOL)isMeTemplate
{
  return ([(PLSearchSuggestionTemplate *)self templateType] >> 4) & 1;
}

- (PSIDateFilter)dateFilter
{
  dateFilter = self->_dateFilter;
  if (!dateFilter)
  {
    unint64_t v4 = [(PLSearchSuggestionTemplate *)self templateDateType];
    unint64_t v5 = [(PLSearchSuggestionTemplate *)self calendar];
    id v6 = [(PLSearchSuggestionTemplate *)self todayDate];
    id v7 = +[PLSearchSuggestionDateUtility dateFilterForSearchSuggestionTemplateDateType:v4 calendar:v5 relativeDate:v6];
    unint64_t v8 = self->_dateFilter;
    self->_dateFilter = v7;

    dateFilter = self->_dateFilter;
  }
  return dateFilter;
}

@end