@interface PGStoryPromptSuggestionQuestion
- (BOOL)isEquivalentToPersistedQuestion:(id)a3;
- (NSDictionary)additionalInfo;
- (NSString)entityIdentifier;
- (PGStoryPromptSuggestionQuestion)init;
- (PGStoryPromptSuggestionQuestion)initWithPromptId:(id)a3 promptText:(id)a4 isValidated:(BOOL)a5 assetCount:(int64_t)a6 mcAvailabilityStatus:(int64_t)a7 localFactoryScore:(double)a8;
- (double)localFactoryScore;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
- (void)setState:(unsigned __int16)a3;
@end

@implementation PGStoryPromptSuggestionQuestion

- (PGStoryPromptSuggestionQuestion)initWithPromptId:(id)a3 promptText:(id)a4 isValidated:(BOOL)a5 assetCount:(int64_t)a6 mcAvailabilityStatus:(int64_t)a7 localFactoryScore:(double)a8
{
  uint64_t v13 = sub_1D1EBDE60();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1D1EBDE60();
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedEntityIdentifier);
  uint64_t *v17 = v13;
  v17[1] = v15;
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedLocalFactoryScore) = a8;
  *(_WORD *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedState) = 0;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___PGStoryPromptSuggestionQuestion_promptText);
  uint64_t *v18 = v16;
  v18[1] = v19;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_isValidated) = a5;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_assetCount) = (Class)a6;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_mcAvailabilityStatus) = (Class)a7;
  v21.receiver = self;
  v21.super_class = (Class)PGStoryPromptSuggestionQuestion;
  return [(PGStoryPromptSuggestionQuestion *)&v21 init];
}

- (NSString)entityIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)localFactoryScore
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedLocalFactoryScore);
}

- (unsigned)state
{
  return *(_WORD *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedState);
}

- (void)setState:(unsigned __int16)a3
{
  *(_WORD *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedState) = a3;
}

- (NSDictionary)additionalInfo
{
  v2 = self;
  PGStoryPromptSuggestionQuestion.additionalInfo.getter();

  v3 = (void *)sub_1D1EBDCC0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (unsigned)type
{
  return 30;
}

- (unsigned)displayType
{
  return 6;
}

- (unsigned)entityType
{
  return 4;
}

- (BOOL)isEquivalentToPersistedQuestion:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = PGStoryPromptSuggestionQuestion.isEquivalent(toPersistedQuestion:)(v4);

  return self & 1;
}

- (PGStoryPromptSuggestionQuestion)init
{
  result = (PGStoryPromptSuggestionQuestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end