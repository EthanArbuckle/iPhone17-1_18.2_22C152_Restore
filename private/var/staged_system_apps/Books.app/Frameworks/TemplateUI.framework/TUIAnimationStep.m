@interface TUIAnimationStep
- (NSDictionary)values;
- (double)duration;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDuration:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setValues:(id)a3;
@end

@implementation TUIAnimationStep

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TUIAnimationStep allocWithZone:a3] init];
  v5 = v4;
  if (v4)
  {
    v4->_startTime = self->_startTime;
    v4->_duration = self->_duration;
    v6 = (NSDictionary *)[(NSDictionary *)self->_values copy];
    values = v5->_values;
    v5->_values = v6;
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:@"<"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 addObject:v5];

  v6 = +[NSString stringWithFormat:@" %p", self];
  [v3 addObject:v6];

  v7 = +[NSString stringWithFormat:@" startTime: %g", *(void *)&self->_startTime];
  [v3 addObject:v7];

  v8 = +[NSString stringWithFormat:@" duration: %g", *(void *)&self->_duration];
  [v3 addObject:v8];

  [v3 addObject:@" values: { "];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  values = self->_values;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_79C14;
  v13[3] = &unk_253E38;
  v15 = &v16;
  id v10 = v3;
  id v14 = v10;
  [(NSDictionary *)values enumerateKeysAndObjectsUsingBlock:v13];
  if (*((unsigned char *)v17 + 24)) {
    [v10 addObject:@" "];
  }
  [v10 addObject:@"}>"];
  v11 = [v10 componentsJoinedByString:&stru_257BF0];

  _Block_object_dispose(&v16, 8);

  return v11;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDictionary)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end