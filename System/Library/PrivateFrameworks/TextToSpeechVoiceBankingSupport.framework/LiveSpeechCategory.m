@interface LiveSpeechCategory
+ (BOOL)renameCategoryWithID:(id)a3 name:(id)a4 error:(id *)a5;
+ (BOOL)updateCategorySymbolWithID:(id)a3 symbol:(id)a4 error:(id *)a5;
+ (NSArray)categories;
+ (id)addCategoryWithName:(id)a3 symbol:(id)a4 error:(id *)a5;
+ (id)categoryForID:(id)a3;
+ (id)makeEmptyCategory;
+ (id)observeChanges:(id)a3;
+ (void)deleteCategory:(id)a3;
+ (void)deleteCategoryWithID:(id)a3;
- (BOOL)addPhrase:(id)a3 inputID:(id)a4 error:(id *)a5;
- (BOOL)deletePhrase:(id)a3 error:(id *)a4;
- (BOOL)isRecents;
- (BOOL)isSaved;
- (LiveSpeechCategory)init;
- (NSString)categoryID;
- (NSString)localizedName;
- (NSString)name;
- (NSString)symbol;
- (id)phrases;
- (void)setCategoryID:(id)a3;
- (void)setName:(id)a3;
- (void)setSymbol:(id)a3;
@end

@implementation LiveSpeechCategory

- (LiveSpeechCategory)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___LiveSpeechCategory_name);
  void *v2 = 0;
  v2[1] = 0xE000000000000000;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___LiveSpeechCategory_symbol);
  void *v3 = 0;
  v3[1] = 0xE000000000000000;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___LiveSpeechCategory_categoryID);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)LiveSpeechCategory;
  return [(LiveSpeechCategory *)&v6 init];
}

- (NSString)categoryID
{
  return (NSString *)sub_25F3B67FC();
}

- (void)setCategoryID:(id)a3
{
}

- (NSString)name
{
  return (NSString *)sub_25F3B67FC();
}

- (void)setName:(id)a3
{
}

- (NSString)symbol
{
  return (NSString *)sub_25F3B67FC();
}

- (void)setSymbol:(id)a3
{
}

- (BOOL)isSaved
{
  v2 = self;
  v3 = [(LiveSpeechCategory *)v2 categoryID];
  uint64_t v4 = sub_25F3F6130();
  uint64_t v6 = v5;

  if (v4 == 0x6465766153 && v6 == 0xE500000000000000)
  {

    swift_bridgeObjectRelease();
    char v8 = 1;
  }
  else
  {
    char v8 = sub_25F3F6B80();

    swift_bridgeObjectRelease();
  }
  return v8 & 1;
}

- (BOOL)isRecents
{
  v2 = self;
  v3 = [(LiveSpeechCategory *)v2 categoryID];
  uint64_t v4 = sub_25F3F6130();
  uint64_t v6 = v5;

  if (v4 == 0x73746E65636552 && v6 == 0xE700000000000000)
  {

    swift_bridgeObjectRelease();
    char v8 = 1;
  }
  else
  {
    char v8 = sub_25F3F6B80();

    swift_bridgeObjectRelease();
  }
  return v8 & 1;
}

- (NSString)localizedName
{
  v2 = self;
  sub_25F3B6ADC();

  v3 = (void *)sub_25F3F6100();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (id)phrases
{
  v2 = self;
  char v3 = [(LiveSpeechCategory *)v2 isSaved];
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_26A79DCD8;
  uint64_t v5 = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE15favoritePhrasesSaySDySSypGGvg_0();

  uint64_t v6 = v2;
  sub_25F3BAE34(v5, v6, v3);
  swift_bridgeObjectRelease();

  type metadata accessor for LiveSpeechPhrase(v7);
  char v8 = (void *)sub_25F3F62E0();
  swift_bridgeObjectRelease();

  return v8;
}

- (BOOL)addPhrase:(id)a3 inputID:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_25F3F6130();
  uint64_t v9 = v8;
  if (a4)
  {
    uint64_t v10 = sub_25F3F6130();
    a4 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  v12 = self;
  sub_25F3B6D68(v7, v9, v10, (uint64_t)a4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)deletePhrase:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_25F3B7DB8(v5);

  return 1;
}

+ (id)makeEmptyCategory
{
  v2 = sub_25F3BB1F0();

  return v2;
}

+ (NSArray)categories
{
  return (NSArray *)sub_25F3B83C0((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_25F3BB2D8, (void (*)(void))type metadata accessor for LiveSpeechCategory);
}

+ (id)categoryForID:(id)a3
{
  uint64_t v3 = sub_25F3F6130();
  id v5 = sub_25F3BB9C0(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)addCategoryWithName:(id)a3 symbol:(id)a4 error:(id *)a5
{
  uint64_t v5 = sub_25F3F6130();
  uint64_t v7 = v6;
  uint64_t v8 = sub_25F3F6130();
  uint64_t v10 = sub_25F3BC004(v5, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v10;
}

+ (void)deleteCategory:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, sel_categoryID);
  if (!v5)
  {
    sub_25F3F6130();
    id v6 = (id)sub_25F3F6100();
    swift_bridgeObjectRelease();
    id v5 = v6;
  }
  id v7 = v5;
  objc_msgSend(a1, sel_deleteCategoryWithID_);
}

+ (void)deleteCategoryWithID:(id)a3
{
  uint64_t v3 = sub_25F3F6130();
  sub_25F3BC308(v3, v4);

  swift_bridgeObjectRelease();
}

+ (BOOL)renameCategoryWithID:(id)a3 name:(id)a4 error:(id *)a5
{
  return sub_25F3B8A08((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, sub_25F3BD0A8);
}

+ (BOOL)updateCategorySymbolWithID:(id)a3 symbol:(id)a4 error:(id *)a5
{
  return sub_25F3B8A08((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25F3BD4F8);
}

+ (id)observeChanges:(id)a3
{
  uint64_t v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  if (qword_26A79DCD0 != -1) {
    swift_once();
  }
  id v5 = (void *)qword_26A79DCD8;
  uint64_t v10 = (void *)qword_26A79DCD8;
  swift_getKeyPath();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_25F3BE138;
  *(void *)(v6 + 24) = v4;
  id v7 = v5;
  swift_retain();
  uint64_t v8 = (void *)sub_25F3F59D0();
  swift_release();
  swift_release();
  swift_release();

  return v8;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end