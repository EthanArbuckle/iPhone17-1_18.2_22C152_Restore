@interface CNVCardParser
+ (BOOL)isTagSyntacticallyValid:(id)a3;
+ (BOOL)parseFirstResultInData:(id)a3 resultBuilder:(id)a4;
+ (id)newParameterSelectorMap;
+ (id)newParsingSelectorMap;
+ (id)os_log;
+ (id)parseData:(id)a3 options:(id)a4 resultFactory:(id)a5;
+ (id)parseData:(id)a3 resultFactory:(id)a4;
+ (unint64_t)countOfCardsInData:(id)a3;
+ (unint64_t)inferredStringEncodingFromData:(id)a3;
- (BOOL)advancePastSemicolon;
- (BOOL)atEOF;
- (BOOL)hasImportErrors;
- (BOOL)parseExtension:(id)a3;
- (BOOL)parseInstantMessageValueWithService:(id)a3;
- (BOOL)parseLine;
- (BOOL)parseNextResultUsingResultBuilder:(id)a3;
- (BOOL)parseValueUsingSelector:(SEL)a3;
- (BOOL)parse_ADR;
- (BOOL)parse_BDAY;
- (BOOL)parse_CALURI;
- (BOOL)parse_EMAIL;
- (BOOL)parse_FN;
- (BOOL)parse_IMPP;
- (BOOL)parse_N;
- (BOOL)parse_NICKNAME;
- (BOOL)parse_NOTE;
- (BOOL)parse_ORG;
- (BOOL)parse_PHOTO;
- (BOOL)parse_PRODID;
- (BOOL)parse_REV;
- (BOOL)parse_TEL;
- (BOOL)parse_TITLE;
- (BOOL)parse_UID;
- (BOOL)parse_URL;
- (BOOL)parse_VERSION;
- (BOOL)parse_VND_63_SENSITIVE_CONTENT_CONFIG;
- (BOOL)parse_X_ABADR;
- (BOOL)parse_X_ABDATE;
- (BOOL)parse_X_ABLABEL;
- (BOOL)parse_X_ABORDER;
- (BOOL)parse_X_ABPHOTO;
- (BOOL)parse_X_ABRELATEDNAMES;
- (BOOL)parse_X_ABSHOWAS;
- (BOOL)parse_X_ABUID;
- (BOOL)parse_X_ACTIVITY_ALERT;
- (BOOL)parse_X_ADDRESSBOOKSERVER_PHONEME_DATA;
- (BOOL)parse_X_ADDRESSING_GRAMMAR;
- (BOOL)parse_X_AIM;
- (BOOL)parse_X_AIM_ID;
- (BOOL)parse_X_ALTBDAY;
- (BOOL)parse_X_APPLE_GUARDIAN_WHITELISTED;
- (BOOL)parse_X_APPLE_LIKENESS_SERVICE_IDENTIFIER;
- (BOOL)parse_X_APPLE_LIKENESS_SOURCE;
- (BOOL)parse_X_APPLE_SUBADMINISTRATIVEAREA;
- (BOOL)parse_X_APPLE_SUBLOCALITY;
- (BOOL)parse_X_GOOGLE_ID;
- (BOOL)parse_X_GOOGLE_TALK;
- (BOOL)parse_X_GTALK;
- (BOOL)parse_X_ICQ;
- (BOOL)parse_X_ICQ_ID;
- (BOOL)parse_X_IMAGEHASH;
- (BOOL)parse_X_IMAGETYPE;
- (BOOL)parse_X_IMAGE_BACKGROUND_COLORS_DATA;
- (BOOL)parse_X_JABBER;
- (BOOL)parse_X_JABBER_ID;
- (BOOL)parse_X_MAIDENNAME;
- (BOOL)parse_X_MSN;
- (BOOL)parse_X_MSN_ID;
- (BOOL)parse_X_PHONETIC_FIRST_NAME;
- (BOOL)parse_X_PHONETIC_LAST_NAME;
- (BOOL)parse_X_PHONETIC_MIDDLE_NAME;
- (BOOL)parse_X_PHONETIC_ORG;
- (BOOL)parse_X_PRONUNCIATION_FIRST_NAME;
- (BOOL)parse_X_PRONUNCIATION_LAST_NAME;
- (BOOL)parse_X_QQ;
- (BOOL)parse_X_QQ_ID;
- (BOOL)parse_X_SHARED_PHOTO_DISPLAY_PREF;
- (BOOL)parse_X_SKYPE;
- (BOOL)parse_X_SKYPE_ID;
- (BOOL)parse_X_SKYPE_USERNAME;
- (BOOL)parse_X_SOCIALPROFILE;
- (BOOL)parse_X_WALLPAPER;
- (BOOL)parse_X_WATCH_WALLPAPER_IMAGE_DATA;
- (BOOL)parse_X_YAHOO;
- (BOOL)parse_X_YAHOO_ID;
- (BOOL)valueIsEmpty:(id)a3;
- (CNVCardParsedResultBuilder)resultBuilder;
- (CNVCardParser)initWithData:(id)a3;
- (CNVCardParser)initWithData:(id)a3 options:(id)a4;
- (CNVCardReadingOptions)options;
- (NSData)imageData;
- (SEL)handlerSelectorForParameterName:(id)a3;
- (SEL)parsingSelectorForTag:(id)a3;
- (_TtP5vCard25CNVCardTagInclusionPolicy_)tagInclusionPolicy;
- (id)fallbackLabelForProperty:(id)a3;
- (id)firstCustomLabelForProperty:(id)a3 types:(id)a4;
- (id)firstParameterWithName:(id)a3;
- (id)firstValueForKey:(id)a3 inExtension:(id)a4;
- (id)firstValueForKey:(id)a3 inExtensionGroup:(id)a4;
- (id)firstValueForParameterWithName:(id)a3;
- (id)genericLabelForProperty:(id)a3;
- (id)makeLineWithLabel:(id)a3 value:(id)a4;
- (id)makeLineWithValue:(id)a3 forProperty:(id)a4;
- (id)nextBase64Data;
- (id)nextParameterInCurrentLine;
- (id)nextResultWithFactory:(id)a3 progressLength:(int64_t *)a4;
- (id)parameterValuesForName:(id)a3;
- (id)parseArrayValue;
- (id)parseBase64Data;
- (id)parseParameterValues;
- (id)parseParameters;
- (id)parseRemainingLine;
- (id)parseStringValue;
- (id)parseUnknownValueStartingAtPosition:(unint64_t)a3;
- (id)phoneLabel;
- (id)pool_nextResultWithFactory:(id)a3 progressLength:(int64_t *)a4;
- (id)resultsWithFactory:(id)a3;
- (id)typeParameters;
- (id)unparsedStringForCurrentProperty;
- (id)validCountryCodes;
- (int64_t)currentPosition;
- (void)cleanUpCardState;
- (void)parameter_BASE64:(id)a3;
- (void)parameter_CHARSET:(id)a3;
- (void)parameter_ENCODING:(id)a3;
- (void)parameter_QUOTED_PRINTABLE:(id)a3;
- (void)parseLine;
- (void)processExtensionValues;
- (void)processNameValues;
- (void)reportMultiValueLines:(id)a3 forProperty:(id)a4;
- (void)reportValue:(id)a3 forProperty:(id)a4;
- (void)reportValues;
- (void)setImageData:(id)a3;
@end

@implementation CNVCardParser

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_3);
  }
  v2 = (void *)os_log_cn_once_object_1;
  return v2;
}

uint64_t __23__CNVCardParser_os_log__block_invoke()
{
  os_log_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts.vcard", "CNVCardParser");
  return MEMORY[0x1F41817F8]();
}

+ (unint64_t)countOfCardsInData:(id)a3
{
  v3 = +[CNVCardRangeFinder allRangesInData:a3];
  v4 = [v3 left];
  unint64_t v5 = [v4 count];

  return v5;
}

+ (BOOL)parseFirstResultInData:(id)a3 resultBuilder:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithData:v7];

  LOBYTE(v7) = [v8 parseNextResultUsingResultBuilder:v6];
  return (char)v7;
}

