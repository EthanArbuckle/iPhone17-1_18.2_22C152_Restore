@interface CNVCardFilteredPersonScope
- (BOOL)isEmpty;
- (CNVCardFilteredPersonScope)initWithExcludedFields:(id)a3 options:(unint64_t)a4;
- (NSSet)excludedFields;
- (unint64_t)filterOptions;
@end

@implementation CNVCardFilteredPersonScope

- (CNVCardFilteredPersonScope)initWithExcludedFields:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNVCardFilteredPersonScope;
  v7 = [(CNVCardFilteredPersonScope *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
    excludedFields = v7->_excludedFields;
    v7->_excludedFields = (NSSet *)v8;

    v7->_filterOptions = a4;
    v10 = v7;
  }

  return v7;
}

- (BOOL)isEmpty
{
  if ([(CNVCardFilteredPersonScope *)self filterOptions]) {
    return 0;
  }
  uint64_t v4 = *MEMORY[0x1E4F5A290];
  v5 = [(CNVCardFilteredPersonScope *)self excludedFields];
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  return v4;
}

- (NSSet)excludedFields
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (void).cxx_destruct
{
}

@end