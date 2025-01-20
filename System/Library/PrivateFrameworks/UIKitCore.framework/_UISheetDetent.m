@interface _UISheetDetent
+ (_UISheetDetent)_largeDetent;
+ (_UISheetDetent)_mediumDetent;
+ (id)_detentWithContainerViewBlock:(id)a3;
@end

@implementation _UISheetDetent

+ (_UISheetDetent)_mediumDetent
{
  if (qword_1EB25FFD8 != -1) {
    dispatch_once(&qword_1EB25FFD8, &__block_literal_global_129);
  }
  v2 = (void *)_MergedGlobals_1004;
  return (_UISheetDetent *)v2;
}

+ (_UISheetDetent)_largeDetent
{
  if (qword_1EB25FFE8 != -1) {
    dispatch_once(&qword_1EB25FFE8, &__block_literal_global_2_10);
  }
  v2 = (void *)qword_1EB25FFE0;
  return (_UISheetDetent *)v2;
}

+ (id)_detentWithContainerViewBlock:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____UISheetDetent;
  v3 = objc_msgSendSuper2(&v5, sel__detentWithContainerViewBlock_, a3);
  return v3;
}

@end