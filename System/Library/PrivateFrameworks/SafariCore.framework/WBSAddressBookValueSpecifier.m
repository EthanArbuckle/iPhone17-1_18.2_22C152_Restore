@interface WBSAddressBookValueSpecifier
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)category;
- (NSString)classification;
- (NSString)classificationHint;
- (NSString)component;
- (NSString)label;
- (NSString)parentProperty;
- (NSString)property;
- (WBSAddressBookValueSpecifier)initWithProperty:(id)a3 component:(id)a4 label:(id)a5 category:(id)a6 parentProperty:(id)a7 classification:(id)a8 classificationHint:(id)a9;
- (id)description;
- (unint64_t)hash;
@end

@implementation WBSAddressBookValueSpecifier

- (WBSAddressBookValueSpecifier)initWithProperty:(id)a3 component:(id)a4 label:(id)a5 category:(id)a6 parentProperty:(id)a7 classification:(id)a8 classificationHint:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v39.receiver = self;
  v39.super_class = (Class)WBSAddressBookValueSpecifier;
  v22 = [(WBSAddressBookValueSpecifier *)&v39 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    property = v22->_property;
    v22->_property = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    component = v22->_component;
    v22->_component = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    label = v22->_label;
    v22->_label = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    category = v22->_category;
    v22->_category = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    parentProperty = v22->_parentProperty;
    v22->_parentProperty = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    classification = v22->_classification;
    v22->_classification = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    classificationHint = v22->_classificationHint;
    v22->_classificationHint = (NSString *)v35;

    v37 = v22;
  }

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_property hash];
  NSUInteger v4 = [(NSString *)self->_component hash] ^ v3;
  return v4 ^ [(NSString *)self->_label hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (WBSAddressBookValueSpecifier *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      property = self->_property;
      BOOL v9 = 0;
      if (property == v5->_property || -[NSString isEqualToString:](property, "isEqualToString:"))
      {
        component = self->_component;
        if (component == v5->_component || -[NSString isEqualToString:](component, "isEqualToString:"))
        {
          label = self->_label;
          if (label == v5->_label || -[NSString isEqualToString:](label, "isEqualToString:")) {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  NSUInteger v3 = NSString;
  NSUInteger v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p property: %@; component: %@; label: %@>",
    v5,
    self,
    self->_property,
    self->_component,
  v6 = self->_label);

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  NSUInteger v4 = v3;
  property = self->_property;
  if (property) {
    [v3 setObject:property forKeyedSubscript:@"property"];
  }
  component = self->_component;
  if (component) {
    [v4 setObject:component forKeyedSubscript:@"component"];
  }
  label = self->_label;
  if (label) {
    [v4 setObject:label forKeyedSubscript:@"label"];
  }
  category = self->_category;
  if (category) {
    [v4 setObject:category forKeyedSubscript:@"category"];
  }
  parentProperty = self->_parentProperty;
  if (parentProperty) {
    [v4 setObject:parentProperty forKeyedSubscript:@"parentProperty"];
  }
  classification = self->_classification;
  if (classification) {
    [v4 setObject:classification forKeyedSubscript:@"classification"];
  }
  classificationHint = self->_classificationHint;
  if (classificationHint) {
    [v4 setObject:classificationHint forKeyedSubscript:@"classificationHint"];
  }
  return (NSDictionary *)v4;
}

- (NSString)property
{
  return self->_property;
}

- (NSString)component
{
  return self->_component;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)parentProperty
{
  return self->_parentProperty;
}

- (NSString)classification
{
  return self->_classification;
}

- (NSString)classificationHint
{
  return self->_classificationHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationHint, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_parentProperty, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end