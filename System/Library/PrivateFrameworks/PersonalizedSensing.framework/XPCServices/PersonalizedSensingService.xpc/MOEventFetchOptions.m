@interface MOEventFetchOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFetchOptions:(id)a3;
- (MOEventFetchOptions)initWithCoder:(id)a3;
- (MOEventFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 category:(unint64_t)a5 limit:(id)a6;
- (MOEventFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5;
- (NSDateInterval)dateInterval;
- (NSNumber)limit;
- (id)description;
- (unint64_t)category;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
@end

@implementation MOEventFetchOptions

- (MOEventFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5
{
  return [(MOEventFetchOptions *)self initWithDateInterval:a3 ascending:a4 category:0 limit:a5];
}

- (MOEventFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 category:(unint64_t)a5 limit:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MOEventFetchOptions;
  v13 = [(MOEventFetchOptions *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_ascending = a4;
    v13->_category = a5;
    objc_storeStrong((id *)&v13->_dateInterval, a3);
    objc_storeStrong((id *)&v14->_limit, a6);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL ascending = self->_ascending;
  id v5 = a3;
  v6 = +[NSNumber numberWithBool:ascending];
  [v5 encodeObject:v6 forKey:@"ascending"];

  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_limit forKey:@"limit"];
  id v7 = +[NSNumber numberWithUnsignedInteger:self->_category];
  [v5 encodeObject:v7 forKey:@"category"];
}

- (MOEventFetchOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ascending"];
  id v6 = [v5 BOOLValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"limit"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];

  v10 = -[MOEventFetchOptions initWithDateInterval:ascending:category:limit:](self, "initWithDateInterval:ascending:category:limit:", v7, v6, [v9 unsignedLongValue], v8);
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MOEventFetchOptions *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(MOEventFetchOptions *)self isEqualToFetchOptions:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  id v5 = a3;
  int ascending = self->_ascending;
  unsigned int v7 = [v5 ascending];
  dateInterval = self->_dateInterval;
  if (dateInterval) {
    goto LABEL_2;
  }
  v3 = [v5 dateInterval];
  if (!v3)
  {
    unsigned int v13 = 1;
    goto LABEL_11;
  }
  if (self->_dateInterval)
  {
LABEL_2:
    uint64_t v9 = [v5 dateInterval];
    if (v9)
    {
      v10 = (void *)v9;
      id v11 = self->_dateInterval;
      id v12 = [v5 dateInterval];
      unsigned int v13 = [(NSDateInterval *)v11 isEqualToDateInterval:v12];

      if (dateInterval) {
        goto LABEL_12;
      }
    }
    else
    {
      unsigned int v13 = 0;
      if (dateInterval) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    unsigned int v13 = 0;
  }
LABEL_11:

LABEL_12:
  if (self->_limit)
  {
    v14 = [v5 limit];
    if (v14)
    {
      unsigned __int8 v15 = 1;
    }
    else if (self->_limit)
    {
      objc_super v16 = [v5 limit];
      if (v16)
      {
        limit = self->_limit;
        v18 = [v5 limit];
        unsigned __int8 v15 = [(NSNumber *)limit isEqualToNumber:v18];
      }
      else
      {
        unsigned __int8 v15 = 0;
      }
    }
    else
    {
      unsigned __int8 v15 = 0;
    }
  }
  else
  {
    unsigned __int8 v15 = 0;
  }
  unint64_t category = self->_category;
  id v20 = [v5 category];
  if (ascending == v7) {
    unsigned int v21 = v13;
  }
  else {
    unsigned int v21 = 0;
  }
  if ((id)category == v20) {
    unsigned __int8 v22 = v15;
  }
  else {
    unsigned __int8 v22 = 0;
  }
  if (v21 == 1) {
    BOOL v23 = v22;
  }
  else {
    BOOL v23 = 0;
  }

  return v23;
}

- (unint64_t)hash
{
  v3 = +[NSNumber numberWithBool:self->_ascending];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = (unint64_t)[(NSDateInterval *)self->_dateInterval hash];
  unint64_t v6 = v5 ^ (unint64_t)[(NSNumber *)self->_limit hash] ^ v4;
  unsigned int v7 = +[NSNumber numberWithUnsignedInteger:self->_category];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (id)description
{
  if (self->_ascending) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  unint64_t v4 = [(NSDateInterval *)self->_dateInterval startDate];
  unint64_t v5 = [v4 stringFromDate];
  unint64_t v6 = [(NSDateInterval *)self->_dateInterval endDate];
  unsigned int v7 = [v6 stringFromDate];
  unint64_t v8 = +[NSString stringWithFormat:@"ascending, %@,  startDate, %@, endDate, %@, category, %lu, limit, %@", v3, v5, v7, self->_category, self->_limit];

  return v8;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSNumber)limit
{
  return self->_limit;
}

- (unint64_t)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end