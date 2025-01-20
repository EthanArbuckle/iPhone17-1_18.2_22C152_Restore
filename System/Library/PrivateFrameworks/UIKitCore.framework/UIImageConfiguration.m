@interface UIImageConfiguration
+ (BOOL)supportsSecureCoding;
+ (UIImageConfiguration)configurationWithLocale:(NSLocale *)locale;
+ (UIImageConfiguration)configurationWithTraitCollection:(UITraitCollection *)traitCollection;
+ (id)_completeConfiguration:(void *)a3 fromConfiguration:;
+ (id)_unspecifiedConfiguration;
- (BOOL)_ignoresDynamicType;
- (BOOL)_isEquivalentToConfiguration:(id)a3;
- (BOOL)_isUnspecified;
- (BOOL)_shouldApplyConfiguration:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (NSLocale)locale;
- (NSString)description;
- (UIImageConfiguration)configurationByApplyingConfiguration:(UIImageConfiguration *)otherConfiguration;
- (UIImageConfiguration)configurationWithLocale:(NSLocale *)locale;
- (UIImageConfiguration)configurationWithTraitCollection:(UITraitCollection *)traitCollection;
- (UIImageConfiguration)initWithCoder:(id)a3;
- (UITraitCollection)_effectiveTraitCollectionForImageLookup;
- (UITraitCollection)traitCollection;
- (id)_configurationIgnoringDynamicType;
- (id)_init;
- (id)_initWithTraitCollection:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)_initWithConfiguration:(void *)a1;
- (unint64_t)hash;
- (void)_applyConfigurationValuesTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIImageConfiguration

+ (id)_completeConfiguration:(void *)a3 fromConfiguration:
{
  id v4 = a2;
  id v5 = a3;
  self;
  if (v5)
  {
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    id v13 = v5;
    v10 = v13;
    goto LABEL_16;
  }
  v12 = _UICurrentImageTraitCollection();
  id v5 = [v12 imageConfiguration];

  if (!v4) {
    goto LABEL_10;
  }
LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    uint64_t v7 = -[UIImageConfiguration _initWithConfiguration:](v6, v5);

    id v5 = (id)v7;
  }
  id v8 = v4;
  id v9 = v5;
  v10 = v9;
  if (v9 == v8)
  {
  }
  else
  {
    if (!v9)
    {

LABEL_14:
      id v14 = [v10 configurationByApplyingConfiguration:v8];
      goto LABEL_15;
    }
    int v11 = [v8 isEqual:v9];

    if (!v11) {
      goto LABEL_14;
    }
  }
  id v14 = v8;
LABEL_15:
  id v13 = v14;
LABEL_16:

  return v13;
}

- (UIImageConfiguration)configurationByApplyingConfiguration:(UIImageConfiguration *)otherConfiguration
{
  id v4 = otherConfiguration;
  if ([(UIImageConfiguration *)self _shouldApplyConfiguration:v4])
  {
    id v5 = (UIImageConfiguration *)[(UIImageConfiguration *)self copy];
    [(UIImageConfiguration *)v4 _applyConfigurationValuesTo:v5];
  }
  else
  {
    id v5 = self;
  }

  return v5;
}

- (BOOL)_shouldApplyConfiguration:(id)a3
{
  if (a3) {
    return [a3 _isUnspecified] ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)_isUnspecified
{
  return !self->_traitCollection && !self->_locale && !self->_ignoresDynamicType;
}

- (void)_applyConfigurationValuesTo:(id)a3
{
  int v11 = (id *)a3;
  id v4 = [v11 traitCollection];
  id v5 = self->_traitCollection;
  id v6 = v5;
  if (v4 && v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __96__UITraitCollection__traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection___block_invoke;
    v12[3] = &unk_1E52F2C00;
    v12[4] = v5;
    v12[5] = v4;
    uint64_t v7 = (UITraitCollection *)-[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v5, (uint64_t)v12);
  }
  else
  {
    if (v4) {
      id v8 = v4;
    }
    else {
      id v8 = v5;
    }
    uint64_t v7 = v8;
  }
  id v9 = v11[2];
  v11[2] = v7;

  locale = self->_locale;
  if (locale) {
    objc_storeStrong(v11 + 3, locale);
  }
  if (!dyld_program_sdk_at_least() || self->_ignoresDynamicType) {
    *((unsigned char *)v11 + 8) = self->_ignoresDynamicType;
  }
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) _init];
  objc_storeStrong((id *)(v4 + 16), self->_traitCollection);
  objc_storeStrong((id *)(v4 + 24), self->_locale);
  *(unsigned char *)(v4 + 8) = self->_ignoresDynamicType;
  return (id)v4;
}

