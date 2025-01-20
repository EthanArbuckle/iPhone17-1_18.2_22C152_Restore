@interface TTRIMenuButtonAttachment
- (_TtC15RemindersUICore24TTRIMenuButtonAttachment)init;
- (_TtC15RemindersUICore24TTRIMenuButtonAttachment)initWithCoder:(id)a3;
- (_TtC15RemindersUICore24TTRIMenuButtonAttachment)initWithData:(id)a3 ofType:(id)a4;
- (double)lineLayoutPadding;
- (void)setLineLayoutPadding:(double)a3;
@end

@implementation TTRIMenuButtonAttachment

- (_TtC15RemindersUICore24TTRIMenuButtonAttachment)init
{
  swift_beginAccess();
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  v3 = (void *)sub_1B996E9B0();
  swift_bridgeObjectRelease();
  v4 = [(TTRIMenuButtonAttachment *)self initWithData:0 ofType:v3];

  return v4;
}

- (_TtC15RemindersUICore24TTRIMenuButtonAttachment)initWithData:(id)a3 ofType:(id)a4
{
  v5 = a3;
  if (!a3)
  {
    id v13 = a4;
    unint64_t v9 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    return (_TtC15RemindersUICore24TTRIMenuButtonAttachment *)TTRIMenuButtonAttachment.init(data:ofType:)((uint64_t)v5, v9, v10, v12);
  }
  id v6 = a4;
  id v7 = v5;
  v5 = (void *)sub_1B996A5D0();
  unint64_t v9 = v8;

  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = sub_1B996E9F0();
  uint64_t v12 = v11;

  return (_TtC15RemindersUICore24TTRIMenuButtonAttachment *)TTRIMenuButtonAttachment.init(data:ofType:)((uint64_t)v5, v9, v10, v12);
}

- (_TtC15RemindersUICore24TTRIMenuButtonAttachment)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B9118D10();
}

- (double)lineLayoutPadding
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_defaultMetrics);
  id v7 = (Class *)((char *)&v5->super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore24TTRIMenuButtonAttachment_traitCollection);
  swift_beginAccess();
  objc_msgSend(v6, sel_scaledValueForValue_compatibleWithTraitCollection_, *v7, 2.0);
  double v9 = v8;

  v13.receiver = v5;
  v13.super_class = ObjectType;
  [(TTRIMenuButtonAttachment *)&v13 lineLayoutPadding];
  double v11 = v10;

  if (v9 > v11) {
    return v9;
  }
  else {
    return v11;
  }
}

- (void)setLineLayoutPadding:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(TTRIMenuButtonAttachment *)&v4 setLineLayoutPadding:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRIMenuButtonAttachment_traitCollection));

  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC15RemindersUICore24TTRIMenuButtonAttachment_textColor);
}

@end