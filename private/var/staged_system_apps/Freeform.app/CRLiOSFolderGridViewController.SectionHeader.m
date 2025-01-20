@interface CRLiOSFolderGridViewController.SectionHeader
- (_TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader)initWithCoder:(id)a3;
- (_TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader)initWithFrame:(CGRect)a3;
- (void)collapseButtonTapped:(id)a3;
@end

@implementation CRLiOSFolderGridViewController.SectionHeader

- (_TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader)initWithFrame:(CGRect)a3
{
  return (_TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader *)sub_100539FD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10053BEC4();
}

- (void)collapseButtonTapped:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_unknownObjectRetain();
    v4 = self;
    sub_100D79FC8((uint64_t)v4);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  sub_10053BB8C(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_sectionIdentifier), *(id *)&self->sectionIdentifier[OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_sectionIdentifier], *(void *)&self->sectionIdentifier[OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_sectionIdentifier+ 8], self->sectionIdentifier[OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_sectionIdentifier+ 16]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_pinLabelToLeadingEdgeOfCollapseButtonConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_titleLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_collapseButton));
  id v3 = (char *)self + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController13SectionHeader_delegate;

  sub_100523398((uint64_t)v3);
}

@end