- (id)_init
{
  return [(UIImageConfiguration *)self _initWithTraitCollection:0];
}

- (id)_initWithTraitCollection:(id)a3
{
  uint64_t v4 = (char *)a3;
  v9.receiver = self;
  v9.super_class = (Class)UIImageConfiguration;
  id v5 = [(UIImageConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = -[UITraitCollection _traitCollectionRelevantForImageConfiguration](v4);
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v6;
  }
  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  uint64_t v4 = (UIImageConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() && v4->_ignoresDynamicType == self->_ignoresDynamicType)
    {
      traitCollection = v4->_traitCollection;
      uint64_t v7 = self->_traitCollection;
      id v8 = traitCollection;
      if (v7 == v8)
      {
      }
      else
      {
        objc_super v9 = v8;
        LOBYTE(v10) = 0;
        if (!v7 || !v8)
        {
LABEL_17:

          goto LABEL_18;
        }
        BOOL v10 = [(UITraitCollection *)v7 isEqual:v8];

        if (!v10) {
          goto LABEL_18;
        }
      }
      locale = self->_locale;
      v12 = v4->_locale;
      uint64_t v7 = locale;
      id v13 = v12;
      if (v7 == v13)
      {
        LOBYTE(v10) = 1;
        objc_super v9 = v7;
      }
      else
      {
        objc_super v9 = v13;
        LOBYTE(v10) = 0;
        if (v7 && v13) {
          LOBYTE(v10) = [(UITraitCollection *)v7 isEqual:v13];
        }
      }
      goto LABEL_17;
    }
    LOBYTE(v10) = 0;
  }
LABEL_18:

  return v10;
}

- (uint64_t)_initWithConfiguration:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = [(id)objc_opt_class() _unspecifiedConfiguration];
    uint64_t v5 = [v4 configurationByApplyingConfiguration:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = [(UITraitCollection *)self->_traitCollection hash];
  return [(NSLocale *)self->_locale hash] ^ v3;
}

- (UITraitCollection)_effectiveTraitCollectionForImageLookup
{
  traitCollection = self->_traitCollection;
  if (traitCollection)
  {
    uint64_t v4 = traitCollection;
  }
  else
  {
    +[UITraitCollection _emptyTraitCollection]();
    uint64_t v4 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = v4;
  if (self->_ignoresDynamicType)
  {
    if (qword_1EB2614E0 != -1) {
      dispatch_once(&qword_1EB2614E0, &__block_literal_global_30_2);
    }
    id v6 = (id)qword_1EB2614D8;
    uint64_t v7 = [v5 _traitCollectionByReplacingObject:v6 forTraitToken:0x1ED3F5AD8];

    uint64_t v5 = (void *)v7;
  }
  return (UITraitCollection *)v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (UIImageConfiguration)configurationWithTraitCollection:(UITraitCollection *)traitCollection
{
  uint64_t v4 = -[UITraitCollection _traitCollectionRelevantForImageConfiguration]((char *)traitCollection);
  uint64_t v5 = self->_traitCollection;
  id v6 = v4;
  uint64_t v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_7;
  }
  id v8 = v7;
  if (v6 && v7)
  {
    BOOL v9 = [(UITraitCollection *)v6 isEqual:v7];

    if (!v9) {
      goto LABEL_9;
    }
LABEL_7:
    BOOL v10 = self;
    goto LABEL_10;
  }

LABEL_9:
  BOOL v10 = (UIImageConfiguration *)[(UIImageConfiguration *)self copy];
  objc_storeStrong((id *)&v10->_traitCollection, v4);
LABEL_10:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  traitCollection = self->_traitCollection;
  if (traitCollection) {
    [v6 encodeObject:traitCollection forKey:@"UITraitCollection"];
  }
  locale = self->_locale;
  if (locale) {
    [v6 encodeObject:locale forKey:@"NSLocale"];
  }
  if ([(UIImageConfiguration *)self _ignoresDynamicType]) {
    [v6 encodeBool:self->_ignoresDynamicType forKey:@"UIIgnoresDynamicType"];
  }
}

- (BOOL)_ignoresDynamicType
{
  return self->_ignoresDynamicType;
}

- (UIImageConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"UITraitCollection"];

  uint64_t v7 = [(UIImageConfiguration *)self _initWithTraitCollection:v6];
  if (v7)
  {
    id v8 = self;
    uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"NSLocale"];
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v9;

    if ([v4 containsValueForKey:@"UIIgnoresDynamicType"]) {
      v7->_ignoresDynamicType = [v4 decodeBoolForKey:@"UIIgnoresDynamicType"];
    }
  }

  return v7;
}

