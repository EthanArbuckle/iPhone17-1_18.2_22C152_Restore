@interface PKGetClassNFFieldNotificationECP1
@end

@implementation PKGetClassNFFieldNotificationECP1

Class __PKGetClassNFFieldNotificationECP1_0_block_invoke()
{
  if (PKLoadNearField_loadPredicate != -1) {
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_213);
  }
  Class result = objc_getClass("NFFieldNotificationECP1_0");
  qword_1EB403500 = (uint64_t)result;
  return result;
}

@end