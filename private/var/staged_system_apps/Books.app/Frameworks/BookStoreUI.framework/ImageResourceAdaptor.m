@interface ImageResourceAdaptor
- (UIImage)image;
- (_TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor)init;
- (id)load;
- (void)addInterest;
- (void)addNonVolatileInterest;
- (void)addWithObserver:(id)a3;
- (void)dealloc;
- (void)imageResourceDidChangeImage:(id)a3;
- (void)imageResourceDidChangeIntrinsicSize:(id)a3;
- (void)removeInterest;
- (void)removeNonVolatileInterest;
- (void)removeWithObserver:(id)a3;
@end

@implementation ImageResourceAdaptor

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor_resource);
  v3 = self;
  [v2 removeObserver:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for ImageResourceAdaptor();
  [(ImageResourceAdaptor *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor_observers);
}

- (UIImage)image
{
  v2 = self;
  id v3 = sub_19BE2C();

  return (UIImage *)v3;
}

- (id)load
{
  v2 = self;
  id v3 = sub_19BEFC();

  return v3;
}

- (void)addInterest
{
}

- (void)removeInterest
{
}

- (void)addNonVolatileInterest
{
}

- (void)removeNonVolatileInterest
{
}

- (void)addWithObserver:(id)a3
{
}

- (void)removeWithObserver:(id)a3
{
}

- (_TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor)init
{
  result = (_TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)imageResourceDidChangeImage:(id)a3
{
}

- (void)imageResourceDidChangeIntrinsicSize:(id)a3
{
}

@end