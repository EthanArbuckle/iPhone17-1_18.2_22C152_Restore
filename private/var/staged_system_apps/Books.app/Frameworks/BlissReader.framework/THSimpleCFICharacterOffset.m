@interface THSimpleCFICharacterOffset
+ (id)characterOffsetWithOffset:(unint64_t)a3;
- (BOOL)isAcceptableLeaf;
- (THSimpleCFICharacterOffset)initWithOffset:(unint64_t)a3;
- (id)cfiString;
- (unint64_t)offset;
- (void)setOffset:(unint64_t)a3;
@end

@implementation THSimpleCFICharacterOffset

- (THSimpleCFICharacterOffset)initWithOffset:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THSimpleCFICharacterOffset;
  v4 = [(THSimpleCFICharacterOffset *)&v7 init];
  v5 = v4;
  if (v4) {
    [(THSimpleCFICharacterOffset *)v4 setOffset:a3];
  }
  return v5;
}

- (BOOL)isAcceptableLeaf
{
  return 1;
}

+ (id)characterOffsetWithOffset:(unint64_t)a3
{
  v3 = [[THSimpleCFICharacterOffset alloc] initWithOffset:a3];

  return v3;
}

- (id)cfiString
{
  return +[NSString stringWithFormat:@":%lu", [(THSimpleCFICharacterOffset *)self offset]];
}

- (unint64_t)offset
{
  return self->offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->offset = a3;
}

@end