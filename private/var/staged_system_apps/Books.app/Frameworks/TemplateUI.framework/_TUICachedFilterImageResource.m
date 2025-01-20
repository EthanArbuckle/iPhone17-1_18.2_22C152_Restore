@interface _TUICachedFilterImageResource
+ (id)sizedKeyForFilter:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5 imageResource:(id)a6;
+ (id)unsizedKeyForFilter:(id)a3 contentsScale:(double)a4 imageResource:(id)a5;
- (BCUImageFilter)filter;
- (BCUOperation)filterOperation;
- (NSDictionary)filterOptions;
- (_TUICachedFilterImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resource:(id)a8 filter:(id)a9;
- (id)_filterOptions;
- (id)debugFunctionalDescription;
- (id)newImageResourceWithSize:(CGSize)a3;
- (id)sizedKey;
- (id)unsizedKey;
- (void)_endFilterOperation:(id)a3;
- (void)_startFilterOperation:(id)a3;
- (void)applyToImage:(id)a3 completion:(id)a4;
@end

@implementation _TUICachedFilterImageResource

- (_TUICachedFilterImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resource:(id)a8 filter:(id)a9
{
  double height = a6.height;
  double width = a6.width;
  id v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)_TUICachedFilterImageResource;
  v19 = -[_TUICachedPipelineImageResource initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:](&v22, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:", a3, a4, a5, a8, width, height, a7);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_filter, a9);
    v20->_operationLock._os_unfair_lock_opaque = 0;
  }

  return v20;
}

- (id)debugFunctionalDescription
{
  v3 = [(_TUICachedPipelineImageResource *)self imageResource];
  v4 = [v3 debugFunctionalDescription];
  v5 = [(BCUImageFilter *)self->_filter identifier];
  v6 = +[NSString stringWithFormat:@"(%@).filter(%@)", v4, v5];

  return v6;
}

- (id)_filterOptions
{
  v3 = [(_TUICachedPipelineImageResource *)self imageResource];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(_TUICachedPipelineImageResource *)self imageResource];
    v6 = [v5 filterOptions];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_startFilterOperation:(id)a3
{
  char v4 = (BCUOperation *)a3;
  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  filterOperation = self->_filterOperation;
  self->_filterOperation = v4;
  v8 = v4;
  v7 = filterOperation;

  os_unfair_lock_unlock(p_operationLock);
  [(BCUOperation *)v7 cancel];
  [(BCUOperation *)v8 start];
}

- (void)_endFilterOperation:(id)a3
{
  char v4 = (BCUOperation *)a3;
  os_unfair_lock_lock(&self->_operationLock);
  if (self->_filterOperation == v4)
  {
    self->_filterOperation = 0;
  }
  os_unfair_lock_unlock(&self->_operationLock);
}

- (void)applyToImage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  filter = self->_filter;
  v8 = [a3 image];
  id v9 = [v8 CGImage];
  [(_TUICachedImageResource *)self naturalSize];
  double v11 = v10;
  double v13 = v12;
  [(_TUICachedImageResource *)self contentsScale];
  double v15 = v14;
  v16 = [(_TUICachedFilterImageResource *)self _filterOptions];
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  objc_super v22 = sub_A5E54;
  v23 = &unk_2545D0;
  v24 = self;
  id v25 = v6;
  id v17 = v6;
  LODWORD(v18) = 1056964608;
  id v19 = -[BCUImageFilter newOperationWithImage:size:contentsScale:priority:options:waitForCPUSynchronization:logKey:completion:](filter, "newOperationWithImage:size:contentsScale:priority:options:waitForCPUSynchronization:logKey:completion:", v9, v16, 0, 0, &v20, v11, v13, v15, v18);

  -[_TUICachedFilterImageResource _startFilterOperation:](self, "_startFilterOperation:", v19, v20, v21, v22, v23, v24);
}

- (id)newImageResourceWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._cache);
  v7 = [(_TUICachedPipelineImageResource *)self imageResource];
  id v8 = [v7 newImageResourceWithSize:width, height];
  [(_TUICachedImageResource *)self contentsScale];
  double v10 = v9;
  double v11 = [(BCUImageFilter *)self->_filter identifier];
  double v12 = [(_TUICachedFilterImageResource *)self _filterOptions];
  double v13 = [WeakRetained imageResource:v8 naturalSize:v11 contentsScale:v12 withFilter:width height:v10];

  return v13;
}

+ (id)sizedKeyForFilter:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5 imageResource:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  double v11 = [a6 sizedKey];
  double v12 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", v10, width, height, a5);

  double v13 = [v11 cacheKeyWithFilterInfo:v12];

  return v13;
}

+ (id)unsizedKeyForFilter:(id)a3 contentsScale:(double)a4 imageResource:(id)a5
{
  id v7 = a3;
  id v8 = [a5 unsizedKey];
  double v9 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", v7, CGSizeZero.width, CGSizeZero.height, a4);

  id v10 = [v8 cacheKeyWithFilterInfo:v9];

  return v10;
}

- (id)sizedKey
{
  v14.receiver = self;
  v14.super_class = (Class)_TUICachedFilterImageResource;
  v3 = [(_TUICachedPipelineImageResource *)&v14 sizedKey];
  char v4 = [_TUICachedImageFilterInfo alloc];
  filter = self->_filter;
  [(_TUICachedImageResource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  [(_TUICachedImageResource *)self contentsScale];
  double v11 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:](v4, "initWithFilter:naturalSize:contentsScale:", filter, v7, v9, v10);
  double v12 = [v3 cacheKeyWithFilterInfo:v11];

  return v12;
}

- (id)unsizedKey
{
  v10.receiver = self;
  v10.super_class = (Class)_TUICachedFilterImageResource;
  v3 = [(_TUICachedPipelineImageResource *)&v10 unsizedKey];
  char v4 = [_TUICachedImageFilterInfo alloc];
  filter = self->_filter;
  [(_TUICachedImageResource *)self contentsScale];
  double v7 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:](v4, "initWithFilter:naturalSize:contentsScale:", filter, CGSizeZero.width, CGSizeZero.height, v6);
  double v8 = [v3 cacheKeyWithFilterInfo:v7];

  return v8;
}

- (BCUOperation)filterOperation
{
  return self->_filterOperation;
}

- (BCUImageFilter)filter
{
  return self->_filter;
}

- (NSDictionary)filterOptions
{
  return self->_filterOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterOptions, 0);
  objc_storeStrong((id *)&self->_filter, 0);

  objc_storeStrong((id *)&self->_filterOperation, 0);
}

@end