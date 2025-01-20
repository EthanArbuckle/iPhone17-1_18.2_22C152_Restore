@interface MTATimerBaseCell
+ (double)estimatedCellHeightForTimerWithTitle:(id)a3;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MTATimerBaseCell

+ (double)estimatedCellHeightForTimerWithTitle:(id)a3
{
  return 110.0;
}

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)MTATimerBaseCell;
  [(MTATimerBaseCell *)&v2 awakeFromNib];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)MTATimerBaseCell;
  [(MTATimerBaseCell *)&v4 setSelected:a3 animated:a4];
}

@end