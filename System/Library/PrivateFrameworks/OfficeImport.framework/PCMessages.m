@interface PCMessages
+ (void)initialize;
@end

@implementation PCMessages

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    v2 = [TCTaggedMessage alloc];
    TCBundle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [v6 localizedStringForKey:@"This document was created with an unsupported version of PowerPoint." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v4 = [(TCTaggedMessage *)v2 initWithMessageText:v3];
    v5 = (void *)PCUnsupportedVersion;
    PCUnsupportedVersion = v4;
  }
}

@end