@interface PKRule
+ (BOOL)supportsSecureCoding;
- (NSPredicate)predicate;
- (NSString)identifier;
- (NSString)predicateFormat;
- (PKOSVersionRequirementRange)osVersionRequirementRange;
- (PKRule)initWithCoder:(id)a3;
- (PKRule)initWithDictionary:(id)a3;
- (PKRule)initWithIdentifier:(id)a3 predicateFormat:(id)a4 osVersionRequirementRange:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)parsePredicateFormat;
- (void)setIdentifier:(id)a3;
- (void)setOsVersionRequirementRange:(id)a3;
- (void)setPredicateFormat:(id)a3;
@end

@implementation PKRule

- (PKRule)initWithIdentifier:(id)a3 predicateFormat:(id)a4 osVersionRequirementRange:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v9 length])
  {
    v14 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Malformed Rule in manifest: nil or empty identifier.", buf, 2u);
    }

    goto LABEL_9;
  }
  v16.receiver = self;
  v16.super_class = (Class)PKRule;
  v12 = [(PKRule *)&v16 init];
  self = v12;
  if (!v12
    || (objc_storeStrong((id *)&v12->_identifier, a3),
        objc_storeStrong((id *)&self->_predicateFormat, a4),
        objc_storeStrong((id *)&self->_osVersionRequirementRange, a5),
        [(PKRule *)self parsePredicateFormat],
        self->_predicateFormat)
    && !self->_predicate)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  self = self;
  v13 = self;
LABEL_10:

  return v13;
}

- (PKRule)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKStringForKey:@"identifier"];
  v6 = [v4 PKStringForKey:@"predicateFormat"];
  v7 = [v4 PKDictionaryForKey:@"osVersionRange"];

  if (v7) {
    v8 = [[PKOSVersionRequirementRange alloc] initWithDictionary:v7];
  }
  else {
    v8 = 0;
  }
  id v9 = [(PKRule *)self initWithIdentifier:v5 predicateFormat:v6 osVersionRequirementRange:v8];

  return v9;
}

- (void)parsePredicateFormat
{
  if (self->_predicateFormat)
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:");
    v3 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  predicate = self->_predicate;
  self->_predicate = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKRule;
  v5 = [(PKRule *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicateFormat"];
    predicateFormat = v5->_predicateFormat;
    v5->_predicateFormat = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osVersionRange"];
    osVersionRequirementRange = v5->_osVersionRequirementRange;
    v5->_osVersionRequirementRange = (PKOSVersionRequirementRange *)v12;

    [(NSPredicate *)v5->_predicate allowEvaluation];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_predicateFormat forKey:@"predicateFormat"];
  [v5 encodeObject:self->_predicate forKey:@"predicate"];
  [v5 encodeObject:self->_osVersionRequirementRange forKey:@"osVersionRange"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"predicate: '%@'; ", self->_predicate];
  [v3 appendFormat:@"predicateFormat: '%@'; ", self->_predicateFormat];
  [v3 appendFormat:@"osVersionRange: '%@'; ", self->_osVersionRequirementRange];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSPredicate *)self->_predicate copyWithZone:a3];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_predicateFormat copyWithZone:a3];
  id v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(PKOSVersionRequirementRange *)self->_osVersionRequirementRange copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (PKOSVersionRequirementRange)osVersionRequirementRange
{
  return self->_osVersionRequirementRange;
}

- (void)setOsVersionRequirementRange:(id)a3
{
}

- (NSString)predicateFormat
{
  return self->_predicateFormat;
}

- (void)setPredicateFormat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateFormat, 0);
  objc_storeStrong((id *)&self->_osVersionRequirementRange, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end