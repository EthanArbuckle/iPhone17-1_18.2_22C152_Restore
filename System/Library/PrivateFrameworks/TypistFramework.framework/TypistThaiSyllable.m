@interface TypistThaiSyllable
+ (BOOL)isThaiCharacter:(unsigned __int16)a3;
+ (id)smallCharacers;
+ (id)tallCharacters;
+ (id)upperCombiningCharacters;
@end

@implementation TypistThaiSyllable

+ (BOOL)isThaiCharacter:(unsigned __int16)a3
{
  return (a3 - 3584) < 0x81;
}

+ (id)tallCharacters
{
  return (id)objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 3650, 3);
}

+ (id)upperCombiningCharacters
{
  return (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"◌ี◌ื◌ั◌ั◌็◌ิ◌̍◌̎◌ํ◌ึ◌์◌่◌้◌๊◌๋"];
}

+ (id)smallCharacers
{
  return (id)objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 3585, 47);
}

@end