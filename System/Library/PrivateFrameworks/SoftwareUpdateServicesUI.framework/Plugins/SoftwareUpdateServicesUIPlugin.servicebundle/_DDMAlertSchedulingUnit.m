@interface _DDMAlertSchedulingUnit
- (NSDate)date;
- (NSString)alertMsgFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)window;
- (void)setAlertMsgFormat:(id)a3;
- (void)setDate:(id)a3;
- (void)setWindow:(unint64_t)a3;
@end

@implementation _DDMAlertSchedulingUnit

- (id)description
{
  date = self->_date;
  v4 = window2Str(self->_window);
  v5 = +[NSString stringWithFormat:@"{date:%@, window:%@, alertMsg:%@}", date, v4, self->_alertMsgFormat];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8 = self;
  v7[2] = (id)a2;
  v7[1] = a3;
  v7[0] = objc_alloc_init(_DDMAlertSchedulingUnit);
  if (v7[0])
  {
    id v5 = [(NSDate *)v8->_date copy];
    objc_msgSend(v7[0], "setDate:");

    [v7[0] setWindow:v8->_window];
    id v6 = [(NSString *)v8->_alertMsgFormat copy];
    objc_msgSend(v7[0], "setAlertMsgFormat:");
  }
  id v4 = v7[0];
  objc_storeStrong(v7, 0);
  return v4;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)window
{
  return self->_window;
}

- (void)setWindow:(unint64_t)a3
{
  self->_window = a3;
}

- (NSString)alertMsgFormat
{
  return self->_alertMsgFormat;
}

- (void)setAlertMsgFormat:(id)a3
{
}

- (void).cxx_destruct
{
}

@end