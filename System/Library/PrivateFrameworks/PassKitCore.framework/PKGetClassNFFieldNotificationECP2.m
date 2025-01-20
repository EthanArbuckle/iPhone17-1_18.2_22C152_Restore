@interface PKGetClassNFFieldNotificationECP2
@end

@implementation PKGetClassNFFieldNotificationECP2

Class __PKGetClassNFFieldNotificationECP2_0_block_invoke()
{
  if (PKLoadNearField_loadPredicate != -1) {
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_213);
  }
  Class result = objc_getClass("NFFieldNotificationECP2_0");
  qword_1EB403510 = (uint64_t)result;
  return result;
}

@end