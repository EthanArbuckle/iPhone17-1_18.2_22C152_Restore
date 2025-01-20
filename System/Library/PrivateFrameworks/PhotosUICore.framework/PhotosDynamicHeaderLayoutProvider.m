@interface PhotosDynamicHeaderLayoutProvider
- (_TtC12PhotosUICore33PhotosDynamicHeaderLayoutProvider)init;
- (id)createGlobalHeaderLayoutForPhotosViewModel:(id)a3 dataSource:(id)a4 spec:(id)a5;
- (void)configureGlobalHeaderLayout:(id)a3 dataSource:(id)a4 spec:(id)a5;
@end

@implementation PhotosDynamicHeaderLayoutProvider

- (id)createGlobalHeaderLayoutForPhotosViewModel:(id)a3 dataSource:(id)a4 spec:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1AA39AA80(v8, (uint64_t)v9, v10);
}

- (void)configureGlobalHeaderLayout:(id)a3 dataSource:(id)a4 spec:(id)a5
{
  type metadata accessor for PhotosDynamicHeaderLayout();
  id v9 = (void *)swift_dynamicCastClass();
  if (v9)
  {
    id v10 = v9;
    v11 = (void *)MEMORY[0x1E4FBC8C8];
    v12 = *(void (**)(id))((*v9 & *MEMORY[0x1E4FBC8C8]) + 0xC8);
    id v13 = a4;
    id v14 = a3;
    id v15 = a5;
    v18 = self;
    v12(a4);
    v16 = *(void (**)(void))((*v11 & *v10) + 0xE0);
    id v17 = v15;
    v16();
  }
}

- (_TtC12PhotosUICore33PhotosDynamicHeaderLayoutProvider)init
{
  result = (_TtC12PhotosUICore33PhotosDynamicHeaderLayoutProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end