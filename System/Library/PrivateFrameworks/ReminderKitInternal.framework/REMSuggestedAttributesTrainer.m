@interface REMSuggestedAttributesTrainer
+ (BOOL)supportsSecureCoding;
- (REMSuggestedAttributesTrainer)initWithCoder:(id)a3;
- (REMSuggestedAttributesTrainer)initWithFetchResultTokenToDiffAgainst:(id)a3;
- (void)dealloc;
@end

@implementation REMSuggestedAttributesTrainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSuggestedAttributesTrainer)initWithCoder:(id)a3
{
  return [(REMStoreSwiftInvocation *)self init];
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_1E96F08A0;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1A7571E90();
  __swift_project_value_buffer(v6, (uint64_t)qword_1E96F3C90);
  v7 = sub_1A7571E80();
  os_log_type_t v8 = sub_1A7572FF0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A72A1000, v7, v8, "REMSuggestedAttributesTrainer deinit", v9, 2u);
    MEMORY[0x1AD0CD330](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(REMSuggestedAttributesTrainer *)&v10 dealloc];
}

- (REMSuggestedAttributesTrainer)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithFetchResultTokenToDiffAgainst:a3];
}

@end