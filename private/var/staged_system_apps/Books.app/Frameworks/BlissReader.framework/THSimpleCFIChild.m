@interface THSimpleCFIChild
+ (id)childWithIndex:(unint64_t)a3;
- (BOOL)isAcceptableLeaf;
- (THSimpleCFIChild)initWithIndex:(unint64_t)a3;
- (id)cfiString;
- (unint64_t)index;
- (void)setIndex:(unint64_t)a3;
@end

@implementation THSimpleCFIChild

- (THSimpleCFIChild)initWithIndex:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THSimpleCFIChild;
  v4 = [(THSimpleCFIChild *)&v7 init];
  v5 = v4;
  if (v4) {
    [(THSimpleCFIChild *)v4 setIndex:a3];
  }
  return v5;
}

- (BOOL)isAcceptableLeaf
{
  return 1;
}

+ (id)childWithIndex:(unint64_t)a3
{
  v3 = [[THSimpleCFIChild alloc] initWithIndex:a3];

  return v3;
}

- (id)cfiString
{
  return +[NSString stringWithFormat:@"/%lu", [(THSimpleCFIChild *)self index]];
}

- (unint64_t)index
{
  return self->index;
}

- (void)setIndex:(unint64_t)a3
{
  self->index = a3;
}

@end