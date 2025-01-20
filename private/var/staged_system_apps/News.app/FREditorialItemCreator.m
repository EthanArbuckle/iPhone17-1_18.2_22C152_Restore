@interface FREditorialItemCreator
- (FREditorialItemCreator)init;
- (FREditorialItemCreator)initWithThumbnailCreator:(id)a3;
- (FREditorialItemThumbnailCreator)thumbnailCreator;
- (id)createEditorialItemFromCachedEntry:(id)a3;
@end

@implementation FREditorialItemCreator

- (FREditorialItemCreator)initWithThumbnailCreator:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100071E5C();
  }
  v9.receiver = self;
  v9.super_class = (Class)FREditorialItemCreator;
  v6 = [(FREditorialItemCreator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_thumbnailCreator, a3);
  }

  return v7;
}

- (FREditorialItemCreator)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FREditorialItemCreator init]";
    __int16 v7 = 2080;
    v8 = "FREditorialItemCreator.m";
    __int16 v9 = 1024;
    int v10 = 27;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FREditorialItemCreator init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (id)createEditorialItemFromCachedEntry:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 image];

    if (v6)
    {
      __int16 v7 = [(FREditorialItemCreator *)self thumbnailCreator];
      v8 = [v5 image];
      __int16 v9 = [v7 editorialThumbnailImageWith:v8];
    }
    else
    {
      __int16 v9 = 0;
    }
    __int16 v11 = +[NSMutableArray array];
    if ([v5 showBadge])
    {
      id v12 = +[NSNumber numberWithInteger:0];
      [v11 addObject:v12];
    }
    id v13 = objc_alloc((Class)TSEditorialItem);
    v14 = [v5 editorialItemID];
    v15 = [v5 title];
    v16 = [v5 subtitle];
    v17 = [v5 subtitleColorString];
    v18 = [v5 actionUrlString];
    v19 = +[NSURL URLWithString:v18];
    id v10 = [v13 initWithIdentifier:v14 title:v15 subtitle:v16 subtitleColor:v17 attributes:v11 actionURL:v19 thumbnailImage:v9 backingTag:0 headline:0];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (FREditorialItemThumbnailCreator)thumbnailCreator
{
  return self->_thumbnailCreator;
}

- (void).cxx_destruct
{
}

@end