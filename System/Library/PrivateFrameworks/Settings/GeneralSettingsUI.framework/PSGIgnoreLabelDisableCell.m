@interface PSGIgnoreLabelDisableCell
- (void)setCellEnabled:(BOOL)a3;
@end

@implementation PSGIgnoreLabelDisableCell

- (void)setCellEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PSGIgnoreLabelDisableCell;
  [(PSTableCell *)&v5 setCellEnabled:a3];
  v4 = [(PSTableCell *)self titleLabel];
  [v4 setEnabled:1];
}

@end