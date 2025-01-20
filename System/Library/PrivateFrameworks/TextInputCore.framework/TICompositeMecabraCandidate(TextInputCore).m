@interface TICompositeMecabraCandidate(TextInputCore)
- (void)initWithMecabraCandidate:()TextInputCore autoconvertedCandidates:;
@end

@implementation TICompositeMecabraCandidate(TextInputCore)

- (void)initWithMecabraCandidate:()TextInputCore autoconvertedCandidates:
{
  id v6 = a4;
  v7 = MecabraCandidateGetSurface();
  v8 = MecabraCandidateGetAnalysisString();
  if (!v6) {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }
  v9 = [v6 valueForKey:@"candidate"];
  v10 = [v9 componentsJoinedByString:&stru_1F3F7A998];

  v11 = [v6 valueForKey:@"input"];
  v12 = [v11 componentsJoinedByString:&stru_1F3F7A998];

  v13 = [v10 stringByAppendingString:v7];
  v14 = [v12 stringByAppendingString:v8];
  v15 = [NSNumber numberWithUnsignedLongLong:a3];
  v16 = (void *)[a1 initWithCandidate:v13 forInput:v14 mecabraCandidatePointerValue:v15 withFlags:FlagsForCandidate()];

  if (v16)
  {
    v17 = [v6 valueForKey:*MEMORY[0x1E4FAEFD8]];
    [v16 setAutoconvertedCandidatePointerValues:v17];

    [v16 setRemainderCandidateString:v7];
  }

  return v16;
}

@end