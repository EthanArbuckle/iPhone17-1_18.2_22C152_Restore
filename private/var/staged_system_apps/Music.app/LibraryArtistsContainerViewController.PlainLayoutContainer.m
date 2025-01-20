@interface LibraryArtistsContainerViewController.PlainLayoutContainer
- (UINavigationItem)navigationItem;
- (_TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer)init;
- (_TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer)initWithCoder:(id)a3;
- (_TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation LibraryArtistsContainerViewController.PlainLayoutContainer

- (_TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_artistListViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_navigatedArtistDetailViewController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LibraryArtistsContainerViewController.PlainLayoutContainer();
  return [(LibraryArtistsContainerViewController.PlainLayoutContainer *)&v3 initWithNibName:0 bundle:0];
}

- (_TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_artistListViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_navigatedArtistDetailViewController) = 0;
  id v4 = a3;

  result = (_TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (UINavigationItem)navigationItem
{
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_artistListViewController);
  if (v3)
  {
    id v4 = self;
    v5 = (UINavigationItem *)[v3 navigationItem];
    if (v5)
    {
      v6 = v5;

      goto LABEL_6;
    }
  }
  else
  {
    v7 = self;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for LibraryArtistsContainerViewController.PlainLayoutContainer();
  v6 = [(LibraryArtistsContainerViewController.PlainLayoutContainer *)&v9 navigationItem];

LABEL_6:

  return v6;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003DD4EC();
}

- (_TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_artistListViewController));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC5Music37LibraryArtistsContainerViewControllerP33_CE2A41BFB64A7DDBA59CF94A5FD1A01F20PlainLayoutContainer_navigatedArtistDetailViewController);
}

@end