@interface _BSUIWeeklyProgressLayoutInfo
- (BSUIProgressSeparatorController)separator;
- (BSUIProgressSingleDayController)day;
- (CGRect)frame;
- (NSString)dayLabel;
- (double)percentComplete;
- (id)description;
- (int64_t)layoutType;
- (void)setDay:(id)a3;
- (void)setDayLabel:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setPercentComplete:(double)a3;
- (void)setSeparator:(id)a3;
@end

@implementation _BSUIWeeklyProgressLayoutInfo

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(_BSUIWeeklyProgressLayoutInfo *)self day];
  [v8 setFrame:CGRectMake(x, y, width, height)];

  v9 = [(_BSUIWeeklyProgressLayoutInfo *)self separator];
  [v9 setFrame:x, y, width, height];

  v10 = [(_BSUIWeeklyProgressLayoutInfo *)self separator];
  [v10 configureWithType:[self layoutType]];

  self->_frame.origin.double x = x;
  self->_frame.origin.double y = y;
  self->_frame.size.double width = width;
  self->_frame.size.double height = height;
}

- (id)description
{
  v3 = +[NSNumber numberWithInteger:[(_BSUIWeeklyProgressLayoutInfo *)self layoutType]];
  uint64_t v4 = [(_BSUIWeeklyProgressLayoutInfo *)self day];
  v5 = (void *)v4;
  if (v4)
  {
    v6 = +[NSString stringWithFormat:@"    layoutType = %@: data: %@", v3, v4];
  }
  else
  {
    v7 = [(_BSUIWeeklyProgressLayoutInfo *)self separator];
    v6 = +[NSString stringWithFormat:@"    layoutType = %@: data: %@", v3, v7];
  }

  return v6;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (NSString)dayLabel
{
  return self->_dayLabel;
}

- (void)setDayLabel:(id)a3
{
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BSUIProgressSingleDayController)day
{
  return self->_day;
}

- (void)setDay:(id)a3
{
}

- (BSUIProgressSeparatorController)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_day, 0);

  objc_storeStrong((id *)&self->_dayLabel, 0);
}

@end