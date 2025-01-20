@interface _MoreEventsView
- (BOOL)isCompact;
- (BOOL)isNarrow;
- (_MoreEventsView)init;
- (double)pillInset;
- (id)stringAttributes;
- (int64_t)numberOfEvents;
- (void)_updateString;
- (void)draw;
- (void)loadViewsIfNeeded;
- (void)reset;
- (void)setFrame:(CGRect)a3;
- (void)setIsCompact:(BOOL)a3;
- (void)setNumberOfEvents:(int64_t)a3;
- (void)update;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation _MoreEventsView

- (_MoreEventsView)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MoreEventsView;
  v2 = [(_MoreEventsView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_numberOfEvents = 0;
    string = v2->_string;
    v2->_string = (NSString *)&stru_1001D6918;
  }
  return v3;
}

- (void)loadViewsIfNeeded
{
  if (!self->_label)
  {
    v3 = (UILabel *)objc_opt_new();
    label = self->_label;
    self->_label = v3;

    [(UILabel *)self->_label setClipsToBounds:0];
    id v5 = objc_alloc((Class)NSAttributedString);
    string = self->_string;
    v7 = [(_MoreEventsView *)self stringAttributes];
    id v8 = [v5 initWithString:string attributes:v7];
    [(UILabel *)self->_label setAttributedText:v8];

    v9 = self->_label;
    [(_MoreEventsView *)self addSubview:v9];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3) {
    [(_MoreEventsView *)self loadViewsIfNeeded];
  }
}

- (void)reset
{
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_renderFrame = &self->_renderFrame;
  BOOL v9 = self->_renderFrame.size.width == a3.size.width && self->_renderFrame.size.height == a3.size.height;
  if (v9
    && ((v10 = self->_label) == 0
     || (([(UILabel *)v10 frame], v12 == width) ? (BOOL v13 = v11 == height) : (BOOL v13 = 0), v13)))
  {
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    double MidX = CGRectGetMidX(v19);
    v20.origin.double x = x;
    v20.origin.double y = y;
    v20.size.double width = width;
    v20.size.double height = height;
    CGFloat MidY = CGRectGetMidY(v20);
    v18.receiver = self;
    v18.super_class = (Class)_MoreEventsView;
    -[_MoreEventsView setCenter:](&v18, "setCenter:", MidX, MidY);
  }
  else
  {
    label = self->_label;
    if (label) {
      -[UILabel setFrame:](label, "setFrame:", 0.0, 0.0, p_renderFrame->size.width, p_renderFrame->size.height);
    }
    p_renderFrame->origin.double x = x;
    p_renderFrame->origin.double y = y;
    p_renderFrame->size.double width = width;
    p_renderFrame->size.double height = height;
    v17.receiver = self;
    v17.super_class = (Class)_MoreEventsView;
    -[_MoreEventsView setFrame:](&v17, "setFrame:", x, y, width, height);
  }
  p_renderFrame->origin.double x = x;
  p_renderFrame->origin.double y = y;
  p_renderFrame->size.double width = width;
  p_renderFrame->size.double height = height;
}

- (void)setIsCompact:(BOOL)a3
{
  if (self->_isCompact != a3)
  {
    self->_isCompact = a3;
    [(_MoreEventsView *)self _updateString];
  }
}

- (void)update
{
  [(_MoreEventsView *)self _updateString];

  [(_MoreEventsView *)self setNeedsLayout];
}

- (void)_updateString
{
  if (self->_isCompact)
  {
    if (qword_100216600 != -1) {
      dispatch_once(&qword_100216600, &stru_1001D3118);
    }
    id v13 = +[NSNumber numberWithInteger:self->_numberOfEvents];
    v3 = [qword_1002165F8 objectForKey:];
    if (!v3)
    {
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      id v5 = [v4 localizedStringForKey:@"+%ld" value:&stru_1001D6918 table:0];
      v3 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, self->_numberOfEvents);

      [(id)qword_1002165F8 setObject:v3 forKey:v13];
    }
    if (![(NSString *)self->_string isEqualToString:v3])
    {
      objc_storeStrong((id *)&self->_string, v3);
      if (self->_label)
      {
        id v6 = objc_alloc((Class)NSAttributedString);
        string = self->_string;
        id v8 = [(_MoreEventsView *)self stringAttributes];
        id v9 = [v6 initWithString:string attributes:v8];
        [(UILabel *)self->_label setAttributedText:v9];
      }
    }
  }
  else
  {
    if (qword_100216610 != -1) {
      dispatch_once(&qword_100216610, &stru_1001D3138);
    }
    id v13 = +[NSNumber numberWithInteger:self->_numberOfEvents];
    [qword_100216608 objectForKey:];
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      double v11 = +[NSBundle bundleForClass:objc_opt_class()];
      double v12 = [v11 localizedStringForKey:@"+%ld more" value:&stru_1001D6918 table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, self->_numberOfEvents);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();

      [(id)qword_100216608 setObject:v10 forKey:v13];
    }
    v3 = self->_string;
    self->_string = v10;
  }
}

- (BOOL)isNarrow
{
  if (!self->_isCompact) {
    return 0;
  }
  double height = self->_renderFrame.size.height;
  +[MonthViewOccurrence compactOccurrenceHeight];
  return height < v3;
}

- (double)pillInset
{
  [(_MoreEventsView *)self isNarrow];

  CalRoundToScreenScale();
  return result;
}

- (id)stringAttributes
{
  BOOL isCompact = self->_isCompact;
  double height = self->_renderFrame.size.height;
  +[MonthViewOccurrence compactOccurrenceHeight];

  return +[MonthWeekOccurrencesView xMoreStringAttributesCompact:isCompact narrow:height < v4];
}

- (void)draw
{
  double x = self->_renderFrame.origin.x;
  double y = self->_renderFrame.origin.y;
  double width = self->_renderFrame.size.width;
  double height = self->_renderFrame.size.height;
  if (!self->_isCompact)
  {
    CalRoundToScreenScale();
    double v8 = v7;
    CalRoundToScreenScale();
    double x = x + v8;
    double y = y + 0.0;
    double width = width - (v8 + v9);
  }
  id v10 = objc_alloc((Class)NSAttributedString);
  string = self->_string;
  double v12 = [(_MoreEventsView *)self stringAttributes];
  id v16 = [v10 initWithString:string attributes:v12];

  [v16 size];
  CalRoundToScreenScale();
  double v14 = v13;
  CalRoundToScreenScale();
  [v16 drawWithRect:CGRectMake(x, y, width, height) options:0 context:x + 0.0, y + v14, width, height - (v14 + v15)];
}

- (int64_t)numberOfEvents
{
  return self->_numberOfEvents;
}

- (void)setNumberOfEvents:(int64_t)a3
{
  self->_numberOfEvents = a3;
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end