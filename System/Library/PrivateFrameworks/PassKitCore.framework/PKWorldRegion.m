@interface PKWorldRegion
+ (BOOL)supportsSecureCoding;
+ (unint64_t)mostConstrainingTypeInRegions:(id)a3;
- ($F7B9B8DFEF474B3BB7BDDE1984A806A4)displayRegion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWorldRegion:(id)a3;
- (BOOL)isIncludedInRegions:(id)a3;
- (NSString)abbreviationCode;
- (NSString)identifier;
- (NSString)localeIdentifier;
- (NSString)localizedName;
- (PKWorldRegion)init;
- (PKWorldRegion)initWithCoder:(id)a3;
- (PKWorldRegion)parentRegion;
- (id)description;
- (id)regionOfType:(unint64_t)a3;
- (id)searchString;
- (int)resultProviderIdentifier;
- (unint64_t)hash;
- (unint64_t)muid;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAbbreviationCode:(id)a3;
- (void)setDisplayRegion:(id *)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setParentRegion:(id)a3;
- (void)setResultProviderIdentifier:(int)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKWorldRegion

- (PKWorldRegion)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKWorldRegion;
  result = [(PKWorldRegion *)&v5 init];
  if (result)
  {
    double v3 = *MEMORY[0x1E4F1E750];
    double v4 = *(double *)(MEMORY[0x1E4F1E750] + 8);
    result->_latitude = *(double *)MEMORY[0x1E4F1E750];
    result->_longitude = v4;
    result->_latitudeDelta = v3;
    result->_longitudeDelta = v4;
  }
  return result;
}

- (PKWorldRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKWorldRegion;
  objc_super v5 = [(PKWorldRegion *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_muid = [v4 decodeInt64ForKey:@"muid"];
    v5->_resultProviderIdentifier = [v4 decodeInt32ForKey:@"resultProviderIdentifier"];
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    [v4 decodeDoubleForKey:@"latitude"];
    v5->_latitude = v8;
    [v4 decodeDoubleForKey:@"longitude"];
    v5->_longitude = v9;
    [v4 decodeDoubleForKey:@"latitudeDelta"];
    v5->_latitudeDelta = v10;
    [v4 decodeDoubleForKey:@"longitudeDelta"];
    v5->_longitudeDelta = v11;
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"abbreviationCode"];
    abbreviationCode = v5->_abbreviationCode;
    v5->_abbreviationCode = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentRegion"];
    parentRegion = v5->_parentRegion;
    v5->_parentRegion = (PKWorldRegion *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInt64:self->_muid forKey:@"muid"];
  [v5 encodeInt32:self->_resultProviderIdentifier forKey:@"resultProviderIdentifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_localizedName forKey:@"localizedName"];
  [v5 encodeObject:self->_localeIdentifier forKey:@"localeIdentifier"];
  [v5 encodeObject:self->_abbreviationCode forKey:@"abbreviationCode"];
  [v5 encodeDouble:@"latitude" forKey:self->_latitude];
  [v5 encodeDouble:@"longitude" forKey:self->_longitude];
  [v5 encodeDouble:@"latitudeDelta" forKey:self->_latitudeDelta];
  [v5 encodeDouble:@"longitudeDelta" forKey:self->_longitudeDelta];
  [v5 encodeObject:self->_parentRegion forKey:@"parentRegion"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- ($F7B9B8DFEF474B3BB7BDDE1984A806A4)displayRegion
{
  CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(self->_latitude, self->_longitude);
  return ($F7B9B8DFEF474B3BB7BDDE1984A806A4 *)CLLocationCoordinate2DIsValid(v4);
}

- (void)setDisplayRegion:(id *)a3
{
  self->_latitude = v3;
  self->_longitude = v4;
  self->_latitudeDelta = v5;
  self->_longitudeDelta = v6;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PKWorldRegion *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKWorldRegion *)self isEqualToWorldRegion:v4];
  }

  return v5;
}

- (BOOL)isEqualToWorldRegion:(id)a3
{
  id v4 = a3;
  localizedName = self->_localizedName;
  double v6 = [v4 localizedName];
  v7 = localizedName;
  double v8 = v6;
  double v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_10;
  }
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    BOOL v11 = 0;
    uint64_t v12 = v8;
    goto LABEL_33;
  }
  BOOL v13 = [(NSString *)v7 isEqualToString:v8];

  if (v13)
  {
LABEL_10:
    abbreviationCode = self->_abbreviationCode;
    v15 = [v4 abbreviationCode];
    uint64_t v12 = abbreviationCode;
    uint64_t v16 = v15;
    v7 = v16;
    if (v12 == v16)
    {
    }
    else
    {
      if (!v12 || !v16)
      {

        goto LABEL_32;
      }
      BOOL v17 = [(NSString *)v12 isEqualToString:v16];

      if (!v17)
      {
        BOOL v11 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    localeIdentifier = self->_localeIdentifier;
    v19 = [v4 localeIdentifier];
    v20 = localeIdentifier;
    objc_super v21 = v19;
    uint64_t v12 = v21;
    if (v20 == v21)
    {

LABEL_24:
      unint64_t type = self->_type;
      if (type != [v4 type]
        || self->_muid != *((void *)v4 + 1)
        || self->_resultProviderIdentifier != *((_DWORD *)v4 + 4)
        || self->_latitude != *((double *)v4 + 4)
        || self->_longitude != *((double *)v4 + 5)
        || self->_latitudeDelta != *((double *)v4 + 6))
      {
        goto LABEL_32;
      }
      BOOL v11 = self->_longitudeDelta == *((double *)v4 + 7);
LABEL_33:

      goto LABEL_34;
    }
    if (v20 && v21)
    {
      BOOL v22 = [(NSString *)v20 isEqualToString:v21];

      if (!v22) {
        goto LABEL_32;
      }
      goto LABEL_24;
    }

LABEL_32:
    BOOL v11 = 0;
    goto LABEL_33;
  }
  BOOL v11 = 0;
LABEL_35:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_abbreviationCode];
  [v3 safelyAddObject:self->_localizedName];
  [v3 safelyAddObject:self->_localeIdentifier];
  [v3 safelyAddObject:self->_parentRegion];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_muid - v5 + 32 * v5;
  uint64_t v7 = self->_resultProviderIdentifier - v6 + 32 * v6;
  unint64_t v8 = (unint64_t)self->_latitude - v7 + 32 * v7;
  unint64_t v9 = (unint64_t)self->_longitude - v8 + 32 * v8;
  unint64_t v10 = (unint64_t)self->_latitudeDelta - v9 + 32 * v9;
  unint64_t v11 = (unint64_t)self->_longitudeDelta - v10 + 32 * v10;

  return v11;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t type = self->_type;
  localizedName = self->_localizedName;
  localeIdentifier = self->_localeIdentifier;
  identifier = self->_identifier;
  abbreviationCode = self->_abbreviationCode;
  unint64_t v10 = [(PKWorldRegion *)self->_parentRegion identifier];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@, type: %lu, name: %@, locale: %@, code: %@, parentID: %@, displayRegion: %.4f/%.4f, %.4f/%.4f>",
    v4,
    self,
    identifier,
    type,
    localizedName,
    localeIdentifier,
    abbreviationCode,
    v10,
    *(void *)&self->_latitude,
    *(void *)&self->_longitude,
    *(void *)&self->_latitudeDelta,
  unint64_t v11 = *(void *)&self->_longitudeDelta);

  return v11;
}

