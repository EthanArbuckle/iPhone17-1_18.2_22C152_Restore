@interface PKPayLaterDynamicContentSection
- (NSArray)rows;
- (PKApplyFooterContent)footerContent;
- (PKPayLaterDynamicContentSection)initWithDictionary:(id)a3;
- (id)description;
- (void)setFooterContent:(id)a3;
- (void)setRows:(id)a3;
@end

@implementation PKPayLaterDynamicContentSection

- (PKPayLaterDynamicContentSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKArrayContaining:objc_opt_class() forKey:@"rows"];
  v6 = objc_msgSend(v5, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_470);
  v7 = [v4 PKDictionaryForKey:@"footerContent"];

  if ([v7 count]) {
    v8 = [[PKApplyFooterContent alloc] initWithDictionary:v7];
  }
  else {
    v8 = 0;
  }
  if ([v5 count]) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (v9)
  {
    v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PKPayLaterDynamicContentSection;
    v10 = [(PKPayLaterDynamicContentSection *)&v15 init];
    if (v10)
    {
      if ([v6 count])
      {
        uint64_t v11 = [v6 copy];
        rows = v10->_rows;
        v10->_rows = (NSArray *)v11;
      }
      else
      {
        rows = v10->_rows;
        v10->_rows = 0;
      }

      objc_storeStrong((id *)&v10->_footerContent, v8);
    }
    self = v10;
    v13 = self;
  }

  return v13;
}

PKPayLaterDynamicContentPageItem *__54__PKPayLaterDynamicContentSection_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPayLaterDynamicContentPageItem alloc] initWithDictionary:v2];

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_rows) {
    [v3 appendFormat:@"rows: '%@'; ", self->_rows];
  }
  if (self->_footerContent) {
    [v4 appendFormat:@"footerContent: '%@'; ", self->_footerContent];
  }
  [v4 appendFormat:@">"];
  v5 = (void *)[v4 copy];

  return v5;
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (void)setFooterContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end