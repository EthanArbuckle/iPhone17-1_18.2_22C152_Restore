@interface OADPath
- (BOOL)stroked;
- (CGSize)size;
- (OADPath)init;
- (id)description;
- (id)elementAtIndex:(unint64_t)a3;
- (int)fillMode;
- (unint64_t)elementCount;
- (void)addElement:(id)a3;
- (void)setFillMode:(int)a3;
- (void)setSize:(CGSize)a3;
- (void)setStroked:(BOOL)a3;
@end

@implementation OADPath

- (OADPath)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADPath;
  v2 = [(OADPath *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mElements = v2->mElements;
    v2->mElements = v3;

    v2->mFillMode = 1;
    v2->mStroked = 1;
  }
  return v2;
}

- (void)addElement:(id)a3
{
}

- (unint64_t)elementCount
{
  return [(NSMutableArray *)self->mElements count];
}

- (BOOL)stroked
{
  return self->mStroked;
}

- (id)elementAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mElements objectAtIndex:a3];
}

- (void)setFillMode:(int)a3
{
  self->mFillMode = a3;
}

- (void)setStroked:(BOOL)a3
{
  self->mStroked = a3;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)fillMode
{
  return self->mFillMode;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADPath;
  v2 = [(OADPath *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end