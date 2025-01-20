@interface RTTServiceUpdate
- (BOOL)isEqual:(id)a3;
- (NSDictionary)options;
- (NSString)serviceUpdateType;
- (RTTServiceUpdate)initWithServiceUpdateType:(id)a3 options:(id)a4;
- (id)description;
- (id)optionValueForKey:(id)a3;
- (void)setOptions:(id)a3;
- (void)setServiceUpdateType:(id)a3;
@end

@implementation RTTServiceUpdate

- (RTTServiceUpdate)initWithServiceUpdateType:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTTServiceUpdate;
  v9 = [(RTTServiceUpdate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceUpdateType, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (id)optionValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(RTTServiceUpdate *)self options];

  if (v5)
  {
    v6 = [(RTTServiceUpdate *)self options];
    id v7 = [v6 objectForKey:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 serviceUpdateType];
    char v6 = [v5 isEqualToString:self->_serviceUpdateType];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)RTTServiceUpdate;
  id v4 = [(RTTServiceUpdate *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ %@", v4, self->_serviceUpdateType];

  return v5;
}

- (NSString)serviceUpdateType
{
  return self->_serviceUpdateType;
}

- (void)setServiceUpdateType:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_serviceUpdateType, 0);
}

@end