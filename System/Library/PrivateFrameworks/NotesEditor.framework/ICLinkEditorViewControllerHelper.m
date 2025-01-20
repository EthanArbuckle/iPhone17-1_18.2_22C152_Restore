@interface ICLinkEditorViewControllerHelper
+ (id)presentFromViewController:(id)a3 delegate:(id)a4 text:(id)a5 url:(id)a6 attachment:(id)a7 stringSelection:(id)a8 range:(_NSRange)a9 addApproach:(int64_t)a10;
- (ICLinkEditorViewControllerHelper)init;
@end

@implementation ICLinkEditorViewControllerHelper

+ (id)presentFromViewController:(id)a3 delegate:(id)a4 text:(id)a5 url:(id)a6 attachment:(id)a7 stringSelection:(id)a8 range:(_NSRange)a9 addApproach:(int64_t)a10
{
  NSUInteger location = a9.location;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD808A0);
  MEMORY[0x270FA5388](v16 - 8);
  v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    uint64_t v19 = sub_20C162AC0();
    a5 = v20;
    if (a6)
    {
LABEL_3:
      sub_20C15F580();
      uint64_t v21 = sub_20C15F5D0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 0, 1, v21);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = sub_20C15F5D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v18, 1, 1, v22);
LABEL_6:
  id v23 = a3;
  swift_unknownObjectRetain();
  id v24 = a7;
  id v25 = a8;
  v26 = (void *)sub_20C13C004(v23, (char *)a4, v19, (uint64_t)a5, (uint64_t)v18, a7, v25, location, a9.length, a10);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_20C0019A4((uint64_t)v18);

  return v26;
}

- (ICLinkEditorViewControllerHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LinkEditorViewControllerHelper();
  return [(ICLinkEditorViewControllerHelper *)&v3 init];
}

@end