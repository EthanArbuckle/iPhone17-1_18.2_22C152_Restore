@interface CRLSelectionViewController_i
- (void)didEndZoomingOperation;
- (void)willBeginZoomingOperation;
@end

@implementation CRLSelectionViewController_i

- (void)willBeginZoomingOperation
{
  v2 = self;
  sub_100A37E28();
}

- (void)didEndZoomingOperation
{
  v2 = self;
  sub_100A37C84();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLSelectionViewController_i_textSelectionInteraction));
}

@end