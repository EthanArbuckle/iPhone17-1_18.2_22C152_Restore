@interface MSVSystemDialogResponse
- (MSVSystemDialogResponse)initWithIdentifier:(int64_t)a3 textFieldValues:(id)a4;
- (NSArray)textFieldValues;
- (id)description;
- (int64_t)buttonIdentifier;
@end

@implementation MSVSystemDialogResponse

- (void).cxx_destruct
{
}

- (NSArray)textFieldValues
{
  return self->_textFieldValues;
}

- (int64_t)buttonIdentifier
{
  return self->_buttonIdentifier;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p, buttonID = %ld, textFieldValues = %@>", objc_opt_class(), self, self->_buttonIdentifier, self->_textFieldValues];
}

- (MSVSystemDialogResponse)initWithIdentifier:(int64_t)a3 textFieldValues:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSVSystemDialogResponse;
  v7 = [(MSVSystemDialogResponse *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_buttonIdentifier = a3;
    uint64_t v9 = [v6 copy];
    textFieldValues = v8->_textFieldValues;
    v8->_textFieldValues = (NSArray *)v9;
  }
  return v8;
}

@end