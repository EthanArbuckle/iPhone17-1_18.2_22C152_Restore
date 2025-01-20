@interface TranslationCard
- (BOOL)_axCanPerformLookupAction;
- (BOOL)_axTranslationIsFavorited;
- (_TtC17SequoiaTranslator15TranslationCard)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator15TranslationCard)initWithFrame:(CGRect)a3;
- (id)_axSenseHeader;
- (id)_axSourceLanguage;
- (id)_axSourceLanguageTranslationResult;
- (id)_axSourceLocale;
- (id)_axTargetLanguage;
- (id)_axTargetLanguageTranslationResult;
- (id)_axTargetLocale;
- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5;
- (void)_axPerformFavoriteAction;
- (void)_axPerformLookupAction;
- (void)_axPerformSpeakTranslationAction;
- (void)disambiguableResult:(id)a3 didChangeResultForSentence:(id)a4 withSelection:(id)a5;
- (void)layoutSubviews;
- (void)senseTapped:(id)a3;
- (void)sourceTapped:(id)a3;
- (void)targetTapped:(id)a3;
@end

@implementation TranslationCard

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = (void *)sub_1002080EC((uint64_t)v9);

  return v12;
}

- (void)disambiguableResult:(id)a3 didChangeResultForSentence:(id)a4 withSelection:(id)a5
{
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_cachedTranslation);
  if (v5)
  {
    id v9 = a3;
    id v10 = a4;
    id v11 = a5;
    v12 = self;
    id v13 = v5;
    sub_1001FFD78(v13);
  }
}

- (_TtC17SequoiaTranslator15TranslationCard)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator15TranslationCard *)sub_100209EE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10020A3E8();
}

- (_TtC17SequoiaTranslator15TranslationCard)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10020D5DC();
}

- (void)sourceTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10020C50C(v4);
}

- (void)targetTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10020C668((uint64_t)v4);
}

- (void)senseTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10020C7AC(v4);
}

- (id)_axSourceLanguage
{
  return sub_10020CAE8(self, (uint64_t)a2, (uint64_t (*)(void))sub_100208888);
}

- (id)_axTargetLanguage
{
  return sub_10020CAE8(self, (uint64_t)a2, (uint64_t (*)(void))sub_100209068);
}

- (id)_axSourceLanguageTranslationResult
{
  sub_10020CBC8(self, (uint64_t)a2, (uint64_t (*)(void))sub_100208CFC);
  return result;
}

- (id)_axTargetLanguageTranslationResult
{
  sub_10020CBC8(self, (uint64_t)a2, (uint64_t (*)(void))sub_100209288);
  return result;
}

- (BOOL)_axTranslationIsFavorited
{
  v2 = self;
  id v3 = sub_1000270A8();
  unsigned __int8 v4 = [(objc_class *)v3 isSelected];

  return v4;
}

- (void)_axPerformFavoriteAction
{
}

- (BOOL)_axCanPerformLookupAction
{
  v2 = self;
  id v3 = sub_1000272B4();
  unsigned __int8 v4 = [(objc_class *)v3 isHidden];

  return v4 ^ 1;
}

- (void)_axPerformLookupAction
{
}

- (void)_axPerformSpeakTranslationAction
{
}

- (id)_axSenseHeader
{
  v2 = self;
  id v3 = sub_100209890();

  return v3;
}

- (id)_axSourceLocale
{
  return sub_10020D04C(self, (uint64_t)a2, (void (*)(void))sub_10020CE34);
}

- (id)_axTargetLocale
{
  return sub_10020D04C(self, (uint64_t)a2, (void (*)(void))sub_10020CE58);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___languageOneLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___separatorWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___sourceView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___languageTwoLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___targetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___hintView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___senseHeader));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___senseRowsStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___favoritedImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___spacer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_favoriteObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_selectedAlternativeObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_ttsPlaybackRateObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_cachedDisambiguableResult));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_cachedTranslation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_alternativesBehaviour));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_expandedFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_collapsedFontBold));
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_sourceLocale, (uint64_t *)&unk_1002F4110);
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_targetLocale, (uint64_t *)&unk_1002F4110);
}

@end