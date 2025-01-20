@interface BEBookViewModel
- (BEBookViewModel)init;
- (BEBookViewModel)initWithBook:(id)a3;
- (BOOL)sample;
- (NSArray)authors;
- (NSArray)paginatableDocuments;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)documentUniqueID;
- (NSString)path;
- (NSString)title;
- (id)documentFor:(int64_t)a3;
- (int64_t)collection_type;
- (void)setDocumentUniqueID:(id)a3;
- (void)setPaginatableDocuments:(id)a3;
- (void)setSample:(BOOL)a3;
@end

@implementation BEBookViewModel

- (NSString)documentUniqueID
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_139250();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setDocumentUniqueID:(id)a3
{
  uint64_t v4 = sub_139260();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BEBookViewModel_documentUniqueID);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)title
{
  return (NSString *)sub_126014();
}

- (NSString)path
{
  return (NSString *)sub_126014();
}

- (NSArray)authors
{
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1392E0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (int64_t)collection_type
{
  return 0;
}

- (BOOL)sample
{
  NSArray v2 = (BOOL *)self + OBJC_IVAR___BEBookViewModel_sample;
  swift_beginAccess();
  return *v2;
}

- (void)setSample:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___BEBookViewModel_sample;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BEBookViewModel)initWithBook:(id)a3
{
  return (BEBookViewModel *)BookViewModel.init(book:)(a3);
}

- (id)documentFor:(int64_t)a3
{
  uint64_t v4 = self;
  uint64_t v5 = sub_126A30((id)a3);

  return v5;
}

- (NSArray)paginatableDocuments
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1391A0();
  swift_release();
  swift_release();

  sub_11EC74(&qword_22B1D0);
  v4.super.isa = sub_1392E0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setPaginatableDocuments:(id)a3
{
  sub_11EC74(&qword_22B1D0);
  sub_1392F0();
  swift_getKeyPath();
  swift_getKeyPath();
  NSArray v4 = self;
  sub_1391B0();
}

- (BEBookViewModel)init
{
  result = (BEBookViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___BEBookViewModel__paginatableDocuments;
  uint64_t v4 = sub_11EC74(&qword_22B1E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___BEBookViewModel__pageTotal;
  uint64_t v6 = sub_11EC74(&qword_22B1B0);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (NSString)description
{
  return (NSString *)sub_127C9C(self, (uint64_t)a2, (void (*)(void))BookViewModel.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_127C9C(self, (uint64_t)a2, (void (*)(void))BookViewModel.debugDescription.getter);
}

@end