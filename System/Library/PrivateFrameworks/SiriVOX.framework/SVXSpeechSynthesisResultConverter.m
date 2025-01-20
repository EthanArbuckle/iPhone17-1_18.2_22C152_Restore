@interface SVXSpeechSynthesisResultConverter
- (id)toServiceCommandResult:(id)a3;
@end

@implementation SVXSpeechSynthesisResultConverter

- (id)toServiceCommandResult:(id)a3
{
  uint64_t v3 = [a3 type];
  if (v3 == 2)
  {
    v4 = +[SVXServiceCommandResult resultIgnored];
  }
  else
  {
    if (v3 == 1) {
      +[SVXServiceCommandResult resultSuccess];
    }
    else {
    v4 = +[SVXServiceCommandResult resultFailureWithErrorCode:0 reason:0];
    }
  }

  return v4;
}

@end