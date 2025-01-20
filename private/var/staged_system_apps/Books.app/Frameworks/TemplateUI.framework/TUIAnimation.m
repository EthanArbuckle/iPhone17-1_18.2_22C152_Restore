@interface TUIAnimation
- ($4AC7F32B1C626A3A04933030E84D26E0)timing;
- (NSArray)steps;
- (TUIAnimationStep)from;
- (TUIAnimationStep)to;
- (double)delay;
- (double)duration;
- (id)_animationRenderModelForStep:(id)a3 sourceRenderModel:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)generateRenderModelsFromSource:(id)a3;
- (unint64_t)options;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFrom:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setSteps:(id)a3;
- (void)setTiming:(id *)a3;
- (void)setTo:(id)a3;
@end

@implementation TUIAnimation

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TUIAnimation allocWithZone:a3] init];
  v5 = v4;
  if (v4)
  {
    v4->_delay = self->_delay;
    v4->_duration = self->_duration;
    v4->_options = self->_options;
    long long v6 = *(_OWORD *)&self->_timing.mass;
    long long v7 = *(_OWORD *)&self->_timing.damping;
    v4->_timing.initialVelocity.dy = self->_timing.initialVelocity.dy;
    *(_OWORD *)&v4->_timing.damping = v7;
    *(_OWORD *)&v4->_timing.mass = v6;
    v8 = (NSArray *)[(NSArray *)self->_steps copy];
    steps = v5->_steps;
    v5->_steps = v8;

    v10 = (TUIAnimationStep *)[(TUIAnimationStep *)self->_from copy];
    from = v5->_from;
    v5->_from = v10;

    v12 = (TUIAnimationStep *)[(TUIAnimationStep *)self->_to copy];
    to = v5->_to;
    v5->_to = v12;
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:@"<"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 addObject:v5];

  long long v6 = +[NSString stringWithFormat:@" %p", self];
  [v3 addObject:v6];

  long long v7 = +[NSString stringWithFormat:@" delay: %g", *(void *)&self->_delay];
  [v3 addObject:v7];

  v8 = +[NSString stringWithFormat:@" duration: %g", *(void *)&self->_duration];
  [v3 addObject:v8];

  v9 = +[NSNumber numberWithUnsignedInteger:self->_options];
  v10 = +[NSString stringWithFormat:@" options: %@", v9];
  [v3 addObject:v10];

  [v3 addObject:@" timing: "];
  float64x2_t v11 = *(float64x2_t *)&self->_timing.damping;
  v31[0] = *(float64x2_t *)&self->_timing.mass;
  v31[1] = v11;
  CGFloat dy = self->_timing.initialVelocity.dy;
  v12 = NSStringFromTUISpringTimingParameters(v31);
  [v3 addObject:v12];

  v13 = [(TUIAnimationStep *)self->_from description];
  v14 = +[NSString stringWithFormat:@" from: %@", v13];
  [v3 addObject:v14];

  v15 = [(TUIAnimationStep *)self->_to description];
  v16 = +[NSString stringWithFormat:@" to: %@", v15];
  [v3 addObject:v16];

  [v3 addObject:@" steps: { "];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v17 = self->_steps;
  id v18 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v18)
  {
    id v19 = v18;
    char v20 = 0;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (v20) {
          [v3 addObject:@", "];
        }
        v24 = [v23 description];
        [v3 addObject:v24];

        char v20 = 1;
      }
      id v19 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v19);

    [v3 addObject:@" "];
  }
  else
  {
  }
  [v3 addObject:@"}>"];
  v25 = [v3 componentsJoinedByString:&stru_257BF0];

  return v25;
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

- ($4AC7F32B1C626A3A04933030E84D26E0)timing
{
  long long v3 = *(_OWORD *)&self[1].var3.dy;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var3.CGFloat dy = self[2].var1;
  return self;
}

- (void)setTiming:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  self->_timing.initialVelocity.CGFloat dy = a3->var3.dy;
  *(_OWORD *)&self->_timing.damping = v4;
  *(_OWORD *)&self->_timing.mass = v3;
}

- (NSArray)steps
{
  return self->_steps;
}

- (void)setSteps:(id)a3
{
}

- (TUIAnimationStep)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (TUIAnimationStep)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);

  objc_storeStrong((id *)&self->_steps, 0);
}

- (id)generateRenderModelsFromSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v6 = [(TUIAnimation *)self steps];
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        float64x2_t v11 = [(TUIAnimation *)self _animationRenderModelForStep:*(void *)(*((void *)&v23 + 1) + 8 * i) sourceRenderModel:v4];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  v12 = objc_alloc_init(TUIAnimationRenderModel);
  [(TUIAnimation *)self delay];
  -[TUIAnimationRenderModel setDelay:](v12, "setDelay:");
  [(TUIAnimation *)self duration];
  -[TUIAnimationRenderModel setDuration:](v12, "setDuration:");
  [(TUIAnimationRenderModel *)v12 setOptions:[(TUIAnimationRenderModel *)v12 options] | [(TUIAnimation *)self options]];
  [(TUIAnimation *)self timing];
  v18[0] = v20;
  v18[1] = v21;
  uint64_t v19 = v22;
  [(TUIAnimationRenderModel *)v12 setTiming:v18];
  [(TUIAnimationRenderModel *)v12 setModels:v5];
  v13 = [(TUIAnimation *)self from];
  v14 = [(TUIAnimation *)self _animationRenderModelForStep:v13 sourceRenderModel:v4];
  [(TUIAnimationRenderModel *)v12 setFrom:v14];

  v15 = [(TUIAnimation *)self to];
  v16 = [(TUIAnimation *)self _animationRenderModelForStep:v15 sourceRenderModel:v4];
  [(TUIAnimationRenderModel *)v12 setTo:v16];

  return v12;
}

- (id)_animationRenderModelForStep:(id)a3 sourceRenderModel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 values];
    id v8 = v6;
    id v9 = v7;
    id v10 = v8;
    id v11 = v10;
    if ([v9 count])
    {
      id v32 = v5;
      id v11 = [v10 copyWithZone:0];
      id v31 = v10;

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v12 = [v9 keyEnumerator];
      id v13 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v39;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v39 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            id v18 = [v9 objectForKeyedSubscript:v17];
            if ([v17 isEqualToString:@"alpha"])
            {
              uint64_t v19 = objc_opt_class();
              long long v20 = TUIDynamicCast(v19, v18);
              long long v21 = v20;
              if (v20)
              {
                [v20 doubleValue];
                [v11 setAlpha:];
              }
            }
            else if ([v17 isEqualToString:@"transform"])
            {
              memset(&v37, 0, sizeof(v37));
              if (v18) {
                [v18 CGAffineTransformValue];
              }
              if (v11) {
                [v11 transform];
              }
              else {
                memset(&t1, 0, sizeof(t1));
              }
              CGAffineTransform t2 = v37;
              CGAffineTransformConcat(&v36, &t1, &t2);
              CGAffineTransform v33 = v36;
              [v11 setTransform:&v33];
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v14);
      }

      id v5 = v32;
      id v10 = v31;
    }

    uint64_t v22 = [TUIAnimationRenderModelStep alloc];
    [v5 startTime];
    double v24 = v23;
    [v5 duration];
    double v26 = v25;
    long long v27 = [v5 values];
    long long v28 = [v27 allKeys];
    long long v29 = [(TUIAnimationRenderModelStep *)v22 initWithStepStartTime:v11 duration:v28 renderModel:v24 animatedKeyPaths:v26];
  }
  else
  {
    long long v29 = 0;
  }

  return v29;
}

@end