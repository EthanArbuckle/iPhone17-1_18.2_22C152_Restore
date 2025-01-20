@interface PKTableViewDiffableDataSourceSection
- (BOOL)isEqual:(id)a3;
- (NSString)footer;
- (NSString)identifier;
- (NSString)title;
- (PKTableViewDiffableDataSourceSection)initWithIdentifier:(id)a3;
- (unint64_t)hash;
- (void)setFooter:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKTableViewDiffableDataSourceSection

- (PKTableViewDiffableDataSourceSection)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTableViewDiffableDataSourceSection;
  v5 = [(PKTableViewDiffableDataSourceSection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKTableViewDiffableDataSourceSection *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if (PKEqualObjects() && PKEqualObjects()) {
      char v7 = PKEqualObjects();
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_footer];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end