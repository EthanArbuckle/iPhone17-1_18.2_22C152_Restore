@interface TFFeedbackEntryShortText
- (NSString)placeholder;
- (TFFeedbackEntryShortText)initWithIdentifier:(id)a3 title:(id)a4 placeholder:(id)a5 contentType:(unint64_t)a6;
- (unint64_t)contentType;
@end

@implementation TFFeedbackEntryShortText

- (TFFeedbackEntryShortText)initWithIdentifier:(id)a3 title:(id)a4 placeholder:(id)a5 contentType:(unint64_t)a6
{
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TFFeedbackEntryShortText;
  v11 = [(TFFeedbackEntry *)&v15 initWithType:0 identifier:a3 title:a4];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    placeholder = v11->_placeholder;
    v11->_placeholder = (NSString *)v12;

    v11->_contentType = a6;
  }

  return v11;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
}

@end