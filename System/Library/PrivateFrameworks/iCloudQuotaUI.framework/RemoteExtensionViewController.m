@interface RemoteExtensionViewController
- (_TtC13iCloudQuotaUI29RemoteExtensionViewController)initWithCoder:(id)a3;
- (_TtC13iCloudQuotaUI29RemoteExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation RemoteExtensionViewController

- (void)loadView
{
  v2 = self;
  sub_22C8ED1A0();
}

- (_TtC13iCloudQuotaUI29RemoteExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_22C9A36C8();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC13iCloudQuotaUI29RemoteExtensionViewController____lazy_storage___contentViewController) = 0;
    id v6 = a4;
    v7 = (void *)sub_22C9A3688();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC13iCloudQuotaUI29RemoteExtensionViewController____lazy_storage___contentViewController) = 0;
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RemoteExtensionViewController();
  v9 = [(RemoteExtensionViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC13iCloudQuotaUI29RemoteExtensionViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13iCloudQuotaUI29RemoteExtensionViewController____lazy_storage___contentViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RemoteExtensionViewController();
  return [(RemoteExtensionViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI29RemoteExtensionViewController____lazy_storage___contentViewController));
}

@end