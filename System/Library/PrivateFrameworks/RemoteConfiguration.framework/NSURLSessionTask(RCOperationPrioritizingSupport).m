@interface NSURLSessionTask(RCOperationPrioritizingSupport)
- (uint64_t)relativePriority;
- (uint64_t)setRelativePriority:()RCOperationPrioritizingSupport;
@end

@implementation NSURLSessionTask(RCOperationPrioritizingSupport)

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

- (uint64_t)setRelativePriority:()RCOperationPrioritizingSupport
{
  if ((unint64_t)(a3 + 1) >= 4) {
    float v4 = (_DWORD *)MEMORY[0x1E4F28A00];
  }
  else {
    float v4 = (_DWORD *)((char *)&unk_1A4AE1AB0 + 4 * a3 + 4);
  }
  LODWORD(a4) = *v4;
  return [a1 setPriority:a4];
}

@end