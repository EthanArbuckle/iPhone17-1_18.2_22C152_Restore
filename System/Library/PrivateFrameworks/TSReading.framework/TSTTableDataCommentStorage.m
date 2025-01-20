@interface TSTTableDataCommentStorage
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initObjectWithCommentStorage:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSTTableDataCommentStorage

- (id)initObjectWithCommentStorage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSTTableDataCommentStorage;
  v4 = [(TSTTableDataCommentStorage *)&v6 init];
  if (v4)
  {
    v4->mCommentStorage = (TSDCommentStorage *)a3;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return [(TSDCommentStorage *)self->mCommentStorage hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  mCommentStorage = self->mCommentStorage;
  uint64_t v6 = *((void *)a3 + 2);

  return [(TSDCommentStorage *)mCommentStorage isEqual:v6];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"refCount: %d   commentStorage: %@", self->super.mRefCount, self->mCommentStorage];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataCommentStorage;
  [(TSTTableDataCommentStorage *)&v3 dealloc];
}

@end