@interface MCMotionTriggerExpression
+ (id)motionTriggerForTargetPlugObjectID:(id)a3 withKey:(id)a4 duration:(double)a5 andExpression:(id)a6;
- (MCMotionTriggerExpression)initWithImprint:(id)a3;
- (NSDictionary)attributes;
- (NSString)expression;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setAttributes:(id)a3;
- (void)setExpression:(id)a3;
@end

@implementation MCMotionTriggerExpression

+ (id)motionTriggerForTargetPlugObjectID:(id)a3 withKey:(id)a4 duration:(double)a5 andExpression:(id)a6
{
  id v7 = +[MCMotionTrigger motionTriggerForTargetPlugObjectID:a3 withKey:a4 andDuration:a5];
  [v7 setExpression:a6];
  return v7;
}

- (MCMotionTriggerExpression)initWithImprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCMotionTriggerExpression;
  v4 = -[MCMotionTrigger initWithImprint:](&v6, "initWithImprint:");
  if (v4)
  {
    v4->_expression = (NSString *)[a3 objectForKey:@"expression"];
    v4->_attributes = (NSDictionary *)[a3 objectForKey:@"attributes"];
  }
  return v4;
}

- (void)demolish
{
  self->_expression = 0;
  self->_attributes = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCMotionTriggerExpression;
  [(MCMotionTrigger *)&v3 demolish];
}

- (id)imprint
{
  v8.receiver = self;
  v8.super_class = (Class)MCMotionTriggerExpression;
  id v3 = [(MCMotionTrigger *)&v8 imprint];
  v4 = v3;
  expression = self->_expression;
  if (expression) {
    [v3 setObject:expression forKey:@"expression"];
  }
  attributes = self->_attributes;
  if (attributes) {
    [v4 setObject:attributes forKey:@"attributes"];
  }
  return v4;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCMotionTriggerExpression;
  -[MCMotionTrigger _copySelfToSnapshot:](&v7, "_copySelfToSnapshot:");
  expression = self->_expression;
  if (expression) {
    *((void *)a3 + 7) = [(NSString *)expression copy];
  }
  attributes = self->_attributes;
  if (attributes) {
    *((void *)a3 + 8) = [(NSDictionary *)attributes copy];
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MCMotionTriggerExpression;
  return objc_msgSend(-[MCMotionTrigger description](&v3, "description"), "stringByAppendingFormat:", @", expression='%@', attributes=%@", self->_expression, self->_attributes);
}

- (NSString)expression
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExpression:(id)a3
{
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAttributes:(id)a3
{
}

@end