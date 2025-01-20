@interface CLWorkoutSubscriptionAdapter
- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4;
- (BOOL)valid;
- (CLWorkoutSubscriptionAdapter)initWithWorkoutSubscription:(void *)a3;
- (void)onWorkoutSessionUpdate:(WorkoutEvent *)a3 withOverview:(id)a4 andPriors:(id)a5;
- (void)setSubscription:(void *)a3;
- (void)setValid:(BOOL)a3;
- (void)subscription;
@end

@implementation CLWorkoutSubscriptionAdapter

- (CLWorkoutSubscriptionAdapter)initWithWorkoutSubscription:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLWorkoutSubscriptionAdapter;
  result = [(CLWorkoutSubscriptionAdapter *)&v5 init];
  if (result) {
    result->_subscription = a3;
  }
  return result;
}

- (void)onWorkoutSessionUpdate:(WorkoutEvent *)a3 withOverview:(id)a4 andPriors:(id)a5
{
  v7 = [(CLWorkoutSubscriptionAdapter *)self subscription];
  long long v8 = *(_OWORD *)&a3->var5.var6.var1[47];
  long long v9 = *(_OWORD *)&a3->var5.var6.var1[63];
  long long v10 = *(_OWORD *)&a3->var5.var6.var1[15];
  v21[11] = *(_OWORD *)&a3->var5.var6.var1[31];
  v21[12] = v8;
  v21[13] = v9;
  WorkoutAttrib var5 = a3->var5.var5;
  long long v12 = *(_OWORD *)&a3->var5.var6.var0;
  long long v13 = *(_OWORD *)a3->var5.var2;
  v21[7] = *(_OWORD *)&a3->var5.var3;
  v21[8] = var5;
  v21[9] = v12;
  v21[10] = v10;
  long long v14 = *(_OWORD *)a3->var5.var0;
  long long v15 = *(_OWORD *)a3->var5.var1;
  long long v16 = *(_OWORD *)&a3->var4.var0;
  v21[3] = *(_OWORD *)&a3->var4.var2;
  v21[4] = v14;
  v21[5] = v15;
  v21[6] = v13;
  long long v17 = *(_OWORD *)&a3->var2;
  v21[0] = *(_OWORD *)&a3->var0;
  v21[1] = v17;
  unint64_t var7 = a3->var5.var7;
  v21[2] = v16;
  (*((void (**)(void **__return_ptr, id))a4 + 2))(v18, a4);
  sub_101260720((uint64_t)v7, (uint64_t)v21, v18);
  sub_100663B8C(v20);
  if (v19 < 0) {
    operator delete(v18[2]);
  }
}

- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4
{
  return 1;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(void *)a3
{
  self->_subscription = a3;
}

@end