@interface WFShortcutSuggestionsDescriptor
+ (BOOL)supportsSecureCoding;
- (NSArray)suggestions;
- (WFShortcutSuggestionsDescriptor)initWithCoder:(id)a3;
- (WFShortcutSuggestionsDescriptor)initWithIdentifier:(id)a3 suggestions:(id)a4 availability:(unint64_t)a5;
- (unint64_t)availability;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFShortcutSuggestionsDescriptor

- (void).cxx_destruct
{
}

- (unint64_t)availability
{
  return self->_availability;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFShortcutSuggestionsDescriptor;
  id v4 = a3;
  [(WFShortcutSuggestionsDescriptor *)&v6 encodeWithCoder:v4];
  v5 = [(WFShortcutSuggestionsDescriptor *)self suggestions];
  [v4 encodeObject:v5 forKey:@"suggestions"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFShortcutSuggestionsDescriptor availability](self, "availability"), @"availability");
}

- (WFShortcutSuggestionsDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFShortcutSuggestionsDescriptor;
  v5 = [(WFShortcutSuggestionsDescriptor *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"suggestions"];
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v9;

    v5->_availability = [v4 decodeIntegerForKey:@"availability"];
    v11 = v5;
  }

  return v5;
}

- (WFShortcutSuggestionsDescriptor)initWithIdentifier:(id)a3 suggestions:(id)a4 availability:(unint64_t)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFShortcutSuggestionsDescriptor;
  uint64_t v9 = [(WFShortcutSuggestionsDescriptor *)&v14 initWithIdentifier:a3 objectType:6];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    suggestions = v9->_suggestions;
    v9->_suggestions = (NSArray *)v10;

    v9->_availability = a5;
    v12 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end