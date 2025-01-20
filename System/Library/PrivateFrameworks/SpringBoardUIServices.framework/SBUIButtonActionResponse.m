@interface SBUIButtonActionResponse
- (SBUIButtonActionResponse)initWithUnHandledButtonEvents:(unint64_t)a3;
- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4;
- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6;
- (unint64_t)unHandledButtonEvents;
@end

@implementation SBUIButtonActionResponse

- (SBUIButtonActionResponse)initWithUnHandledButtonEvents:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v6 forSetting:1];

  v11.receiver = self;
  v11.super_class = (Class)SBUIButtonActionResponse;
  v7 = [(SBUIButtonActionResponse *)&v11 error];
  v10.receiver = self;
  v10.super_class = (Class)SBUIButtonActionResponse;
  v8 = [(SBUIButtonActionResponse *)&v10 initWithInfo:v5 error:v7];

  return v8;
}

- (unint64_t)unHandledButtonEvents
{
  uint64_t v3 = [(SBUIButtonActionResponse *)self error];
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = [(SBUIButtonActionResponse *)self error];
    uint64_t v6 = [v5 code];

    if (v6 == 2) {
      return 0;
    }
  }
  v8 = [(SBUIButtonActionResponse *)self info];
  v9 = [v8 objectForSetting:1];

  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  if (v13) {
    unint64_t v7 = [v13 integerValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4
{
  if (a4 == 1) {
    return @"events";
  }
  else {
    return 0;
  }
}

- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  if (a6 == 1)
  {
    uint64_t v7 = __eventsFromObject(a5);
    v8 = SBUIServiceButtonEventDescription(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end