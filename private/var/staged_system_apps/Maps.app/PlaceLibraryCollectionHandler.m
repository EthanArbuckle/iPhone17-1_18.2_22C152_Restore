@interface PlaceLibraryCollectionHandler
+ (void)isPlaceInLibrary:(id)a3 completion:(id)a4;
+ (void)removePlace:(id)a3 completion:(id)a4;
+ (void)savePlace:(id)a3 completion:(id)a4;
@end

@implementation PlaceLibraryCollectionHandler

+ (void)savePlace:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003B0EE8;
  v7[3] = &unk_1012E76E8;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

+ (void)removePlace:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003B11D0;
  v7[3] = &unk_1012E76E8;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

+ (void)isPlaceInLibrary:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003B1620;
  v7[3] = &unk_1012E76E8;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

@end