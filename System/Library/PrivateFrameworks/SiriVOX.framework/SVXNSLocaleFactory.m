@interface SVXNSLocaleFactory
- (id)canonicalLocaleIdentifierFromString:(id)a3;
- (id)localeWithLocaleIdentifier:(id)a3;
@end

@implementation SVXNSLocaleFactory

- (id)localeWithLocaleIdentifier:(id)a3
{
  return (id)[MEMORY[0x263EFF960] localeWithLocaleIdentifier:a3];
}

- (id)canonicalLocaleIdentifierFromString:(id)a3
{
  return (id)[MEMORY[0x263EFF960] canonicalLocaleIdentifierFromString:a3];
}

@end