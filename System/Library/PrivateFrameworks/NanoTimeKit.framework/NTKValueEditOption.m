@interface NTKValueEditOption
+ (BOOL)_valueIsValid:(unint64_t)a3 forDevice:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_localizedNameForActionForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_optionWithValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)localizedNameForValidValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionByValidatingValueOfInvalidOption:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidOption;
- (NTKValueEditOption)initWithCoder:(id)a3;
- (NTKValueEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4;
- (id)JSONObjectRepresentation;
- (id)_faceBundleStringToValueDict;
- (id)_valueToFaceBundleStringDict;
- (id)dailySnapshotKey;
- (id)localizedName;
- (id)localizedNameForAction;
- (unint64_t)_value;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKValueEditOption

- (id)dailySnapshotKey
{
  v3 = objc_opt_class();
  unint64_t value = self->_value;
  v5 = [(NTKEditOption *)self device];
  v6 = [v3 _snapshotKeyForValue:value forDevice:v5];

  return v6;
}

- (id)localizedName
{
  v3 = objc_opt_class();
  unint64_t value = self->_value;
  v5 = [(NTKEditOption *)self device];
  v6 = [v3 _localizedNameForValue:value forDevice:v5];

  if (!v6)
  {
    v7 = objc_opt_class();
    unint64_t v8 = self->_value;
    v9 = [(NTKEditOption *)self device];
    v6 = [v7 localizedNameForValidValue:v8 forDevice:v9];
  }
  return v6;
}

+ (id)localizedNameForValidValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = [a1 _nameLocalizationKeyForValue:a3 forDevice:a4];
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ must implement either _localizedNameForValue:forDevice: or _nameLocalizationKeyForValue:forDevice:", objc_opt_class() format];
  }
  v5 = [v4 stringByAppendingString:@"_COMPANION"];
  v6 = NTKCompanionClockFaceLocalizedString(v5, @"name for edit option");
  if (!v6)
  {
    v6 = NTKClockFaceLocalizedString(v4, @"name for edit option");
  }

  return v6;
}

- (id)localizedNameForAction
{
  v3 = objc_opt_class();
  unint64_t value = self->_value;
  v5 = [(NTKEditOption *)self device];
  v6 = [v3 _localizedNameForActionForValue:value forDevice:v5];

  return v6;
}

- (BOOL)isValidOption
{
  v3 = objc_opt_class();
  unint64_t value = self->_value;
  v5 = [(NTKEditOption *)self device];
  LOBYTE(v3) = [v3 _valueIsValid:value forDevice:v5];

  return (char)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_value == v4[2];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_value;
}

+ (id)_optionWithValue:(unint64_t)a3 forDevice:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([a1 _valueIsValid:a3 forDevice:v6])
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithDevice:v6];
    v7[2] = a3;
  }
  else
  {
    unint64_t v8 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 1024;
      int v14 = a3;
      id v9 = v12;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to instantiate %@ with invalid value '%u'", (uint8_t *)&v11, 0x12u);
    }
    v7 = 0;
  }

  return v7;
}

- (unint64_t)_value
{
  return self->_value;
}

+ (BOOL)_valueIsValid:(unint64_t)a3 forDevice:(id)a4
{
  return 1;
}

+ (id)optionByValidatingValueOfInvalidOption:(id)a3
{
  return 0;
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (id)_localizedNameForActionForValue:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKValueEditOption;
  id v4 = a3;
  [(NTKEditOption *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_value, @"EnumeratedValue", v5.receiver, v5.super_class);
}

- (NTKValueEditOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKValueEditOption;
  objc_super v5 = [(NTKEditOption *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_unint64_t value = [v4 decodeIntegerForKey:@"EnumeratedValue"];
  }

  return v5;
}

- (id)JSONObjectRepresentation
{
  v3 = [(NTKValueEditOption *)self _valueToFaceBundleStringDict];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_value];
  objc_super v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

- (NTKValueEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  objc_super v7 = [(NTKEditOption *)self initWithDevice:a4];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"object must be a string - invalid value: %@", v6 format];
    }
    unint64_t v8 = [(NTKValueEditOption *)v7 _faceBundleStringToValueDict];
    id v9 = [v8 objectForKeyedSubscript:v6];

    if (!v9) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"invalid value: %@", v6 format];
    }
    v7->_unint64_t value = [v9 unsignedIntegerValue];
  }
  return v7;
}

- (id)_faceBundleStringToValueDict
{
  if (_faceBundleStringToValueDict_onceToken != -1) {
    dispatch_once(&_faceBundleStringToValueDict_onceToken, &__block_literal_global_129);
  }
  [(id)_faceBundleStringToValueDict_lock lock];
  v3 = (void *)_faceBundleStringToValueDict_faceBundleStringToValueDictPerClass;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  id v6 = [v3 objectForKeyedSubscript:v5];

  if (!v6)
  {
    objc_super v7 = objc_opt_new();
    unint64_t v8 = [(NTKValueEditOption *)self _valueToFaceBundleStringDict];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__NTKValueEditOption__faceBundleStringToValueDict__block_invoke_2;
    v14[3] = &unk_1E62C08E8;
    id v9 = v7;
    id v15 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v14];

    v10 = (void *)_faceBundleStringToValueDict_faceBundleStringToValueDictPerClass;
    id v6 = v9;
    int v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v10 setObject:v6 forKeyedSubscript:v12];
  }
  [(id)_faceBundleStringToValueDict_lock unlock];
  return v6;
}

uint64_t __50__NTKValueEditOption__faceBundleStringToValueDict__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_faceBundleStringToValueDict_faceBundleStringToValueDictPerClass;
  _faceBundleStringToValueDict_faceBundleStringToValueDictPerClass = v0;

  uint64_t v2 = objc_opt_new();
  v3 = (void *)_faceBundleStringToValueDict_lock;
  _faceBundleStringToValueDict_lock = v2;

  id v4 = (void *)_faceBundleStringToValueDict_lock;
  return [v4 setName:@"-[NTKEditOption _faceBundleStringToValueDict]"];
}

uint64_t __50__NTKValueEditOption__faceBundleStringToValueDict__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

- (id)_valueToFaceBundleStringDict
{
  return 0;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

@end