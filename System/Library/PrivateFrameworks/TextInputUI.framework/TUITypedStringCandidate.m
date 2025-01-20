@interface TUITypedStringCandidate
+ (id)typedStringCandidateWithLocale:(id)a3 candidateString:(id)a4 inputString:(id)a5 rawInputString:(id)a6;
- (NSString)displayLabel;
- (void)setDisplayLabel:(id)a3;
@end

@implementation TUITypedStringCandidate

+ (id)typedStringCandidateWithLocale:(id)a3 candidateString:(id)a4 inputString:(id)a5 rawInputString:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithCandidate:v12 forInput:v11 rawInput:v10];

  uint64_t v15 = [v13 objectForKey:*MEMORY[0x1E4F1C460]];
  v16 = (void *)v15;
  v17 = @"“";
  if (v15) {
    v17 = (__CFString *)v15;
  }
  v18 = v17;

  v19 = [v13 objectForKey:*MEMORY[0x1E4F1C468]];

  v20 = @"”";
  if (v19) {
    v20 = v19;
  }
  v21 = v20;

  v22 = [NSString stringWithFormat:@"%@%@%@", v18, v12, v21];

  [v14 setDisplayLabel:v22];
  return v14;
}

- (void).cxx_destruct
{
}

- (void)setDisplayLabel:(id)a3
{
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

@end