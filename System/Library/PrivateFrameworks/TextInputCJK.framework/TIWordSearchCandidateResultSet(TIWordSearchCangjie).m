@interface TIWordSearchCandidateResultSet(TIWordSearchCangjie)
- (uint64_t)nthIndexIgnoringExtensionCandidates:()TIWordSearchCangjie;
@end

@implementation TIWordSearchCandidateResultSet(TIWordSearchCangjie)

- (uint64_t)nthIndexIgnoringExtensionCandidates:()TIWordSearchCangjie
{
  v4 = [a1 candidates];
  uint64_t v5 = [v4 count];
  uint64_t v6 = 0;
  if (v5 && a3)
  {
    unint64_t v7 = v5;
    uint64_t v6 = 0;
    do
    {
      v8 = [v4 objectAtIndexedSubscript:v6];
      int v9 = [v8 isExtensionCandidate];

      if (++v6 >= v7) {
        break;
      }
      a3 -= v9 ^ 1u;
    }
    while (a3);
  }

  return v6;
}

@end