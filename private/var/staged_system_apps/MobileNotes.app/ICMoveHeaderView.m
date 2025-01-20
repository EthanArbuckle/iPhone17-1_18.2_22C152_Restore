@interface ICMoveHeaderView
+ (double)absoluteHeight;
- (ICMoveHeaderView)initWithCoder:(id)a3;
- (ICMoveHeaderView)initWithFrame:(CGRect)a3;
- (NSArray)objectIds;
- (NSManagedObjectContext)htmlContext;
- (NSManagedObjectContext)modernContext;
- (NSString)reuseIdentifier;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)setHtmlContext:(id)a3;
- (void)setModernContext:(id)a3;
- (void)setObjectIds:(id)a3;
- (void)updateUIForCurrentTraitCollection;
@end

@implementation ICMoveHeaderView

- (ICMoveHeaderView)initWithFrame:(CGRect)a3
{
  return (ICMoveHeaderView *)sub_100371970(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICMoveHeaderView)initWithCoder:(id)a3
{
  return (ICMoveHeaderView *)sub_100371DA8(a3);
}

- (void)updateUIForCurrentTraitCollection
{
  v2 = self;
  sub_100371F0C();
}

+ (double)absoluteHeight
{
  if (qword_10069AF18 != -1) {
    swift_once();
  }
  return *(double *)&qword_1006CDF80;
}

- (NSString)reuseIdentifier
{
  swift_getObjectType();
  sub_10002F214(&qword_1006A4638);
  String.init<A>(describing:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_10002F214(&qword_1006A38E0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for UIBackgroundConfiguration();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UICellConfigurationState();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = self;
  static UIBackgroundConfiguration.clear()();
  [(ICMoveHeaderView *)v15 directionalLayoutMargins];
  [(ICMoveHeaderView *)v15 directionalLayoutMargins];
  UIBackgroundConfiguration.backgroundInsets.setter();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  UICollectionViewCell.backgroundConfiguration.setter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (NSManagedObjectContext)modernContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                           + OBJC_IVAR___ICMoveHeaderView_modernContext));
}

- (void)setModernContext:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_100373ABC(a3, &OBJC_IVAR___ICMoveHeaderView_modernContext, &OBJC_IVAR___ICMovePreviewView_modernContext);
}

- (NSManagedObjectContext)htmlContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                           + OBJC_IVAR___ICMoveHeaderView_htmlContext));
}

- (void)setHtmlContext:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_100373ABC(a3, &OBJC_IVAR___ICMoveHeaderView_htmlContext, &OBJC_IVAR___ICMovePreviewView_htmlContext);
}

- (NSArray)objectIds
{
  sub_100031418(0, (unint64_t *)&qword_10069E810);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setObjectIds:(id)a3
{
  sub_100031418(0, (unint64_t *)&qword_10069E810);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICMoveHeaderView_objectIds) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = self;
  swift_bridgeObjectRelease();
  sub_100372B7C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView____lazy_storage___previewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView____lazy_storage___textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView_modernContext));

  swift_bridgeObjectRelease();
}

@end