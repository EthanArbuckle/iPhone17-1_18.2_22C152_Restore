@interface ICMovePreviewView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (ICMovePreviewView)initWithCoder:(id)a3;
- (ICMovePreviewView)initWithFrame:(CGRect)a3;
- (NSArray)objectIds;
- (NSManagedObjectContext)htmlContext;
- (NSManagedObjectContext)modernContext;
- (void)reloadImages;
- (void)setHtmlContext:(id)a3;
- (void)setModernContext:(id)a3;
- (void)setObjectIds:(id)a3;
@end

@implementation ICMovePreviewView

- (ICMovePreviewView)initWithFrame:(CGRect)a3
{
  return (ICMovePreviewView *)sub_10020907C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICMovePreviewView)initWithCoder:(id)a3
{
  return (ICMovePreviewView *)sub_100209450(a3);
}

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_size);
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_size);
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSManagedObjectContext)modernContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                           + OBJC_IVAR___ICMovePreviewView_modernContext));
}

- (void)setModernContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_modernContext);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_modernContext) = (Class)a3;
  id v3 = a3;
}

- (NSManagedObjectContext)htmlContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                           + OBJC_IVAR___ICMovePreviewView_htmlContext));
}

- (void)setHtmlContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_htmlContext);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_htmlContext) = (Class)a3;
  id v3 = a3;
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
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_objectIds) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = self;
  swift_bridgeObjectRelease();
  sub_100209D48();
}

- (void)reloadImages
{
  NSArray v2 = self;
  sub_100209D48();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end