@interface SRCSLexiconManager
- (NSString)localeIdentifier;
- (SRCSLexiconManager)initWithLocaleIdentifier:(id)a3;
@end

@implementation SRCSLexiconManager

- (SRCSLexiconManager)initWithLocaleIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SRCSLexiconManager;
  return [(SRCSLexiconManager *)&v4 init];
}

- (NSString)localeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end