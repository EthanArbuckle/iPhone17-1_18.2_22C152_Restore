@interface PSMultilineSubtitleSwitchTableViewCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PSMultilineSubtitleSwitchTableViewCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(PSMultilineSubtitleSwitchTableViewCell *)self detailTextLabel];
  [v5 setNumberOfLines:0];

  v6.receiver = self;
  v6.super_class = (Class)PSMultilineSubtitleSwitchTableViewCell;
  [(PSSubtitleSwitchTableCell *)&v6 refreshCellContentsWithSpecifier:v4];

  [(PSMultilineSubtitleSwitchTableViewCell *)self setNeedsLayout];
}

@end