@interface PKPayLaterDashboardMessage
- (NSDate)date;
- (PKDashboardPassMessage)message;
- (PKPayLaterDashboardMessage)initWithMessage:(id)a3 priority:(int64_t)a4 date:(id)a5;
- (int64_t)compare:(id)a3;
- (int64_t)priority;
- (void)setPriority:(int64_t)a3;
@end

@implementation PKPayLaterDashboardMessage

- (PKPayLaterDashboardMessage)initWithMessage:(id)a3 priority:(int64_t)a4 date:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterDashboardMessage;
  v11 = [(PKPayLaterDashboardMessage *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_message, a3);
    objc_storeStrong((id *)&v12->_date, a5);
    int64_t v13 = 400;
    if (a4) {
      int64_t v13 = a4;
    }
    v12->_priority = v13;
  }

  return v12;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 priority];
  int64_t priority = self->_priority;
  if (priority == v5)
  {
    if (self->_date)
    {
      v7 = [v4 date];

      date = self->_date;
      if (v7)
      {
        id v9 = [v4 date];
        uint64_t v10 = [(NSDate *)date compare:v9];

        if (v10 == -1) {
          int64_t v11 = 1;
        }
        else {
          int64_t v11 = -1;
        }
        goto LABEL_12;
      }
    }
    else
    {
      date = 0;
    }
    int64_t v11 = date != 0;
    goto LABEL_12;
  }
  if (priority < v5) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = -1;
  }
LABEL_12:

  return v11;
}

- (PKDashboardPassMessage)message
{
  return self->_message;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_int64_t priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end