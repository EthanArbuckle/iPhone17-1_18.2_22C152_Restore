@interface RAPWebBundleHoursContext
- (NSArray)days;
- (NSDictionary)context;
- (NSNumber)from;
- (NSNumber)to;
- (id)debugDescription;
- (void)setDays:(id)a3;
- (void)setFrom:(id)a3;
- (void)setTo:(id)a3;
@end

@implementation RAPWebBundleHoursContext

- (NSDictionary)context
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v4 = [(RAPWebBundleHoursContext *)self from];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(RAPWebBundleHoursContext *)self to];

    if (v6)
    {
      v15[0] = @"from";
      v7 = [(RAPWebBundleHoursContext *)self from];
      v15[1] = @"to";
      v16[0] = v7;
      v8 = [(RAPWebBundleHoursContext *)self to];
      v16[1] = v8;
      v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
      [v3 setObject:v9 forKeyedSubscript:@"timeRange"];
    }
  }
  v10 = [(RAPWebBundleHoursContext *)self days];
  id v11 = [v10 count];

  if (v11)
  {
    v12 = [(RAPWebBundleHoursContext *)self days];
    [v3 setObject:v12 forKeyedSubscript:@"days"];
  }
  id v13 = [v3 copy];

  return (NSDictionary *)v13;
}

- (id)debugDescription
{
  v2 = [(RAPWebBundleHoursContext *)self context];
  id v3 = [v2 debugDescription];

  return v3;
}

- (NSNumber)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (NSNumber)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
}

- (NSArray)days
{
  return self->_days;
}

- (void)setDays:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_days, 0);
  objc_storeStrong((id *)&self->_to, 0);

  objc_storeStrong((id *)&self->_from, 0);
}

@end