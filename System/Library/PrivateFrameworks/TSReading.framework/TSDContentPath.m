@interface TSDContentPath
+ (TSDContentPath)contentPathWithLocations:(id)a3;
- (NSArray)contentLocations;
- (id)contentLocationAtTime:(double)a3 withTimingFunction:(id)a4;
- (id)i_contentLocations;
- (void)dealloc;
- (void)setContentLocations:(id)a3;
@end

@implementation TSDContentPath

+ (TSDContentPath)contentPathWithLocations:(id)a3
{
  v4 = objc_alloc_init(TSDContentPath);
  [(TSDContentPath *)v4 setContentLocations:a3];

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDContentPath;
  [(TSDContentPath *)&v3 dealloc];
}

- (id)contentLocationAtTime:(double)a3 withTimingFunction:(id)a4
{
  id v7 = [(NSArray *)self->_contentLocations lastObject];
  if ([(NSArray *)self->_contentLocations count] < 2) {
    return v7;
  }
  if (!a4) {
    a4 = (id)[MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
  }
  [a4 solveForTime:a3];
  double v9 = v8;
  float v10 = v8 * (double)[(NSArray *)self->_contentLocations count];
  float v11 = floorf(v10);
  float v12 = (float)([(NSArray *)self->_contentLocations count] - 1);
  unint64_t v13 = [(NSArray *)self->_contentLocations count];
  if (v11 >= v12)
  {
    float v15 = (float)(v13 - 1);
  }
  else
  {
    float v14 = v9 * (double)v13;
    float v15 = floorf(v14);
  }
  unint64_t v17 = (unint64_t)v15;
  id v18 = [(NSArray *)self->_contentLocations objectAtIndex:(unint64_t)v15];
  id v19 = [(NSArray *)self->_contentLocations objectAtIndex:v17 + 1];
  double v20 = v9 / (double)[(NSArray *)self->_contentLocations count];
  [v19 unscaledPoint];
  double v22 = v21;
  double v24 = v23;
  [v18 unscaledPoint];
  double v26 = TSDSubtractPoints(v22, v24, v25);
  double v28 = TSDMultiplyPointScalar(v26, v27, v20);
  [v19 viewScale];
  double v30 = v29;
  [v18 viewScale];
  double v32 = v20 * (v30 - v31);
  [v18 unscaledPoint];
  double v35 = TSDAddPoints(v33, v34, v28);
  double v37 = v36;
  [v18 viewScale];

  return +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v35, v37, v32 + v38);
}

- (id)i_contentLocations
{
  return self->_contentLocations;
}

- (NSArray)contentLocations
{
  return self->_contentLocations;
}

- (void)setContentLocations:(id)a3
{
}

@end