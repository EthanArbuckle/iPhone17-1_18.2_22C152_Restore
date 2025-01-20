@interface UIViewVectorAnimatableProperty
- (UIViewVectorAnimatableProperty)initWithLength:(unint64_t)a3;
- (const)_presentationValue;
- (const)_value;
- (const)_velocity;
- (id)_makeArrayFromVector:(const double *)a3;
- (unint64_t)_length;
- (void)_copyValue:(const double *)a3;
- (void)_copyVelocity:(const double *)a3;
- (void)_mutateValue:(id)a3;
- (void)_mutateVelocity:(id)a3;
- (void)_updateVectorFromArray:(id)a3;
- (void)dealloc;
@end

@implementation UIViewVectorAnimatableProperty

- (UIViewVectorAnimatableProperty)initWithLength:(unint64_t)a3
{
  v5 = +[UIAnimatablePropertyWrapper makeSwiftVectorAnimatableProperty];
  v8.receiver = self;
  v8.super_class = (Class)UIViewVectorAnimatableProperty;
  v6 = [(UIAnimatablePropertyWrapper *)&v8 initWithAnimatableProperty:v5];

  if (v6)
  {
    v6->__length = a3;
    v6->_vector = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v6;
}

- (void)_mutateValue:(id)a3
{
  v4 = (void (**)(id, double *))a3;
  [(UIViewVectorAnimatableProperty *)self _updateVectorFromArray:MEMORY[0x1E4F1CBF0]];
  v4[2](v4, self->_vector);

  id v6 = [(UIViewVectorAnimatableProperty *)self _makeArrayFromVector:self->_vector];
  v5 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  [v5 setValue:v6];
}

- (void)_updateVectorFromArray:(id)a3
{
  id v4 = a3;
  if (self->__length)
  {
    unint64_t v5 = 0;
    id v8 = v4;
    do
    {
      if ([v4 count] <= v5)
      {
        self->_vector[v5] = 0.0;
      }
      else
      {
        id v6 = [v8 objectAtIndexedSubscript:v5];
        [v6 doubleValue];
        self->_vector[v5] = v7;
      }
      id v4 = v8;
      ++v5;
    }
    while (self->__length > v5);
  }
}

- (id)_makeArrayFromVector:(const double *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->__length)
  {
    unint64_t v6 = 0;
    do
    {
      double v7 = [NSNumber numberWithDouble:a3[v6]];
      [v5 addObject:v7];

      ++v6;
    }
    while (self->__length > v6);
  }
  id v8 = (void *)[v5 copy];

  return v8;
}

- (void)dealloc
{
  free(self->_vector);
  v3.receiver = self;
  v3.super_class = (Class)UIViewVectorAnimatableProperty;
  [(UIAnimatablePropertyWrapper *)&v3 dealloc];
}

- (const)_value
{
  objc_super v3 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  id v4 = [v3 value];
  [(UIViewVectorAnimatableProperty *)self _updateVectorFromArray:v4];

  return self->_vector;
}

- (void)_copyValue:(const double *)a3
{
  id v5 = [(UIViewVectorAnimatableProperty *)self _makeArrayFromVector:a3];
  id v4 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  [v4 setValue:v5];
}

- (const)_presentationValue
{
  objc_super v3 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  id v4 = [v3 presentationValue];
  [(UIViewVectorAnimatableProperty *)self _updateVectorFromArray:v4];

  return self->_vector;
}

- (const)_velocity
{
  objc_super v3 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  id v4 = [v3 velocity];
  [(UIViewVectorAnimatableProperty *)self _updateVectorFromArray:v4];

  return self->_vector;
}

- (void)_mutateVelocity:(id)a3
{
  id v4 = (void (**)(id, double *))a3;
  [(UIViewVectorAnimatableProperty *)self _updateVectorFromArray:MEMORY[0x1E4F1CBF0]];
  v4[2](v4, self->_vector);

  id v6 = [(UIViewVectorAnimatableProperty *)self _makeArrayFromVector:self->_vector];
  id v5 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  [v5 setVelocity:v6];
}

- (void)_copyVelocity:(const double *)a3
{
  id v5 = [(UIViewVectorAnimatableProperty *)self _makeArrayFromVector:a3];
  id v4 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  [v4 setVelocity:v5];
}

- (unint64_t)_length
{
  return self->__length;
}

@end