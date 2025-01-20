@interface THPageRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)shouldGroupAccessibilityChildren;
- (BOOL)thaxRepIsLastTextElementOnPage:(id)a3;
- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm;
- (NSArray)thaxPageContentReps;
- (THPageRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4;
- (id)accessibilityContainerForMarginNoteLayersInMarginNotesController:(id)a3;
- (id)childRepsForHitTesting;
- (id)thaxInfo;
- (unint64_t)thaxAbsolutePageIndex;
- (void)dealloc;
- (void)tsaxLoadChildrenIntoCollection:(id)a3;
@end

@implementation THPageRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THPageRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)thaxAbsolutePageIndex
{
  id v2 = [(THPageRepAccessibility *)self thaxInfo];

  return (unint64_t)[v2 tsaxUnsignedIntegerValueForKey:@"absolutePageIndex"];
}

- (id)thaxInfo
{
  return [(TSDRepAccessibility *)self tsaxValueForKey:@"info"];
}

- (THPageRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THPageRepAccessibility;
  v4 = [(THTSDRepAccessibility *)&v7 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4) {
    [v4 tsaxValueForKey:@"marginNotesController"] imaxSetAccessibilityDelegate:v4;
  }
  return v5;
}

- (id)childRepsForHitTesting
{
  if (!+[THTSDRepAccessibility thaxRepShouldAllowHitTestingOfChildren:self])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)THPageRepAccessibility;
  return [(THPageRepAccessibility *)&v4 childRepsForHitTesting];
}

- (void)dealloc
{
  [self tsaxValueForKey:@"marginNotesController"] imaxSetAccessibilityDelegate:0;
  v3.receiver = self;
  v3.super_class = (Class)THPageRepAccessibility;
  [(TSDRepAccessibility *)&v3 dealloc];
}

- (id)accessibilityContainerForMarginNoteLayersInMarginNotesController:(id)a3
{
  return [(TSDRepAccessibility *)self tsaxValueForKey:@"accessibilityContainer"];
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  v5 = objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)THPageRepAccessibility;
  [(THTSDRepAccessibility *)&v7 tsaxLoadChildrenIntoCollection:v5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_29F8C0;
  v6[3] = &unk_46C988;
  v6[4] = &stru_46C960;
  [v5 sortUsingComparator:v6];
  [a3 addObjectsFromArray:v5];
}

- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm
{
  return 0;
}

- (BOOL)thaxRepIsLastTextElementOnPage:(id)a3
{
  return [(NSArray *)[(THPageRepAccessibility *)self thaxPageContentReps] lastObject] == a3;
}

- (NSArray)thaxPageContentReps
{
  id v3 = +[NSMutableArray array];
  char v19 = 0;
  objc_super v4 = objc_opt_class();
  Class v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)self, 1, &v19);
  if (v19) {
    abort();
  }
  id v6 = [(objc_class *)v5 tsaxChildReps];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_opt_class();
        Class v13 = __TSAccessibilityCastAsSafeCategory(v12, v11, 0, 0);
        if (-[objc_class _accessibilityIncludeDuringContentReading](v13, "_accessibilityIncludeDuringContentReading"))[v3 addObject:v13]; {
      }
        }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }
  return (NSArray *)[v3 copy];
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end