@interface _UICollectionViewSubviewRouterBookmark
+ (_UICollectionViewSubviewRouterBookmark)bookmarkForUncontrolledSubview;
- (id)description;
@end

@implementation _UICollectionViewSubviewRouterBookmark

+ (_UICollectionViewSubviewRouterBookmark)bookmarkForUncontrolledSubview
{
  self;
  v0 = objc_alloc_init(_UICollectionViewSubviewRouterBookmark);
  if (v0)
  {
    v0->_count = 1;
    v0->_orderMode = -10000;
  }
  return v0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (!self)
  {
    unint64_t count = 0;
    goto LABEL_8;
  }
  unint64_t count = self->_count;
  int64_t orderMode = self->_orderMode;
  if ((orderMode & 0x8000000000000000) == 0)
  {
    if (orderMode == 1)
    {
      v7 = @"Above Container";
      goto LABEL_12;
    }
    if (orderMode)
    {
LABEL_9:
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = [NSString stringWithUTF8String:"NSString * _Nonnull _UICollectionViewSubviewOrderModeToString(_UICollectionViewSubviewOrderMode)"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"_UICollectionViewSubviewRouter.m", 526, @"Unknown order mode: %ld", orderMode);

      v7 = &stru_1ED0E84C0;
      goto LABEL_12;
    }
LABEL_8:
    v7 = @"Container";
    goto LABEL_12;
  }
  if (orderMode != -10000)
  {
    if (orderMode == -1)
    {
      v7 = @"Below Container";
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v7 = @"Uncontrolled";
LABEL_12:
  v10 = [v3 stringWithFormat:@"<%@: %p unint64_t count = %ld; orderMode = %@;", v4, self, count, v7];;
  if (self)
  {
    if (self->_orderMode == -10000) {
      goto LABEL_16;
    }
    int64_t zIndex = self->_zIndex;
  }
  else
  {
    int64_t zIndex = 0;
  }
  v12 = objc_msgSend(NSString, "stringWithFormat:", @" int64_t zIndex = %ld", zIndex);
  uint64_t v13 = [v10 stringByAppendingString:v12];

  v10 = (void *)v13;
LABEL_16:
  v14 = [v10 stringByAppendingString:@">"];

  return v14;
}

@end