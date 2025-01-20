@interface ImageElement
- (_TtC8RemoteUI12ImageElement)init;
- (_TtC8RemoteUI12ImageElement)initWithAttributes:(id)a3 parent:(id)a4;
- (id)sourceURL;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setTintColor:(id)a3;
@end

@implementation ImageElement

- (void)setImage:(id)a3
{
  v5 = *(void (**)(id))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0x78);
  id v6 = a3;
  v7 = self;
  v5(a3);
}

- (void)setImageSize:(CGSize)a3
{
  CGFloat width = a3.width;
  CGFloat height = a3.height;
  v5 = *(void (**)(void, void, void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0xA8);
  id v6 = self;
  v5(*(void *)&width, *(void *)&height, 0);
}

- (void)setTintColor:(id)a3
{
  v5 = *(void (**)(id))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0xD8);
  id v6 = a3;
  v7 = self;
  v5(a3);
}

- (id)sourceURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780DEF0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0x100);
  v7 = self;
  v6();

  uint64_t v8 = sub_2146020B8();
  uint64_t v9 = *(void *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    v10 = (void *)sub_214602038();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return v10;
}

- (_TtC8RemoteUI12ImageElement)initWithAttributes:(id)a3 parent:(id)a4
{
  id v4 = a4;
  result = (_TtC8RemoteUI12ImageElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8RemoteUI12ImageElement)init
{
  result = (_TtC8RemoteUI12ImageElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8RemoteUI12ImageElement__image;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED38);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8RemoteUI12ImageElement__imageSize;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED48);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8RemoteUI12ImageElement__tintColor;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED60);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = (char *)self + OBJC_IVAR____TtC8RemoteUI12ImageElement_baseURL;
  sub_21456AF24((uint64_t)v9);
}

@end