@interface UIObjectCompat
- (NSArray)children;
- (NSString)description;
- (NSUUID)id;
- (UIObjectCompat)init;
- (UIObjectCompat)initWithDetection:(id)a3 clickable:(id)a4 focused:(id)a5 icon:(id)a6 boundingBox:(id)a7 children:(id)a8;
- (UIObjectCompat)initWithLabel:(int64_t)a3 confidence:(double)a4 text:(id)a5 boundingBox:(id)a6 children:(id)a7 clickable:(BOOL)a8 focused:(BOOL)a9;
- (_TtC15UIUnderstanding11BoundingBox)boundingBox;
- (_TtC15UIUnderstanding11UIDetection)detection;
- (_TtC15UIUnderstanding13IconDetection)iconDetection;
- (_TtC15UIUnderstanding14FocusDetection)focusDetection;
- (_TtC15UIUnderstanding21ClickabilityDetection)clickDetection;
- (void)setBoundingBox:(id)a3;
- (void)setChildren:(id)a3;
- (void)setClickDetection:(id)a3;
- (void)setDetection:(id)a3;
- (void)setFocusDetection:(id)a3;
- (void)setIconDetection:(id)a3;
- (void)setId:(id)a3;
@end

@implementation UIObjectCompat

- (NSUUID)id
{
  uint64_t v3 = sub_260655498();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___UIObjectCompat_id;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_260655468();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSUUID *)v8;
}

- (void)setId:(id)a3
{
  uint64_t v4 = sub_260655498();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260655478();
  v8 = (char *)self + OBJC_IVAR___UIObjectCompat_id;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (_TtC15UIUnderstanding11UIDetection)detection
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___UIObjectCompat_detection);
  swift_beginAccess();
  return (_TtC15UIUnderstanding11UIDetection *)*v2;
}

- (void)setDetection:(id)a3
{
}

- (_TtC15UIUnderstanding11BoundingBox)boundingBox
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___UIObjectCompat_boundingBox);
  swift_beginAccess();
  return (_TtC15UIUnderstanding11BoundingBox *)*v2;
}

- (void)setBoundingBox:(id)a3
{
}

- (_TtC15UIUnderstanding13IconDetection)iconDetection
{
  return (_TtC15UIUnderstanding13IconDetection *)sub_2606193A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___UIObjectCompat_iconDetection);
}

- (void)setIconDetection:(id)a3
{
}

- (NSArray)children
{
  swift_beginAccess();
  type metadata accessor for UIObject();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_260655928();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setChildren:(id)a3
{
  type metadata accessor for UIObject();
  uint64_t v4 = sub_260655938();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___UIObjectCompat_children);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC15UIUnderstanding21ClickabilityDetection)clickDetection
{
  return (_TtC15UIUnderstanding21ClickabilityDetection *)sub_2606193A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___UIObjectCompat_clickDetection);
}

- (void)setClickDetection:(id)a3
{
}

- (_TtC15UIUnderstanding14FocusDetection)focusDetection
{
  return (_TtC15UIUnderstanding14FocusDetection *)sub_2606193A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___UIObjectCompat_focusDetection);
}

- (void)setFocusDetection:(id)a3
{
}

- (UIObjectCompat)initWithDetection:(id)a3 clickable:(id)a4 focused:(id)a5 icon:(id)a6 boundingBox:(id)a7 children:(id)a8
{
  type metadata accessor for UIObject();
  uint64_t v13 = sub_260655938();
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = (UIObjectCompat *)sub_26061CECC(v14, a4, a5, a6, v18, v13);

  return v19;
}

- (UIObjectCompat)initWithLabel:(int64_t)a3 confidence:(double)a4 text:(id)a5 boundingBox:(id)a6 children:(id)a7 clickable:(BOOL)a8 focused:(BOOL)a9
{
  if (a5)
  {
    uint64_t v14 = sub_2606557B8();
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
  }
  type metadata accessor for UIObject();
  uint64_t v17 = sub_260655938();
  return (UIObjectCompat *)UIObject.init(label:confidence:text:boundingBox:children:clickable:focused:)(a3, v14, v16, a6, a4, v17, a8, a9);
}

- (NSString)description
{
  v2 = self;
  sub_26061AC50();

  uint64_t v3 = (void *)sub_260655788();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (UIObjectCompat)init
{
  result = (UIObjectCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___UIObjectCompat_id;
  uint64_t v4 = sub_260655498();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___UIObjectCompat_focusDetection);
}

@end