@interface THGlossaryTermTableViewCell
- (BOOL)isFollowingCellHighlighted;
- (BOOL)isFollowingCellSelected;
- (BOOL)isLastEntryAppearance;
- (BOOL)preferDarkAppearance;
- (THGlossaryTermTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (THGlossaryTermTableViewCellDelegate)delegate;
- (THLabelWithWordHighlights)labelWithHighlights;
- (UIView)separatorView;
- (void)dealloc;
- (void)p_setSelectedAppearanceLastEntry:(BOOL)a3 animated:(BOOL)a4;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setFollowingCellHighlighted:(BOOL)a3;
- (void)setFollowingCellSelected:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLastEntryAppearance:(BOOL)a3;
- (void)setPreferDarkAppearance:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSeparatorView:(id)a3;
@end

@implementation THGlossaryTermTableViewCell

- (THGlossaryTermTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THGlossaryTermTableViewCell;
  v4 = [(THGlossaryTermTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v4->mSelectedAppearance = 0;
    v4->mLastEntryAppearance = 0;
    id v6 = objc_alloc((Class)UIView);
    [(THGlossaryTermTableViewCell *)v5 frame];
    id v7 = [v6 initWithFrame:];
    [(THGlossaryTermTableViewCell *)v5 setSelectedBackgroundView:v7];
  }
  return v5;
}

- (void)dealloc
{
  self->mLabelWithHighlights = 0;
  self->_separatorView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryTermTableViewCell;
  [(THGlossaryTermTableViewCell *)&v3 dealloc];
}

- (THLabelWithWordHighlights)labelWithHighlights
{
  result = self->mLabelWithHighlights;
  if (!result)
  {
    [self contentView].bounds
    id v6 = -[THLabelWithWordHighlights initWithFrame:]([THLabelWithWordHighlights alloc], "initWithFrame:", 0.0, 0.0, v4, v5);
    self->mLabelWithHighlights = v6;
    [(THLabelWithWordHighlights *)v6 setContentMode:7];
    [self->mLabelWithHighlights addSubview:[self contentView]];
    return self->mLabelWithHighlights;
  }
  return result;
}

- (UIView)separatorView
{
  result = self->_separatorView;
  if (!result)
  {
    [self contentView].bounds;
    self->_separatorView = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, v4, v5];
    [self->_contentView addSubview:self->_separatorView];
    return self->_separatorView;
  }
  return result;
}

- (void)p_setSelectedAppearanceLastEntry:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if ([(THGlossaryTermTableViewCell *)self isSelected]) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = [(THGlossaryTermTableViewCell *)self isHighlighted];
  }
  if ([(THGlossaryTermTableViewCell *)self isFollowingCellSelected]) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = [(THGlossaryTermTableViewCell *)self isFollowingCellHighlighted];
  }
  if (self->mSelectedAppearance == v6 && self->mFollowingCellSelectedAppearance == v7)
  {
    int v8 = 0;
  }
  else
  {
    [(UIView *)[(THGlossaryTermTableViewCell *)self separatorView] setHidden:v6 | v7];
    self->mSelectedAppearance = v6;
    self->mFollowingCellSelectedAppearance = v7;
    int v8 = 1;
  }
  objc_super v9 = [(THGlossaryTermTableViewCell *)self labelWithHighlights];
  if (self->mLastEntryAppearance == v4)
  {
    if (!v8) {
      return;
    }
  }
  else
  {
    if (v4) {
      v10 = +[UIColor blueColor];
    }
    else {
      v10 = +[UIColor colorWithWhite:0.203921569 alpha:1.0];
    }
    v11 = v10;
    [(THLabelWithWordHighlights *)v9 setTextColor:v10];
    [(THLabelWithWordHighlights *)v9 setHighlightedTextColor:v11];
    self->mLastEntryAppearance = v4;
  }
  [(THGlossaryTermTableViewCell *)self setNeedsDisplay];

  [(THLabelWithWordHighlights *)v9 setNeedsDisplay];
}

- (void)prepareForReuse
{
  [(THGlossaryTermTableViewCell *)self setFollowingCellHighlighted:0];
  [(THGlossaryTermTableViewCell *)self setFollowingCellSelected:0];
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryTermTableViewCell;
  [(THGlossaryTermTableViewCell *)&v3 prepareForReuse];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)THGlossaryTermTableViewCell;
  -[THGlossaryTermTableViewCell setSelected:animated:](&v8, "setSelected:animated:");
  [(THGlossaryTermTableViewCellDelegate *)[(THGlossaryTermTableViewCell *)self delegate] glossaryTermTableCell:self selected:v5];
  if (v5) {
    id v7 = [(THGlossaryTermTableViewCell *)self selectedBackgroundView];
  }
  else {
    id v7 = [(THGlossaryTermTableViewCell *)self contentView];
  }
  -[THGlossaryTermTableViewCell setBackgroundColor:](self, "setBackgroundColor:", [v7 backgroundColor]);
  [(THGlossaryTermTableViewCell *)self p_setSelectedAppearanceLastEntry:self->mLastEntryAppearance animated:v4];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)THGlossaryTermTableViewCell;
  -[THGlossaryTermTableViewCell setHighlighted:animated:](&v6, "setHighlighted:animated:", a3);
  [(THGlossaryTermTableViewCell *)self p_setSelectedAppearanceLastEntry:self->mLastEntryAppearance animated:v4];
}

- (void)setLastEntryAppearance:(BOOL)a3
{
}

- (void)setFollowingCellHighlighted:(BOOL)a3
{
  if (self->mFollowingCellHighlighted != a3)
  {
    self->mFollowingCellHighlighted = a3;
    [(THGlossaryTermTableViewCell *)self p_setSelectedAppearanceLastEntry:self->mLastEntryAppearance animated:0];
  }
}

- (void)setFollowingCellSelected:(BOOL)a3
{
  if (self->mFollowingCellSelected != a3)
  {
    self->mFollowingCellSelected = a3;
    [(THGlossaryTermTableViewCell *)self p_setSelectedAppearanceLastEntry:self->mLastEntryAppearance animated:0];
  }
}

- (BOOL)isLastEntryAppearance
{
  return self->mLastEntryAppearance;
}

- (BOOL)isFollowingCellHighlighted
{
  return self->mFollowingCellHighlighted;
}

- (BOOL)isFollowingCellSelected
{
  return self->mFollowingCellSelected;
}

- (THGlossaryTermTableViewCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THGlossaryTermTableViewCellDelegate *)a3;
}

- (void)setSeparatorView:(id)a3
{
}

- (BOOL)preferDarkAppearance
{
  return self->_preferDarkAppearance;
}

- (void)setPreferDarkAppearance:(BOOL)a3
{
  self->_preferDarkAppearance = a3;
}

@end