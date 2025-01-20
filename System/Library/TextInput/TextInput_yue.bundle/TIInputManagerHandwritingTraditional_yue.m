@interface TIInputManagerHandwritingTraditional_yue
+ (Class)wordSearchClass;
- (BOOL)shouldUpdateDictionaryPaths;
- (TIInputManager)initImplementation;
- (id)recognitionLanguage;
@end

@implementation TIInputManagerHandwritingTraditional_yue

+ (Class)wordSearchClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F7E990], a2);
}

- (TIInputManager)initImplementation
{
  v5.receiver = self;
  v5.super_class = (Class)TIInputManagerHandwritingTraditional_yue;
  v3 = [(TIInputManagerHandwriting *)&v5 initImplementation];
  [(TIInputManagerHandwriting *)self updateAddressBook];
  [(TIInputManagerHandwriting *)self updateUserWordEntries];
  [(TIInputManagerHandwriting *)self updateDictionaryPaths];
  return v3;
}

- (id)recognitionLanguage
{
  return (id)[MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"yue-Hant"];
}

- (BOOL)shouldUpdateDictionaryPaths
{
  return 1;
}

@end