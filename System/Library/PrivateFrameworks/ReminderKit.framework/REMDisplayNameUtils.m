@interface REMDisplayNameUtils
+ (id)displayNameFromAccountName:(id)a3;
+ (id)displayNameFromListName:(id)a3 isPlaceholder:(BOOL)a4;
@end

@implementation REMDisplayNameUtils

+ (id)displayNameFromAccountName:(id)a3
{
  id v3 = a3;
  v4 = [v3 lowercaseString];
  int v5 = [v4 isEqualToString:@"local"];

  if (v5)
  {
    _REMGetLocalizedString(12);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v3;
  }
  v7 = v6;

  return v7;
}

+ (id)displayNameFromListName:(id)a3 isPlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if (![v5 length] && v4) {
      goto LABEL_4;
    }
  }
  else if (v4)
  {
LABEL_4:
    uint64_t v7 = 49;
LABEL_9:
    _REMGetLocalizedString(v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (([v6 isEqualToString:@"DEFAULT_TASK_CALENDAR_NAME"] & 1) != 0
    || [v6 isEqualToString:@"Reminders"])
  {
    uint64_t v7 = 11;
    goto LABEL_9;
  }
  id v8 = v6;
LABEL_10:
  v9 = v8;

  return v9;
}

@end