@interface NSFileCoordinator
+ (BOOL)tsp_coordinateReadingItemAtURL:(id)a3 urlType:(int64_t)a4 options:(unint64_t)a5 filePresenter:(id)a6 error:(id *)a7 byAccessor:(id)a8;
+ (BOOL)tsp_coordinateReadingItemAtURL:(id)a3 urlType:(int64_t)a4 options:(unint64_t)a5 writingItemAtURL:(id)a6 options:(unint64_t)a7 filePresenter:(id)a8 error:(id *)a9 byAccessor:(id)a10;
+ (BOOL)tsp_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 filePresenter:(id)a5 error:(id *)a6 byAccessor:(id)a7;
+ (BOOL)tsp_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 filePresenter:(id)a7 error:(id *)a8 byAccessor:(id)a9;
- (void)tsp_coordinateAccessWithIntents:(id)a3 queue:(id)a4 byAccessor:(id)a5;
@end

@implementation NSFileCoordinator

+ (BOOL)tsp_coordinateReadingItemAtURL:(id)a3 urlType:(int64_t)a4 options:(unint64_t)a5 filePresenter:(id)a6 error:(id *)a7 byAccessor:(id)a8
{
  return 1;
}

+ (BOOL)tsp_coordinateReadingItemAtURL:(id)a3 urlType:(int64_t)a4 options:(unint64_t)a5 writingItemAtURL:(id)a6 options:(unint64_t)a7 filePresenter:(id)a8 error:(id *)a9 byAccessor:(id)a10
{
  return 1;
}

+ (BOOL)tsp_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 filePresenter:(id)a5 error:(id *)a6 byAccessor:(id)a7
{
  return 1;
}

+ (BOOL)tsp_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 filePresenter:(id)a7 error:(id *)a8 byAccessor:(id)a9
{
  return 1;
}

- (void)tsp_coordinateAccessWithIntents:(id)a3 queue:(id)a4 byAccessor:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022104;
  v7[3] = &unk_1001C6900;
  id v8 = a5;
  id v6 = v8;
  [a4 addOperationWithBlock:v7];
}

@end