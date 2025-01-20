@interface WBSAddressBookMatch
+ (BOOL)supportsSecureCoding;
+ (id)addressBookMatchWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)dateValue;
- (NSDictionary)dictionaryRepresentation;
- (NSString)completion;
- (NSString)description;
- (NSString)identifier;
- (NSString)key;
- (NSString)label;
- (NSString)property;
- (NSString)stringValue;
- (NSString)uniqueID;
- (WBSAddressBookMatch)initWithCoder:(id)a3;
- (WBSAddressBookMatch)initWithValue:(id)a3 property:(id)a4 key:(id)a5 identifier:(id)a6;
- (WBSAddressBookMatch)initWithValue:(id)a3 property:(id)a4 key:(id)a5 identifier:(id)a6 label:(id)a7;
- (WBSAddressBookMatch)initWithValue:(id)a3 property:(id)a4 key:(id)a5 identifier:(id)a6 label:(id)a7 uniqueID:(id)a8;
- (unint64_t)hash;
- (void)_setValue:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setProperty:(id)a3;
@end

@implementation WBSAddressBookMatch

- (void)_setValue:(id)a3
{
  if (self->_value != a3)
  {
    v4 = (void *)[a3 copy];
    id value = self->_value;
    self->_id value = v4;
  }
}

- (NSString)stringValue
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id value = self->_value;
  }
  else {
    id value = 0;
  }
  return (NSString *)value;
}

- (NSDate)dateValue
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id value = self->_value;
  }
  else {
    id value = 0;
  }
  return (NSDate *)value;
}

- (WBSAddressBookMatch)initWithValue:(id)a3 property:(id)a4 key:(id)a5 identifier:(id)a6
{
  return [(WBSAddressBookMatch *)self initWithValue:a3 property:a4 key:a5 identifier:a6 label:0];
}

- (WBSAddressBookMatch)initWithValue:(id)a3 property:(id)a4 key:(id)a5 identifier:(id)a6 label:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)WBSAddressBookMatch;
  v17 = [(WBSAddressBookMatch *)&v30 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    id value = v17->_value;
    v17->_id value = (id)v18;

    uint64_t v20 = [v13 copy];
    property = v17->_property;
    v17->_property = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    key = v17->_key;
    v17->_key = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    label = v17->_label;
    v17->_label = (NSString *)v26;

    v28 = v17;
  }

  return v17;
}

- (WBSAddressBookMatch)initWithValue:(id)a3 property:(id)a4 key:(id)a5 identifier:(id)a6 label:(id)a7 uniqueID:(id)a8
{
  id v14 = a8;
  id v15 = [(WBSAddressBookMatch *)self initWithValue:a3 property:a4 key:a5 identifier:a6 label:a7];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    uniqueID = v15->_uniqueID;
    v15->_uniqueID = (NSString *)v16;

    uint64_t v18 = v15;
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_value hash];
  NSUInteger v4 = [(NSString *)self->_property hash] ^ v3;
  return v4 ^ [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (WBSAddressBookMatch *)a3;
  if (v4 == self)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(WBSAddressBookMatch *)self stringValue];
      v19 = [(WBSAddressBookMatch *)self dateValue];
      v7 = [(WBSAddressBookMatch *)v5 stringValue];
      v8 = [(WBSAddressBookMatch *)v5 dateValue];
      v9 = [(WBSAddressBookMatch *)v5 property];
      v10 = [(WBSAddressBookMatch *)v5 key];
      v11 = [(WBSAddressBookMatch *)v5 identifier];
      id v12 = [(WBSAddressBookMatch *)v5 label];
      if ((v6 == v7 || [v6 isEqualToString:v7])
        && (v19 == v8 || [v19 isEqualToDate:v8])
        && ((property = self->_property, property == v9)
         || [(NSString *)property isEqualToString:v9])
        && ((key = self->_key, key == v10) || [(NSString *)key isEqualToString:v10])
        && ((identifier = self->_identifier, identifier == v11)
         || [(NSString *)identifier isEqualToString:v11]))
      {
        label = self->_label;
        if (label == v12) {
          char v17 = 1;
        }
        else {
          char v17 = [(NSString *)label isEqualToString:v12];
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

- (NSString)description
{
  uint64_t v3 = [(WBSAddressBookMatch *)self dateValue];
  NSUInteger v4 = v3;
  if (v3) {
    [v3 description];
  }
  else {
  v5 = [(WBSAddressBookMatch *)self stringValue];
  }
  if ([(NSString *)self->_key length])
  {
    [NSString stringWithFormat:@"; key = %@", self->_key];
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1EFBE3CF8;
  }
  if ([(NSString *)self->_identifier length])
  {
    [NSString stringWithFormat:@"; identifier = %@", self->_identifier];
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1EFBE3CF8;
  }
  if ([(NSString *)self->_label length])
  {
    [NSString stringWithFormat:@"; label = '%@'", self->_label];
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1EFBE3CF8;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p%@; property = %@%@; id value = '%@'%@>",
    objc_opt_class(),
    self,
    v8,
    self->_property,
    v6,
    v5,
  v9 = v7);

  return (NSString *)v9;
}

- (NSString)completion
{
  return (NSString *)self->_value;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v3 = objc_opt_new();
  NSUInteger v4 = v3;
  id value = self->_value;
  if (value) {
    [v3 setObject:value forKeyedSubscript:@"Value"];
  }
  property = self->_property;
  if (property) {
    [v4 setObject:property forKeyedSubscript:@"Property"];
  }
  key = self->_key;
  if (key) {
    [v4 setObject:key forKeyedSubscript:@"Key"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKeyedSubscript:@"Identifier"];
  }
  label = self->_label;
  if (label) {
    [v4 setObject:label forKeyedSubscript:@"Label"];
  }
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v4 setObject:uniqueID forKeyedSubscript:@"UniqueID"];
  }
  return (NSDictionary *)v4;
}

+ (id)addressBookMatchWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "safari_stringForKey:", @"Value");
  v6 = objc_msgSend(v4, "safari_stringForKey:", @"Property");
  v7 = objc_msgSend(v4, "safari_stringForKey:", @"Key");
  v8 = objc_msgSend(v4, "safari_stringForKey:", @"Identifier");
  v9 = objc_msgSend(v4, "safari_stringForKey:", @"Label");
  v10 = objc_msgSend(v4, "safari_stringForKey:", @"UniqueID");

  v11 = (void *)[objc_alloc((Class)a1) initWithValue:v5 property:v6 key:v7 identifier:v8 label:v9 uniqueID:v10];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSAddressBookMatch)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSAddressBookMatch;
  v5 = [(WBSAddressBookMatch *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Value"];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Property"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Key"];
    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Label"];
    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UniqueID"];
    v5 = [(WBSAddressBookMatch *)v5 initWithValue:v9 property:v10 key:v11 identifier:v12 label:v13 uniqueID:v14];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id value = self->_value;
  id v5 = a3;
  [v5 encodeObject:value forKey:@"Value"];
  [v5 encodeObject:self->_property forKey:@"Property"];
  [v5 encodeObject:self->_key forKey:@"Key"];
  [v5 encodeObject:self->_identifier forKey:@"Identifier"];
  [v5 encodeObject:self->_label forKey:@"Label"];
  [v5 encodeObject:self->_uniqueID forKey:@"UniqueID"];
}

- (NSString)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong(&self->_value, 0);
}

@end