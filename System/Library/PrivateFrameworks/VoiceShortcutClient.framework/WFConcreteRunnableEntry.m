@interface WFConcreteRunnableEntry
+ (BOOL)supportsSecureCoding;
- (NSString)identifier;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (WFConcreteRunnableEntry)initWithCoder:(id)a3;
- (WFConcreteRunnableEntry)initWithIdentifier:(id)a3 name:(id)a4 entryIcon:(id)a5 accessoryIcon:(id)a6 serializedParameterState:(id)a7;
- (WFIcon)accessoryIcon;
- (WFIcon)entryIcon;
- (WFPropertyListObject)serializedParameterState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFConcreteRunnableEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedParameterState, 0);
  objc_storeStrong((id *)&self->_accessoryIcon, 0);
  objc_storeStrong((id *)&self->_entryIcon, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (WFPropertyListObject)serializedParameterState
{
  return self->_serializedParameterState;
}

- (WFIcon)accessoryIcon
{
  return self->_accessoryIcon;
}

- (WFIcon)entryIcon
{
  return self->_entryIcon;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFConcreteRunnableEntry *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(WFConcreteRunnableEntry *)self uniqueIdentifier];
  [v4 encodeObject:v6 forKey:@"uniqueIdentifier"];

  v7 = [(WFConcreteRunnableEntry *)self name];
  [v4 encodeObject:v7 forKey:@"name"];

  v8 = [(WFConcreteRunnableEntry *)self entryIcon];
  [v4 encodeObject:v8 forKey:@"entryIcon"];

  v9 = [(WFConcreteRunnableEntry *)self accessoryIcon];
  [v4 encodeObject:v9 forKey:@"accessoryIcon"];

  id v10 = [(WFConcreteRunnableEntry *)self serializedParameterState];
  [v4 encodeObject:v10 forKey:@"serializedParameterState"];
}

- (WFConcreteRunnableEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFConcreteRunnableEntry;
  v5 = [(WFConcreteRunnableEntry *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entryIcon"];
    entryIcon = v5->_entryIcon;
    v5->_entryIcon = (WFIcon *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryIcon"];
    accessoryIcon = v5->_accessoryIcon;
    v5->_accessoryIcon = (WFIcon *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"serializedParameterState"];
    serializedParameterState = v5->_serializedParameterState;
    v5->_serializedParameterState = (WFPropertyListObject *)v23;

    v25 = v5;
  }

  return v5;
}

- (WFConcreteRunnableEntry)initWithIdentifier:(id)a3 name:(id)a4 entryIcon:(id)a5 accessoryIcon:(id)a6 serializedParameterState:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)WFConcreteRunnableEntry;
  uint64_t v17 = [(WFConcreteRunnableEntry *)&v27 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v21 = [v20 UUIDString];
    uniqueIdentifier = v17->_uniqueIdentifier;
    v17->_uniqueIdentifier = (NSString *)v21;

    uint64_t v23 = [v13 copy];
    name = v17->_name;
    v17->_name = (NSString *)v23;

    objc_storeStrong((id *)&v17->_entryIcon, a5);
    objc_storeStrong((id *)&v17->_accessoryIcon, a6);
    objc_storeStrong((id *)&v17->_serializedParameterState, a7);
    v25 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end