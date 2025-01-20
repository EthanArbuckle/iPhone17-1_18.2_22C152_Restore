@interface CRLSEiOSViewController
- (_TtC24FreeformSharingExtension22CRLSEiOSViewController)initWithCoder:(id)a3;
- (_TtC24FreeformSharingExtension22CRLSEiOSViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CRLSEiOSViewController

- (_TtC24FreeformSharingExtension22CRLSEiOSViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10005C810();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC24FreeformSharingExtension22CRLSEiOSViewController *)sub_10002E648(v5, v7, a4);
}

- (_TtC24FreeformSharingExtension22CRLSEiOSViewController)initWithCoder:(id)a3
{
  return (_TtC24FreeformSharingExtension22CRLSEiOSViewController *)sub_10002E7C0(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10002E8E0();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLSEiOSViewController();
  id v4 = v7.receiver;
  [(CRLSEiOSViewController *)&v7 viewWillAppear:v3];
  if (qword_10007C6D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v5 = (id)static OS_os_log.crlSharingExtension;
  uint64_t v6 = sub_10005C9B0();
  sub_100050FE0((uint64_t)v5, (uint64_t)&_mh_execute_header, v6, (uint64_t)"Sharing Extension view controller viewWillAppear", 48, 2, (uint64_t)_swiftEmptyArrayStorage);
}

@end