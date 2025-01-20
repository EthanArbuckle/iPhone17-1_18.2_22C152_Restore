@interface TUNearbySuggestionAdvertisement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSuggestionAdvertisement:(id)a3;
- (NSString)deviceIdentifier;
- (NSUUID)suggestionIdentifier;
- (TUNearbySuggestionAdvertisement)initWithCoder:(id)a3;
- (TUNearbySuggestionAdvertisement)initWithSuggestion:(id)a3;
- (TUNearbySuggestionAdvertisement)initWithSuggestionIdentifier:(id)a3 deviceIdentifier:(id)a4 type:(int64_t)a5;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUNearbySuggestionAdvertisement

- (TUNearbySuggestionAdvertisement)initWithSuggestionIdentifier:(id)a3 deviceIdentifier:(id)a4 type:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUNearbySuggestionAdvertisement;
  v11 = [(TUNearbySuggestionAdvertisement *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_suggestionIdentifier, a3);
    objc_storeStrong((id *)&v12->_deviceIdentifier, a4);
    v12->_type = a5;
  }

  return v12;
}

- (TUNearbySuggestionAdvertisement)initWithSuggestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 deviceHandle];
  v6 = [v5 identifierWithType:2];

  v7 = [v4 identifier];
  uint64_t v8 = [v4 type];

  id v9 = [(TUNearbySuggestionAdvertisement *)self initWithSuggestionIdentifier:v7 deviceIdentifier:v6 type:v8];
  return v9;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" suggestionIdentifier=%@", self->_suggestionIdentifier];
  [v6 appendFormat:@" deviceIdentifier=%@", self->_deviceIdentifier];
  objc_msgSend(v6, "appendFormat:", @" type=%zu", self->_type);
  [v6 appendString:@">"];
  v7 = (void *)[v6 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbySuggestionAdvertisement)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_suggestionIdentifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_deviceIdentifier);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  v11 = NSStringFromSelector(sel_type);
  uint64_t v12 = [v4 decodeIntegerForKey:v11];

  v13 = [(TUNearbySuggestionAdvertisement *)self initWithSuggestionIdentifier:v7 deviceIdentifier:v10 type:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  suggestionIdentifier = self->_suggestionIdentifier;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_suggestionIdentifier);
  [v5 encodeObject:suggestionIdentifier forKey:v6];

  deviceIdentifier = self->_deviceIdentifier;
  uint64_t v8 = NSStringFromSelector(sel_deviceIdentifier);
  [v5 encodeObject:deviceIdentifier forKey:v8];

  int64_t type = self->_type;
  NSStringFromSelector(sel_type);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:type forKey:v10];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUNearbySuggestionAdvertisement *)self isEqualToSuggestionAdvertisement:v4];

  return v5;
}

- (BOOL)isEqualToSuggestionAdvertisement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUNearbySuggestionAdvertisement *)self suggestionIdentifier];
  v6 = [v4 suggestionIdentifier];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(TUNearbySuggestionAdvertisement *)self suggestionIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
}

@end