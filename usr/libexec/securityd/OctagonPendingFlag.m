@interface OctagonPendingFlag
- (CKKSNearFutureScheduler)scheduler;
- (NSDate)fireTime;
- (NSOperation)afterOperation;
- (OctagonFlagString)flag;
- (OctagonPendingFlag)initWithFlag:(id)a3 after:(id)a4;
- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4;
- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 after:(id)a5;
- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 delayInSeconds:(double)a5;
- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 scheduler:(id)a5;
- (OctagonPendingFlag)initWithFlag:(id)a3 delayInSeconds:(double)a4;
- (OctagonPendingFlag)initWithFlag:(id)a3 scheduler:(id)a4;
- (id)description;
- (unint64_t)conditions;
- (void)setAfterOperation:(id)a3;
- (void)setScheduler:(id)a3;
@end

@implementation OctagonPendingFlag

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_afterOperation, 0);
  objc_storeStrong((id *)&self->_fireTime, 0);

  objc_storeStrong((id *)&self->_flag, 0);
}

- (void)setScheduler:(id)a3
{
}

- (CKKSNearFutureScheduler)scheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAfterOperation:(id)a3
{
}

- (NSOperation)afterOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)conditions
{
  return self->_conditions;
}

- (NSDate)fireTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (OctagonFlagString)flag
{
  return (OctagonFlagString *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = [(OctagonPendingFlag *)self fireTime];

  if (v3)
  {
    v4 = [(OctagonPendingFlag *)self flag];
    uint64_t v5 = [(OctagonPendingFlag *)self fireTime];
LABEL_3:
    v6 = (void *)v5;
    +[NSString stringWithFormat:@"<OctagonPendingFlag: %@: %@>", v4, v5];
    v7 = LABEL_4:;
    goto LABEL_5;
  }
  v9 = [(OctagonPendingFlag *)self afterOperation];

  if (!v9)
  {
    v4 = [(OctagonPendingFlag *)self flag];
    uint64_t v5 = sub_1000F787C([(OctagonPendingFlag *)self conditions]);
    goto LABEL_3;
  }
  unint64_t v10 = [(OctagonPendingFlag *)self conditions];
  v4 = [(OctagonPendingFlag *)self flag];
  uint64_t v11 = [(OctagonPendingFlag *)self afterOperation];
  v6 = (void *)v11;
  if (!v10)
  {
    +[NSString stringWithFormat:@"<OctagonPendingFlag: %@: %@>", v4, v11];
    goto LABEL_4;
  }
  v12 = sub_1000F787C([(OctagonPendingFlag *)self conditions]);
  v7 = +[NSString stringWithFormat:@"<OctagonPendingFlag: %@: %@ %@>", v4, v6, v12];

LABEL_5:

  return v7;
}

- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 after:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OctagonPendingFlag;
  uint64_t v11 = [(OctagonPendingFlag *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_flag, a3);
    fireTime = v12->_fireTime;
    v12->_fireTime = 0;

    objc_storeStrong((id *)&v12->_afterOperation, a5);
    v12->_conditions = a4;
  }

  return v12;
}

- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 scheduler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  [v10 trigger];
  v17.receiver = self;
  v17.super_class = (Class)OctagonPendingFlag;
  uint64_t v11 = [(OctagonPendingFlag *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_flag, a3);
    fireTime = v12->_fireTime;
    v12->_fireTime = 0;

    objc_storeStrong((id *)&v12->_scheduler, a5);
    uint64_t v14 = [v10 operationDependency];
    afterOperation = v12->_afterOperation;
    v12->_afterOperation = (NSOperation *)v14;

    v12->_conditions = a4;
  }

  return v12;
}

- (OctagonPendingFlag)initWithFlag:(id)a3 scheduler:(id)a4
{
  return [(OctagonPendingFlag *)self initWithFlag:a3 conditions:0 scheduler:a4];
}

- (OctagonPendingFlag)initWithFlag:(id)a3 after:(id)a4
{
  return [(OctagonPendingFlag *)self initWithFlag:a3 conditions:0 after:a4];
}

- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4 delayInSeconds:(double)a5
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)OctagonPendingFlag;
  id v10 = [(OctagonPendingFlag *)&v16 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_flag, a3);
    if (a5 <= 0.0)
    {
      fireTime = v11->_fireTime;
      v11->_fireTime = 0;
    }
    else
    {
      uint64_t v12 = +[NSDate dateWithTimeIntervalSinceNow:a5];
      fireTime = v11->_fireTime;
      v11->_fireTime = (NSDate *)v12;
    }

    afterOperation = v11->_afterOperation;
    v11->_afterOperation = 0;

    v11->_conditions = a4;
  }

  return v11;
}

- (OctagonPendingFlag)initWithFlag:(id)a3 conditions:(unint64_t)a4
{
  return [(OctagonPendingFlag *)self initWithFlag:a3 conditions:a4 delayInSeconds:0.0];
}

- (OctagonPendingFlag)initWithFlag:(id)a3 delayInSeconds:(double)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OctagonPendingFlag;
  v8 = [(OctagonPendingFlag *)&v14 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_flag, a3);
    uint64_t v10 = +[NSDate dateWithTimeIntervalSinceNow:a4];
    fireTime = v9->_fireTime;
    v9->_fireTime = (NSDate *)v10;

    afterOperation = v9->_afterOperation;
    v9->_afterOperation = 0;

    v9->_conditions = 0;
  }

  return v9;
}

@end