@interface LiveSpeechPhrase
+ (BOOL)updatePhrase:(id)a3 categoryID:(id)a4 withUpdatedText:(id)a5 error:(id *)a6;
+ (BOOL)updatePhrase:(id)a3 fromCategory:(id)a4 toCategory:(id)a5 error:(id *)a6;
+ (NSArray)phrases;
+ (id)makeEmptyPhrase;
+ (id)observeChanges:(id)a3;
+ (int64_t)maxPreferredPhraseCount;
+ (void)setMaxPreferredPhraseCount:(int64_t)a3;
- (LiveSpeechPhrase)init;
- (NSDate)creationDate;
- (NSString)categoryID;
- (NSString)inputID;
- (NSString)text;
- (void)setCategoryID:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setInputID:(id)a3;
- (void)setText:(id)a3;
@end

@implementation LiveSpeechPhrase

- (LiveSpeechPhrase)init
{
  return (LiveSpeechPhrase *)sub_25F3B4430();
}

- (NSString)text
{
  return (NSString *)sub_25F3B67FC();
}

- (void)setText:(id)a3
{
}

- (NSString)categoryID
{
  return (NSString *)sub_25F3B4BB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___LiveSpeechPhrase_categoryID);
}

- (void)setCategoryID:(id)a3
{
}

- (NSString)inputID
{
  return (NSString *)sub_25F3B4BB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___LiveSpeechPhrase_inputID);
}

- (void)setInputID:(id)a3
{
}

- (NSDate)creationDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_25F3B4DE4((uint64_t)v5);

  uint64_t v7 = sub_25F3F5CC0();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_25F3F5C40();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSDate *)v9;
}

- (void)setCreationDate:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_25F3F5C80();
    uint64_t v8 = sub_25F3F5CC0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_25F3F5CC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_25F3B5008((uint64_t)v7);
}

+ (id)makeEmptyPhrase
{
  type metadata accessor for LiveSpeechPhrase((uint64_t)a1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B398898);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F3F5CC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = sub_25F3B4538(0, 0xE000000000000000, 0, 0, 0, 0, (uint64_t)v4);

  return v6;
}

+ (BOOL)updatePhrase:(id)a3 categoryID:(id)a4 withUpdatedText:(id)a5 error:(id *)a6
{
  return sub_25F3B5B68((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, sub_25F3BA508);
}

+ (BOOL)updatePhrase:(id)a3 fromCategory:(id)a4 toCategory:(id)a5 error:(id *)a6
{
  return sub_25F3B5B68((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, sub_25F3BA870);
}

+ (NSArray)phrases
{
  return (NSArray *)sub_25F3B83C0((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_25F3BAC98, (void (*)(void))type metadata accessor for LiveSpeechPhrase);
}

+ (id)observeChanges:(id)a3
{
  uint64_t v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_26A79DCD8;
  v10 = (void *)qword_26A79DCD8;
  swift_getKeyPath();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_25F3BE2E0;
  *(void *)(v6 + 24) = v4;
  id v7 = v5;
  swift_retain();
  uint64_t v8 = (void *)sub_25F3F59D0();
  swift_release();
  swift_release();
  swift_release();

  return v8;
}

+ (int64_t)maxPreferredPhraseCount
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_26A79DCD8;
  uint64_t v3 = (void *)sub_25F3F6100();
  id v4 = objc_msgSend(v2, sel_integerForKey_, v3);

  return (int64_t)v4;
}

+ (void)setMaxPreferredPhraseCount:(int64_t)a3
{
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v3 = (id)qword_26A79DCD8;
  id v4 = (void *)sub_25F3F6430();
  id v5 = (id)sub_25F3F6100();
  objc_msgSend(v3, sel_setValue_forKey_, v4, v5);
}

- (void).cxx_destruct
{
}

@end