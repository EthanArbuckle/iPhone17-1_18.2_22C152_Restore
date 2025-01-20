@interface NSURLSessionTask(FCOperationPrioritizingSupport)
- (uint64_t)relativePriority;
- (uint64_t)setRelativePriority:()FCOperationPrioritizingSupport;
@end

@implementation NSURLSessionTask(FCOperationPrioritizingSupport)

- (uint64_t)setRelativePriority:()FCOperationPrioritizingSupport
{
  if ((unint64_t)(a3 + 1) >= 4) {
    v4 = (_DWORD *)MEMORY[0x1E4F18CF0];
  }
  else {
    v4 = (_DWORD *)((char *)&unk_1A4973740 + 4 * a3 + 4);
  }
  LODWORD(a4) = *v4;
  return [a1 setPriority:a4];
}

- (uint64_t)relativePriority
{
  [a1 priority];
  if (v2 == 0.25 || fabs(v2 + -0.25) < 0.000000249999999) {
    return -1;
  }
  [a1 priority];
  if (v4 == 0.5 || fabs(v4 + -0.5) < 0.000000499999999) {
    return 0;
  }
  [a1 priority];
  if (v5 == 0.75 || fabs(v5 + -0.75) < 0.000000749999998) {
    return 1;
  }
  [a1 priority];
  if (v6 != 1.0 && fabs(v6 + -1.0) >= 0.000000999999997) {
    return 0;
  }
  return 2;
}

@end