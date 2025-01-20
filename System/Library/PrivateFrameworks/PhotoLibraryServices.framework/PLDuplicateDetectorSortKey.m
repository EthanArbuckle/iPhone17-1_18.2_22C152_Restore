@interface PLDuplicateDetectorSortKey
+ (id)sortKey:(id)a3 reverse:(BOOL)a4;
- (BOOL)reverse;
- (NSString)key;
- (void)setKey:(id)a3;
- (void)setReverse:(BOOL)a3;
@end

@implementation PLDuplicateDetectorSortKey

- (void).cxx_destruct
{
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

+ (id)sortKey:(id)a3 reverse:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PLDuplicateDetectorPostProcessing.m", 95, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  v8 = objc_alloc_init(PLDuplicateDetectorSortKey);
  [(PLDuplicateDetectorSortKey *)v8 setKey:v7];
  [(PLDuplicateDetectorSortKey *)v8 setReverse:v4];

  return v8;
}

@end