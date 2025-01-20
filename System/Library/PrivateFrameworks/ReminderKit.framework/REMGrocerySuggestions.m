@interface REMGrocerySuggestions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)suggestedSectionsByReminderTitle;
- (REMGrocerySuggestions)initWithCoder:(id)a3;
- (REMGrocerySuggestions)initWithSuggestedSectionsByReminderTitle:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMGrocerySuggestions

- (REMGrocerySuggestions)initWithSuggestedSectionsByReminderTitle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMGrocerySuggestions;
  v6 = [(REMGrocerySuggestions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_suggestedSectionsByReminderTitle, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = REMDynamicCast(v5, (uint64_t)v4);

  v7 = [(REMGrocerySuggestions *)self suggestedSectionsByReminderTitle];
  v8 = [v6 suggestedSectionsByReminderTitle];
  if (v7 == v8)
  {
    char v11 = 1;
  }
  else
  {
    objc_super v9 = [(REMGrocerySuggestions *)self suggestedSectionsByReminderTitle];
    v10 = [v6 suggestedSectionsByReminderTitle];
    char v11 = [v9 isEqual:v10];
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(REMGrocerySuggestions *)self suggestedSectionsByReminderTitle];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = (void *)[v5 initWithSuggestedSectionsByReminderTitle:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMGrocerySuggestions *)self suggestedSectionsByReminderTitle];
  [v4 encodeObject:v5 forKey:@"suggestedSectionsByReminderTitle"];
}

- (REMGrocerySuggestions)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  objc_super v9 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v10 = [v5 decodeObjectOfClasses:v9 forKey:@"suggestedSectionsByReminderTitle"];

  char v11 = [(REMGrocerySuggestions *)self initWithSuggestedSectionsByReminderTitle:v10];
  return v11;
}

- (NSDictionary)suggestedSectionsByReminderTitle
{
  return self->_suggestedSectionsByReminderTitle;
}

- (void).cxx_destruct
{
}

@end