@interface ConfigurationList
+ (BOOL)supportsSecureCoding;
- (ConfigurationList)initWithCoder:(id)a3;
- (ConfigurationList)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation ConfigurationList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ConfigurationList)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
  {
    uint64_t v6 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  uint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  return (ConfigurationList *)ConfigurationList.init(identifier:display:pronunciationHint:)(v6, v8, v9, v11, v12, v14);
}

- (ConfigurationList)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ConfigurationList();
  return [(ConfigurationList *)&v5 initWithCoder:a3];
}

@end