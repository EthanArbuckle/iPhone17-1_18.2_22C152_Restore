@interface UIAlertController
+ (id)controllerForDeletingStation:(id)a3 fromLibrary:(id)a4 deletionCompletion:(id)a5;
@end

@implementation UIAlertController

+ (id)controllerForDeletingStation:(id)a3 fromLibrary:(id)a4 deletionCompletion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  id v10 = a4;
  id v11 = sub_100257344(v9, v10, (uint64_t)sub_1000343D8, v8);

  swift_release();

  return v11;
}

@end