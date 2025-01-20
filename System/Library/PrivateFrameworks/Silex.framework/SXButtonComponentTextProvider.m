@interface SXButtonComponentTextProvider
- (id)textForComponent:(id)a3;
@end

@implementation SXButtonComponentTextProvider

- (id)textForComponent:(id)a3
{
  v3 = [a3 text];
  v4 = v3;
  if (!v3) {
    v3 = &stru_26D5311C0;
  }
  v5 = v3;

  return v5;
}

@end