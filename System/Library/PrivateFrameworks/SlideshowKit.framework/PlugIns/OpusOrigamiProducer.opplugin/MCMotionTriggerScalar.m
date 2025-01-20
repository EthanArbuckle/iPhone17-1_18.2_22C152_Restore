@interface MCMotionTriggerScalar
+ (id)motionTriggerForTargetPlugObjectID:(id)a3 withKey:(id)a4 duration:(double)a5 andValue:(double)a6;
- (MCMotionTriggerScalar)initWithImprint:(id)a3;
- (double)value;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)setValue:(double)a3;
@end

@implementation MCMotionTriggerScalar

+ (id)motionTriggerForTargetPlugObjectID:(id)a3 withKey:(id)a4 duration:(double)a5 andValue:(double)a6
{
  id result = +[MCMotionTrigger motionTriggerForTargetPlugObjectID:a3 withKey:a4 andDuration:a5];
  *((double *)result + 7) = a6;
  return result;
}

- (MCMotionTriggerScalar)initWithImprint:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MCMotionTriggerScalar;
  v4 = -[MCMotionTrigger initWithImprint:](&v9, "initWithImprint:");
  if (v4)
  {
    id v5 = [a3 objectForKey:@"value"];
    if (v5)
    {
      [v5 floatValue];
      double v7 = v6;
    }
    else
    {
      double v7 = 0.0;
    }
    v4->_value = v7;
  }
  return v4;
}

- (id)imprint
{
  v6.receiver = self;
  v6.super_class = (Class)MCMotionTriggerScalar;
  id v3 = [(MCMotionTrigger *)&v6 imprint];
  double value = self->_value;
  if (value != 0.0)
  {
    *(float *)&double value = value;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", value), @"value");
  }
  return v3;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCMotionTriggerScalar;
  -[MCMotionTrigger _copySelfToSnapshot:](&v5, "_copySelfToSnapshot:");
  *((void *)a3 + 7) = *(void *)&self->_value;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MCMotionTriggerScalar;
  return objc_msgSend(-[MCMotionTrigger description](&v3, "description"), "stringByAppendingFormat:", @", value=%f", *(void *)&self->_value);
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_double value = a3;
}

@end