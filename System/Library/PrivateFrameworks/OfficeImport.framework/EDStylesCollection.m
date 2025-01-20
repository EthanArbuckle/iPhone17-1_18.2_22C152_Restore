@interface EDStylesCollection
- (EDStylesCollection)init;
- (id)defaultWorkbookStyle;
- (unint64_t)addObject:(id)a3;
- (unint64_t)defaultWorkbookStyleIndex;
- (void)removeAllObjects;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)setDefaultWorkbookStyleIndex:(unint64_t)a3;
@end

@implementation EDStylesCollection

- (EDStylesCollection)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDStylesCollection;
  result = [(EDCollection *)&v3 init];
  if (result) {
    result->mDefaultWorkbookStyleIndex = -1;
  }
  return result;
}

- (void)setDefaultWorkbookStyleIndex:(unint64_t)a3
{
  self->mDefaultWorkbookStyleIndex = a3;
}

- (unint64_t)addObject:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EDStylesCollection;
  id v5 = [(EDCollection *)&v7 addObject:v4];
  if (v5 != (id)-1) {
    [v4 setIndex:v5];
  }

  return (unint64_t)v5;
}

- (id)defaultWorkbookStyle
{
  return [(EDCollection *)self objectAtIndex:self->mDefaultWorkbookStyleIndex];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EDStylesCollection;
  [(EDCollection *)&v3 removeObjectAtIndex:a3];
}

- (void)removeAllObjects
{
  v2.receiver = self;
  v2.super_class = (Class)EDStylesCollection;
  [(EDCollection *)&v2 removeAllObjects];
}

- (unint64_t)defaultWorkbookStyleIndex
{
  return self->mDefaultWorkbookStyleIndex;
}

@end