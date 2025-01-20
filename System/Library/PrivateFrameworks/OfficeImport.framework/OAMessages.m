@interface OAMessages
+ (void)initialize;
@end

@implementation OAMessages

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    v2 = [TCTaggedMessage alloc];
    TCBundle();
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [v29 localizedStringForKey:@"Some shape, image, graphic content was unreadable.", &stru_26EBF24D8, @"TCCompatibility" value table];
    uint64_t v4 = [(TCTaggedMessage *)v2 initWithMessageText:v3];
    v5 = (void *)OABadFormat;
    OABadFormat = v4;

    v6 = [TCTaggedMessage alloc];
    TCBundle();
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    v7 = [v30 localizedStringForKey:@"MathType equations in unsupported formats were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v8 = [(TCTaggedMessage *)v6 initWithMessageText:v7];
    v9 = (void *)OARemovedMathTypeEquations;
    OARemovedMathTypeEquations = v8;

    v10 = [TCTaggedMessage alloc];
    TCBundle();
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    v11 = [v31 localizedStringForKey:@"Equations requiring unsupported MathML elements were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v12 = [(TCTaggedMessage *)v10 initWithMessageText:v11];
    v13 = (void *)OAUnsupportedMathMLDropped;
    OAUnsupportedMathMLDropped = v12;

    v14 = [TCTaggedMessage alloc];
    TCBundle();
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    v15 = [v32 localizedStringForKey:@"Objects positioned far away from slides were moved closer to slides." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v16 = [(TCTaggedMessage *)v14 initWithMessageText:v15];
    v17 = (void *)OADrawableBoundsOutOfRange;
    OADrawableBoundsOutOfRange = v16;

    v18 = [TCTaggedMessage alloc];
    uint64_t v19 = [(TCTaggedMessage *)v18 initWithMessageText:kWarningMessageUnsupportedMediaTypes];
    v20 = (void *)OAUnsupportedMediaType;
    OAUnsupportedMediaType = v19;

    v21 = [TCTaggedMessage alloc];
    TCBundle();
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    v22 = [v33 localizedStringForKey:@"URL-based movies and audio files were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v23 = [(TCTaggedMessage *)v21 initWithMessageText:v22];
    v24 = (void *)OARemovedUrlMedia;
    OARemovedUrlMedia = v23;

    v25 = [TCTaggedMessage alloc];
    TCBundle();
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    v26 = [v34 localizedStringForKey:@"Movies and audio files weren\\U2019t exported." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v27 = [(TCTaggedMessage *)v25 initWithMessageText:v26];
    v28 = (void *)OAMediaNotExported;
    OAMediaNotExported = v27;
  }
}

@end