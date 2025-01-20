@interface BSUIWeeklyProgressDay
- (BOOL)isEqual:(id)a3;
- (BSUIWeeklyProgressDay)initWithType:(int64_t)a3 progress:(double)a4 text:(id)a5 dateShortString:(id)a6;
- (NSString)dateShortString;
- (NSString)text;
- (double)progress;
- (id)description;
- (int64_t)type;
@end

@implementation BSUIWeeklyProgressDay

- (BSUIWeeklyProgressDay)initWithType:(int64_t)a3 progress:(double)a4 text:(id)a5 dateShortString:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BSUIWeeklyProgressDay;
  v13 = [(BSUIWeeklyProgressDay *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v13->_progress = a4;
    objc_storeStrong((id *)&v13->_text, a5);
    objc_storeStrong((id *)&v14->_dateShortString, a6);
  }

  return v14;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int64_t v5 = [(BSUIWeeklyProgressDay *)self type];
  [(BSUIWeeklyProgressDay *)self progress];
  uint64_t v7 = v6;
  v8 = [(BSUIWeeklyProgressDay *)self text];
  v9 = [(BSUIWeeklyProgressDay *)self dateShortString];
  v10 = +[NSString stringWithFormat:@"<%@(%p) type=%ld progress=%.3f text=%@ dateShortString=%@ >", v4, self, v5, v7, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  int64_t v5 = BUDynamicCast();

  if (v5
    && (id v6 = -[BSUIWeeklyProgressDay type](self, "type"), v6 == [v5 type])
    && (-[BSUIWeeklyProgressDay progress](self, "progress"), double v8 = v7, [v5 progress], v8 == v9))
  {
    v10 = [(BSUIWeeklyProgressDay *)self text];
    id v11 = [v5 text];
    if ([v10 isEqualToString:v11])
    {
      id v12 = [(BSUIWeeklyProgressDay *)self dateShortString];
      v13 = [v5 dateShortString];
      unsigned __int8 v14 = [v12 isEqualToString:v13];
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (int64_t)type
{
  return self->_type;
}

- (double)progress
{
  return self->_progress;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)dateShortString
{
  return self->_dateShortString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateShortString, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end