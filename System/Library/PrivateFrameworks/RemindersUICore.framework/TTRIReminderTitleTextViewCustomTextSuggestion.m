@interface TTRIReminderTitleTextViewCustomTextSuggestion
+ (BOOL)supportsSecureCoding;
- (TTRIReminderTitleTextViewCustomTextSuggestion)init;
- (TTRIReminderTitleTextViewCustomTextSuggestion)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TTRIReminderTitleTextViewCustomTextSuggestion

- (TTRIReminderTitleTextViewCustomTextSuggestion)initWithCoder:(id)a3
{
  return (TTRIReminderTitleTextViewCustomTextSuggestion *)TTRIReminderTitleTextViewCustomTextSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v8.receiver;
  [(UITextSuggestion *)&v8 encodeWithCoder:v4];
  v6 = (void *)sub_1B996A720();
  v7 = (void *)sub_1B996E9B0();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7, v8.receiver, v8.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TTRIReminderTitleTextViewCustomTextSuggestion)init
{
  result = (TTRIReminderTitleTextViewCustomTextSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___TTRIReminderTitleTextViewCustomTextSuggestion_textEditingSuggestionUUID;
  uint64_t v3 = sub_1B996A770();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end