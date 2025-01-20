@interface PXPeopleDataSourceSection
- (BOOL)isDisclosed;
- (NSString)disclosedTitle;
- (NSString)unDisclosedTitle;
- (PXPeopleDataSourceSection)initWithPersonFetchType:(unint64_t)a3;
- (unint64_t)personFetchType;
- (void)setDisclosed:(BOOL)a3;
- (void)setDisclosedTitle:(id)a3;
- (void)setUnDisclosedTitle:(id)a3;
@end

@implementation PXPeopleDataSourceSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unDisclosedTitle, 0);
  objc_storeStrong((id *)&self->_disclosedTitle, 0);
}

- (void)setUnDisclosedTitle:(id)a3
{
}

- (NSString)unDisclosedTitle
{
  return self->_unDisclosedTitle;
}

- (void)setDisclosedTitle:(id)a3
{
}

- (NSString)disclosedTitle
{
  return self->_disclosedTitle;
}

- (void)setDisclosed:(BOOL)a3
{
  self->_disclosed = a3;
}

- (BOOL)isDisclosed
{
  return self->_disclosed;
}

- (unint64_t)personFetchType
{
  return self->_personFetchType;
}

- (PXPeopleDataSourceSection)initWithPersonFetchType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleDataSourceSection;
  v4 = [(PXPeopleDataSourceSection *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_disclosed = 1;
    disclosedTitle = v4->_disclosedTitle;
    v4->_personFetchType = a3;
    v4->_disclosedTitle = (NSString *)&stru_1F00B0030;

    unDisclosedTitle = v5->_unDisclosedTitle;
    v5->_unDisclosedTitle = (NSString *)&stru_1F00B0030;
  }
  return v5;
}

@end