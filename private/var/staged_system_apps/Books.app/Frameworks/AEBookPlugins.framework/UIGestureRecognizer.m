@interface UIGestureRecognizer
- (BOOL)bk_isWKSyntheticTapGestureRecognizer;
- (BOOL)matchesTarget:(Class)a3 andAction:(SEL)a4;
- (id)retrieveAndClearSelectionRectValue;
- (void)captureSelectionRectValueForTap:(id)a3;
@end

@implementation UIGestureRecognizer

- (BOOL)matchesTarget:(Class)a3 andAction:(SEL)a4
{
  [(UIGestureRecognizer *)self valueForKey:@"_targets"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 valueForKey:@"_target" v14];
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 action] == a4)
        {

          BOOL v12 = 1;
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (void)captureSelectionRectValueForTap:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(self, &off_1DC838, a3, (char *)&dword_0 + 1);
  }
}

- (id)retrieveAndClearSelectionRectValue
{
  v3 = objc_getAssociatedObject(self, &off_1DC838);
  if (v3) {
    objc_setAssociatedObject(self, &off_1DC838, 0, (char *)&dword_0 + 1);
  }

  return v3;
}

- (BOOL)bk_isWKSyntheticTapGestureRecognizer
{
  if (qword_22B588 != -1) {
    dispatch_once(&qword_22B588, &stru_1DC840);
  }
  return objc_opt_isKindOfClass() & 1;
}

@end