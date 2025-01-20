@interface SFBrowsingAssistantMainButton
- (SFBrowsingAssistantMainButton)initWithCoder:(id)a3;
- (SFBrowsingAssistantMainButton)initWithFrame:(CGRect)a3;
- (void)updateConfiguration;
@end

@implementation SFBrowsingAssistantMainButton

- (SFBrowsingAssistantMainButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SFBrowsingAssistantMainButton_cornerRadius) = 0;
  id v4 = a3;

  result = (SFBrowsingAssistantMainButton *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9176890);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for MainButton();
  v8.receiver = self;
  v8.super_class = v6;
  v7 = self;
  [(SFBrowsingAssistantMainButton *)&v8 updateConfiguration];
  sub_18C6F40A0(v7, (uint64_t)v5);
  sub_18C6FA2F8();
}

- (SFBrowsingAssistantMainButton)initWithFrame:(CGRect)a3
{
  result = (SFBrowsingAssistantMainButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end