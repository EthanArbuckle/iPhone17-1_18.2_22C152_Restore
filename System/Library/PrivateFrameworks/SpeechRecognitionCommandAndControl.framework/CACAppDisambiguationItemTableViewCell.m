@interface CACAppDisambiguationItemTableViewCell
- (CACAppDisambiguationItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CACAppDisambiguationItemTableViewCell

- (CACAppDisambiguationItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CACAppDisambiguationItemTableViewCell;
  return [(CACAppDisambiguationItemTableViewCell *)&v5 initWithStyle:0 reuseIdentifier:a4];
}

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)CACAppDisambiguationItemTableViewCell;
  [(CACAppDisambiguationItemTableViewCell *)&v2 awakeFromNib];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CACAppDisambiguationItemTableViewCell;
  [(CACAppDisambiguationItemTableViewCell *)&v4 setSelected:a3 animated:a4];
}

@end