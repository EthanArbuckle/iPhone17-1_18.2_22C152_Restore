@interface SVXDeviceSetupOptions
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)languageCode;
- (SVXDeviceSetupOptions)initWithCoder:(id)a3;
- (SVXDeviceSetupOptions)initWithLanguageCode:(id)a3 gender:(int64_t)a4 hasActiveAccount:(int64_t)a5 isNewsRestricted:(int64_t)a6;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)gender;
- (int64_t)hasActiveAccount;
- (int64_t)isNewsRestricted;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXDeviceSetupOptions

- (void).cxx_destruct
{
}

- (int64_t)isNewsRestricted
{
  return self->_isNewsRestricted;
}

- (int64_t)hasActiveAccount
{
  return self->_hasActiveAccount;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)encodeWithCoder:(id)a3
{
  languageCode = self->_languageCode;
  id v5 = a3;
  [v5 encodeObject:languageCode forKey:@"SVXDeviceSetupOptions::languageCode"];
  v6 = [NSNumber numberWithInteger:self->_gender];
  [v5 encodeObject:v6 forKey:@"SVXDeviceSetupOptions::gender"];

  v7 = [NSNumber numberWithInteger:self->_hasActiveAccount];
  [v5 encodeObject:v7 forKey:@"SVXDeviceSetupOptions::hasActiveAccount"];

  id v8 = [NSNumber numberWithInteger:self->_isNewsRestricted];
  [v5 encodeObject:v8 forKey:@"SVXDeviceSetupOptions::isNewsRestricted"];
}

- (SVXDeviceSetupOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupOptions::languageCode"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupOptions::gender"];
  uint64_t v7 = [v6 integerValue];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupOptions::hasActiveAccount"];
  uint64_t v9 = [v8 integerValue];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupOptions::isNewsRestricted"];

  uint64_t v11 = [v10 integerValue];
  v12 = [(SVXDeviceSetupOptions *)self initWithLanguageCode:v5 gender:v7 hasActiveAccount:v9 isNewsRestricted:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXDeviceSetupOptions *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t gender = self->_gender;
      if (gender == [(SVXDeviceSetupOptions *)v5 gender]
        && (int64_t hasActiveAccount = self->_hasActiveAccount,
            hasActiveAccount == [(SVXDeviceSetupOptions *)v5 hasActiveAccount])
        && (int64_t isNewsRestricted = self->_isNewsRestricted,
            isNewsRestricted == [(SVXDeviceSetupOptions *)v5 isNewsRestricted]))
      {
        uint64_t v9 = [(SVXDeviceSetupOptions *)v5 languageCode];
        languageCode = self->_languageCode;
        BOOL v11 = languageCode == v9 || [(NSString *)languageCode isEqual:v9];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_languageCode hash];
  id v4 = [NSNumber numberWithInteger:self->_gender];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [NSNumber numberWithInteger:self->_hasActiveAccount];
  uint64_t v7 = [v6 hash];
  id v8 = [NSNumber numberWithInteger:self->_isNewsRestricted];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v18.receiver = self;
  v18.super_class = (Class)SVXDeviceSetupOptions;
  uint64_t v5 = [(SVXDeviceSetupOptions *)&v18 description];
  unint64_t gender = self->_gender;
  if (gender > 3) {
    uint64_t v7 = @"(unknown)";
  }
  else {
    uint64_t v7 = off_264552568[gender];
  }
  languageCode = self->_languageCode;
  unint64_t v9 = v7;
  unint64_t hasActiveAccount = self->_hasActiveAccount;
  if (hasActiveAccount > 2) {
    BOOL v11 = @"(unknown)";
  }
  else {
    BOOL v11 = off_264551FD8[hasActiveAccount];
  }
  v12 = v11;
  unint64_t isNewsRestricted = self->_isNewsRestricted;
  if (isNewsRestricted > 2) {
    v14 = @"(unknown)";
  }
  else {
    v14 = off_264551FD8[isNewsRestricted];
  }
  v15 = v14;
  v16 = (void *)[v4 initWithFormat:@"%@ {languageCode = %@, unint64_t gender = %@, hasActiveAccount = %@, isNewsRestricted = %@}", v5, languageCode, v9, v12, v15];

  return v16;
}

- (id)description
{
  return [(SVXDeviceSetupOptions *)self _descriptionWithIndent:0];
}

- (SVXDeviceSetupOptions)initWithLanguageCode:(id)a3 gender:(int64_t)a4 hasActiveAccount:(int64_t)a5 isNewsRestricted:(int64_t)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SVXDeviceSetupOptions;
  BOOL v11 = [(SVXDeviceSetupOptions *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    languageCode = v11->_languageCode;
    v11->_languageCode = (NSString *)v12;

    v11->_unint64_t gender = a4;
    v11->_unint64_t hasActiveAccount = a5;
    v11->_unint64_t isNewsRestricted = a6;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXDeviceSetupOptionsMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_SVXDeviceSetupOptionsMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    v6 = [(_SVXDeviceSetupOptionsMutation *)v5 generate];
  }
  else
  {
    v6 = (void *)[(SVXDeviceSetupOptions *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  NSUInteger v3 = (void (**)(id, _SVXDeviceSetupOptionsMutation *))a3;
  id v4 = objc_alloc_init(_SVXDeviceSetupOptionsMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  uint64_t v5 = [(_SVXDeviceSetupOptionsMutation *)v4 generate];

  return v5;
}

@end