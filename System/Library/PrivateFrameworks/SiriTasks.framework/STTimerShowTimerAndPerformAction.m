@interface STTimerShowTimerAndPerformAction
+ (BOOL)supportsSecureCoding;
- (NSArray)templateActions;
- (NSArray)timers;
- (STTimerShowTimerAndPerformAction)initWithCoder:(id)a3;
- (id)_initWithTimer:(id)a3 action:(unint64_t)a4;
- (id)_initWithTimers:(id)a3 action:(unint64_t)a4;
- (id)_initWithTimers:(id)a3 templateActions:(id)a4 timerAction:(unint64_t)a5;
- (id)timer;
- (unint64_t)action;
- (void)encodeWithCoder:(id)a3;
- (void)setTemplateActions:(id)a3;
- (void)setTimers:(id)a3;
@end

@implementation STTimerShowTimerAndPerformAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateActions, 0);
  objc_storeStrong((id *)&self->_timers, 0);
}

- (void)setTemplateActions:(id)a3
{
}

- (NSArray)templateActions
{
  return self->_templateActions;
}

- (void)setTimers:(id)a3
{
}

- (NSArray)timers
{
  return self->_timers;
}

- (STTimerShowTimerAndPerformAction)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STTimerShowTimerAndPerformAction;
  v5 = [(AFSiriRequest *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_timers"];
    timers = v5->_timers;
    v5->_timers = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_templateActions"];
    templateActions = v5->_templateActions;
    v5->_templateActions = (NSArray *)v14;

    v5->_action = [v4 decodeIntegerForKey:@"_action"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STTimerShowTimerAndPerformAction;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_timers, @"_timers", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_templateActions forKey:@"_templateActions"];
  [v4 encodeInteger:self->_action forKey:@"_action"];
}

- (unint64_t)action
{
  return self->_action;
}

- (id)timer
{
  return [(NSArray *)self->_timers firstObject];
}

- (id)_initWithTimers:(id)a3 templateActions:(id)a4 timerAction:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STTimerShowTimerAndPerformAction;
  v10 = [(AFSiriRequest *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    timers = v10->_timers;
    v10->_timers = (NSArray *)v11;

    uint64_t v13 = [v9 copy];
    templateActions = v10->_templateActions;
    v10->_templateActions = (NSArray *)v13;

    v10->_action = a5;
  }

  return v10;
}

- (id)_initWithTimers:(id)a3 action:(unint64_t)a4
{
  return [(STTimerShowTimerAndPerformAction *)self _initWithTimers:a3 templateActions:0 timerAction:a4];
}

- (id)_initWithTimer:(id)a3 action:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STTimerShowTimerAndPerformAction;
  v7 = [(AFSiriRequest *)&v11 init];
  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObject:v6];
      timers = v7->_timers;
      v7->_timers = (NSArray *)v8;
    }
    v7->_action = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end