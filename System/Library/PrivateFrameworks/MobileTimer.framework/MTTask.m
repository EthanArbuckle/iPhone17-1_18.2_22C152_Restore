@interface MTTask
+ (id)taskWithIdentifier:(id)a3 completableBlock:(id)a4;
+ (id)taskWithIdentifier:(id)a3 delay:(double)a4 completableBlock:(id)a5;
- (MTGCDTimer)timer;
- (NSString)identifier;
- (double)delay;
- (id)completableBlock;
- (id)description;
- (void)setCompletableBlock:(id)a3;
- (void)setDelay:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation MTTask

+ (id)taskWithIdentifier:(id)a3 completableBlock:(id)a4
{
  return (id)[a1 taskWithIdentifier:a3 delay:a4 completableBlock:0.0];
}

+ (id)taskWithIdentifier:(id)a3 delay:(double)a4 completableBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = objc_opt_new();
  [v9 setIdentifier:v8];

  [v9 setDelay:a4];
  [v9 setCompletableBlock:v7];

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MTTask *)self identifier];
  [(MTTask *)self delay];
  id v7 = [v3 stringWithFormat:@"<%@:%p %@ delay:%f>", v4, self, v5, v6];

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (id)completableBlock
{
  return self->_completableBlock;
}

- (void)setCompletableBlock:(id)a3
{
}

- (MTGCDTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_completableBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end