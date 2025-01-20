@interface UIButton.AssociatedData
- (_TtCE12PhotosUICoreCSo8UIButtonP33_898FD4FBA85815262B053C5EBA9C728014AssociatedData)init;
@end

@implementation UIButton.AssociatedData

- (_TtCE12PhotosUICoreCSo8UIButtonP33_898FD4FBA85815262B053C5EBA9C728014AssociatedData)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtCE12PhotosUICoreCSo8UIButtonP33_898FD4FBA85815262B053C5EBA9C728014AssociatedData_isBadged) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCE12PhotosUICoreCSo8UIButtonP33_898FD4FBA85815262B053C5EBA9C728014AssociatedData_badgeView) = 0;
  v3.receiver = self;
  v3.super_class = (Class)_s14AssociatedDataCMa_4();
  return [(UIButton.AssociatedData *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE12PhotosUICoreCSo8UIButtonP33_898FD4FBA85815262B053C5EBA9C728014AssociatedData_badgeView));
}

@end