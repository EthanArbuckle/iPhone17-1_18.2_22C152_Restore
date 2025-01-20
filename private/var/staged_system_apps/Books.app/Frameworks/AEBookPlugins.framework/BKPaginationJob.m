@interface BKPaginationJob
- (BOOL)force;
- (id)init:(unint64_t)a3;
- (unint64_t)jobGeneration;
- (void)copyState:(id)a3;
- (void)setForce:(BOOL)a3;
- (void)setJobGeneration:(unint64_t)a3;
@end

@implementation BKPaginationJob

- (id)init:(unint64_t)a3
{
  v4 = [(BKJob *)self init];
  v5 = v4;
  if (v4) {
    [(BKPaginationJob *)v4 setJobGeneration:a3];
  }
  return v5;
}

- (void)copyState:(id)a3
{
  id v4 = [a3 jobGeneration];

  [(BKPaginationJob *)self setJobGeneration:v4];
}

- (unint64_t)jobGeneration
{
  return self->_jobGeneration;
}

- (void)setJobGeneration:(unint64_t)a3
{
  self->_jobGeneration = a3;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

@end