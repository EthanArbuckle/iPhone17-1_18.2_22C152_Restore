@interface TIInputManagerHandwriting_ja
+ (Class)wordSearchClass;
- (id)handleKeyboardInput:(id)a3;
- (id)recognitionLanguage;
- (int)recognitionMode;
- (void)initImplementation;
@end

@implementation TIInputManagerHandwriting_ja

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (void)initImplementation
{
  v5.receiver = self;
  v5.super_class = (Class)TIInputManagerHandwriting_ja;
  id v3 = [(TIInputManagerHandwriting *)&v5 initImplementation];
  [(TIInputManagerHandwriting *)self updateAddressBook];
  [(TIInputManagerHandwriting *)self updateUserWordEntries];
  return v3;
}

- (id)recognitionLanguage
{
  return (id)[MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"ja-Hrkt"];
}

- (int)recognitionMode
{
  return 2;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TIInputManagerHandwriting_ja *)self keyboardState];
  if ([v5 shouldOutputFullwidthSpace])
  {
    v6 = [v4 string];
    int v7 = [v6 isEqualToString:@" "];

    if (v7) {
      [v4 setString:@"　"];
    }
  }
  else
  {
  }
  v10.receiver = self;
  v10.super_class = (Class)TIInputManagerHandwriting_ja;
  v8 = [(TIKeyboardInputManagerBase *)&v10 handleKeyboardInput:v4];

  return v8;
}

@end