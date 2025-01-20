@interface TUIAnimationRenderModelStep
- (NSArray)keyPaths;
- (TUIAnimationRenderModelStep)initWithStepStartTime:(double)a3 duration:(double)a4 renderModel:(id)a5 animatedKeyPaths:(id)a6;
- (TUIRenderModelAnimatable)renderModel;
- (double)stepDuration;
- (double)stepStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation TUIAnimationRenderModelStep

- (TUIAnimationRenderModelStep)initWithStepStartTime:(double)a3 duration:(double)a4 renderModel:(id)a5 animatedKeyPaths:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TUIAnimationRenderModelStep;
  v13 = [(TUIAnimationRenderModelStep *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_stepStartTime = a3;
    v13->_stepDuration = a4;
    objc_storeStrong((id *)&v13->_renderModel, a5);
    v15 = (NSArray *)[v12 copy];
    keyPaths = v14->_keyPaths;
    v14->_keyPaths = v15;
  }
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TUIAnimationRenderModelStep allocWithZone:a3];
  double stepStartTime = self->_stepStartTime;
  double stepDuration = self->_stepDuration;
  renderModel = self->_renderModel;
  keyPaths = self->_keyPaths;

  return [(TUIAnimationRenderModelStep *)v4 initWithStepStartTime:renderModel duration:keyPaths renderModel:stepStartTime animatedKeyPaths:stepDuration];
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

  v7 = +[NSString stringWithFormat:@" startTime: %g", *(void *)&self->_stepStartTime];
  [v3 addObject:v7];

  v8 = +[NSString stringWithFormat:@" duration: %g", *(void *)&self->_stepDuration];
  [v3 addObject:v8];

  [v3 addObject:@" keyPaths: "];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v9 = self->_keyPaths;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (v12) {
          [v3 addObject:@", "];
        }
        [v3 addObject:v15];
        [v3 addObject:@" = "];
        if ([v15 isEqualToString:@"alpha"])
        {
          [(TUIRenderModelAnimatable *)self->_renderModel alpha];
          uint64_t v17 = +[NSString stringWithFormat:@"%g", v16];
        }
        else
        {
          if (![v15 isEqualToString:@"transform"]) {
            goto LABEL_16;
          }
          renderModel = self->_renderModel;
          if (renderModel) {
            [(TUIRenderModelAnimatable *)renderModel transform];
          }
          else {
            memset(&transform, 0, sizeof(transform));
          }
          uint64_t v17 = NSStringFromCGAffineTransform(&transform);
        }
        v19 = (void *)v17;
        [v3 addObject:v17];

LABEL_16:
        char v12 = 1;
      }
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  v20 = +[NSString stringWithFormat:@" renderModel: %p", self->_renderModel];
  [v3 addObject:v20];

  [v3 addObject:@">"];
  v21 = [v3 componentsJoinedByString:&stru_257BF0];

  return v21;
}

- (double)stepStartTime
{
  return self->_stepStartTime;
}

- (double)stepDuration
{
  return self->_stepDuration;
}

- (TUIRenderModelAnimatable)renderModel
{
  return self->_renderModel;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPaths, 0);

  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end