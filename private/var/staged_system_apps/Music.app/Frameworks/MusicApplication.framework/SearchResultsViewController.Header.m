@interface SearchResultsViewController.Header
- (_TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header)initWithCoder:(id)a3;
- (_TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SearchResultsViewController.Header

- (_TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header *)sub_38AD78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_38CFC0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_38B400((uint64_t)a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header_buttonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header____lazy_storage___button);
}

@end