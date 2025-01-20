@interface UIPrintOptionCell
- (void)prepareForReuse;
@end

@implementation UIPrintOptionCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)UIPrintOptionCell;
  [(UIPrintOptionCell *)&v3 prepareForReuse];
  [(UIPrintOptionCell *)self setAccessoryView:0];
  [(UIPrintOptionCell *)self setContentConfiguration:0];
}

@end