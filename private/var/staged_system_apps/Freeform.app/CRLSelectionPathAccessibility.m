@interface CRLSelectionPathAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (NSArray)crlaxOrderedSelections;
- (id)crlaxMostSpecificCellSelection;
- (id)crlaxMostSpecificSelectionOfClass:(Class)a3;
- (id)crlaxMostSpecificTextSelection;
- (id)crlaxSelectionPathWithAppendedSelection:(id)a3;
- (void)crlaxEnumerateSelectionsLeastToMostSpecificInPathUsingBlock:(id)a3;
- (void)crlaxEnumerateSelectionsMostToLeastSpecificInPathUsingBlock:(id)a3;
@end

@implementation CRLSelectionPathAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLSelectionPath";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (NSArray)crlaxOrderedSelections
{
  char v19 = 0;
  v2 = [(CRLSelectionPathAccessibility *)self crlaxTarget];
  id v3 = [v2 orderedSelections];

  v4 = (objc_class *)objc_opt_class();
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v19);
  if (v19) {
LABEL_13:
  }
    abort();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
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
        id v13 = (id)__CRLAccessibilityCastAsSafeCategory(v12, v11, 1, &v19);
        if (v19) {
          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  return (NSArray *)v6;
}

- (id)crlaxMostSpecificCellSelection
{
  id v3 = NSClassFromString(@"TSTCellSelection");
  v4 = [(CRLSelectionPathAccessibility *)self crlaxMostSpecificSelectionOfClass:NSClassFromString(@"TSTCellSelection")];
  v5 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v4, 0, 0);

  return v5;
}

- (id)crlaxMostSpecificTextSelection
{
  id v3 = NSClassFromString(@"CRLWPSelection");
  v4 = [(CRLSelectionPathAccessibility *)self crlaxMostSpecificSelectionOfClass:NSClassFromString(@"CRLWPSelection")];
  v5 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v4, 0, 0);

  return v5;
}

- (id)crlaxMostSpecificSelectionOfClass:(Class)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100442A34;
  v10 = sub_100442A44;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100442A4C;
  v5[3] = &unk_1014FA1F8;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)crlaxSelectionPathWithAppendedSelection:(id)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = sub_100442A34;
  long long v17 = sub_100442A44;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100442C18;
  v10[3] = &unk_1014CEE50;
  v12 = &v13;
  v10[4] = self;
  id v3 = a3;
  id v11 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v10)) {
    abort();
  }

  id v4 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  LOBYTE(v13) = 0;
  id v5 = v4;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v5, 1, &v13);
  if ((_BYTE)v13) {
    abort();
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (void)crlaxEnumerateSelectionsMostToLeastSpecificInPathUsingBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100442D04;
  v4[3] = &unk_1014D0AB0;
  v4[4] = self;
  id v3 = a3;
  id v5 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
}

- (void)crlaxEnumerateSelectionsLeastToMostSpecificInPathUsingBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100442DAC;
  v4[3] = &unk_1014D0AB0;
  v4[4] = self;
  id v3 = a3;
  id v5 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
}

@end