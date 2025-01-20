@interface PKFieldMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)foundExplicitlyRequestedPass;
- (BOOL)shouldIgnoreField;
- (NSArray)associatedPassIdentifiers;
- (PKFieldMetadata)init;
- (PKFieldMetadata)initWithAssociatedPassIdentifiers:(id)a3 shouldIgnoreField:(BOOL)a4 foundExplicitlyRequestedPass:(BOOL)a5;
- (PKFieldMetadata)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKFieldMetadata

- (BOOL)shouldIgnoreField
{
  return self->_shouldIgnoreField;
}

- (void).cxx_destruct
{
}

- (PKFieldMetadata)initWithAssociatedPassIdentifiers:(id)a3 shouldIgnoreField:(BOOL)a4 foundExplicitlyRequestedPass:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKFieldMetadata;
  v10 = [(PKFieldMetadata *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_associatedPassIdentifiers, a3);
    v11->_shouldIgnoreField = a4;
    v11->_foundExplicitlyRequestedPass = a5;
  }

  return v11;
}

- (PKFieldMetadata)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  associatedPassIdentifiers = self->_associatedPassIdentifiers;
  id v5 = a3;
  [v5 encodeObject:associatedPassIdentifiers forKey:@"associatedPassIdentifiers"];
  [v5 encodeBool:self->_shouldIgnoreField forKey:@"shouldIgnoreField"];
  [v5 encodeBool:self->_foundExplicitlyRequestedPass forKey:@"foundExplicitlyRequestedPass"];
}

- (PKFieldMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKFieldMetadata;
  id v5 = [(PKFieldMetadata *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"associatedPassIdentifiers"];
    associatedPassIdentifiers = v5->_associatedPassIdentifiers;
    v5->_associatedPassIdentifiers = (NSArray *)v9;

    v5->_shouldIgnoreField = [v4 decodeBoolForKey:@"shouldIgnoreField"];
    v5->_foundExplicitlyRequestedPass = [v4 decodeBoolForKey:@"foundExplicitlyRequestedPass"];
  }

  return v5;
}

- (NSArray)associatedPassIdentifiers
{
  return self->_associatedPassIdentifiers;
}

- (BOOL)foundExplicitlyRequestedPass
{
  return self->_foundExplicitlyRequestedPass;
}

@end