+ (id)newParsingSelectorMap
{
  v2 = objc_alloc_init(CNVCardSelectorMap);
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_ADD forString:@"ADD"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_ADR forString:@"ADR"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_BDAY forString:@"BDAY"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_CALURI forString:@"CALURI"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_EMAIL forString:@"EMAIL"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_FN forString:@"FN"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_IMPP forString:@"IMPP"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_N forString:@"N"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_NICKNAME forString:@"NICKNAME"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_NOTE forString:@"NOTE"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_ORG forString:@"ORG"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_PHONETIC_ORG forString:@"X-PHONETIC-ORG"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_PHOTO forString:@"PHOTO"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_PRODID forString:@"PRODID"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_REV forString:@"REV"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_TEL forString:@"TEL"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_TITLE forString:@"TITLE"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_UID forString:@"UID"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_URL forString:@"URL"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_VERSION forString:@"VERSION"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ABADR forString:@"X-ABADR"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ABDATE forString:@"X-ABDATE"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ABLABEL forString:@"X-ABLABEL"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ABORDER forString:@"X-ABORDER"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ABPHOTO forString:@"X-ABPHOTO"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_AIM forString:@"X-AIM"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_AIM_ID forString:@"X-AIM-ID"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ABRELATEDNAMES forString:@"X-ABRELATEDNAMES"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ABSHOWAS forString:@"X-ABSHOWAS"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ABUID forString:@"X-ABUID"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ACTIVITY_ALERT forString:@"X-ACTIVITY-ALERT"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ALTBDAY forString:@"X-ALTBDAY"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_APPLE_SUBADMINISTRATIVEAREA forString:@"X-APPLE-SUBADMINISTRATIVEAREA"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_APPLE_SUBLOCALITY forString:@"X-APPLE-SUBLOCALITY"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_GOOGLE_ID forString:@"X-GOOGLE-ID"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_GOOGLE_TALK forString:@"X-GOOGLE-TALK"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_GTALK forString:@"X-GTALK"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ICQ forString:@"X-ICQ"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ICQ_ID forString:@"X-ICQ-ID"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_IMAGEHASH forString:@"X-IMAGEHASH"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_IMAGETYPE forString:@"X-IMAGETYPE"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_WALLPAPER forString:@"X-WALLPAPER"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_JABBER forString:@"X-JABBER"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_JABBER_ID forString:@"X-JABBER-ID"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_MAIDENNAME forString:@"X-MAIDENNAME"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_MSN forString:@"X-MSN"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_MSN_ID forString:@"X-MSN-ID"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_PHONETIC_FIRST_NAME forString:@"X-PHONETIC-FIRST-NAME"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_PHONETIC_LAST_NAME forString:@"X-PHONETIC-LAST-NAME"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_PHONETIC_MIDDLE_NAME forString:@"X-PHONETIC-MIDDLE-NAME"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_PRONUNCIATION_FIRST_NAME forString:@"X-PRONUNCIATION-FIRST-NAME"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_PRONUNCIATION_LAST_NAME forString:@"X-PRONUNCIATION-LAST-NAME"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_QQ forString:@"X-QQ"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_QQ_ID forString:@"X-QQ-ID"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_SKYPE forString:@"X-SKYPE"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_SKYPE_ID forString:@"X-SKYPE-ID"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_SKYPE_USERNAME forString:@"X-SKYPE-USERNAME"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_SOCIALPROFILE forString:@"X-SOCIALPROFILE"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_YAHOO forString:@"X-YAHOO"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_YAHOO_ID forString:@"X-YAHOO-ID"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ADDRESSBOOKSERVER_PHONEME_DATA forString:@"X-ADDRESSBOOKSERVER-PHONEME-DATA"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_APPLE_LIKENESS_SERVICE_IDENTIFIER forString:@"X-APPLE-LIKENESS-SERVICE-IDENTIFIER"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_APPLE_LIKENESS_SOURCE forString:@"X-APPLE-LIKENESS-SOURCE"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_APPLE_GUARDIAN_WHITELISTED forString:@"X-APPLE-GUARDIAN-WHITELISTED"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_ADDRESSING_GRAMMAR forString:@"X-ADDRESSING-GRAMMAR"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_SHARED_PHOTO_DISPLAY_PREF forString:@"X-SHARED-PHOTO-DISPLAY-PREF"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_X_IMAGE_BACKGROUND_COLORS_DATA forString:@"X-IMAGE-BACKGROUND-COLORS-DATA"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parse_VND_63_SENSITIVE_CONTENT_CONFIG forString:@"VND-63-SENSITIVE-CONTENT-CONFIG"];
  return v2;
}

+ (id)newParameterSelectorMap
{
  v2 = objc_alloc_init(CNVCardSelectorMap);
  [(CNVCardSelectorMap *)v2 setSelector:sel_parameter_QUOTED_PRINTABLE_ forString:@"QUOTED-PRINTABLE"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parameter_BASE64_ forString:@"BASE64"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parameter_CHARSET_ forString:@"CHARSET"];
  [(CNVCardSelectorMap *)v2 setSelector:sel_parameter_ENCODING_ forString:@"ENCODING"];
  return v2;
}

- (CNVCardParser)initWithData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_alloc_init(CNVCardReadingOptions);
  id v6 = [(CNVCardParser *)self initWithData:v4 options:v5];

  return v6;
}

- (CNVCardParser)initWithData:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CNVCardParser;
  v9 = [(CNVCardParser *)&v28 init];
  v10 = v9;
  v11 = 0;
  if (v7 && v9)
  {
    if ([v7 length]
      && (v12 = [[CNVCardLexer alloc] initWithData:v7],
          lexer = v10->_lexer,
          v10->_lexer = v12,
          lexer,
          v10->_lexer))
    {
      objc_storeStrong((id *)&v10->_data, a3);
      objc_storeStrong((id *)&v10->_options, a4);
      v14 = [v8 propertiesToFetch];
      uint64_t v15 = +[CNVCardTagInclusion policyWithTags:v14];
      tagInclusionPolicy = v10->_tagInclusionPolicy;
      v10->_tagInclusionPolicy = (_TtP5vCard25CNVCardTagInclusionPolicy_ *)v15;

      v10->_defaultEncoding = [(id)objc_opt_class() inferredStringEncodingFromData:v7];
      v17 = objc_alloc_init(CNVCardMutableNameComponents);
      nameComponents = v10->_nameComponents;
      v10->_nameComponents = v17;

      v10->_fullNameHasZeroLength = 1;
      v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unknowns = v10->_unknowns;
      v10->_unknowns = v19;

      v21 = objc_alloc_init(CNVCardDateComponentsParser);
      dateComponentsParser = v10->_dateComponentsParser;
      v10->_dateComponentsParser = v21;

      uint64_t v23 = [(id)objc_opt_class() newParsingSelectorMap];
      parsingSelectorMap = v10->_parsingSelectorMap;
      v10->_parsingSelectorMap = (CNVCardSelectorMap *)v23;

      uint64_t v25 = [(id)objc_opt_class() newParameterSelectorMap];
      parameterSelectorMap = v10->_parameterSelectorMap;
      v10->_parameterSelectorMap = (CNVCardSelectorMap *)v25;

      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (id)parseData:(id)a3 resultFactory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(CNVCardReadingOptions);
  v9 = [a1 parseData:v7 options:v8 resultFactory:v6];

  return v9;
}

+ (id)parseData:(id)a3 options:(id)a4 resultFactory:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[CNVCardParsingConcurrencyStrategy strategyForOptions:v8];
  v11 = [v10 parseData:v9 options:v8 resultFactory:v7];

  return v11;
}

- (id)resultsWithFactory:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (![(CNVCardParser *)self atEOF])
  {
    do
    {
      unint64_t v6 = [v5 count];
      id v7 = [(CNVCardParser *)self options];
      unint64_t v8 = [v7 contactLimit];

      if (v6 >= v8) {
        break;
      }
      uint64_t v9 = [(CNVCardParser *)self nextResultWithFactory:v4 progressLength:0];
      if (!v9) {
        break;
      }
      v10 = (void *)v9;
      [v5 addObject:v9];
    }
    while (![(CNVCardParser *)self atEOF]);
  }

  return v5;
}

- (id)nextResultWithFactory:(id)a3 progressLength:(int64_t *)a4
{
  id v7 = a3;
  id v4 = v7;
  unint64_t v5 = CNResultWithAutoreleasePool();

  return v5;
}

uint64_t __54__CNVCardParser_nextResultWithFactory_progressLength___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pool_nextResultWithFactory:progressLength:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)pool_nextResultWithFactory:(id)a3 progressLength:(int64_t *)a4
{
  id v6 = a3;
  if (![(CNVCardParser *)self atEOF])
  {
    unint64_t v8 = [v6 makeBuilder];
    int64_t v9 = [(CNVCardParser *)self currentPosition];
    BOOL v10 = [(CNVCardParser *)self parseNextResultUsingResultBuilder:v8];
    self->_hasImportErrors = !v10;
    if (a4)
    {
      *a4 = [(CNVCardParser *)self currentPosition] - v9;
      if (self->_hasImportErrors)
      {
LABEL_6:
        id v7 = 0;
LABEL_9:

        goto LABEL_10;
      }
    }
    else if (!v10)
    {
      goto LABEL_6;
    }
    id v7 = [v8 build];
    goto LABEL_9;
  }
  id v7 = 0;
  if (a4) {
    *a4 = 0;
  }
LABEL_10:

  return v7;
}

- (BOOL)parseNextResultUsingResultBuilder:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_resultBuilder, a3);
  id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  extensions = self->_extensions;
  self->_extensions = v6;

  [(CNVCardLexer *)self->_lexer advanceToString];
  int v8 = [(CNVCardLexer *)self->_lexer readNextToken];
  if ((v8 - 32769) <= 1)
  {
    do
      int v8 = [(CNVCardLexer *)self->_lexer readNextToken];
    while ((v8 - 32769) < 2);
  }
  if (v8 != 5)
  {
    if (v8 != 65537)
    {
      int64_t v9 = +[CNVCardLogging vCard];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CNVCardParser parseNextResultUsingResultBuilder:]();
      }

      [(CNVCardLexer *)self->_lexer advanceToToken:7 throughTypes:0x4000];
      [(CNVCardLexer *)self->_lexer advancePastEOL];
    }
    goto LABEL_25;
  }
  if (![(CNVCardLexer *)self->_lexer advanceToToken:8193 throughTypes:0x4000])
  {
    v12 = +[CNVCardLogging vCard];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CNVCardParser parseNextResultUsingResultBuilder:].cold.5();
    }
    goto LABEL_24;
  }
  if (![(CNVCardLexer *)self->_lexer advanceToToken:6 throughTypes:0x4000])
  {
    v12 = +[CNVCardLogging vCard];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CNVCardParser parseNextResultUsingResultBuilder:].cold.4();
    }
    goto LABEL_24;
  }
  if (![(CNVCardLexer *)self->_lexer advanceToEOL])
  {
    v12 = +[CNVCardLogging vCard];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CNVCardParser parseNextResultUsingResultBuilder:]();
    }
    goto LABEL_24;
  }
  if (![(CNVCardLexer *)self->_lexer advancePastEOL])
  {
    v12 = +[CNVCardLogging vCard];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CNVCardParser parseNextResultUsingResultBuilder:]();
    }
