@interface REShortcutFilter
+ (unint64_t)filterVersion;
- (REShortcutFilter)init;
- (id)identifierForIntent:(id)a3 bundleIdentifier:(id)a4;
- (id)identifierForUserActivity:(id)a3 bundleIdentifier:(id)a4;
- (id)intentByFilteringIntent:(id)a3 withLevel:(unint64_t)a4;
- (id)userActivityByFilteringUserActivity:(id)a3 withLevel:(unint64_t)a4;
- (unint64_t)_actionIdentifierForIntent:(id)a3;
- (unint64_t)_actionIdentifierForUserActivity:(id)a3;
@end

@implementation REShortcutFilter

+ (unint64_t)filterVersion
{
  return 1;
}

- (REShortcutFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)REShortcutFilter;
  return [(REShortcutFilter *)&v3 init];
}

- (id)intentByFilteringIntent:(id)a3 withLevel:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = v5;
    if (a4 != 1) {
      goto LABEL_6;
    }
    uint64_t v8 = [v5 _emptyCopy];
  }
  else
  {
    uint64_t v8 = REIntentBySimplifyingParametersForIntent(v5);
  }
  v7 = (void *)v8;

LABEL_6:
  return v7;
}

- (id)userActivityByFilteringUserActivity:(id)a3 withLevel:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    id v7 = objc_alloc(MEMORY[0x263F018D0]);
    uint64_t v8 = [v5 activityType];
    v6 = (void *)[v7 initWithActivityType:v8];
  }
  return v6;
}

- (unint64_t)_actionIdentifierForIntent:(id)a3
{
  objc_super v3 = REParametersForIntent(a3);
  unint64_t v4 = objc_msgSend(v3, "re_actionIdentifierHashValue");

  return v4;
}

- (id)identifierForIntent:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(REShortcutFilter *)self _actionIdentifierForIntent:a3];
  uint64_t v8 = NSString;
  v9 = NSNumber;
  id v10 = v6;
  v11 = [v9 numberWithUnsignedLongLong:v7];
  v12 = [v8 stringWithFormat:@"%@-%@", v10, v11];

  return v12;
}

- (unint64_t)_actionIdentifierForUserActivity:(id)a3
{
  objc_super v3 = REExtractUserActivity(a3);
  unint64_t v4 = objc_msgSend(v3, "re_actionIdentifierHashValue");

  return v4;
}

- (id)identifierForUserActivity:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(REShortcutFilter *)self _actionIdentifierForUserActivity:a3];
  uint64_t v8 = NSString;
  v9 = NSNumber;
  id v10 = v6;
  v11 = [v9 numberWithUnsignedLongLong:v7];
  v12 = [v8 stringWithFormat:@"%@-%@", v10, v11];

  return v12;
}

@end