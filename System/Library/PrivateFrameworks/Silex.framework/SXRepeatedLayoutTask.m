@interface SXRepeatedLayoutTask
- (SXRepeatedLayoutTask)initWithTask:(id)a3 result:(id)a4;
- (double)elapsedDuration;
- (unint64_t)repeatCount;
@end

@implementation SXRepeatedLayoutTask

- (SXRepeatedLayoutTask)initWithTask:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 options];
  v9 = +[SXLayoutInstructions defaultInstructions];
  v10 = [v7 blueprint];
  v11 = [v7 DOM];
  v19.receiver = self;
  v19.super_class = (Class)SXRepeatedLayoutTask;
  v12 = [(SXLayoutTask *)&v19 initWithOptions:v8 instructions:v9 blueprint:v10 DOM:v11];

  if (v12)
  {
    id v13 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12->_repeatCount = [v13 repeatCount] + 1;
      [v13 elapsedDuration];
      double v15 = v14;
      [v7 duration];
      double v17 = v15 + v16;
    }
    else
    {
      v12->_repeatCount = 1;
      [v7 duration];
    }
    v12->_elapsedDuration = v17;
  }
  return v12;
}

- (unint64_t)repeatCount
{
  return self->_repeatCount;
}

- (double)elapsedDuration
{
  return self->_elapsedDuration;
}

@end