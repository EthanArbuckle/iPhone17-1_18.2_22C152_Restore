@interface TFFeedbackEntryLongText
- (NSString)placeholder;
- (TFFeedbackEntryLongText)initWithIdentifier:(id)a3 title:(id)a4 placeholder:(id)a5;
@end

@implementation TFFeedbackEntryLongText

- (TFFeedbackEntryLongText)initWithIdentifier:(id)a3 title:(id)a4 placeholder:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TFFeedbackEntryLongText;
  v9 = [(TFFeedbackEntry *)&v13 initWithType:1 identifier:a3 title:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    placeholder = v9->_placeholder;
    v9->_placeholder = (NSString *)v10;
  }
  return v9;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void).cxx_destruct
{
}

@end