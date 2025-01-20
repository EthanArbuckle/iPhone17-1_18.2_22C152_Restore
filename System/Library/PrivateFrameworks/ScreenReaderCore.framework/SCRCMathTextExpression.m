@interface SCRCMathTextExpression
- (id)latexDescriptionInMathMode:(BOOL)a3;
- (id)mathMLString;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
@end

@implementation SCRCMathTextExpression

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = objc_alloc(MEMORY[0x263F086A0]);
  v6 = [(SCRCMathSimpleExpression *)self content];
  v10 = @"kSCRCMathStringAttributeIsNonTechnicalText";
  v11[0] = MEMORY[0x263EFFA88];
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = (void *)[v5 initWithString:v6 attributes:v7];

  return v8;
}

- (id)mathMLString
{
  v2 = [(SCRCMathSimpleExpression *)self content];
  v3 = [v2 stringWrappedInMathMLTag:@"mtext"];

  return v3;
}

- (id)latexDescriptionInMathMode:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(SCRCMathSimpleExpression *)self content];
  if (v3)
  {
    uint64_t v5 = [NSString stringWithFormat:@"\\text{%@}", v4];

    v4 = (void *)v5;
  }
  return v4;
}

@end