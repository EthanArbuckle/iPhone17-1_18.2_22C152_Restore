@interface GMHeaderIconProvider
- (_TtC14VoiceTriggerUI20GMHeaderIconProvider)init;
- (id)imageViewWithLabelWithLabelFontSize:(double)a3 labelBackgroundColor:(id)a4 labelForegroundColor:(id)a5;
@end

@implementation GMHeaderIconProvider

- (_TtC14VoiceTriggerUI20GMHeaderIconProvider)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14VoiceTriggerUI20GMHeaderIconProvider_gmIconID);
  void *v2 = 0xD00000000000002DLL;
  v2[1] = 0x80000002388EC920;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GMHeaderIconProvider();
  return [(GMHeaderIconProvider *)&v4 init];
}

- (id)imageViewWithLabelWithLabelFontSize:(double)a3 labelBackgroundColor:(id)a4 labelForegroundColor:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  v11 = (void *)sub_2388BEBC0((uint64_t)v8, v9, a3);

  return v11;
}

- (void).cxx_destruct
{
}

@end