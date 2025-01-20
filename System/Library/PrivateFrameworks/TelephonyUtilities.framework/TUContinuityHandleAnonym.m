@interface TUContinuityHandleAnonym
+ (BOOL)supportsSecureCoding;
- (NSString)identifier;
- (NSString)label;
- (NSString)localizedDisplayName;
- (TUContinuityHandleAnonym)initWithCoder:(id)a3;
- (TUContinuityHandleAnonym)initWithIdentifier:(id)a3 label:(id)a4 localizedDisplayName:(id)a5 type:(int64_t)a6;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUContinuityHandleAnonym

- (TUContinuityHandleAnonym)initWithIdentifier:(id)a3 label:(id)a4 localizedDisplayName:(id)a5 type:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUContinuityHandleAnonym;
  v14 = [(TUContinuityHandleAnonym *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_label, a4);
    objc_storeStrong((id *)&v15->_localizedDisplayName, a5);
    v15->_type = a6;
  }

  return v15;
}

- (NSString)localizedDisplayName
{
  if ([(NSString *)self->_label length])
  {
    v3 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:self->_label];
  }
  else
  {
    v3 = self->_localizedDisplayName;
  }

  return v3;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" label=%@", self->_label];
  [v6 appendFormat:@" localizedDisplayName=%@", self->_localizedDisplayName];
  objc_msgSend(v6, "appendFormat:", @" type=%ld", self->_type);
  [v6 appendFormat:@" identifier=%@", self->_identifier];
  [v6 appendFormat:@">"];
  v7 = (void *)[v6 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuityHandleAnonym)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_identifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_label);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];
  uint64_t v11 = objc_opt_class();
  id v12 = NSStringFromSelector(sel_localizedDisplayName);
  id v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
  v14 = NSStringFromSelector(sel_type);
  uint64_t v15 = [v4 decodeIntegerForKey:v14];

  v16 = [(TUContinuityHandleAnonym *)self initWithIdentifier:v7 label:v10 localizedDisplayName:v13 type:v15];
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_identifier);
  [v5 encodeObject:identifier forKey:v6];

  label = self->_label;
  uint64_t v8 = NSStringFromSelector(sel_label);
  [v5 encodeObject:label forKey:v8];

  localizedDisplayName = self->_localizedDisplayName;
  v10 = NSStringFromSelector(sel_localizedDisplayName);
  [v5 encodeObject:localizedDisplayName forKey:v10];

  int64_t type = self->_type;
  NSStringFromSelector(sel_type);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:type forKey:v12];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end