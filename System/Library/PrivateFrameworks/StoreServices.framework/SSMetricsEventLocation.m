@interface SSMetricsEventLocation
- (NSDictionary)reportingDictionary;
- (NSString)locationType;
- (id)valueForLocationKey:(id)a3;
- (int64_t)locationPosition;
- (void)setLocationPosition:(int64_t)a3;
- (void)setLocationType:(id)a3;
- (void)setValue:(id)a3 forLocationKey:(id)a4;
@end

@implementation SSMetricsEventLocation

- (NSDictionary)reportingDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_position];
  [v3 setObject:v4 forKey:@"locationPosition"];

  type = self->_type;
  if (type) {
    [v3 setObject:type forKey:@"locationType"];
  }
  if (self->_values) {
    objc_msgSend(v3, "addEntriesFromDictionary:");
  }
  return (NSDictionary *)v3;
}

- (void)setValue:(id)a3 forLocationKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v12;
  id v8 = v6;
  values = self->_values;
  if (v12)
  {
    if (!values)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v11 = self->_values;
      self->_values = v10;

      id v7 = v12;
      values = self->_values;
    }
    [(NSMutableDictionary *)values setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)values removeObjectForKey:v8];
  }
}

- (id)valueForLocationKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_values objectForKey:a3];
}

- (int64_t)locationPosition
{
  return self->_position;
}

- (void)setLocationPosition:(int64_t)a3
{
  self->_position = a3;
}

- (NSString)locationType
{
  return self->_type;
}

- (void)setLocationType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end