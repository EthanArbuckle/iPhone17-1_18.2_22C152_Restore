@interface TIMutableCharacterSetDescription
+ (BOOL)supportsSecureCoding;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addCharactersInString:(id)a3;
- (void)removeCharactersInString:(id)a3;
@end

@implementation TIMutableCharacterSetDescription

- (void)removeCharactersInString:(id)a3
{
  id v4 = a3;
  [(TICharacterSetDescription *)self clearCachedCharacterSet];
  id v8 = [(TICharacterSetDescription *)self charactersRemovedFromBase];
  uint64_t v5 = [v8 stringByAppendingString:v4];
  v6 = (void *)v5;
  if (v5) {
    id v7 = (id)v5;
  }
  else {
    id v7 = v4;
  }
  [(TICharacterSetDescription *)self setCharactersRemovedFromBase:v7];
}

- (void)addCharactersInString:(id)a3
{
  id v4 = a3;
  [(TICharacterSetDescription *)self clearCachedCharacterSet];
  id v8 = [(TICharacterSetDescription *)self charactersAddedToBase];
  uint64_t v5 = [v8 stringByAppendingString:v4];
  v6 = (void *)v5;
  if (v5) {
    id v7 = (id)v5;
  }
  else {
    id v7 = v4;
  }
  [(TICharacterSetDescription *)self setCharactersAddedToBase:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TICharacterSetDescription allocWithZone:a3];
  int64_t v5 = [(TICharacterSetDescription *)self baseIdentifier];
  v6 = [(TICharacterSetDescription *)self charactersAddedToBase];
  id v7 = [(TICharacterSetDescription *)self charactersRemovedFromBase];
  id v8 = [(TICharacterSetDescription *)v4 initWithBase:v5 additionalCharacters:v6 removedCharacters:v7 inverted:[(TICharacterSetDescription *)self inverted]];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end