@interface SBHLibraryCategoryIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)categoryWithLocalizedDisplayName:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCategoryIdentifier:(id)a3;
- (NSString)localizedDisplayName;
- (NSString)localizedDisplayNameKey;
- (SBHLibraryCategoryIdentifier)initWithCoder:(id)a3;
- (SBHLibraryCategoryIdentifier)initWithPredictionCategoryID:(unint64_t)a3 categoryIndex:(unint64_t)a4 localizedDisplayName:(id)a5 localizedDisplayNameKey:(id)a6;
- (SBHLibraryCategoryIdentifier)initWithPredictionCategoryID:(unint64_t)a3 localizedDisplayNameKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)predictionCategoryID;
- (unint64_t)predictionCategoryIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBHLibraryCategoryIdentifier

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    v4 = [MEMORY[0x1E4F4F758] builder];
    v5 = [(SBHLibraryCategoryIdentifier *)self localizedDisplayName];
    v6 = [v4 appendObject:v5];
    v7 = [(SBHLibraryCategoryIdentifier *)self localizedDisplayNameKey];
    v8 = [v6 appendObject:v7];
    v9 = objc_msgSend(v8, "appendUnsignedInteger:", -[SBHLibraryCategoryIdentifier predictionCategoryID](self, "predictionCategoryID"));
    self->_hash = [v9 hash];

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHLibraryCategoryIdentifier *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(SBHLibraryCategoryIdentifier *)self isEqualToCategoryIdentifier:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToCategoryIdentifier:(id)a3
{
  v4 = (SBHLibraryCategoryIdentifier *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 {
         && (unint64_t v6 = [(SBHLibraryCategoryIdentifier *)self predictionCategoryID],
  }
             v6 == [(SBHLibraryCategoryIdentifier *)v5 predictionCategoryID]))
  {
    v7 = [(SBHLibraryCategoryIdentifier *)self localizedDisplayName];
    v8 = [(SBHLibraryCategoryIdentifier *)v5 localizedDisplayName];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)predictionCategoryID
{
  return self->_predictionCategoryID;
}

- (NSString)localizedDisplayName
{
  if (self->_localizedDisplayNameKey)
  {
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    v4 = [v3 localizedStringForKey:self->_localizedDisplayNameKey value:self->_localizedDisplayNameKey table:@"SpringBoard"];
  }
  else
  {
    v4 = self->_localizedDisplayName;
  }
  return v4;
}

- (NSString)localizedDisplayNameKey
{
  return self->_localizedDisplayNameKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayNameKey, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPredictionCategoryID:self->_predictionCategoryID localizedDisplayNameKey:self->_localizedDisplayNameKey];
  v4[5] = self->_predictionCategoryIndex;
  uint64_t v5 = [(NSString *)self->_localizedDisplayName copy];
  unint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(NSString *)self->_localizedDisplayNameKey copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (SBHLibraryCategoryIdentifier)initWithPredictionCategoryID:(unint64_t)a3 localizedDisplayNameKey:(id)a4
{
  return [(SBHLibraryCategoryIdentifier *)self initWithPredictionCategoryID:a3 categoryIndex:-1 localizedDisplayName:0 localizedDisplayNameKey:a4];
}

- (SBHLibraryCategoryIdentifier)initWithPredictionCategoryID:(unint64_t)a3 categoryIndex:(unint64_t)a4 localizedDisplayName:(id)a5 localizedDisplayNameKey:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBHLibraryCategoryIdentifier;
  v12 = [(SBHLibraryCategoryIdentifier *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_predictionCategoryID = a3;
    v12->_predictionCategoryIndex = a4;
    uint64_t v14 = [v10 copy];
    localizedDisplayName = v13->_localizedDisplayName;
    v13->_localizedDisplayName = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    localizedDisplayNameKey = v13->_localizedDisplayNameKey;
    v13->_localizedDisplayNameKey = (NSString *)v16;
  }
  return v13;
}

+ (id)categoryWithLocalizedDisplayName:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(int64_t)a5
{
  id v8 = a3;
  char v9 = (void *)[objc_alloc((Class)a1) initWithPredictionCategoryID:a4 categoryIndex:a5 localizedDisplayName:v8 localizedDisplayNameKey:0];

  return v9;
}

- (id)description
{
  return [(SBHLibraryCategoryIdentifier *)self descriptionWithMultilinePrefix:@"\t"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v8 = a3;
  uint64_t v5 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[SBHLibraryCategoryIdentifier predictionCategoryIndex](self, "predictionCategoryIndex"));
  [v8 encodeObject:v5 forKey:@"predictionCategoryIndexNumber"];

  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBHLibraryCategoryIdentifier predictionCategoryID](self, "predictionCategoryID"));
  [v8 encodeObject:v6 forKey:@"predictionCategoryIDNumber"];

  uint64_t v7 = [(SBHLibraryCategoryIdentifier *)self localizedDisplayName];
  [v8 encodeObject:v7 forKey:@"localizedDisplayName"];

  [v8 encodeObject:self->_localizedDisplayNameKey forKey:@"localizedDisplayNameKey"];
}

- (SBHLibraryCategoryIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionCategoryIDNumber"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionCategoryIndexNumber"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  char v9 = self;
  id v10 = [v4 decodeObjectOfClass:v9 forKey:@"localizedDisplayName"];

  id v11 = self;
  v12 = [v4 decodeObjectOfClass:v11 forKey:@"localizedDisplayNameKey"];

  v13 = [(SBHLibraryCategoryIdentifier *)self initWithPredictionCategoryID:v6 categoryIndex:v8 localizedDisplayName:v10 localizedDisplayNameKey:v12];
  return v13;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBHLibraryCategoryIdentifier *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v5 = [(SBHLibraryCategoryIdentifier *)self localizedDisplayName];
  [v4 appendString:v5 withName:@"localizedDisplayName"];

  id v6 = (id)[v4 appendUnsignedInteger:self->_predictionCategoryID withName:@"predictionCategoryID"];
  unint64_t predictionCategoryIndex = self->_predictionCategoryIndex;
  if (predictionCategoryIndex != -1) {
    id v8 = (id)[v4 appendUnsignedInteger:predictionCategoryIndex withName:@"predictionCategoryIndex"];
  }
  return v4;
}

- (id)succinctDescription
{
  v3 = [(SBHLibraryCategoryIdentifier *)self succinctDescriptionBuilder];
  id v4 = [(SBHLibraryCategoryIdentifier *)self localizedDisplayName];
  [v3 appendString:v4 withName:@"localizedDisplayName"];

  uint64_t v5 = [v3 build];

  return v5;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (unint64_t)predictionCategoryIndex
{
  return self->_predictionCategoryIndex;
}

@end