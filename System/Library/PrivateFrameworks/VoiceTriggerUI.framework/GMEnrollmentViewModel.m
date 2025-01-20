@interface GMEnrollmentViewModel
- (_TtC14VoiceTriggerUI21GMEnrollmentViewModel)init;
- (_TtC14VoiceTriggerUI21GMEnrollmentViewModel)initWithPrelude:(id)a3 instruction:(id)a4 continuation:(id)a5;
- (void)setContinuationLabel:(id)a3;
- (void)setContinuationLabelHidden:(BOOL)a3;
- (void)setIntructionLabel:(id)a3;
- (void)setIntructionLabelHidden:(BOOL)a3;
- (void)setPreludeLabel:(id)a3;
- (void)setPreludeLabelHidden:(BOOL)a3;
@end

@implementation GMEnrollmentViewModel

- (_TtC14VoiceTriggerUI21GMEnrollmentViewModel)initWithPrelude:(id)a3 instruction:(id)a4 continuation:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (_TtC14VoiceTriggerUI21GMEnrollmentViewModel *)sub_2388DF150(v7, v8, v9);

  return v10;
}

- (void)setIntructionLabel:(id)a3
{
}

- (void)setPreludeLabel:(id)a3
{
}

- (void)setContinuationLabel:(id)a3
{
}

- (void)setIntructionLabelHidden:(BOOL)a3
{
}

- (void)setPreludeLabelHidden:(BOOL)a3
{
}

- (void)setContinuationLabelHidden:(BOOL)a3
{
}

- (_TtC14VoiceTriggerUI21GMEnrollmentViewModel)init
{
  result = (_TtC14VoiceTriggerUI21GMEnrollmentViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14VoiceTriggerUI21GMEnrollmentViewModel___observationRegistrar;
  uint64_t v4 = sub_2388DFE18();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end