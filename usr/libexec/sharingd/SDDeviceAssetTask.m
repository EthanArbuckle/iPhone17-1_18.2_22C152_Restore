@interface SDDeviceAssetTask
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (SDDeviceAssetTask)init;
- (SFDeviceAssetQuery)query;
- (id)description;
- (int64_t)state;
- (unint64_t)hash;
- (void)setDate:(id)a3;
- (void)setQuery:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation SDDeviceAssetTask

- (SDDeviceAssetTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)SDDeviceAssetTask;
  result = [(SDDeviceAssetTask *)&v3 init];
  if (result) {
    result->_state = 0;
  }
  return result;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unint64_t v5 = [(SDDeviceAssetTask *)self state];
  if (v5 > 2) {
    v6 = "?";
  }
  else {
    v6 = (&off_1008CAB10)[v5];
  }
  v7 = [(SDDeviceAssetTask *)self date];
  v8 = [(SDDeviceAssetTask *)self query];
  v9 = [v8 stringIdentifier];
  v10 = +[NSString stringWithFormat:@"<%@: %p, state: %s, date: %@, query: \"%@\">", v4, self, v6, v7, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SDDeviceAssetTask *)a3;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      id v6 = [(SDDeviceAssetTask *)self state];
      if (v6 == (id)[(SDDeviceAssetTask *)v5 state])
      {
        v7 = [(SDDeviceAssetTask *)self date];
        v8 = [(SDDeviceAssetTask *)v5 date];
        if ([v7 isEqual:v8])
        {
          v9 = [(SDDeviceAssetTask *)self query];
          v10 = [(SDDeviceAssetTask *)v5 query];
          unsigned __int8 v11 = [v9 isEqual:v10];
        }
        else
        {
          unsigned __int8 v11 = 0;
        }
      }
      else
      {
        unsigned __int8 v11 = 0;
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  objc_super v3 = [(SDDeviceAssetTask *)self date];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(SDDeviceAssetTask *)self query];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (SFDeviceAssetQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end