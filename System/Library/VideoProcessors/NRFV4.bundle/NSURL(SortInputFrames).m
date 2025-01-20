@interface NSURL(SortInputFrames)
- (uint64_t)sisp_compareBracketIdx:()SortInputFrames;
@end

@implementation NSURL(SortInputFrames)

- (uint64_t)sisp_compareBracketIdx:()SortInputFrames
{
  id v4 = a3;
  int v5 = frameIdFromPath(a1);
  int v6 = frameIdFromPath(v4);

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

@end