LABEL_24:

LABEL_25:
    [(CNVCardParser *)self cleanUpCardState];
    resultBuilder = self->_resultBuilder;
    self->_resultBuilder = 0;

    BOOL v11 = 0;
    goto LABEL_26;
  }
  while ([(CNVCardParser *)self parseLine])
    ;
  [(CNVCardParser *)self reportValues];
  if (![(CNVCardLexer *)self->_lexer advanceToToken:8193 throughTypes:0x4000]
    || ![(CNVCardLexer *)self->_lexer advanceToToken:6 throughTypes:0x4000])
  {
    goto LABEL_25;
  }
  [(CNVCardLexer *)self->_lexer advancePastEOL];
  [(CNVCardParser *)self cleanUpCardState];
  BOOL v10 = self->_resultBuilder;
  self->_resultBuilder = 0;

  BOOL v11 = 1;
LABEL_26:

  return v11;
}

- (void)cleanUpCardState
{
  v3 = objc_alloc_init(CNVCardMutableNameComponents);
  nameComponents = self->_nameComponents;
  self->_nameComponents = v3;

  bday = self->_bday;
  self->_bday = 0;

  altBday = self->_altBday;
  self->_altBday = 0;

  self->_fullNameHasZeroLength = 1;
  resultBuilder = self->_resultBuilder;
  self->_resultBuilder = 0;

  carddavUID = self->_carddavUID;
  self->_carddavUID = 0;

  emails = self->_emails;
  self->_emails = 0;

  urls = self->_urls;
  self->_urls = 0;

  calendarURIs = self->_calendarURIs;
  self->_calendarURIs = 0;

  relatedNames = self->_relatedNames;
  self->_relatedNames = 0;

  dateComponents = self->_dateComponents;
  self->_dateComponents = 0;

  phones = self->_phones;
  self->_phones = 0;

  addresses = self->_addresses;
  self->_addresses = 0;

  instantMessagingAddresses = self->_instantMessagingAddresses;
  self->_instantMessagingAddresses = 0;

  socialProfiles = self->_socialProfiles;
  self->_socialProfiles = 0;

  activityAlerts = self->_activityAlerts;
  self->_activityAlerts = 0;

  notes = self->_notes;
  self->_notes = 0;

  extensions = self->_extensions;
  self->_extensions = 0;

  imageData = self->_imageData;
  self->_imageData = 0;

  uid = self->_uid;
  self->_uid = 0;

  addressingGrammars = self->_addressingGrammars;
  self->_addressingGrammars = 0;

  unknowns = self->_unknowns;
  [(NSMutableArray *)unknowns removeAllObjects];
}

- (BOOL)hasImportErrors
{
  return self->_hasImportErrors;
}

+ (unint64_t)inferredStringEncodingFromData:(id)a3
{
  unint64_t v3 = +[CNVCardDataAnalyzer analyzeData:a3];
  if (v3)
  {
    if (v3 == 2483028224) {
      return 2415919360;
    }
    else {
      return v3;
    }
  }
  else
  {
    CFStringRef v5 = +[CNVCardUserDefaults vCard21Encoding];
    id v6 = (__CFString *)v5;
    if (!v5
      || (CFStringEncoding v7 = CFStringConvertIANACharSetNameToEncoding(v5),
          unint64_t v4 = CFStringConvertEncodingToNSStringEncoding(v7),
          v4 == 0xFFFFFFFF))
    {
      unint64_t v4 = 30;
    }
  }
  return v4;
}

- (BOOL)parseLine
{
  self->_startingPositionOfCurrentProperty = [(CNVCardParser *)self currentPosition];
  unint64_t defaultEncoding = self->_defaultEncoding;
  *(_WORD *)&self->_quotedPrintable = 0;
  grouping = self->_grouping;
  self->_grouping = 0;
  self->_encoding = defaultEncoding;

  CFStringRef v5 = [(CNVCardLexer *)self->_lexer nextArraySeperatedByToken:256 stoppingAt:46080 inEncoding:1 maximumValueLength:[(CNVCardReadingOptions *)self->_options maximumValueLength]];
  uint64_t v6 = [v5 count];
  if (!v6)
  {
    int v8 = 0;
LABEL_23:
    BOOL v31 = 0;
    goto LABEL_24;
  }
  uint64_t v7 = v6;
  int v8 = [v5 lastObject];
  if (v7 == 2)
  {
    int64_t v9 = [v5 objectAtIndex:0];
    BOOL v10 = (NSString *)[v9 copy];
    BOOL v11 = self->_grouping;
    self->_grouping = v10;
  }
  if (!v8 || (objc_msgSend(v8, "_cn_caseInsensitiveIsEqual:", @"END") & 1) != 0) {
    goto LABEL_23;
  }
  if ([(CNVCardTagInclusionPolicy *)self->_tagInclusionPolicy shouldParseTag:v8]
    && (v12 = [(CNVCardParser *)self parsingSelectorForTag:v8]) != 0
    && (v13 = v12, (objc_opt_respondsToSelector() & 1) != 0))
  {
    v14 = [(CNVCardParser *)self parseParameters];
    uint64_t v15 = (NSArray *)[v14 copy];
    itemParameters = self->_itemParameters;
    self->_itemParameters = v15;

    if (![(CNVCardParser *)self parseValueUsingSelector:v13])
    {
      v17 = +[CNVCardLogging vCard];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        [(CNVCardParser *)(uint64_t)v8 parseLine];
      }
LABEL_19:
    }
  }
  else if ([(CNVCardTagInclusionPolicy *)self->_tagInclusionPolicy shouldCaptureUnknownTags])
  {
    v17 = [(CNVCardParser *)self parseUnknownValueStartingAtPosition:self->_startingPositionOfCurrentProperty];
    if ([(id)objc_opt_class() isTagSyntacticallyValid:v8])
    {
      v24 = objc_alloc_init(CNVCardUnknownPropertyDescription);
      [(CNVCardUnknownPropertyDescription *)v24 setPropertyName:v8];
      [(CNVCardUnknownPropertyDescription *)v24 setOriginalLine:v17];
      [(NSMutableArray *)self->_unknowns addObject:v24];
    }
    else
    {
      v24 = +[CNVCardLogging vCard];
      if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR)) {
        [(CNVCardParser *)(uint64_t)v17 parseLine];
      }
    }

    goto LABEL_19;
  }
  if (![(CNVCardLexer *)self->_lexer advanceToEOL]
    || ![(CNVCardLexer *)self->_lexer advancePastEOL])
  {
    goto LABEL_23;
  }
  BOOL v31 = 1;
LABEL_24:

  return v31;
}

+ (BOOL)isTagSyntacticallyValid:(id)a3
{
  uint64_t v3 = isTagSyntacticallyValid__cn_once_token_9;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isTagSyntacticallyValid__cn_once_token_9, &__block_literal_global_383);
  }
  char v5 = objc_msgSend(v4, "_cn_containsCharacterInSet:", isTagSyntacticallyValid__cn_once_object_9);

  return v5 ^ 1;
}

void __41__CNVCardParser_isTagSyntacticallyValid___block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-."];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)isTagSyntacticallyValid__cn_once_object_9;
  isTagSyntacticallyValid__cn_once_object_9 = v0;
}

- (SEL)parsingSelectorForTag:(id)a3
{
  return [(CNVCardSelectorMap *)self->_parsingSelectorMap selectorForString:a3];
}

- (BOOL)parseValueUsingSelector:(SEL)a3
{
  char v5 = (uint64_t (*)(CNVCardParser *, SEL))-[CNVCardParser methodForSelector:](self, "methodForSelector:");
  return v5(self, a3);
}

- (BOOL)parse_ADR
{
  uint64_t v3 = +[CNVCardADRParser valueWithParser:self];
  if ([v3 count])
  {
    id v4 = [(CNVCardParser *)self makeLineWithValue:v3 forProperty:@"Address"];
    addresses = self->_addresses;
    if (!addresses)
    {
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = self->_addresses;
      self->_addresses = v6;

      addresses = self->_addresses;
    }
    [(NSMutableArray *)addresses addObject:v4];
  }
  return 1;
}

- (BOOL)parse_BDAY
{
  uint64_t v3 = [(CNVCardDateComponentsParser *)self->_dateComponentsParser gregorianDateComponentsWithParser:self];
  bday = self->_bday;
  self->_bday = v3;

  return 1;
}

