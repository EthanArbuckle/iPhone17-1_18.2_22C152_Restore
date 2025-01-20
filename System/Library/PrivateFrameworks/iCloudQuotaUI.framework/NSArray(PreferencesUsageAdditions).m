@interface NSArray(PreferencesUsageAdditions)
- (uint64_t)sortedInsertionIndexWithRange:()PreferencesUsageAdditions block:;
@end

@implementation NSArray(PreferencesUsageAdditions)

- (uint64_t)sortedInsertionIndexWithRange:()PreferencesUsageAdditions block:
{
  v8 = a5;
  if (a4)
  {
    uint64_t v9 = a3 + (a4 >> 1);
    v10 = [a1 objectAtIndex:v9];
    int v11 = v8[2](v8, v10, v9);
    if (v11)
    {
      if (v11 != 2)
      {
LABEL_8:

        goto LABEL_9;
      }
      a3 = v9 + 1;
      unint64_t v12 = (unint64_t)(ceil((double)a4 * 0.5) + -1.0);
    }
    else
    {
      unint64_t v12 = a4 >> 1;
    }
    uint64_t v9 = objc_msgSend(a1, "sortedInsertionIndexWithRange:block:", a3, v12, v8);
    goto LABEL_8;
  }
  uint64_t v9 = a3;
LABEL_9:

  return v9;
}

@end