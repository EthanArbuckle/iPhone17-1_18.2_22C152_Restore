@interface CalendarMessageResourceChangeCell
- (id)actions;
- (id)bodyStringDict;
- (id)titleStrings;
- (int64_t)_changedPropertyCount;
- (unint64_t)options;
- (void)setNotification:(id)a3;
@end

@implementation CalendarMessageResourceChangeCell

- (id)titleStrings
{
  v4 = self;
  v5 = [(CalendarMessageCell *)self notification];
  if ([v5 changeType] == 1
    || [v5 changeType] == 3
    || [v5 changeType] == 2)
  {
    v6 = [v5 title];
    char v7 = 1;
  }
  else
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v2 = [v4 localizedStringForKey:@"“%@”" value:&stru_1001D6918 table:0];
    v3 = [v5 title];
    v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v2, v3);
    char v7 = 0;
  }
  v10 = v6;
  v8 = +[NSArray arrayWithObjects:&v10 count:1];
  if ((v7 & 1) == 0)
  {

    v6 = v4;
  }

  return v8;
}

- (id)bodyStringDict
{
  v2 = [(CalendarMessageCell *)self notification];
  v3 = [v2 descriptionStrings:CUIKCalendarNoboDescriptionProfile];

  return v3;
}

- (int64_t)_changedPropertyCount
{
  v2 = [(CalendarMessageCell *)self notification];
  LODWORD(v3) = [v2 dateChanged];
  unsigned int v4 = [v2 timeChanged];
  uint64_t v5 = 1;
  if (v3) {
    uint64_t v5 = 2;
  }
  if (v4) {
    uint64_t v3 = v5;
  }
  else {
    uint64_t v3 = v3;
  }
  uint64_t v6 = v3 + [v2 titleChanged];
  int64_t v7 = v6 + [v2 locationChanged];

  return v7;
}

- (id)actions
{
  return &off_1001DCAD0;
}

- (unint64_t)options
{
  return 4;
}

- (void)setNotification:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CalendarMessageResourceChangeCell;
  [(CalendarMessageCell *)&v6 setNotification:a3];
  dateString = self->_dateString;
  self->_dateString = 0;

  changeString = self->_changeString;
  self->_changeString = 0;

  [(CalendarMessageCell *)self setHasDisclosure:EKUICurrentWidthSizeClassIsCompactInViewHierarchy()];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeString, 0);

  objc_storeStrong((id *)&self->_dateString, 0);
}

@end