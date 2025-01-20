@interface pathStack
- (id)fullPath;
- (id)peek;
- (id)pop;
- (pathStack)init;
- (void)push:(id)a3;
@end

@implementation pathStack

- (pathStack)init
{
  v6.receiver = self;
  v6.super_class = (Class)pathStack;
  v2 = [(pathStack *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray arrayWithCapacity:128];
    pathElements = v2->pathElements;
    v2->pathElements = (NSMutableArray *)v3;

    if (!v2->pathElements)
    {

      return 0;
    }
  }
  return v2;
}

- (void)push:(id)a3
{
}

- (id)peek
{
  id v3 = [(NSMutableArray *)self->pathElements count];
  if (v3)
  {
    id v3 = [(NSMutableArray *)self->pathElements lastObject];
  }

  return v3;
}

- (id)pop
{
  id v3 = [(pathStack *)self peek];
  if (v3) {
    [(NSMutableArray *)self->pathElements removeObject:v3];
  }

  return v3;
}

- (id)fullPath
{
  id v3 = [(NSMutableArray *)self->pathElements count];
  if (v3)
  {
    id v3 = +[NSString pathWithComponents:self->pathElements];
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end