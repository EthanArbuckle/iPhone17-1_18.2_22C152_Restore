@interface TPSSubscriptionLabelerCharacterSets
+ (USet)_characterSetFromPattern:(id)a3;
- (TPSSubscriptionLabelerCharacterSets)init;
- (USet)CJK;
- (void)dealloc;
@end

@implementation TPSSubscriptionLabelerCharacterSets

+ (USet)_characterSetFromPattern:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = +[TPSSubscriptionLabeler _resultWithAllCharacters:&__block_literal_global_6 string:a3];
  v4 = (USet *)[v3 pointerValue];

  return v4;
}

id __64__TPSSubscriptionLabelerCharacterSets__characterSetFromPattern___block_invoke()
{
  v0 = [MEMORY[0x1E4F29238] valueWithPointer:uset_openPattern()];
  return v0;
}

- (TPSSubscriptionLabelerCharacterSets)init
{
  v4.receiver = self;
  v4.super_class = (Class)TPSSubscriptionLabelerCharacterSets;
  v2 = [(TPSSubscriptionLabelerCharacterSets *)&v4 init];
  if (v2) {
    v2->_CJK = (USet *)[(id)objc_opt_class() _characterSetFromPattern:@"[[:Hani:][:Hiragana:][[:scx=Kana:]][:Bopomofo:][ˉˊˇˋ˙][:Hangul:][()（）]]"];
  }
  return v2;
}

- (void)dealloc
{
  uset_close();
  v3.receiver = self;
  v3.super_class = (Class)TPSSubscriptionLabelerCharacterSets;
  [(TPSSubscriptionLabelerCharacterSets *)&v3 dealloc];
}

- (USet)CJK
{
  return self->_CJK;
}

@end