- (id)regionOfType:(unint64_t)a3
{
  if (self->_type == a3)
  {
    id v3 = self;
  }
  else
  {
    id v3 = [(PKWorldRegion *)self parentRegion];
    if (v3)
    {
      do
      {
        if ([(PKWorldRegion *)v3 type] == a3) {
          break;
        }
        uint64_t v5 = [(PKWorldRegion *)v3 parentRegion];

        id v3 = (PKWorldRegion *)v5;
      }
      while (v5);
    }
  }
  return v3;
}

- (id)searchString
{
  v2 = 0;
  switch(self->_type)
  {
    case 0uLL:
      uint64_t v4 = NSString;
      localizedName = self->_localizedName;
      unint64_t v6 = [(PKWorldRegion *)self->_parentRegion localizedName];
      uint64_t v7 = [v4 stringWithFormat:@"%@, %@", localizedName, v6];
      goto LABEL_7;
    case 1uLL:
      unint64_t v6 = [(PKWorldRegion *)self regionOfType:3];
      unint64_t v8 = [(PKWorldRegion *)self regionOfType:4];
      unint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
      unint64_t v10 = [v8 abbreviationCode];
      unint64_t v11 = PKLocalizedStringForCountryCode(v9, v10);

      uint64_t v12 = [v6 localizedName];

      BOOL v13 = NSString;
      uint64_t v14 = self->_localizedName;
      if (v12)
      {
        v15 = [v6 localizedName];
        v2 = [v13 stringWithFormat:@"%@, %@, %@", v14, v15, v11];
      }
      else
      {
        v2 = [NSString stringWithFormat:@"%@, %@", self->_localizedName, v11];
      }

      goto LABEL_10;
    case 3uLL:
      unint64_t v6 = [(PKWorldRegion *)self regionOfType:4];
      uint64_t v16 = [MEMORY[0x1E4F1CA20] currentLocale];
      BOOL v17 = [v6 abbreviationCode];
      uint64_t v18 = PKLocalizedStringForCountryCode(v16, v17);

      v2 = [NSString stringWithFormat:@"%@, %@", self->_localizedName, v18];

      goto LABEL_10;
    case 4uLL:
      unint64_t v6 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v7 = PKLocalizedStringForCountryCode(v6, self->_abbreviationCode);
LABEL_7:
      v2 = (void *)v7;
LABEL_10:

      break;
    default:
      break;
  }
  return v2;
}

- (BOOL)isIncludedInRegions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [(PKWorldRegion *)self parentRegion];
        if (v10)
        {
          unint64_t v11 = (void *)v10;
          do
          {
            uint64_t v12 = [v9 identifier];
            BOOL v13 = [v11 identifier];
            id v14 = v12;
            id v15 = v13;
            uint64_t v16 = v15;
            if (v14 == v15)
            {
              char v17 = 1;
            }
            else
            {
              char v17 = 0;
              if (v14 && v15) {
                char v17 = [v14 isEqualToString:v15];
              }
            }

            uint64_t v18 = [v11 parentRegion];

            if (v17) {
              break;
            }
            unint64_t v11 = v18;
          }
          while (v18);

          if (v17)
          {
            BOOL v19 = 1;
            goto LABEL_20;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 0;
LABEL_20:

  return v19;
}

+ (unint64_t)mostConstrainingTypeInRegions:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    unint64_t v7 = 4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) type];
        if (v9 < v7) {
          unint64_t v7 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v7 = 4;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int)resultProviderIdentifier
{
  return self->_resultProviderIdentifier;
}

- (void)setResultProviderIdentifier:(int)a3
{
  self->_resultProviderIdentifier = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSString)abbreviationCode
{
  return self->_abbreviationCode;
}

- (void)setAbbreviationCode:(id)a3
{
}

- (PKWorldRegion)parentRegion
{
  return self->_parentRegion;
}

- (void)setParentRegion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abbreviationCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_parentRegion, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end