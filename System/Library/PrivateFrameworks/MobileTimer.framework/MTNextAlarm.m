@interface MTNextAlarm
- (BOOL)isSleepAlarm;
- (NSDate)fireDate;
- (NSString)identifier;
- (NSString)title;
- (NSURL)clockAppSectionURL;
- (id)description;
- (void)setFireDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsSleepAlarm:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTNextAlarm

- (NSURL)clockAppSectionURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if ([(MTNextAlarm *)self isSleepAlarm]) {
    v3 = @"clock-sleep-alarm";
  }
  else {
    v3 = @"clock-alarm";
  }
  return (NSURL *)[v2 mtURLForScheme:v3];
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)MTNextAlarm;
  v4 = [(MTNextAlarm *)&v11 description];
  v5 = [(MTNextAlarm *)self title];
  v6 = [(MTNextAlarm *)self fireDate];
  v7 = [(MTNextAlarm *)self identifier];
  v8 = [(MTNextAlarm *)self clockAppSectionURL];
  v9 = [v3 stringWithFormat:@"[%@] title: [%@] fireDate: [%@] identifier: [%@] clockAppSectionURL: [%@]", v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (void)setIsSleepAlarm:(BOOL)a3
{
  self->_isSleepAlarm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end