- (BOOL)parse_CALURI
{
  uint64_t v3 = +[CNVCardURLParser valueWithParser:self];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    id v4 = [(CNVCardParser *)self makeLineWithValue:v3 forProperty:@"URLs"];
    calendarURIs = self->_calendarURIs;
    if (!calendarURIs)
    {
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = self->_calendarURIs;
      self->_calendarURIs = v6;

      calendarURIs = self->_calendarURIs;
    }
    [(NSMutableArray *)calendarURIs addObject:v4];
  }
  return 1;
}

- (BOOL)parse_EMAIL
{
  uint64_t v3 = [(CNVCardParser *)self parseRemainingLine];
  id v4 = [(CNVCardParser *)self makeLineWithValue:v3 forProperty:@"Email"];
  emails = self->_emails;
  if (!emails)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_emails;
    self->_emails = v6;

    emails = self->_emails;
  }
  [(NSMutableArray *)emails addObject:v4];
  [(CNVCardParser *)self advancePastSemicolon];

  return 1;
}

- (BOOL)parse_FN
{
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  [(CNVCardMutableNameComponents *)self->_nameComponents setFormattedName:v3];

  return 1;
}

- (BOOL)parse_IMPP
{
  id v2 = self;
  uint64_t v3 = [(NSArray *)self->_itemParameters _cn_firstObjectPassingTest:&__block_literal_global_392];
  id v4 = [v3 values];
  char v5 = [v4 firstObject];

  uint64_t v6 = +[CNVCardInstantMessageParser serviceForString:v5];
  LOBYTE(v2) = [(CNVCardParser *)v2 parseInstantMessageValueWithService:v6];

  return (char)v2;
}

uint64_t __27__CNVCardParser_parse_IMPP__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 name];
  uint64_t v3 = [v2 uppercaseString];

  if ([v3 isEqualToString:@"X-SERVICE-TYPE"]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 isEqualToString:@"SERVICE-TYPE"];
  }

  return v4;
}

- (BOOL)parse_N
{
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  [(CNVCardMutableNameComponents *)self->_nameComponents setLastName:v3];

  [(CNVCardParser *)self advancePastSemicolon];
  uint64_t v4 = [(CNVCardParser *)self parseStringValue];
  [(CNVCardMutableNameComponents *)self->_nameComponents setFirstName:v4];

  [(CNVCardParser *)self advancePastSemicolon];
  char v5 = [(CNVCardParser *)self parseStringValue];
  [(CNVCardMutableNameComponents *)self->_nameComponents setMiddleName:v5];

  [(CNVCardParser *)self advancePastSemicolon];
  uint64_t v6 = [(CNVCardParser *)self parseStringValue];
  [(CNVCardMutableNameComponents *)self->_nameComponents setTitle:v6];

  [(CNVCardParser *)self advancePastSemicolon];
  uint64_t v7 = [(CNVCardParser *)self parseStringValue];
  [(CNVCardMutableNameComponents *)self->_nameComponents setSuffix:v7];

  uint64_t v8 = *MEMORY[0x1E4F5A298];
  int64_t v9 = [(CNVCardNameComponents *)self->_nameComponents lastName];
  if ((*(unsigned int (**)(uint64_t, void *))(v8 + 16))(v8, v9))
  {
    BOOL v10 = [(CNVCardNameComponents *)self->_nameComponents firstName];
    if ((*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v10))
    {
      BOOL v11 = [(CNVCardNameComponents *)self->_nameComponents middleName];
      if ((*(unsigned int (**)(uint64_t, void *))(v8 + 16))(v8, v11))
      {
        v12 = [(CNVCardNameComponents *)self->_nameComponents title];
        if ((*(unsigned int (**)(uint64_t, void *))(v8 + 16))(v8, v12))
        {
          v13 = [(CNVCardNameComponents *)self->_nameComponents suffix];
          self->_fullNameHasZeroLength = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v13);
        }
        else
        {
          self->_fullNameHasZeroLength = 0;
        }
      }
      else
      {
        self->_fullNameHasZeroLength = 0;
      }
    }
    else
    {
      self->_fullNameHasZeroLength = 0;
    }
  }
  else
  {
    self->_fullNameHasZeroLength = 0;
  }

  return 1;
}

- (BOOL)parse_NICKNAME
{
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  [(CNVCardParsedResultBuilder *)self->_resultBuilder setValue:v3 forProperty:@"Nickname"];

  return 1;
}

- (BOOL)parse_NOTE
{
  uint64_t v3 = [(CNVCardParser *)self parseRemainingLine];
  uint64_t v4 = (NSMutableString *)[v3 mutableCopy];
  notes = self->_notes;
  self->_notes = v4;

  return 1;
}

- (BOOL)parse_ORG
{
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  [(CNVCardMutableNameComponents *)self->_nameComponents setCompanyName:v3];

  [(CNVCardParser *)self advancePastSemicolon];
  uint64_t v4 = [(CNVCardParser *)self parseStringValue];
  [(CNVCardParser *)self reportValue:v4 forProperty:@"ABDepartment"];

  return 1;
}

- (BOOL)parse_X_PHONETIC_ORG
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v3 forProperty:@"OrganizationPhonetic"];

  return (char)v2;
}

- (BOOL)parse_PHOTO
{
  return 1;
}

void __28__CNVCardParser_parse_PHOTO__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  int64_t v9 = *(void **)(a1 + 32);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  [v9 setImageData:v13];
  v14 = [*(id *)(a1 + 32) resultBuilder];
  [v14 setValue:v10 forProperty:@"memojiMetadata"];

  id v15 = [*(id *)(a1 + 32) resultBuilder];
  [v15 setImageData:v13 forReference:v12 clipRects:v11];
}

- (BOOL)parse_X_WALLPAPER
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v4 forProperty:@"wallpaper"];

  return (char)v2;
}

- (BOOL)parse_X_WATCH_WALLPAPER_IMAGE_DATA
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v4 forProperty:@"watchWallpaperImageData"];

  return (char)v2;
}

- (BOOL)parse_X_IMAGE_BACKGROUND_COLORS_DATA
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v4 forProperty:@"imageBackgroundColorsData"];

  return (char)v2;
}

- (BOOL)parse_PRODID
{
  return 1;
}

- (BOOL)parse_REV
{
  return 1;
}

- (BOOL)parse_TEL
{
  uint64_t v3 = [(CNVCardParser *)self parseRemainingLine];
  uint64_t v4 = [(CNVCardParser *)self makeLineWithValue:v3 forProperty:@"Phone"];
  phones = self->_phones;
  if (!phones)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_phones;
    self->_phones = v6;

    phones = self->_phones;
  }
  [(NSMutableArray *)phones addObject:v4];

  return 1;
}

- (BOOL)parse_TITLE
{
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  char v4 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))();
  if ((v4 & 1) == 0) {
    [(CNVCardParsedResultBuilder *)self->_resultBuilder setValue:v3 forProperty:@"JobTitle"];
  }

  return v4 ^ 1;
}

- (BOOL)parse_UID
{
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  char v4 = (NSString *)[v3 copy];
  carddavUID = self->_carddavUID;
  self->_carddavUID = v4;

  if ([(CNVCardLexer *)self->_lexer peekAtNextToken] == 4097)
  {
    [(CNVCardLexer *)self->_lexer advanceToPeekPoint];
    uint64_t v6 = [(CNVCardParser *)self parseStringValue];
    uint64_t v7 = v6;
    if (v6 && [v6 length]) {
      [(CNVCardParsedResultBuilder *)self->_resultBuilder setValue:v7 forProperty:@"externalUUID"];
    }
    if ([(CNVCardLexer *)self->_lexer peekAtNextToken] == 4097) {
      [(CNVCardLexer *)self->_lexer advanceToPeekPoint];
    }
  }
  return 1;
}

- (BOOL)parse_URL
{
  uint64_t v3 = +[CNVCardURLParser valueWithParser:self];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    char v4 = [(CNVCardParser *)self makeLineWithValue:v3 forProperty:@"URLs"];
    urls = self->_urls;
    if (!urls)
    {
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = self->_urls;
      self->_urls = v6;

      urls = self->_urls;
    }
    [(NSMutableArray *)urls addObject:v4];
  }
  return 1;
}

- (BOOL)parse_VERSION
{
  uint64_t v3 = [(CNVCardParser *)self parseRemainingLine];
  char v4 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))();
  if ((v4 & 1) == 0) {
    self->_30vCard = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", @"3.0");
  }

  return v4 ^ 1;
}

- (BOOL)parse_X_ABADR
{
  return [(CNVCardParser *)self parseExtension:@"X-ABADR"];
}

- (BOOL)parse_X_ABDATE
{
  uint64_t v3 = [(CNVCardDateComponentsParser *)self->_dateComponentsParser gregorianDateComponentsWithParser:self];
  if (v3)
  {
    char v4 = [(CNVCardParser *)self makeLineWithValue:v3 forProperty:@"ABDateComponents"];
    dateComponents = self->_dateComponents;
    if (!dateComponents)
    {
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = self->_dateComponents;
      self->_dateComponents = v6;

      dateComponents = self->_dateComponents;
    }
    [(NSMutableArray *)dateComponents addObject:v4];
  }
  return 1;
}

- (BOOL)parse_X_ABLABEL
{
  return [(CNVCardParser *)self parseExtension:@"X-ABLabel"];
}

