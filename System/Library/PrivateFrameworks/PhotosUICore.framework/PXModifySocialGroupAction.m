@interface PXModifySocialGroupAction
- (NSString)actionIdentifier;
- (NSString)localizedActionName;
- (PXModifySocialGroupAction)initWithOriginalSocialGroup:(id)a3 newKeyAsset:(id)a4 newCustomTitle:(id)a5 customTitleWasDeleted:(BOOL)a6 peopleToBeAdded:(id)a7 peopleToBeRemoved:(id)a8;
- (PXModifySocialGroupAction)initWithPhotoLibrary:(id)a3;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXModifySocialGroupAction

- (NSString)actionIdentifier
{
  v2 = self;
  sub_1AA630918();
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
}

- (NSString)localizedActionName
{
  return (NSString *)0;
}

- (PXModifySocialGroupAction)initWithOriginalSocialGroup:(id)a3 newKeyAsset:(id)a4 newCustomTitle:(id)a5 customTitleWasDeleted:(BOOL)a6 peopleToBeAdded:(id)a7 peopleToBeRemoved:(id)a8
{
  uint64_t v9 = (uint64_t)a7;
  if (a5)
  {
    uint64_t v13 = sub_1AB23A76C();
    uint64_t v15 = v14;
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
  if (a7)
  {
LABEL_3:
    sub_1A9B21070(0, (unint64_t *)&qword_1E981B820);
    uint64_t v9 = sub_1AB23AADC();
  }
LABEL_4:
  if (a8)
  {
    sub_1A9B21070(0, (unint64_t *)&qword_1E981B820);
    a8 = (id)sub_1AB23AADC();
  }
  id v16 = a3;
  id v17 = a4;
  return (PXModifySocialGroupAction *)sub_1AA279410(v16, a4, v13, v15, a6, v9, (uint64_t)a8);
}

- (void)performAction:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1AA279CF8((uint64_t)sub_1A9F4ADE0, v5, (uint64_t)&unk_1F007F4D8, (uint64_t)sub_1AA2796B8, (uint64_t)&block_descriptor_147, (uint64_t)&block_descriptor_6_3);

  swift_release();
}

- (void)performUndo:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1AA279CF8((uint64_t)sub_1A9D5E1DC, v5, (uint64_t)&unk_1F007F550, (uint64_t)sub_1AA279E6C, (uint64_t)&block_descriptor_13_6, (uint64_t)&block_descriptor_16_5);

  swift_release();
}

- (PXModifySocialGroupAction)initWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  result = (PXModifySocialGroupAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXModifySocialGroupAction_originalKeyAsset);
}

@end