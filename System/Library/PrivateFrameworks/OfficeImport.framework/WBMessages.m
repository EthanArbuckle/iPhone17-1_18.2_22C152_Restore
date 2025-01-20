@interface WBMessages
+ (void)initialize;
@end

@implementation WBMessages

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [TCTaggedMessage alloc];
    TCBundle();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [v10 localizedStringForKey:@"The document was created with an unsupported version of Word." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v4 = [(TCTaggedMessage *)v2 initWithMessageText:v3];
    v5 = (void *)WBUnsupportedVersion;
    WBUnsupportedVersion = v4;

    v6 = [TCTaggedMessage alloc];
    TCBundle();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v7 = [v11 localizedStringForKey:@"An image is missing from the document." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v8 = [(TCTaggedMessage *)v6 initWithMessageText:v7];
    v9 = (void *)WBMissingImage;
    WBMissingImage = v8;
  }
}

@end