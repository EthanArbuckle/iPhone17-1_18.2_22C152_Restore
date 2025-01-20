@interface MCStateOperationScalarSet
+ (id)stateOperationForTargetPlugObjectID:(id)a3 withStateKey:(id)a4 andScalar:(double)a5;
- (MCStateOperationScalarSet)initWithImprint:(id)a3;
- (double)scalar;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)setScalar:(double)a3;
@end

@implementation MCStateOperationScalarSet

+ (id)stateOperationForTargetPlugObjectID:(id)a3 withStateKey:(id)a4 andScalar:(double)a5
{
  id result = +[MCStateOperation stateOperationForTargetPlugObjectID:a3 withStateKey:a4];
  *((double *)result + 4) = a5;
  return result;
}

- (MCStateOperationScalarSet)initWithImprint:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCStateOperationScalarSet;
  v4 = -[MCStateOperation initWithImprint:](&v7, "initWithImprint:");
  if (v4)
  {
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"scalar"), "floatValue");
    v4->_scalar = v5;
  }
  return v4;
}

- (id)imprint
{
  v6.receiver = self;
  v6.super_class = (Class)MCStateOperationScalarSet;
  id v3 = [(MCStateOperation *)&v6 imprint];
  double scalar = self->_scalar;
  if (scalar != 0.0)
  {
    *(float *)&double scalar = scalar;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", scalar), @"scalar");
  }
  return v3;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCStateOperationScalarSet;
  -[MCStateOperation _copySelfToSnapshot:](&v5, "_copySelfToSnapshot:");
  *((void *)a3 + 4) = *(void *)&self->_scalar;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MCStateOperationScalarSet;
  return objc_msgSend(-[MCStateOperation description](&v3, "description"), "stringByAppendingFormat:", @" = %f", *(void *)&self->_scalar);
}

- (double)scalar
{
  return self->_scalar;
}

- (void)setScalar:(double)a3
{
  self->_double scalar = a3;
}

@end