@interface RAPCheckmarkTableViewCell
+ (NSString)reuseIdentifier;
- (BOOL)isChecked;
- (RAPCheckmarkTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setChecked:(BOOL)a3;
@end

@implementation RAPCheckmarkTableViewCell

- (RAPCheckmarkTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)RAPCheckmarkTableViewCell;
  result = [(RAPSingleLineTableViewCell *)&v5 initWithStyle:a3 reuseIdentifier:a4];
  if (result) {
    result->_checked = 0;
  }
  return result;
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    self->_checked = a3;
    if (a3) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 0;
    }
    [(RAPCheckmarkTableViewCell *)self setAccessoryType:v3];
  }
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"RAPCheckmarkTableViewCell";
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (void).cxx_destruct
{
}

@end