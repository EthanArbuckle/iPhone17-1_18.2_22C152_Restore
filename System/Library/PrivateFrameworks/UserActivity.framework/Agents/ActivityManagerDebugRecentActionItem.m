@interface ActivityManagerDebugRecentActionItem
- (ActivityManagerDebugRecentActionItem)initWithString:(id)a3;
- (NSDate)when;
- (NSString)str;
- (void)setStr:(id)a3;
- (void)setWhen:(id)a3;
@end

@implementation ActivityManagerDebugRecentActionItem

- (ActivityManagerDebugRecentActionItem)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ActivityManagerDebugRecentActionItem;
  v5 = [(ActivityManagerDebugRecentActionItem *)&v9 init];
  if (v5)
  {
    v6 = +[NSDate date];
    [(ActivityManagerDebugRecentActionItem *)v5 setWhen:v6];

    id v7 = [v4 copy];
    [(ActivityManagerDebugRecentActionItem *)v5 setStr:v7];
  }
  return v5;
}

- (void)setWhen:(id)a3
{
}

- (void)setStr:(id)a3
{
}

- (NSDate)when
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)str
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_str, 0);

  objc_storeStrong((id *)&self->_when, 0);
}

@end