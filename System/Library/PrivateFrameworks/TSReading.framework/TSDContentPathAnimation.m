@interface TSDContentPathAnimation
- (BOOL)i_canProduceAnimation;
- (CAMediaTimingFunction)timingFunction;
- (NSArray)contentLocations;
- (NSArray)keyTimes;
- (NSArray)timingFunctions;
- (TSDContentPath)contentPath;
- (double)duration;
- (id)i_animationWithTransformBlock:(id)a3;
- (id)i_endLocation;
- (void)dealloc;
- (void)setContentLocations:(id)a3;
- (void)setContentPath:(id)a3;
- (void)setDuration:(double)a3;
- (void)setKeyTimes:(id)a3;
- (void)setTimingFunction:(id)a3;
- (void)setTimingFunctions:(id)a3;
@end

@implementation TSDContentPathAnimation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDContentPathAnimation;
  [(TSDContentPathAnimation *)&v3 dealloc];
}

- (TSDContentPath)contentPath
{
  return +[TSDContentPath contentPathWithLocations:self->_contentLocations];
}

- (void)setContentPath:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "i_contentLocations");

  [(TSDContentPathAnimation *)self setContentLocations:v4];
}

- (BOOL)i_canProduceAnimation
{
  return 1;
}

- (id)i_animationWithTransformBlock:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  contentLocations = self->_contentLocations;
  uint64_t v7 = [(NSArray *)contentLocations countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(contentLocations);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        (*((void (**)(long long *__return_ptr, id, uint64_t))a3 + 2))(&v15, a3, v11);
        v14[4] = v19;
        v14[5] = v20;
        v14[6] = v21;
        v14[7] = v22;
        v14[0] = v15;
        v14[1] = v16;
        v14[2] = v17;
        v14[3] = v18;
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCATransform3D:", v14));
      }
      uint64_t v8 = [(NSArray *)contentLocations countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
  v12 = (void *)[MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
  [v12 setValues:v5];
  [(TSDContentPathAnimation *)self duration];
  objc_msgSend(v12, "setDuration:");
  objc_msgSend(v12, "setTimingFunction:", -[TSDContentPathAnimation timingFunction](self, "timingFunction"));
  [v12 setKeyTimes:self->_keyTimes];
  [v12 setTimingFunctions:self->_timingFunctions];
  return v12;
}

- (id)i_endLocation
{
  return [(NSArray *)self->_contentLocations lastObject];
}

- (NSArray)contentLocations
{
  return self->_contentLocations;
}

- (void)setContentLocations:(id)a3
{
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (NSArray)keyTimes
{
  return self->_keyTimes;
}

- (void)setKeyTimes:(id)a3
{
}

- (NSArray)timingFunctions
{
  return self->_timingFunctions;
}

- (void)setTimingFunctions:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end