@interface THSearchTableViewNoResultsCell
- (THSearchTableViewNoResultsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setSearchKind:(int)a3;
@end

@implementation THSearchTableViewNoResultsCell

- (THSearchTableViewNoResultsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THSearchTableViewNoResultsCell;
  v4 = [(THSearchTableViewNoResultsCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(THSearchTableViewNoResultsCell *)v4 setSelectionStyle:0];
    [(-[THSearchTableViewNoResultsCell textLabel](v5, "textLabel")) setFont:+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 14.0)];
    [v5 textLabel].textAlignment = 1;
    [(-[THSearchTableViewNoResultsCell textLabel](v5, "textLabel")) setTextColor:[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.298039228, 1.0)];
    [(-[THSearchTableViewNoResultsCell textLabel](v5, "textLabel")) setText:[THBundle localizedStringForKey:@"Search Completed" value:&stru_46D7E8 table:0]];
    [v5 detailTextLabel].font = [UIFont systemFontOfSize:13.0];
    [v5 detailTextLabel].textAlignment = 1;
    [(-[THSearchTableViewNoResultsCell detailTextLabel](v5, "detailTextLabel")) setTextColor:[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.101960786, 1.0)];
  }
  return v5;
}

- (void)setSearchKind:(int)a3
{
  v5 = (void *)THBundle();
  if (a3) {
    CFStringRef v6 = @"No matches in media found.";
  }
  else {
    CFStringRef v6 = @"No matches in text found.";
  }
  id v7 = [v5 localizedStringForKey:v6 value:&stru_46D7E8 table:0];
  id v8 = [(THSearchTableViewNoResultsCell *)self textLabel];

  [v8 setText:v7];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)THSearchTableViewNoResultsCell;
  [(THSearchTableViewNoResultsCell *)&v6 layoutSubviews];
  [self contentView].bounds;
  double MidX = CGRectGetMidX(v7);
  [self textLabel].center;
  [self textLabel].center = MidX, v4;
  [self textLabel].frame;
  CGRect v9 = CGRectIntegral(v8);
  [self textLabel].frame = CGRectMake(v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  [self detailTextLabel].center;
  [self.detailTextLabel setCenter:MidX, v5];
  [self detailTextLabel].frame;
  CGRect v11 = CGRectIntegral(v10);
  [self.detailTextLabel setFrame:CGRectMake(v11.origin.x, v11.origin.y, v11.size.width, v11.size.height)];
  [self textLabel].textAlignment = 1;
  [self textLabel].setNeedsLayout;
  [self textLabel].text = @"No results";
  [self.detailTextLabel setTextAlignment:1];
  [self.detailTextLabel setNeedsLayout];
  [self.detailTextLabel layoutIfNeeded];
  objc_msgSend(objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](self, "textLabel"), "layer"), "removeAllAnimations");
  objc_msgSend(objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](self, "detailTextLabel"), "layer"), "removeAllAnimations");
}

@end