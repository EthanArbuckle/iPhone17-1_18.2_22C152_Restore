@interface TFFeedbackForm
- (NSArray)entryGroups;
- (NSString)title;
- (TFFeedbackForm)initWithTitle:(id)a3 entryGroups:(id)a4;
@end

@implementation TFFeedbackForm

- (TFFeedbackForm)initWithTitle:(id)a3 entryGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TFFeedbackForm;
  v8 = [(TFFeedbackForm *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    entryGroups = v8->_entryGroups;
    v8->_entryGroups = (NSArray *)v11;
  }
  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)entryGroups
{
  return self->_entryGroups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryGroups, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end