@interface ICSTravelDuration
- (BOOL)alwaysHasParametersToSerialize;
- (NSString)transparency;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4 additionalParameters:(id)a5;
- (void)setDuration:(id)a3;
- (void)setTransparency:(id)a3;
@end

@implementation ICSTravelDuration

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4 additionalParameters:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(ICSProperty *)self parameters];
  v11 = [v10 objectForKeyedSubscript:@"VALUE"];
  if (v11)
  {
  }
  else
  {
    v12 = [v9 objectForKeyedSubscript:@"VALUE"];

    if (!v12)
    {
      if (!v9)
      {
        id v9 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      [v9 setObject:@"DURATION" forKeyedSubscript:@"VALUE"];
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)ICSTravelDuration;
  [(ICSProperty *)&v13 _ICSStringWithOptions:a3 appendingToString:v8 additionalParameters:v9];
}

- (NSString)transparency
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"TRAVEL-TRANSPARENCY"];
}

- (void)setTransparency:(id)a3
{
}

- (void)setDuration:(id)a3
{
}

- (BOOL)alwaysHasParametersToSerialize
{
  return 1;
}

@end