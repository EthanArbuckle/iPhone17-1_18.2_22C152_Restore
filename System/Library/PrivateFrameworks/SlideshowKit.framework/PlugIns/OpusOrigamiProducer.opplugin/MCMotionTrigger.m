@interface MCMotionTrigger
+ (id)motionTriggerForTargetPlugObjectID:(id)a3 withKey:(id)a4 andDuration:(double)a5;
- (MCMotionTrigger)initWithImprint:(id)a3;
- (NSString)key;
- (double)duration;
- (double)easeIn;
- (double)easeOut;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setDuration:(double)a3;
- (void)setEaseIn:(double)a3;
- (void)setEaseOut:(double)a3;
- (void)setKey:(id)a3;
@end

@implementation MCMotionTrigger

+ (id)motionTriggerForTargetPlugObjectID:(id)a3 withKey:(id)a4 andDuration:(double)a5
{
  v8 = (double *)objc_alloc_init((Class)a1);
  [v8 setTargetObjectID:a3];
  [v8 setKey:a4];
  v8[4] = a5;
  return v8;
}

- (MCMotionTrigger)initWithImprint:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MCMotionTrigger;
  v4 = -[MCAction initWithImprint:](&v14, "initWithImprint:");
  if (v4)
  {
    v4->_key = (NSString *)[a3 objectForKey:@"key"];
    id v5 = [a3 objectForKey:@"duration"];
    double v6 = 0.0;
    double v7 = 0.0;
    if (v5) {
      objc_msgSend(v5, "doubleValue", 0.0);
    }
    v4->_duration = v7;
    id v8 = [a3 objectForKey:@"easeIn"];
    if (v8)
    {
      [v8 floatValue];
      double v6 = v9;
    }
    v4->_easeIn = v6;
    id v10 = [a3 objectForKey:@"easeOut"];
    if (v10)
    {
      [v10 floatValue];
      double v12 = v11;
    }
    else
    {
      double v12 = 1.0;
    }
    v4->_easeOut = v12;
  }
  return v4;
}

- (void)demolish
{
  self->_key = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCMotionTrigger;
  [(MCAction *)&v3 demolish];
}

- (id)imprint
{
  v9.receiver = self;
  v9.super_class = (Class)MCMotionTrigger;
  id v3 = [(MCAction *)&v9 imprint];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if (self->_duration != 0.0) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"duration");
  }
  double easeIn = self->_easeIn;
  if (easeIn != 0.0)
  {
    *(float *)&double easeIn = easeIn;
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", easeIn), @"easeIn");
  }
  double easeOut = self->_easeOut;
  if (easeOut != 1.0)
  {
    *(float *)&double easeOut = easeOut;
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", easeOut), @"easeOut");
  }
  return v4;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCMotionTrigger;
  -[MCAction _copySelfToSnapshot:](&v6, "_copySelfToSnapshot:");
  key = self->_key;
  if (key) {
    *((void *)a3 + 3) = [(NSString *)key copy];
  }
  *((void *)a3 + 4) = *(void *)&self->_duration;
  *((void *)a3 + 5) = *(void *)&self->_easeIn;
  *((void *)a3 + 6) = *(void *)&self->_easeOut;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MCMotionTrigger;
  return objc_msgSend(-[MCAction description](&v3, "description"), "stringByAppendingFormat:", @", key='%@', duration=%f, ease=(%f,%f)", self->_key, *(void *)&self->_duration, *(void *)&self->_easeIn, *(void *)&self->_easeOut);
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKey:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)easeIn
{
  return self->_easeIn;
}

- (void)setEaseIn:(double)a3
{
  self->_double easeIn = a3;
}

- (double)easeOut
{
  return self->_easeOut;
}

- (void)setEaseOut:(double)a3
{
  self->_double easeOut = a3;
}

@end