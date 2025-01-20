@interface PXMapKitSuggester
- (_TtC12PhotosUICore17PXMapKitSuggester)init;
- (void)completer:(id)a3 didFailWithError:(id)a4;
- (void)completerDidUpdateResults:(id)a3;
@end

@implementation PXMapKitSuggester

- (_TtC12PhotosUICore17PXMapKitSuggester)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester____lazy_storage___searchCompleter) = 0;
  v2 = (_OWORD *)((char *)self + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_input);
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_completion);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (MKCoordinateRegion *)((char *)self + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_coordinateRegion);
  double v5 = *MEMORY[0x1E4F30DA0];
  double v6 = *(double *)(MEMORY[0x1E4F30DA0] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F30DA0] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F30DA0] + 24);
  v9 = self;
  v12.origin.x = v5;
  v12.origin.y = v6;
  v12.size.width = v7;
  v12.size.height = v8;
  MKCoordinateRegion *v4 = MKCoordinateRegionForMapRect(v12);

  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for PXMapKitSuggester();
  return [(PXMapKitSuggester *)&v11 init];
}

- (void)completerDidUpdateResults:(id)a3
{
  id v4 = a3;
  self;
  sub_1A9DB14BC(v4);
}

- (void)completer:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  double v7 = self;
  sub_1A9DB1F98();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester____lazy_storage___searchCompleter));
  sub_1A9B09990(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_input), *(void *)&self->$__lazy_storage_$_searchCompleter[OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_input]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore17PXMapKitSuggester_completion);
  sub_1A9BB8934(v3);
}

@end