- (BOOL)parse_X_ABORDER
{
  uint64_t v3 = [(CNVCardLexer *)self->_lexer nextArraySeperatedByToken:4096 stoppingAt:0x8000 inEncoding:self->_encoding maximumValueLength:[(CNVCardReadingOptions *)self->_options maximumValueLength]];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    char v5 = [(CNVCardParsedResultBuilder *)self->_resultBuilder valueForProperty:@"ABPersonFlags"];
    uint64_t v6 = [v5 integerValue];

    int64_t v7 = +[CNVCardUserDefaults defaultNameOrdering];
    uint64_t v8 = [v3 objectAtIndex:0];
    int64_t v9 = v8;
    if (v7 == 32)
    {
      uint64_t v10 = [v8 compare:@"LAST" options:1];

      unint64_t v11 = v6 & 0xFFFFFFFFFFFFFFC7 | 0x10;
    }
    else
    {
      uint64_t v10 = [v8 compare:@"FIRST" options:1];

      unint64_t v11 = v6 & 0xFFFFFFFFFFFFFFC7 | 0x20;
    }
    if (v10) {
      unint64_t v12 = v6;
    }
    else {
      unint64_t v12 = v11;
    }
    resultBuilder = self->_resultBuilder;
    v14 = [NSNumber numberWithInteger:v12];
    [(CNVCardParsedResultBuilder *)resultBuilder setValue:v14 forProperty:@"ABPersonFlags"];
  }
  return v4 != 0;
}

- (BOOL)parse_X_ABPHOTO
{
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  uint64_t v4 = +[CNVCardXABPHOTOParser valueWithName:v3];
  if (v4) {
    [(CNVCardParsedResultBuilder *)self->_resultBuilder setImageData:v4 forReference:&stru_1F362EAE0 clipRects:MEMORY[0x1E4F1CBF0]];
  }

  return v4 != 0;
}

- (BOOL)parse_X_AIM
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"AIMInstant"];
}

- (BOOL)parse_X_AIM_ID
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"AIMInstant"];
}

- (BOOL)parse_X_ABRELATEDNAMES
{
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    uint64_t v4 = [(CNVCardParser *)self makeLineWithValue:v3 forProperty:@"ABRelatedNames"];
    relatedNames = self->_relatedNames;
    if (!relatedNames)
    {
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int64_t v7 = self->_relatedNames;
      self->_relatedNames = v6;

      relatedNames = self->_relatedNames;
    }
    [(NSMutableArray *)relatedNames addObject:v4];
  }
  return 1;
}

- (BOOL)parse_X_ABSHOWAS
{
  uint64_t v3 = [(CNVCardLexer *)self->_lexer nextArraySeperatedByToken:4096 stoppingAt:0x8000 inEncoding:self->_encoding maximumValueLength:[(CNVCardReadingOptions *)self->_options maximumValueLength]];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    char v5 = [v3 objectAtIndex:0];
    uint64_t v6 = [v5 compare:@"COMPANY" options:1];

    if (!v6)
    {
      int64_t v7 = [(CNVCardParsedResultBuilder *)self->_resultBuilder valueForProperty:@"ABPersonFlags"];
      uint64_t v8 = [v7 integerValue];

      resultBuilder = self->_resultBuilder;
      uint64_t v10 = [NSNumber numberWithInteger:v8 & 0xFFFFFFFFFFFFFFF8 | 1];
      [(CNVCardParsedResultBuilder *)resultBuilder setValue:v10 forProperty:@"ABPersonFlags"];
    }
  }

  return v4 != 0;
}

- (BOOL)parse_X_ABUID
{
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  uint64_t v4 = (NSString *)[v3 copy];
  uid = self->_uid;
  self->_uid = v4;

  return (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() ^ 1;
}

- (BOOL)parse_X_ACTIVITY_ALERT
{
  uint64_t v3 = +[CNVCardXACTIVITYALERTParser valueWithParser:self];
  if (v3)
  {
    activityAlerts = self->_activityAlerts;
    if (!activityAlerts)
    {
      char v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v6 = self->_activityAlerts;
      self->_activityAlerts = v5;

      activityAlerts = self->_activityAlerts;
    }
    [(NSMutableDictionary *)activityAlerts addEntriesFromDictionary:v3];
  }

  return 1;
}

- (BOOL)parse_X_ALTBDAY
{
  uint64_t v3 = [(CNVCardDateComponentsParser *)self->_dateComponentsParser dateComponentsWithParser:self];
  altBday = self->_altBday;
  self->_altBday = v3;

  return 1;
}

- (BOOL)parse_X_APPLE_SUBADMINISTRATIVEAREA
{
  return [(CNVCardParser *)self parseExtension:@"X-APPLE-SUBADMINISTRATIVEAREA"];
}

- (BOOL)parse_X_APPLE_SUBLOCALITY
{
  return [(CNVCardParser *)self parseExtension:@"X-APPLE-SUBLOCALITY"];
}

- (BOOL)parse_X_GOOGLE_ID
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"GoogleTalkInstant"];
}

- (BOOL)parse_X_GOOGLE_TALK
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"GoogleTalkInstant"];
}

- (BOOL)parse_X_GTALK
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"GoogleTalkInstant"];
}

- (BOOL)parse_X_ICQ
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"ICQInstant"];
}

- (BOOL)parse_X_ICQ_ID
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"ICQInstant"];
}

- (BOOL)parse_X_IMAGEHASH
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v4 forProperty:@"imageHash"];

  return (char)v2;
}

- (BOOL)parse_X_IMAGETYPE
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v3 forProperty:@"imageType"];

  return (char)v2;
}

- (BOOL)parse_X_JABBER
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"JabberInstant"];
}

- (BOOL)parse_X_JABBER_ID
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"JabberInstant"];
}

- (BOOL)parse_X_MAIDENNAME
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseRemainingLine];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v3 forProperty:@"MaidenName"];

  return (char)v2;
}

- (BOOL)parse_X_MSN
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"MSNInstant"];
}

- (BOOL)parse_X_MSN_ID
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"MSNInstant"];
}

- (BOOL)parse_X_PHONETIC_FIRST_NAME
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v3 forProperty:@"FirstPhonetic"];

  return (char)v2;
}

- (BOOL)parse_X_PHONETIC_LAST_NAME
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v3 forProperty:@"LastPhonetic"];

  return (char)v2;
}

- (BOOL)parse_X_PHONETIC_MIDDLE_NAME
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v3 forProperty:@"MiddlePhonetic"];

  return (char)v2;
}

- (BOOL)parse_X_PRONUNCIATION_FIRST_NAME
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v3 forProperty:@"FirstPronunciation"];

  return (char)v2;
}

- (BOOL)parse_X_PRONUNCIATION_LAST_NAME
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v3 forProperty:@"LastPronunciation"];

  return (char)v2;
}

- (BOOL)parse_X_ADDRESSING_GRAMMAR
{
  uint64_t v3 = [(CNVCardParser *)self parseRemainingLine];
  uint64_t v4 = [(CNVCardParser *)self makeLineWithValue:v3 forProperty:@"AddressingGrammar"];
  addressingGrammars = self->_addressingGrammars;
  if (!addressingGrammars)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int64_t v7 = self->_addressingGrammars;
    self->_addressingGrammars = v6;

    addressingGrammars = self->_addressingGrammars;
  }
  [(NSMutableArray *)addressingGrammars addObject:v4];

  return 1;
}

- (BOOL)parse_X_QQ
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"QQInstant"];
}

- (BOOL)parse_X_QQ_ID
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"QQInstant"];
}

- (BOOL)parse_X_SKYPE
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"SkypeInstant"];
}

- (BOOL)parse_X_SKYPE_ID
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"SkypeInstant"];
}

- (BOOL)parse_X_SKYPE_USERNAME
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"SkypeInstant"];
}

- (BOOL)parse_X_SOCIALPROFILE
{
  uint64_t v3 = +[CNVCardXSOCIALPROFILEParser valueWithParser:self];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A270] + 16))() & 1) == 0)
  {
    uint64_t v4 = [(CNVCardParser *)self makeLineWithValue:v3 forProperty:@"SocialProfile"];
    socialProfiles = self->_socialProfiles;
    if (!socialProfiles)
    {
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int64_t v7 = self->_socialProfiles;
      self->_socialProfiles = v6;

      socialProfiles = self->_socialProfiles;
    }
    [(NSMutableArray *)socialProfiles addObject:v4];
  }
  return 1;
}

- (BOOL)parse_X_YAHOO
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"YahooInstant"];
}

- (BOOL)parse_X_YAHOO_ID
{
  return [(CNVCardParser *)self parseInstantMessageValueWithService:@"YahooInstant"];
}

- (BOOL)parse_X_ADDRESSBOOKSERVER_PHONEME_DATA
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v3 forProperty:@"PhonemeData"];

  return (char)v2;
}

- (BOOL)parse_X_APPLE_LIKENESS_SOURCE
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v3 forProperty:@"PreferredLikenessSource"];

  return (char)v2;
}

- (BOOL)parse_X_APPLE_LIKENESS_SERVICE_IDENTIFIER
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v3 forProperty:@"PreferredApplePersonaIdentifier"];

  return (char)v2;
}

- (BOOL)parse_X_APPLE_GUARDIAN_WHITELISTED
{
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  if ([v3 isEqualToString:@"false"]) {
    char v4 = 1;
  }
  else {
    char v4 = [(CNVCardParsedResultBuilder *)self->_resultBuilder setValue:v3 forProperty:@"GuardianWhitelisted"];
  }

  return v4;
}

