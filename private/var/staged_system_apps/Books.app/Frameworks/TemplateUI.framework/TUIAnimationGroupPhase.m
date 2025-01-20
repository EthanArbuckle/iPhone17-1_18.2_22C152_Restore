@interface TUIAnimationGroupPhase
- (NSArray)animations;
- (double)delay;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)options;
- (void)setAnimations:(id)a3;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation TUIAnimationGroupPhase

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TUIAnimationGroupPhase allocWithZone:a3] init];
  if (v4)
  {
    v5 = (NSArray *)[(NSArray *)self->_animations copy];
    animations = v4->_animations;
    v4->_animations = v5;

    v4->_delay = self->_delay;
    v4->_duration = self->_duration;
    v4->_options = self->_options;
  }
  return v4;
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

  v7 = +[NSString stringWithFormat:@" delay: %g", *(void *)&self->_delay];
  [v3 addObject:v7];

  v8 = +[NSString stringWithFormat:@" duration: %g", *(void *)&self->_duration];
  [v3 addObject:v8];

  v9 = +[NSNumber numberWithUnsignedInteger:self->_options];
  v10 = +[NSString stringWithFormat:@" options: %@", v9];
  [v3 addObject:v10];

  [v3 addObject:@" animations: { "];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v11 = self->_animations;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (v14) {
          [v3 addObject:@", "];
        }
        [v3 addObject:@"<"];
        v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        [v3 addObject:v19];

        v20 = +[NSString stringWithFormat:@" %p>", v17];
        [v3 addObject:v20];

        char v14 = 1;
      }
      id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);

    [v3 addObject:@" "];
  }
  else
  {
  }
  [v3 addObject:@"}>"];
  v21 = [v3 componentsJoinedByString:&stru_257BF0];

  return v21;
}

- (NSArray)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
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

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
}

@end