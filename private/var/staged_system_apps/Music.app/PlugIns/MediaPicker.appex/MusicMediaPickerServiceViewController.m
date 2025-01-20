@interface MusicMediaPickerServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (MusicMediaPickerServiceViewController)initWithCoder:(id)a3;
- (MusicMediaPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)mediaPickerNavigationControllerDidCancel:(id)a3;
- (void)updateWithConfiguration:(id)a3;
- (void)viewDidLoad;
@end

@implementation MusicMediaPickerServiceViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10000414C();
}

- (void)mediaPickerNavigationControllerDidCancel:(id)a3
{
  id v4 = a3;
  v6 = self;
  v5 = (void *)sub_1000048F4();
  if (v5)
  {
    [v5 remoteMediaPickerDidCancel];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)updateWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000049B0();
}

+ (id)_remoteViewControllerInterface
{
  return sub_100004C74((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_clientInterface);
}

+ (id)_exportedInterface
{
  return sub_100004C74((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_serviceInterface);
}

- (MusicMediaPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100006A80();
    swift_unknownObjectWeakInit();
    id v6 = a4;
    NSString v7 = sub_100006A70();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectWeakInit();
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MusicMediaPickerServiceViewController();
  v9 = [(MusicMediaPickerServiceViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (MusicMediaPickerServiceViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MusicMediaPickerServiceViewController();
  return [(MusicMediaPickerServiceViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end