@interface TIInputManagerHandwritingSimplified
+ (Class)wordSearchClass;
- (TIInputManager)initImplementation;
- (id)recognitionLanguage;
@end

@implementation TIInputManagerHandwritingSimplified

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (TIInputManager)initImplementation
{
  v5.receiver = self;
  v5.super_class = (Class)TIInputManagerHandwritingSimplified;
  v3 = [(TIInputManagerHandwriting *)&v5 initImplementation];
  [(TIInputManagerHandwriting *)self updateAddressBook];
  [(TIInputManagerHandwriting *)self updateUserWordEntries];
  return v3;
}

- (id)recognitionLanguage
{
  return (id)[MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"zh-Hans"];
}

@end