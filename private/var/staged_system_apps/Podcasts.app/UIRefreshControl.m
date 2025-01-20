@interface UIRefreshControl
- (void)setLastRefreshDate:(id)a3;
- (void)setLastRefreshDate:(id)a3 textColor:(id)a4;
@end

@implementation UIRefreshControl

- (void)setLastRefreshDate:(id)a3
{
}

- (void)setLastRefreshDate:(id)a3 textColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (qword_10060A950 != -1) {
      dispatch_once(&qword_10060A950, &stru_100553048);
    }
    NSAttributedStringKey v16 = NSForegroundColorAttributeName;
    v8 = v7;
    if (!v7)
    {
      v8 = +[UIColor refreshControlTextColor];
    }
    v17 = v8;
    v9 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    if (!v7) {

    }
    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"LAST_REFRESH_FORMAT" value:&stru_10056A8A0 table:0];
    v12 = [v6 friendlyDisplayString];
    v13 = [(id)qword_10060A948 stringFromDate:v6];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12, v13);

    id v15 = [objc_alloc((Class)NSAttributedString) initWithString:v14 attributes:v9];
  }
  else
  {
    id v15 = 0;
  }
  [(UIRefreshControl *)self setAttributedTitle:v15];
}

@end