@interface NSSet
@end

@implementation NSSet

uint64_t __45__NSSet_SafariCoreExtras__safari_shortestURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 path];
  unint64_t v6 = [v5 length];

  v7 = [v4 path];

  unint64_t v8 = [v7 length];
  uint64_t v9 = -1;
  if (v6 >= v8) {
    uint64_t v9 = 1;
  }
  if (v6 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

@end