- (BOOL)parse_X_SHARED_PHOTO_DISPLAY_PREF
{
  uint64_t v3 = [(CNVCardLexer *)self->_lexer nextArraySeperatedByToken:4096 stoppingAt:0x8000 inEncoding:self->_encoding maximumValueLength:[(CNVCardReadingOptions *)self->_options maximumValueLength]];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    char v5 = [(CNVCardParsedResultBuilder *)self->_resultBuilder valueForProperty:@"ABPersonFlags"];
    uint64_t v6 = [v5 integerValue];

    int64_t v7 = [v3 objectAtIndex:0];
    uint64_t v8 = [v7 compare:@"AUTOUPDATE" options:1];

    if (v8)
    {
      int64_t v9 = [v3 objectAtIndex:0];
      uint64_t v10 = [v9 compare:@"ALWAYS_ASK" options:1];

      if (v10)
      {
        unint64_t v11 = [v3 objectAtIndex:0];
        uint64_t v12 = [v11 compare:@"IMPLICIT_AUTOUPDATE" options:1];

        if (v12) {
          unint64_t v13 = v6 & 0xFFFFFFFFFFFFFF3FLL;
        }
        else {
          unint64_t v13 = v6 | 0xC0;
        }
      }
      else
      {
        unint64_t v13 = v6 & 0xFFFFFFFFFFFFFF3FLL | 0x80;
      }
    }
    else
    {
      unint64_t v13 = v6 & 0xFFFFFFFFFFFFFF3FLL | 0x40;
    }
    resultBuilder = self->_resultBuilder;
    id v15 = [NSNumber numberWithInteger:v13];
    [(CNVCardParsedResultBuilder *)resultBuilder setValue:v15 forProperty:@"ABPersonFlags"];
  }
  return v4 != 0;
}

- (BOOL)parse_VND_63_SENSITIVE_CONTENT_CONFIG
{
  id v2 = self;
  uint64_t v3 = [(CNVCardParser *)self parseStringValue];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
  LOBYTE(v2) = [(CNVCardParsedResultBuilder *)v2->_resultBuilder setValue:v4 forProperty:@"sensitiveContentConfiguration"];

  return (char)v2;
}

- (BOOL)parseInstantMessageValueWithService:(id)a3
{
  uint64_t v4 = +[CNVCardInstantMessageParser valueWithService:a3 existingHandles:self->_instantMessagingAddresses parser:self];
  if (v4)
  {
    char v5 = [(CNVCardParser *)self makeLineWithValue:v4 forProperty:@"InstantMessage"];
    instantMessagingAddresses = self->_instantMessagingAddresses;
    if (!instantMessagingAddresses)
    {
      int64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = self->_instantMessagingAddresses;
      self->_instantMessagingAddresses = v7;

      instantMessagingAddresses = self->_instantMessagingAddresses;
    }
    [(NSMutableArray *)instantMessagingAddresses addObject:v5];
  }
  return 1;
}

- (BOOL)parseExtension:(id)a3
{
  id v4 = a3;
  char v5 = [(CNVCardParser *)self parseArrayValue];
  if (v5 && ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_extensions objectForKey:self->_grouping];
    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_extensions setObject:v6 forKey:self->_grouping];
    }
    [v6 setObject:v5 forKey:v4];
  }
  return 1;
}

- (id)firstValueForKey:(id)a3 inExtensionGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    uint64_t v8 = 0;
  }
  else
  {
    int64_t v9 = [(NSMutableDictionary *)self->_extensions objectForKey:v7];
    uint64_t v8 = [(CNVCardParser *)self firstValueForKey:v6 inExtension:v9];
  }
  return v8;
}

- (id)firstValueForKey:(id)a3 inExtension:(id)a4
{
  id v4 = [a4 objectForKey:a3];
  char v5 = [v4 firstObject];

  return v5;
}

- (id)firstParameterWithName:(id)a3
{
  id v4 = a3;
  itemParameters = self->_itemParameters;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__CNVCardParser_firstParameterWithName___block_invoke;
  v9[3] = &unk_1E6C2CE88;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSArray *)itemParameters _cn_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __40__CNVCardParser_firstParameterWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 name];
  uint64_t v4 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", *(void *)(a1 + 32));

  return v4;
}

- (id)firstValueForParameterWithName:(id)a3
{
  uint64_t v3 = [(CNVCardParser *)self firstParameterWithName:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 values];
    id v6 = [v5 firstObject];

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
      id v7 = 0;
    }
    else {
      id v7 = v6;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)typeParameters
{
  if (self->_30vCard) {
    [(CNVCardParser *)self parameterValuesForName:@"TYPE"];
  }
  else {
  id v2 = [(NSArray *)self->_itemParameters _cn_map:&__block_literal_global_443];
  }
  return v2;
}

uint64_t __31__CNVCardParser_typeParameters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (id)parameterValuesForName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_itemParameters;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "name", (void)v16);
        int v13 = objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", v4);

        if (v13)
        {
          v14 = [v11 values];
          [v5 addObjectsFromArray:v14];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)makeLineWithValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(CNVCardParser *)self genericLabelForProperty:a4];
  uint64_t v8 = [(CNVCardParser *)self makeLineWithLabel:v7 value:v6];

  return v8;
}

- (id)makeLineWithLabel:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[CNVCardParsedLine alloc] initWithName:v7];

  [(CNVCardParsedLine *)v8 setValue:v6];
  [(CNVCardParsedLine *)v8 setParameters:self->_itemParameters];
  [(CNVCardParsedLine *)v8 setGrouping:self->_grouping];
  [(CNVCardParsedLine *)v8 setIsPrimary:[(NSArray *)self->_itemParameters _cn_any:&__block_literal_global_446]];
  return v8;
}

- (id)parseParameters
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  int v4 = [(CNVCardLexer *)self->_lexer readNextToken];
  if (v4 == 8193)
  {
LABEL_15:
    id v12 = v3;
  }
  else
  {
    int v5 = v4;
    while ([(CNVCardLexer *)self->_lexer errorCount] <= 10)
    {
      if (v5 == 4097)
      {
        id v6 = [(CNVCardParser *)self nextParameterInCurrentLine];
        [v3 addObject:v6];
        id v7 = [v6 name];
        uint64_t v8 = [(CNVCardParser *)self handlerSelectorForParameterName:v7];

        if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v9 = [v6 values];
          id v10 = [v9 firstObject];

          unint64_t v11 = (void (*)(CNVCardParser *, const char *, void *))[(CNVCardParser *)self methodForSelector:v8];
          if (v11) {
            v11(self, v8, v10);
          }
        }
      }
      else if (v5 == 32769 || v5 == 65537)
      {
        goto LABEL_15;
      }
      int v5 = [(CNVCardLexer *)self->_lexer readNextToken];
      if (v5 == 8193) {
        goto LABEL_15;
      }
    }
    id v12 = 0;
  }

  return v12;
}

- (id)nextParameterInCurrentLine
{
  uint64_t v3 = [(CNVCardLexer *)self->_lexer nextStringInEncoding:1 quotedPrintable:0 stopTokens:46080 trim:1 maximumValueLength:[(CNVCardReadingOptions *)self->_options maximumValueLength]];
  if ([(__CFString *)v3 _cn_caseInsensitiveIsEqual:@"QUOTED-PRINTABLE"])
  {
    int v4 = &unk_1F3638DF0;
  }
  else
  {
    if (![(__CFString *)v3 _cn_caseInsensitiveIsEqual:@"BASE64"])
    {
      int v4 = 0;
      int v5 = 1;
      goto LABEL_7;
    }
    int v4 = &unk_1F3638E08;
  }

  int v5 = 0;
  uint64_t v3 = @"ENCODING";
LABEL_7:
  int v6 = [(CNVCardLexer *)self->_lexer peekAtNextToken];
  if (v5 && v6 == 1025)
  {
    int v4 = [(CNVCardParser *)self parseParameterValues];
  }
  if (v4) {
    id v7 = v4;
  }
  else {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v8 = +[CNVCardParsedParameter parameterWithName:v3 values:v7];

  return v8;
}

- (id)parseParameterValues
{
  [(CNVCardLexer *)self->_lexer advanceToPeekPoint];
  if (self->_quotedPrintable) {
    uint64_t v3 = 46080;
  }
  else {
    uint64_t v3 = 45056;
  }
  int v4 = [(CNVCardLexer *)self->_lexer nextArraySeperatedByToken:128 stoppingAt:v3 inEncoding:4 maximumValueLength:[(CNVCardReadingOptions *)self->_options maximumValueLength]];
  int v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global);

  return v5;
}

- (SEL)handlerSelectorForParameterName:(id)a3
{
  return [(CNVCardSelectorMap *)self->_parameterSelectorMap selectorForString:a3];
}

- (void)parameter_QUOTED_PRINTABLE:(id)a3
{
  self->_quotedPrintable = 1;
}

- (void)parameter_BASE64:(id)a3
{
  self->_base64 = 1;
}

