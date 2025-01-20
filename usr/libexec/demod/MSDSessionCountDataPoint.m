@interface MSDSessionCountDataPoint
- (MSDSessionCountDataPoint)initWithCount:(int64_t)a3;
- (id)print;
- (int64_t)count;
- (void)setCount:(int64_t)a3;
@end

@implementation MSDSessionCountDataPoint

- (MSDSessionCountDataPoint)initWithCount:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSDSessionCountDataPoint;
  v4 = [(MSDSessionCountDataPoint *)&v7 init];
  v5 = v4;
  if (v4) {
    [(MSDSessionCountDataPoint *)v4 setCount:a3];
  }
  return v5;
}

- (id)print
{
  return +[NSString stringWithFormat:@"%llu", [(MSDSessionCountDataPoint *)self count]];
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

@end