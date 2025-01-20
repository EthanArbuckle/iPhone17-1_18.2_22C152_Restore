@interface _SEHostable
+ (id)createHostableWithError:(id *)a3;
+ (id)createHostableWithOptions:(id)a3 error:(id *)a4;
- (CALayer)layer;
- (_SEHostable)init;
- (_SEHostingHandle)handle;
- (void)dealloc;
- (void)invalidate;
- (void)setLayer:(id)a3;
@end

@implementation _SEHostable

- (_SEHostingHandle)handle
{
  return (_SEHostingHandle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____SEHostable_handle));
}

- (CALayer)layer
{
  id v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____SEHostable__context), sel_layer));

  return (CALayer *)v2;
}

- (void)setLayer:(id)a3
{
}

- (_SEHostable)init
{
}

+ (id)createHostableWithError:(id *)a3
{
  v3 = (void *)sub_25C2209DC();

  return v3;
}

+ (id)createHostableWithOptions:(id)a3 error:(id *)a4
{
  sub_25C2219A8();
  v4 = (void *)sub_25C220804();
  swift_bridgeObjectRelease();

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(_SEHostable *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____SEHostable_handle);
}

- (void)invalidate
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____SEHostable__invalidationSignal);
  objc_super v3 = self;
  if (objc_msgSend(v2, sel_signal)) {
    objc_msgSend(*(id *)((char *)&v3->super.isa + OBJC_IVAR____SEHostable__context), sel_invalidate);
  }
}

@end