- (void)parameter_CHARSET:(id)a3
{
  int v4 = (__CFString *)a3;
  int v5 = v4;
  if (!v4)
  {
    unint64_t v6 = 4;
    goto LABEL_7;
  }
  if ([(__CFString *)v4 _cn_caseInsensitiveIsEqual:@"UTF-7"])
  {
    unint64_t v6 = 4000100;
LABEL_7:
    self->_encoding = v6;
    goto LABEL_8;
  }
  if ([(__CFString *)v5 _cn_caseInsensitiveIsEqual:@"shift_jis"])
  {
    unint64_t v6 = 8;
    goto LABEL_7;
  }
  CFStringEncoding v7 = CFStringConvertIANACharSetNameToEncoding(v5);
  self->_encoding = v7;
  if (v7 == -1)
  {
    uint64_t v8 = +[CNVCardLogging vCard];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNVCardParser parameter_CHARSET:]((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    self->_encoding = CFStringConvertEncodingToNSStringEncoding(v7);
  }
LABEL_8:
}

- (void)parameter_ENCODING:(id)a3
{
  id v5 = a3;
  if (objc_msgSend(v5, "_cn_caseInsensitiveIsEqual:", @"QUOTED-PRINTABLE"))
  {
    uint64_t v4 = 312;
LABEL_5:
    *((unsigned char *)&self->super.isa + v4) = 1;
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "_cn_caseInsensitiveIsEqual:", @"b"))
  {
    uint64_t v4 = 313;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "_cn_caseInsensitiveIsEqual:", @"BASE64"))
  {
    uint64_t v4 = 313;
    goto LABEL_5;
  }
LABEL_6:
  MEMORY[0x1F41817F8]();
}

- (void)reportValues
{
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  if (((*(uint64_t (**)(void, NSString *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], self->_uid) & 1) == 0) {
    [(CNVCardParser *)self reportValue:self->_uid forProperty:@"UID"];
  }
  [(CNVCardParser *)self processNameValues];
  [(CNVCardParser *)self processExtensionValues];
  uint64_t v4 = [(CNVCardNameComponents *)self->_nameComponents firstName];
  [(CNVCardParser *)self reportValue:v4 forProperty:@"First"];

  id v5 = [(CNVCardNameComponents *)self->_nameComponents lastName];
  [(CNVCardParser *)self reportValue:v5 forProperty:@"Last"];

  unint64_t v6 = [(CNVCardNameComponents *)self->_nameComponents middleName];
  [(CNVCardParser *)self reportValue:v6 forProperty:@"Middle"];

  CFStringEncoding v7 = [(CNVCardNameComponents *)self->_nameComponents title];
  [(CNVCardParser *)self reportValue:v7 forProperty:@"Title"];

  uint64_t v8 = [(CNVCardNameComponents *)self->_nameComponents suffix];
  [(CNVCardParser *)self reportValue:v8 forProperty:@"Suffix"];

  uint64_t v9 = [(CNVCardNameComponents *)self->_nameComponents companyName];
  [(CNVCardParser *)self reportValue:v9 forProperty:@"Organization"];

  uint64_t v10 = [(CNVCardNameComponents *)self->_nameComponents companyName];
  if ((*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v10)) {
    goto LABEL_6;
  }
  BOOL fullNameHasZeroLength = self->_fullNameHasZeroLength;

  if (fullNameHasZeroLength)
  {
    uint64_t v10 = [(CNVCardParsedResultBuilder *)self->_resultBuilder valueForProperty:@"ABPersonFlags"];
    uint64_t v12 = [v10 integerValue];
    resultBuilder = self->_resultBuilder;
    uint64_t v14 = [NSNumber numberWithInteger:v12 & 0xFFFFFFFFFFFFFFF8 | 1];
    [(CNVCardParsedResultBuilder *)resultBuilder setValue:v14 forProperty:@"ABPersonFlags"];

LABEL_6:
  }
  [(CNVCardParser *)self reportValue:self->_bday forProperty:@"BirthdayComponents"];
  [(CNVCardParser *)self reportValue:self->_altBday forProperty:@"AlternateBirthdayComponents"];
  [(CNVCardParser *)self reportValue:self->_notes forProperty:@"Note"];
  [(CNVCardParser *)self reportMultiValueLines:self->_emails forProperty:@"Email"];
  [(CNVCardParser *)self reportMultiValueLines:self->_phones forProperty:@"Phone"];
  [(CNVCardParser *)self reportMultiValueLines:self->_addresses forProperty:@"Address"];
  [(CNVCardParser *)self reportMultiValueLines:self->_instantMessagingAddresses forProperty:@"InstantMessage"];
  [(CNVCardParser *)self reportMultiValueLines:self->_socialProfiles forProperty:@"SocialProfile"];
  [(CNVCardParser *)self reportMultiValueLines:self->_dateComponents forProperty:@"ABDateComponents"];
  [(CNVCardParser *)self reportMultiValueLines:self->_relatedNames forProperty:@"ABRelatedNames"];
  [(CNVCardParser *)self reportMultiValueLines:self->_urls forProperty:@"URLs"];
  [(CNVCardParser *)self reportMultiValueLines:self->_calendarURIs forProperty:@"calendarURIs"];
  [(CNVCardParser *)self reportMultiValueLines:self->_addressingGrammars forProperty:@"AddressingGrammar"];
  [(CNVCardParser *)self reportValue:self->_activityAlerts forProperty:@"ActivityAlert"];
  if (((*(uint64_t (**)(uint64_t, NSString *))(v3 + 16))(v3, self->_carddavUID) & 1) == 0
    && [(CNVCardParsedResultBuilder *)self->_resultBuilder canSetValueForProperty:@"externalUUID"])
  {
    [(CNVCardParsedResultBuilder *)self->_resultBuilder setValue:self->_carddavUID forProperty:@"externalUUID"];
  }
  if ([(NSMutableArray *)self->_unknowns count])
  {
    id v15 = self->_resultBuilder;
    unknowns = self->_unknowns;
    [(CNVCardParsedResultBuilder *)v15 setUnknownProperties:unknowns];
  }
}

- (void)processNameValues
{
}

- (void)processExtensionValues
{
  addresses = self->_addresses;
  uint64_t v4 = [(CNVCardParser *)self validCountryCodes];
  +[CNVCardADRParser processExtensionValuesForLines:addresses validCountryCodes:v4 parser:self];

  socialProfiles = self->_socialProfiles;
  +[CNVCardXSOCIALPROFILEParser processExtensionValuesForLines:socialProfiles parser:self];
}

- (void)reportValue:(id)a3 forProperty:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (![(CNVCardParser *)self valueIsEmpty:v7]) {
    [(CNVCardParsedResultBuilder *)self->_resultBuilder setValue:v7 forProperty:v6];
  }
}

- (void)reportMultiValueLines:(id)a3 forProperty:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v23 = v7;
    uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
    v24 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      uint64_t v11 = *MEMORY[0x1E4F5A298];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v14 = [v13 value];
          if (![(CNVCardParser *)self valueIsEmpty:v14])
          {
            id v15 = [v13 grouping];
            long long v16 = [(CNVCardParser *)self firstValueForKey:@"X-ABLabel" inExtensionGroup:v15];

            if ((*(unsigned int (**)(uint64_t, void *))(v11 + 16))(v11, v16))
            {
              uint64_t v17 = [v13 name];

              long long v16 = (void *)v17;
            }
            if ([(CNVCardParser *)self valueIsEmpty:v16])
            {
              uint64_t v18 = [(CNVCardParser *)self fallbackLabelForProperty:v23];

              long long v16 = (void *)v18;
            }
            long long v19 = [MEMORY[0x1E4F1CA98] null];
            objc_msgSend(v26, "_cn_addObject:orPlaceholder:", v14, v19);

            uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
            objc_msgSend(v25, "_cn_addObject:orPlaceholder:", v16, v20);

            if ([v13 isPrimary]) {
              uint64_t v21 = MEMORY[0x1E4F1CC38];
            }
            else {
              uint64_t v21 = MEMORY[0x1E4F1CC28];
            }
            [v24 addObject:v21];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v9);
    }

    id v7 = v23;
    [(CNVCardParsedResultBuilder *)self->_resultBuilder setValues:v26 labels:v25 isPrimaries:v24 forProperty:v23];

    id v6 = v22;
  }
}

- (BOOL)valueIsEmpty:(id)a3
{
  id v3 = a3;
  BOOL v6 = 1;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];

    if (v4 != v3 && *MEMORY[0x1E4F1D260] != (void)v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0) {
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

- (id)validCountryCodes
{
  return (id)[(CNVCardParsedResultBuilder *)self->_resultBuilder validCountryCodes];
}

- (id)genericLabelForProperty:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"Phone"])
  {
    id v5 = [(CNVCardParser *)self phoneLabel];
  }
  else
  {
    [(CNVCardParser *)self typeParameters];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      long long v16 = self;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        if (objc_msgSend(v11, "_cn_caseInsensitiveIsEqual:", @"HOME")) {
          break;
        }
        if (objc_msgSend(v11, "_cn_caseInsensitiveIsEqual:", @"WORK"))
        {
          uint64_t v14 = CNVCardLabelWork;
          goto LABEL_22;
        }
        if (objc_msgSend(v11, "_cn_caseInsensitiveIsEqual:", @"MOBILEME"))
        {
          uint64_t v14 = CNVCardLabelMobileMe;
          goto LABEL_22;
        }
        if (objc_msgSend(v11, "_cn_caseInsensitiveIsEqual:", @"OTHER"))
        {
          uint64_t v14 = CNVCardLabelOther;
          goto LABEL_22;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
          self = v16;
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_14;
        }
      }
      uint64_t v14 = CNVCardLabelHome;
