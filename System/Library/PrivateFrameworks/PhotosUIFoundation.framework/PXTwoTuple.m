@interface PXTwoTuple
- (PXTwoTuple)initWithFirst:(id)a3 second:(id)a4;
- (id)first;
- (id)second;
- (void)setFirst:(id)a3;
- (void)setSecond:(id)a3;
@end

@implementation PXTwoTuple

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);

  objc_storeStrong(&self->_first, 0);
}

- (void)setSecond:(id)a3
{
}

- (id)second
{
  return self->_second;
}

- (void)setFirst:(id)a3
{
}

- (id)first
{
  return self->_first;
}

- (PXTwoTuple)initWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXTwoTuple;
  v9 = [(PXTwoTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

@end