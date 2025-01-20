@interface TFFeedbackEntry
- (NSString)identifier;
- (NSString)title;
- (TFFeedbackEntry)initWithType:(unint64_t)a3 identifier:(id)a4 title:(id)a5;
- (unint64_t)type;
@end

@implementation TFFeedbackEntry

- (TFFeedbackEntry)initWithType:(unint64_t)a3 identifier:(id)a4 title:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TFFeedbackEntry;
  v10 = [(TFFeedbackEntry *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    title = v11->_title;
    v11->_title = (NSString *)v14;
  }
  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end