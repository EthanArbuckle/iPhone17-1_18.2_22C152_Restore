@interface _UIDictationCursorAccessory
- (id)identifier;
@end

@implementation _UIDictationCursorAccessory

- (id)identifier
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDictationCursorAccessory;
  v3 = [(_UICursorAccessory *)&v5 identifier];
  if (!v3)
  {
    v3 = [NSString stringWithFormat:@"dictation"];
    [(_UICursorAccessory *)self setIdentifier:v3];
  }
  return v3;
}

@end