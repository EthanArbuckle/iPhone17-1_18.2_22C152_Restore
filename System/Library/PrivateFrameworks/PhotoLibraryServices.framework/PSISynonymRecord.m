@interface PSISynonymRecord
- (NSString)identifier;
- (NSString)synonym;
- (PSISynonymRecord)initWithSynonym:(id)a3 category:(signed __int16)a4 identifier:(id)a5;
- (signed)category;
- (void)setCategory:(signed __int16)a3;
- (void)setIdentifier:(id)a3;
- (void)setSynonym:(id)a3;
@end

@implementation PSISynonymRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_synonym, 0);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setCategory:(signed __int16)a3
{
  self->_category = a3;
}

- (signed)category
{
  return self->_category;
}

- (void)setSynonym:(id)a3
{
}

- (NSString)synonym
{
  return self->_synonym;
}

- (PSISynonymRecord)initWithSynonym:(id)a3 category:(signed __int16)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PSISynonymRecord;
  v10 = [(PSISynonymRecord *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    synonym = v10->_synonym;
    v10->_synonym = (NSString *)v11;

    v10->_category = a4;
    uint64_t v13 = [v9 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v13;
  }
  return v10;
}

@end