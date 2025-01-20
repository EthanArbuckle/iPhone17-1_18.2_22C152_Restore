@interface WFEntityPickerDialogRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)items;
- (NSString)actionIdentifier;
- (NSString)parameterKey;
- (WFEntityPickerDialogRequest)initWithActionIdentifier:(id)a3 parameterKey:(id)a4 items:(id)a5 attribution:(id)a6 prompt:(id)a7;
- (WFEntityPickerDialogRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFEntityPickerDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_parameterKey, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFEntityPickerDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v8 encodeWithCoder:v4];
  v5 = [(WFEntityPickerDialogRequest *)self actionIdentifier];
  [v4 encodeObject:v5 forKey:@"actionIdentifier"];

  v6 = [(WFEntityPickerDialogRequest *)self parameterKey];
  [v4 encodeObject:v6 forKey:@"parameterKey"];

  v7 = [(WFEntityPickerDialogRequest *)self items];
  [v4 encodeObject:v7 forKey:@"items"];
}

- (WFEntityPickerDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFEntityPickerDialogRequest;
  v5 = [(WFDialogRequest *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterKey"];
    parameterKey = v5->_parameterKey;
    v5->_parameterKey = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSArray *)v13;

    v15 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFEntityPickerDialogRequest *)self actionIdentifier];
  v7 = [(WFEntityPickerDialogRequest *)self parameterKey];
  uint64_t v8 = [(WFEntityPickerDialogRequest *)self items];
  v9 = [v3 stringWithFormat:@"<%@: %p, actionId: %@, parameterKey: %@, items: %@", v5, self, v6, v7, v8];

  return v9;
}

- (WFEntityPickerDialogRequest)initWithActionIdentifier:(id)a3 parameterKey:(id)a4 items:(id)a5 attribution:(id)a6 prompt:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFEntityPickerDialogRequest;
  v15 = [(WFDialogRequest *)&v22 initWithAttribution:a6 prompt:a7];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    actionIdentifier = v15->_actionIdentifier;
    v15->_actionIdentifier = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    parameterKey = v15->_parameterKey;
    v15->_parameterKey = (NSString *)v18;

    objc_storeStrong((id *)&v15->_items, a5);
    v20 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end