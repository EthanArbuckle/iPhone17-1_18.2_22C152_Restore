@interface ODDDataPoint
- (id)presentations;
- (void)addAssociatedPresentation:(id)a3;
- (void)addPresentation:(id)a3 order:(unint64_t)a4;
@end

@implementation ODDDataPoint

- (void)addPresentation:(id)a3 order:(unint64_t)a4
{
  id v6 = a3;
  v7 = self->mPresentations;
  v10 = v7;
  [(id)objc_opt_class() addConnectionToPoint:v6 order:a4 array:&v10];
  v8 = v10;

  mPresentations = self->mPresentations;
  self->mPresentations = v8;
}

- (void)addAssociatedPresentation:(id)a3
{
  id v4 = a3;
  mPresentations = self->mPresentations;
  id v8 = v4;
  if (mPresentations)
  {
    if ([(NSMutableArray *)mPresentations indexOfObjectIdenticalTo:v4] == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->mPresentations addObject:v8];
    }
  }
  else
  {
    id v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v4, 0);
    v7 = self->mPresentations;
    self->mPresentations = v6;
  }
}

- (id)presentations
{
  return self->mPresentations;
}

- (void).cxx_destruct
{
}

@end