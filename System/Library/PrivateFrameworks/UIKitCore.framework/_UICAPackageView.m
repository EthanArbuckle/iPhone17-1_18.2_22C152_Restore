@interface _UICAPackageView
+ (BOOL)_shouldCatchDecodingExceptions;
+ (id)_newViewHierarchyFrom:(id)a3 publishedObjectViewClassMap:(id)a4 into:(id)a5;
+ (void)loadPackageViewWithObject:(id)a3 publishedObjectViewClassMap:(id)a4 completion:(id)a5;
- (_UICAPackageView)initWithContentsOfURL:(id)a3 publishedObjectViewClassMap:(id)a4;
- (_UICAPackageView)initWithData:(id)a3 publishedObjectViewClassMap:(id)a4;
- (id)publishedObjectWithName:(id)a3;
- (id)publishedViewWithName:(id)a3;
@end

@implementation _UICAPackageView

+ (BOOL)_shouldCatchDecodingExceptions
{
  if (_shouldCatchDecodingExceptions_onceToken != -1) {
    dispatch_once(&_shouldCatchDecodingExceptions_onceToken, &__block_literal_global_661);
  }
  return _shouldCatchDecodingExceptions___shouldCatchDecodingExceptions;
}

+ (void)loadPackageViewWithObject:(id)a3 publishedObjectViewClassMap:(id)a4 completion:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = dispatch_get_global_queue(17, 0);
  if (v11)
  {
    char v12 = [(id)objc_opt_class() _shouldCatchDecodingExceptions];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke;
    block[3] = &unk_1E5310628;
    char v26 = v12;
    id v22 = v8;
    id v25 = a1;
    id v23 = v9;
    id v24 = v10;
    id v13 = v10;
    dispatch_async(v11, block);

    id v14 = v22;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    v27 = @"CAARFileLoadingMessage";
    v28[0] = @"Failed to get the QOS_CLASS_UTILITY queue";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v17 = [v15 errorWithDomain:@"CAARFileLoadingDomain" code:950001 userInfo:v16];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_5;
    v18[3] = &unk_1E52DB330;
    id v19 = v17;
    id v20 = v10;
    id v14 = v10;
    id v13 = v17;
    dispatch_async(MEMORY[0x1E4F14428], v18);
  }
}

+ (id)_newViewHierarchyFrom:(id)a3 publishedObjectViewClassMap:(id)a4 into:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 rootLayer];
  v11 = _CreateViewForLayer(v10, v7);
  char v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __75___UICAPackageView__newViewHierarchyFrom_publishedObjectViewClassMap_into___block_invoke;
  id v24 = &unk_1E5310650;
  id v25 = v7;
  id v26 = v12;
  id v13 = v12;
  id v14 = v7;
  [v9 foreachLayer:&v21];
  double v15 = *MEMORY[0x1E4F1DAD8];
  double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(v11, "frame", v21, v22, v23, v24);
  objc_msgSend(v8, "setFrame:", v15, v16);
  v17 = [v8 layer];
  uint64_t v18 = [v9 isGeometryFlipped];

  [v17 setGeometryFlipped:v18];
  [v8 addSubview:v11];

  id v19 = (void *)[v13 copy];
  return v19;
}

- (_UICAPackageView)initWithData:(id)a3 publishedObjectViewClassMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UICAPackageView;
  id v8 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F3A4B8];
    id v18 = 0;
    uint64_t v10 = [MEMORY[0x1E4F39C38] packageWithData:v6 type:v9 options:0 error:&v18];
    id v11 = v18;
    package = v8->_package;
    v8->_package = (CAPackage *)v10;

    id v13 = v8->_package;
    if (!v13)
    {
      NSLog(&cfstr_FailedToDecode_7.isa, v11);

      double v16 = 0;
      goto LABEL_6;
    }
    id v14 = +[_UICAPackageView _newViewHierarchyFrom:v13 publishedObjectViewClassMap:v7 into:v8];
    rootViews = v8->_rootViews;
    v8->_rootViews = v14;
  }
  double v16 = v8;
LABEL_6:

  return v16;
}

- (_UICAPackageView)initWithContentsOfURL:(id)a3 publishedObjectViewClassMap:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9B8];
  id v7 = a4;
  id v8 = [v6 dataWithContentsOfURL:a3];
  uint64_t v9 = [(_UICAPackageView *)self initWithData:v8 publishedObjectViewClassMap:v7];

  return v9;
}

- (id)publishedObjectWithName:(id)a3
{
  return (id)[(CAPackage *)self->_package publishedObjectWithName:a3];
}

- (id)publishedViewWithName:(id)a3
{
  v3 = [(CAPackage *)self->_package publishedObjectWithName:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 delegate],
        v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    id v6 = [v3 delegate];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViews, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end