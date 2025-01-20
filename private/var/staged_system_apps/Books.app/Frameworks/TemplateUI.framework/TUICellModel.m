@interface TUICellModel
- (TUIIdentifier)identifier;
- (unint64_t)columnSpan;
- (unint64_t)rowSpan;
- (void)setColumnSpan:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setRowSpan:(unint64_t)a3;
@end

@implementation TUICellModel

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)rowSpan
{
  return self->_rowSpan;
}

- (void)setRowSpan:(unint64_t)a3
{
  self->_rowSpan = a3;
}

- (unint64_t)columnSpan
{
  return self->_columnSpan;
}

- (void)setColumnSpan:(unint64_t)a3
{
  self->_columnSpan = a3;
}

- (void).cxx_destruct
{
}

@end