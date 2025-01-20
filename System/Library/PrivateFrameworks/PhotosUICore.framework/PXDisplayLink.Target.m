@interface PXDisplayLink.Target
- (void)tickWithDisplayLink:(id)a3;
@end

@implementation PXDisplayLink.Target

- (void)tickWithDisplayLink:(id)a3
{
  v3 = *(void (**)(id))self->handler;
  id v4 = a3;
  sub_1AB22F8DC();
  v3(v4);

  swift_release();
}

@end