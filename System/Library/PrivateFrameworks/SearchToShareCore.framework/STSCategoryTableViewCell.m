@interface STSCategoryTableViewCell
- (STSCategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)showSeperator:(BOOL)a3;
@end

@implementation STSCategoryTableViewCell

- (STSCategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)STSCategoryTableViewCell;
  return [(STSCategoryTableViewCell *)&v5 initWithStyle:a3 reuseIdentifier:a4];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)STSCategoryTableViewCell;
  [(STSCategoryTableViewCell *)&v3 prepareForReuse];
  [(STSCategoryTableViewCell *)self showSeperator:0];
}

- (void)showSeperator:(BOOL)a3
{
}

- (void).cxx_destruct
{
}

@end