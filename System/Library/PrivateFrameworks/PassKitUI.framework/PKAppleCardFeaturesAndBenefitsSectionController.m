@interface PKAppleCardFeaturesAndBenefitsSectionController
- (NSArray)allSectionIdentifiers;
- (NSArray)sectionIdentifiers;
- (PKAppleCardFeaturesAndBenefitsSectionController)init;
- (id)selectionHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)setSelectionHandler:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKAppleCardFeaturesAndBenefitsSectionController

- (id)selectionHandler
{
  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_selectionHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_19FA21DF8;
    aBlock[3] = &block_descriptor_116;
    v4 = _Block_copy(aBlock);
    sub_1A03ADE18();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSelectionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_19FA22A60;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_selectionHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_19F48BB68(v7);
}

- (NSArray)sectionIdentifiers
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B0E70);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1A040E960;
  uint64_t v4 = *(unint64_t *)((char *)&self->super._currentSegment
                           + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_exploreFeaturesAndBenefitsSectionID);
  *(void *)(v3 + 32) = *(Class *)((char *)&self->super.super.isa
                                  + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_exploreFeaturesAndBenefitsSectionID);
  *(void *)(v3 + 40) = v4;
  sub_1A03AE138();
  uint64_t v5 = (void *)sub_1A03B4C38();
  swift_bridgeObjectRelease();

  return (NSArray *)v5;
}

- (NSArray)allSectionIdentifiers
{
  v2 = self;
  uint64_t v3 = [(PKAppleCardFeaturesAndBenefitsSectionController *)v2 sectionIdentifiers];
  sub_1A03B4C58();

  uint64_t v4 = (void *)sub_1A03B4C38();
  swift_bridgeObjectRelease();

  return (NSArray *)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1A03AF498();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AF458();
  id v12 = a3;
  v13 = self;
  id v14 = sub_19FA227AC((uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1A03AF498();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AF458();
  uint64_t v12 = sub_1A03B4988();
  uint64_t v14 = v13;
  id v15 = a3;
  uint64_t v16 = self;
  sub_19FA223EC(v15, (uint64_t)v11, v12, v14);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (PKAppleCardFeaturesAndBenefitsSectionController)init
{
  uint64_t v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_exploreFeaturesAndBenefitsSectionID);
  *uint64_t v3 = 0xD000000000000023;
  v3[1] = 0x80000001A045A570;
  uint64_t v4 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_selectionHandler);
  uint64_t v5 = (objc_class *)type metadata accessor for AppleCardFeaturesAndBenefitsSectionController();
  void *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return [(PKPaymentPassDetailSectionController *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsSectionController_selectionHandler);

  sub_19F48BB68(v3);
}

@end