+ (id)_unspecifiedConfiguration
{
  if (_MergedGlobals_1104 != -1) {
    dispatch_once(&_MergedGlobals_1104, &__block_literal_global_299);
  }
  v2 = (void *)qword_1EB2614D0;
  return v2;
}

void __49__UIImageConfiguration__unspecifiedConfiguration__block_invoke()
{
  id v0 = [[UIImageConfiguration alloc] _init];
  v1 = (void *)qword_1EB2614D0;
  qword_1EB2614D0 = (uint64_t)v0;
}

+ (UIImageConfiguration)configurationWithTraitCollection:(UITraitCollection *)traitCollection
{
  id v4 = traitCollection;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) _initWithTraitCollection:v4];

  return (UIImageConfiguration *)v5;
}

- (UIImageConfiguration)configurationWithLocale:(NSLocale *)locale
{
  uint64_t v5 = locale;
  id v6 = self->_locale;
  uint64_t v7 = v5;
  id v8 = v6;
  if (v8 == v7)
  {

    goto LABEL_7;
  }
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    char v10 = [(NSLocale *)v7 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    int v11 = self;
    goto LABEL_10;
  }

LABEL_9:
  int v11 = (UIImageConfiguration *)[(UIImageConfiguration *)self copy];
  objc_storeStrong((id *)&v11->_locale, locale);
LABEL_10:

  return v11;
}

+ (UIImageConfiguration)configurationWithLocale:(NSLocale *)locale
{
  id v4 = locale;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) _init];
  id v6 = (void *)v5[3];
  v5[3] = v4;

  return (UIImageConfiguration *)v5;
}

- (id)_configurationIgnoringDynamicType
{
  if (self->_ignoresDynamicType)
  {
    v2 = self;
  }
  else
  {
    v2 = (UIImageConfiguration *)[(UIImageConfiguration *)self copy];
    v2->_ignoresDynamicType = 1;
  }
  return v2;
}

- (BOOL)_isEquivalentToConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_19;
  }
  uint64_t v5 = [(UIImageConfiguration *)self traitCollection];
  if (v5)
  {
    id v6 = [v4 traitCollection];

    if (v6)
    {
      uint64_t v7 = [(UIImageConfiguration *)self traitCollection];
      id v8 = [v4 traitCollection];
      int v9 = -[UITraitCollection _matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:]((uint64_t)v7, (uint64_t)v8);

      if (!v9) {
        goto LABEL_19;
      }
      LODWORD(v5) = 1;
    }
    else
    {
      LODWORD(v5) = 0;
    }
  }
  uint64_t v10 = [(UIImageConfiguration *)self locale];
  if (v10)
  {
    int v11 = (void *)v10;
    v12 = [v4 locale];

    if (v12)
    {
      id v13 = [(UIImageConfiguration *)self locale];
      id v14 = [v4 locale];
      id v15 = v13;
      id v16 = v14;
      if (v15 == v16)
      {

LABEL_15:
        LODWORD(v5) = 1;
        goto LABEL_16;
      }
      v17 = v16;
      if (v15 && v16)
      {
        char v18 = [v15 isEqual:v16];

        if ((v18 & 1) == 0) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }

LABEL_19:
      LOBYTE(v5) = 0;
      goto LABEL_20;
    }
  }
LABEL_16:
  if ([(UIImageConfiguration *)self _ignoresDynamicType]) {
    LODWORD(v5) = v5 | [v4 _ignoresDynamicType];
  }
LABEL_20:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p", v5, self];

  traitCollection = self->_traitCollection;
  if (traitCollection)
  {
    uint64_t v8 = [(UITraitCollection *)traitCollection _traitsDescription];
    int v9 = [v6 stringByAppendingFormat:@" traits=(%@)", v8];

    id v6 = (void *)v8;
  }
  else
  {
    int v9 = [v6 stringByAppendingString:@" no traits"];
  }

  if (self->_locale)
  {
    uint64_t v10 = [v9 stringByAppendingFormat:@" locale=(%@)", self->_locale];

    int v9 = (void *)v10;
  }
  if (self->_ignoresDynamicType)
  {
    uint64_t v11 = [v9 stringByAppendingString:@" (ignores DT)"];

    int v9 = (void *)v11;
  }
  v12 = [v9 stringByAppendingString:@">"];

  return (NSString *)v12;
}

@end