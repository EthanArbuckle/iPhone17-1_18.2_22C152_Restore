@interface TUIAnimationRenderModel
- ($4AC7F32B1C626A3A04933030E84D26E0)timing;
- (NSArray)models;
- (TUIAnimationRenderModelStep)from;
- (TUIAnimationRenderModelStep)to;
- (double)delay;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)options;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFrom:(id)a3;
- (void)setModels:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setTiming:(id *)a3;
- (void)setTo:(id)a3;
@end

@implementation TUIAnimationRenderModel

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TUIAnimationRenderModel allocWithZone:a3] init];
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
    v8 = (NSArray *)[(NSArray *)self->_models copy];
    models = v5->_models;
    v5->_models = v8;

    v10 = (TUIAnimationRenderModelStep *)[(TUIAnimationRenderModelStep *)self->_from copy];
    from = v5->_from;
    v5->_from = v10;

    v12 = (TUIAnimationRenderModelStep *)[(TUIAnimationRenderModelStep *)self->_to copy];
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

  long long v11 = *(_OWORD *)&self->_timing.damping;
  float64x2_t v25 = *(float64x2_t *)&self->_timing.mass;
  long long v26 = v11;
  CGFloat dy = self->_timing.initialVelocity.dy;
  v12 = NSStringFromTUISpringTimingParameters(&v25);
  v13 = +[NSString stringWithFormat:@" timing: %@", v12];
  [v3 addObject:v13];

  v14 = [(TUIAnimationRenderModelStep *)self->_from description];
  v15 = +[NSString stringWithFormat:@" from: %@", v14];
  [v3 addObject:v15];

  v16 = [(TUIAnimationRenderModelStep *)self->_to description];
  v17 = +[NSString stringWithFormat:@" to: %@", v16];
  [v3 addObject:v17];

  [v3 addObject:@" models: { "];
  v25.f64[0] = 0.0;
  *(void *)&v25.f64[1] = &v25;
  *(void *)&long long v26 = 0x2020000000;
  BYTE8(v26) = 0;
  models = self->_models;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_17D9D4;
  v22[3] = &unk_257178;
  v24 = &v25;
  id v19 = v3;
  id v23 = v19;
  [(NSArray *)models enumerateObjectsUsingBlock:v22];
  if (*(unsigned char *)(*(void *)&v25.f64[1] + 24)) {
    [v19 addObject:@" "];
  }
  [v19 addObject:@"}>"];
  v20 = [v19 componentsJoinedByString:&stru_257BF0];

  _Block_object_dispose(&v25, 8);

  return v20;
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

- (NSArray)models
{
  return self->_models;
}

- (void)setModels:(id)a3
{
}

- (TUIAnimationRenderModelStep)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (TUIAnimationRenderModelStep)to
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

  objc_storeStrong((id *)&self->_models, 0);
}

@end