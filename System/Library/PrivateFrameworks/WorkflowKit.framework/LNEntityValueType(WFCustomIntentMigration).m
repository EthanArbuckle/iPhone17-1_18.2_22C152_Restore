@interface LNEntityValueType(WFCustomIntentMigration)
- (id)wf_titleWithCustomIntentSerializedRepresentation:()WFCustomIntentMigration;
@end

@implementation LNEntityValueType(WFCustomIntentMigration)

- (id)wf_titleWithCustomIntentSerializedRepresentation:()WFCustomIntentMigration
{
  v3 = [a3 objectForKeyedSubscript:@"displayString"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F72DA0]) initWithKey:v3 table:0 bundleURL:0];
  }
  else {
    v4 = 0;
  }

  return v4;
}

@end