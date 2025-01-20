@interface scoredModel
- (NSString)modelKey;
- (double)score;
- (int64_t)compare:(id)a3;
- (scoredModel)initWithModelKey:(id)a3 score:(double)a4;
- (void)setModelKey:(id)a3;
- (void)setScore:(double)a3;
@end

@implementation scoredModel

- (scoredModel)initWithModelKey:(id)a3 score:(double)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)scoredModel;
  v7 = [(scoredModel *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(scoredModel *)v7 setScore:a4];
    [(scoredModel *)v8 setModelKey:v6];
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  [(scoredModel *)self score];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 score];
  double v9 = v8;

  *(float *)&double v10 = v9;
  v11 = [v7 numberWithFloat:v10];
  int64_t v12 = [v6 compare:v11];

  return v12;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)modelKey
{
  return self->_modelKey;
}

- (void)setModelKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end