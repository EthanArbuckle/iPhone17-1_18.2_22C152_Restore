@interface HDMHNotification
- (BOOL)isEqual:(id)a3;
- (HDMHNotification)initWithFireOnDayIndex:(int64_t)a3 dateComponents:(id)a4 category:(id)a5;
- (NSDateComponents)dateComponents;
- (NSString)category;
- (id)description;
- (id)eventIdentifier;
@end

@implementation HDMHNotification

- (HDMHNotification)initWithFireOnDayIndex:(int64_t)a3 dateComponents:(id)a4 category:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDMHNotification;
  v11 = [(HDMHNotification *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_fireOnDayIndex = a3;
    objc_storeStrong((id *)&v11->_dateComponents, a4);
    objc_storeStrong((id *)&v12->_category, a5);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDMHNotification *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      dateComponents = self->_dateComponents;
      v7 = [(HDMHNotification *)v5 dateComponents];
      if ([(NSDateComponents *)dateComponents isEqual:v7])
      {
        category = self->_category;
        id v9 = [(HDMHNotification *)v5 category];
        if ([(NSString *)category isEqualToString:v9])
        {
          id v10 = [(HDMHNotification *)self eventIdentifier];
          v11 = [(HDMHNotification *)v5 eventIdentifier];
          char v12 = [v10 isEqualToString:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p dayIndex:%ld category:%@>", objc_opt_class(), self, self->_fireOnDayIndex, self->_category];
}

- (id)eventIdentifier
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%ld%ld", -[NSDateComponents hour](self->_dateComponents, "hour"), -[NSDateComponents minute](self->_dateComponents, "minute"));
  v4 = [NSString stringWithFormat:@"%@_%ld_%@", self->_category, self->_fireOnDayIndex, v3];

  return v4;
}

- (NSString)category
{
  return self->_category;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponents, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end