@interface PXPeopleMergeUtilities
+ (BOOL)canMergeWithPeople:(id)a3;
+ (id)mergeAlertControllerWithNominalPeople:(id)a3 targetPerson:(id)a4 shouldHandleMergeInternally:(BOOL)a5 completion:(id)a6;
- (id)init;
@end

@implementation PXPeopleMergeUtilities

+ (id)mergeAlertControllerWithNominalPeople:(id)a3 targetPerson:(id)a4 shouldHandleMergeInternally:(BOOL)a5 completion:(id)a6
{
  v7 = _Block_copy(a6);
  sub_1A9B21070(0, (unint64_t *)&qword_1E981B820);
  uint64_t v8 = sub_1AB23AADC();
  *(void *)(swift_allocObject() + 16) = v7;
  sub_1A9D5BDC4(v8, a4);
}

+ (BOOL)canMergeWithPeople:(id)a3
{
  sub_1A9B21070(0, (unint64_t *)&qword_1E981B820);
  unint64_t v3 = sub_1AB23AADC();
  sub_1A9D5C480(v3);
}

- (id)init
{
  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

@end