LABEL_22:
      id v5 = *v14;
      uint64_t v12 = v6;
      goto LABEL_23;
    }
LABEL_14:

    uint64_t v12 = [(CNVCardParser *)self firstCustomLabelForProperty:v4 types:v6];
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
      uint64_t v13 = [(CNVCardParser *)self fallbackLabelForProperty:v4];
    }
    else
    {
      uint64_t v13 = v12;
      uint64_t v12 = v13;
    }
    id v5 = v13;
LABEL_23:
  }
  return v5;
}

- (id)fallbackLabelForProperty:(id)a3
{
  int v3 = [a3 isEqual:@"URLs"];
  id v4 = CNVCardLabelUnknown;
  if (v3) {
    id v4 = CNVCardLabelURLHomePage;
  }
  id v5 = *v4;
  return v5;
}

- (id)phoneLabel
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(CNVCardParser *)self typeParameters];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v4)
  {

LABEL_18:
    uint64_t v14 = [(CNVCardParser *)self firstCustomLabelForProperty:@"Phone" types:v3];
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
      id v15 = [(CNVCardParser *)self fallbackLabelForProperty:@"Phone"];
    }
    else
    {
      id v15 = v14;
    }
    long long v17 = v15;

    goto LABEL_28;
  }
  uint64_t v5 = v4;
  int v6 = 0;
  int v7 = 0;
  int v8 = 0;
  int v9 = 0;
  uint64_t v10 = *(void *)v20;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v3);
      }
      uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if (objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", @"IPHONE"))
      {
        long long v16 = CNVCardLabelPhoneiPhone;
        goto LABEL_27;
      }
      if (objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", @"APPLEWATCH"))
      {
        long long v16 = CNVCardLabelPhoneAppleWatch;
        goto LABEL_27;
      }
      if (objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", @"MAIN"))
      {
        long long v16 = CNVCardLabelPhoneMain;
        goto LABEL_27;
      }
      if ((objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", @"CELL") & 1) != 0
        || (objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", @"MOBILE") & 1) != 0)
      {
        long long v16 = CNVCardLabelPhoneMobile;
LABEL_27:
        long long v17 = *v16;

        goto LABEL_28;
      }
      if (objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", @"PAGER"))
      {
        long long v16 = CNVCardLabelPager;
        goto LABEL_27;
      }
      v9 |= objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", @"HOME");
      v8 |= objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", @"WORK");
      v6 |= objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", @"OTHER");
      v7 |= objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", @"FAX");
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5) {
      continue;
    }
    break;
  }

  if (v9)
  {
    if (v7) {
      uint64_t v13 = CNVCardLabelPhoneHomeFAX;
    }
    else {
      uint64_t v13 = CNVCardLabelPhoneHome;
    }
    goto LABEL_41;
  }
  if (v8)
  {
    if ((v7 & 1) == 0)
    {
      uint64_t v13 = CNVCardLabelPhoneWork;
      goto LABEL_41;
    }
    goto LABEL_39;
  }
  if ((v6 & 1) == 0)
  {
    if (v7)
    {
LABEL_39:
      uint64_t v13 = CNVCardLabelPhoneWorkFAX;
      goto LABEL_41;
    }
    goto LABEL_18;
  }
  if (v7) {
    uint64_t v13 = CNVCardLabelPhoneOtherFAX;
  }
  else {
    uint64_t v13 = CNVCardLabelPhoneOther;
  }
LABEL_41:
  long long v17 = *v13;
LABEL_28:

  return v17;
}

- (id)firstCustomLabelForProperty:(id)a3 types:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"SocialProfile"])
  {
    int v7 = 0;
  }
  else
  {
    int v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3638E20];
    if ([v5 isEqualToString:@"Email"]) {
      [v8 addObject:@"INTERNET"];
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__CNVCardParser_firstCustomLabelForProperty_types___block_invoke;
    v12[3] = &unk_1E6C2CF30;
    id v13 = v8;
    id v9 = v8;
    uint64_t v10 = objc_msgSend(v6, "_cn_filter:", v12);
    int v7 = [v10 firstObject];
  }
  return v7;
}

uint64_t __51__CNVCardParser_firstCustomLabelForProperty_types___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CNVCardParser_firstCustomLabelForProperty_types___block_invoke_2;
  v8[3] = &unk_1E6C2CF30;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "_cn_any:", v8) ^ 1;

  return v6;
}

uint64_t __51__CNVCardParser_firstCustomLabelForProperty_types___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_caseInsensitiveIsEqual:", *(void *)(a1 + 32));
}

- (id)parseStringValue
{
  unint64_t encoding = self->_encoding;
  BOOL quotedPrintable = self->_quotedPrintable;
  lexer = self->_lexer;
  unint64_t v5 = [(CNVCardReadingOptions *)self->_options maximumValueLength];
  return [(CNVCardLexer *)lexer nextStringInEncoding:encoding quotedPrintable:quotedPrintable stopTokens:36864 trim:1 maximumValueLength:v5];
}

- (BOOL)advancePastSemicolon
{
  int v3 = [(CNVCardLexer *)self->_lexer peekAtNextToken];
  if (v3 == 4097) {
    [(CNVCardLexer *)self->_lexer advanceToPeekPoint];
  }
  return v3 == 4097;
}

- (id)parseRemainingLine
{
  int v3 = [(CNVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:0x8000 trim:1 maximumValueLength:[(CNVCardReadingOptions *)self->_options maximumValueLength]];
  [(CNVCardParser *)self advancePastSemicolon];
  return v3;
}

- (id)unparsedStringForCurrentProperty
{
  return [(CNVCardParser *)self parseUnknownValueStartingAtPosition:self->_startingPositionOfCurrentProperty];
}

- (id)parseArrayValue
{
  unint64_t encoding = self->_encoding;
  lexer = self->_lexer;
  unint64_t v4 = [(CNVCardReadingOptions *)self->_options maximumValueLength];
  return [(CNVCardLexer *)lexer nextArraySeperatedByToken:4096 stoppingAt:0x8000 inEncoding:encoding maximumValueLength:v4];
}

- (id)parseUnknownValueStartingAtPosition:(unint64_t)a3
{
  id v5 = [(CNVCardParser *)self parseRemainingLine];
  int64_t v6 = [(CNVCardParser *)self currentPosition];
  unint64_t v7 = v6 - a3;
  int v8 = -[CNVCardLexer stringWithRange:encoding:](self->_lexer, "stringWithRange:encoding:", a3, v6 - a3, self->_encoding);
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    id v9 = -[CNVCardLexer dataWithRange:](self->_lexer, "dataWithRange:", a3, v7);
    uint64_t v10 = [v9 base64EncodedStringWithOptions:0];

    id v11 = v10;
    int v8 = v11;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    id v11 = [v8 stringByTrimmingCharactersInSet:v9];
  }
  uint64_t v12 = v11;

  return v12;
}

- (id)parseBase64Data
{
  return [(CNVCardLexer *)self->_lexer nextBase64Data];
}

- (id)nextBase64Data
{
  return [(CNVCardLexer *)self->_lexer nextBase64Data];
}

- (BOOL)atEOF
{
  return [(CNVCardLexer *)self->_lexer atEOF];
}

- (int64_t)currentPosition
{
  return [(CNVCardLexer *)self->_lexer cursor];
}

- (CNVCardReadingOptions)options
{
  return self->_options;
}

- (CNVCardParsedResultBuilder)resultBuilder
{
  return self->_resultBuilder;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (_TtP5vCard25CNVCardTagInclusionPolicy_)tagInclusionPolicy
{
  return self->_tagInclusionPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagInclusionPolicy, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_itemParameters, 0);
  objc_storeStrong((id *)&self->_imageReference, 0);
  objc_storeStrong((id *)&self->_imageGroup, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_cropRects, 0);
  objc_storeStrong((id *)&self->_activityAlerts, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_instantMessagingAddresses, 0);
  objc_storeStrong((id *)&self->_carddavUID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_unknowns, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_addressingGrammars, 0);
  objc_storeStrong((id *)&self->_calendarURIs, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_relatedNames, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_phones, 0);
  objc_storeStrong((id *)&self->_dateComponents, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_altBday, 0);
  objc_storeStrong((id *)&self->_bday, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_resultBuilder, 0);
  objc_storeStrong((id *)&self->_parameterSelectorMap, 0);
  objc_storeStrong((id *)&self->_parsingSelectorMap, 0);
  objc_storeStrong((id *)&self->_dateComponentsParser, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_lexer, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)parseNextResultUsingResultBuilder:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC18F000, v0, v1, "Syntax error: malformed BEGIN", v2, v3, v4, v5, v6);
}

- (void)parseNextResultUsingResultBuilder:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC18F000, v0, v1, "Syntax error: malformed EOL", v2, v3, v4, v5, v6);
}

- (void)parseNextResultUsingResultBuilder:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC18F000, v0, v1, "Syntax error: malformed space after EOL", v2, v3, v4, v5, v6);
}

- (void)parseNextResultUsingResultBuilder:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC18F000, v0, v1, "Syntax error: malformed VCARD tag", v2, v3, v4, v5, v6);
}

- (void)parseNextResultUsingResultBuilder:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC18F000, v0, v1, "Syntax error: malformed separator", v2, v3, v4, v5, v6);
}

- (void)parseLine
{
}

- (void)parameter_CHARSET:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end