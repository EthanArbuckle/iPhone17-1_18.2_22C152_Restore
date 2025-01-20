@interface HDSPWakeUpResultsNotificationLocalizer
- (HDSPWakeUpResultsNotification)notification;
- (HDSPWakeUpResultsNotificationLocalizer)initWithNotification:(id)a3 healthStore:(id)a4;
- (HKHealthStore)healthStore;
- (double)dailySleepDurationGoal;
- (id)_embeddedNameLocalizedStringKey;
- (id)_embeddedNameSubstitutionStringKey;
- (id)_localizedBodyForOneDayNotificationWithError:(id *)a3;
- (id)_localizedBodyForOneWeekDayNotificationWithError:(id *)a3;
- (id)_localizedBodyForTwoWeekNotificationWithError:(id *)a3;
- (id)_localizedStringKeyBase;
- (id)_regularLocalizedStringKey;
- (id)_regularSubstitutionStringKey;
- (id)localizedBody;
- (id)localizedTitle;
- (id)userFirstName;
- (int64_t)notificationVariant;
- (int64_t)weeklyGoalAchieved;
- (unint64_t)category;
@end

@implementation HDSPWakeUpResultsNotificationLocalizer

- (HDSPWakeUpResultsNotificationLocalizer)initWithNotification:(id)a3 healthStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSPWakeUpResultsNotificationLocalizer;
  v9 = [(HDSPWakeUpResultsNotificationLocalizer *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notification, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    v11 = v10;
  }

  return v10;
}

- (id)localizedTitle
{
  return HDSPLocalizedString(@"RESULT_NOTIFICATION_TITLE");
}

- (id)localizedBody
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(HDSPWakeUpResultsNotificationLocalizer *)self notification];
  uint64_t v4 = [v3 category];

  if (v4 == 2)
  {
    uint64_t v13 = 0;
    v5 = (id *)&v13;
    uint64_t v6 = [(HDSPWakeUpResultsNotificationLocalizer *)self _localizedBodyForTwoWeekNotificationWithError:&v13];
  }
  else if (v4 == 1)
  {
    uint64_t v14 = 0;
    v5 = (id *)&v14;
    uint64_t v6 = [(HDSPWakeUpResultsNotificationLocalizer *)self _localizedBodyForOneWeekDayNotificationWithError:&v14];
  }
  else
  {
    if (v4)
    {
      v9 = &stru_26D3FAEE0;
      goto LABEL_14;
    }
    uint64_t v15 = 0;
    v5 = (id *)&v15;
    uint64_t v6 = [(HDSPWakeUpResultsNotificationLocalizer *)self _localizedBodyForOneDayNotificationWithError:&v15];
  }
  id v7 = v6;
  id v8 = *v5;
  if (v7)
  {
    v9 = [v7 copy];
  }
  else
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      __int16 v18 = 2114;
      id v19 = v8;
      id v12 = v11;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected formatting error: %{public}@", buf, 0x16u);
    }
    v9 = &stru_26D3FAEE0;
  }

LABEL_14:

  return v9;
}

- (id)_localizedBodyForOneDayNotificationWithError:(id *)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if ([(HDSPWakeUpResultsNotificationLocalizer *)self category])
  {
    v38 = [MEMORY[0x263F08690] currentHandler];
    v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HDSPWakeUpResultsNotificationLocalizer category](self, "category"));
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HDSPWakeUpResultsNotificationLocalizer.m", 83, @"This method can only localized content for One Day Wake Up Results; received category %@",
      v39);
  }
  [(HDSPWakeUpResultsNotificationLocalizer *)self dailySleepDurationGoal];
  unint64_t v6 = vcvtmd_s64_f64(v5 / 3600.0);
  id v7 = (void *)MEMORY[0x263F08A30];
  id v8 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v9 = [v7 localizedStringFromNumber:v8 numberStyle:1];

  v10 = [(HDSPWakeUpResultsNotificationLocalizer *)self userFirstName];
  v11 = [(HDSPWakeUpResultsNotificationLocalizer *)self _embeddedNameLocalizedStringKey];
  id v12 = HDSPLocalizedCoachingString(v11);

  if ([v10 length] && v12)
  {
    uint64_t v13 = [(HDSPWakeUpResultsNotificationLocalizer *)self _embeddedNameLocalizedStringKey];
    HDSPLocalizedCoachingString(v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v15 = [(HDSPWakeUpResultsNotificationLocalizer *)self _embeddedNameSubstitutionStringKey];
    v16 = HDSPLocalizedCoachingSubstitutionString(v15);

    if (v16)
    {
      id v47 = 0;
      v17 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, @"%ld", &v47, v6);
      id v18 = v47;
      id v46 = v18;
      id v19 = (void *)v9;
      uint64_t v20 = [NSString stringWithValidatedFormat:v17, @"%@", &v46, v9 validFormatSpecifiers error];
      v21 = v12;
      id v22 = v46;

      id v45 = v22;
      v23 = [NSString stringWithValidatedFormat:v14, @"%@%@", &v45, v10, v20 validFormatSpecifiers error];
      id v24 = v45;

      id v12 = v21;
    }
    else
    {
      id v19 = (void *)v9;
      id v44 = 0;
      v23 = [NSString stringWithValidatedFormat:v14, @"%@", &v44, v10 validFormatSpecifiers error];
      id v24 = v44;
    }
  }
  else
  {
    v25 = [(HDSPWakeUpResultsNotificationLocalizer *)self _regularLocalizedStringKey];
    HDSPLocalizedCoachingString(v25);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    v26 = [(HDSPWakeUpResultsNotificationLocalizer *)self _regularSubstitutionStringKey];
    v16 = HDSPLocalizedCoachingSubstitutionString(v26);

    if (v16)
    {
      id v43 = 0;
      v27 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, @"%ld", &v43, v6);
      id v28 = v43;
      id v42 = v28;
      id v19 = (void *)v9;
      [NSString stringWithValidatedFormat:v27, @"%@", &v42, v9 validFormatSpecifiers error];
      v29 = v10;
      v31 = v30 = v12;
      id v32 = v42;

      id v41 = v32;
      v23 = [NSString stringWithValidatedFormat:v14, @"%@", &v41, v31 validFormatSpecifiers error];
      id v24 = v41;

      id v12 = v30;
      v10 = v29;
    }
    else
    {
      id v19 = (void *)v9;
      id v14 = v14;
      id v24 = 0;
      v23 = v14;
    }
  }

  if (v23)
  {
    id v33 = v23;
  }
  else
  {
    id v34 = v24;
    v35 = v34;
    if (v34)
    {
      if (a3)
      {
        *a3 = v34;
      }
      else
      {
        v36 = HKSPLogForCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v49 = v35;
          _os_log_error_impl(&dword_221A52000, v36, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected formatting error: %{public}@", buf, 0xCu);
        }
      }
    }
  }

  return v23;
}

- (id)_localizedBodyForOneWeekDayNotificationWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([(HDSPWakeUpResultsNotificationLocalizer *)self category] != 1)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HDSPWakeUpResultsNotificationLocalizer category](self, "category"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HDSPWakeUpResultsNotificationLocalizer.m", 141, @"This method can only localized content for One Week Wake Up Results; received category %@",
      v18);
  }
  int64_t v6 = [(HDSPWakeUpResultsNotificationLocalizer *)self weeklyGoalAchieved];
  if ((unint64_t)(v6 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int64_t v19 = v6;
    uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
    v21 = [NSNumber numberWithInteger:v19];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HDSPWakeUpResultsNotificationLocalizer.m", 147, @"One Week goal achieved count must be 3 or 4; received %@",
      v21);
  }
  id v7 = [(HDSPWakeUpResultsNotificationLocalizer *)self userFirstName];
  id v8 = [(HDSPWakeUpResultsNotificationLocalizer *)self _embeddedNameLocalizedStringKey];
  uint64_t v9 = HDSPLocalizedCoachingString(v8);

  if ([v7 length] && v9)
  {
    id v22 = 0;
    v10 = [NSString stringWithValidatedFormat:v9, @"%@", &v22, v7 validFormatSpecifiers error];
    id v11 = v22;
    if (v10) {
      goto LABEL_18;
    }
    id v12 = v11;
    uint64_t v13 = v12;
    if (v12)
    {
      if (a3)
      {
        *a3 = v12;
      }
      else
      {
        uint64_t v15 = HKSPLogForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v24 = v13;
          _os_log_error_impl(&dword_221A52000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected formatting error: %{public}@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    id v14 = [(HDSPWakeUpResultsNotificationLocalizer *)self _regularLocalizedStringKey];
    v10 = HDSPLocalizedCoachingString(v14);

    uint64_t v13 = 0;
    id v11 = 0;
    if (v10) {
      goto LABEL_18;
    }
  }
  v10 = 0;
  id v11 = v13;
LABEL_18:

  return v10;
}

- (id)_localizedBodyForTwoWeekNotificationWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ([(HDSPWakeUpResultsNotificationLocalizer *)self category] != 2)
  {
    uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
    v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HDSPWakeUpResultsNotificationLocalizer category](self, "category"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HDSPWakeUpResultsNotificationLocalizer.m", 172, @"This method can only localized content for Two Week Wake Up Results; received category %@",
      v26);
  }
  int64_t v6 = [(HDSPWakeUpResultsNotificationLocalizer *)self userFirstName];
  id v7 = [(HDSPWakeUpResultsNotificationLocalizer *)self _embeddedNameLocalizedStringKey];
  id v8 = HDSPLocalizedCoachingString(v7);

  if ([v6 length] && v8)
  {
    uint64_t v9 = [(HDSPWakeUpResultsNotificationLocalizer *)self _embeddedNameLocalizedStringKey];
    HDSPLocalizedCoachingString(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    id v11 = [(HDSPWakeUpResultsNotificationLocalizer *)self _embeddedNameSubstitutionStringKey];
    id v12 = HDSPLocalizedCoachingSubstitutionString(v11);

    if (v12)
    {
      id v31 = 0;
      uint64_t v13 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, @"%ld", &v31, -[HDSPWakeUpResultsNotificationLocalizer weeklyGoalAchieved](self, "weeklyGoalAchieved"));
      id v14 = v31;
      id v30 = v14;
      uint64_t v15 = [NSString stringWithValidatedFormat:v10, @"%@%@", &v30, v6, v13 validFormatSpecifiers error];
      v16 = v30;
LABEL_9:
      id v19 = v16;

      goto LABEL_12;
    }
    id v29 = 0;
    uint64_t v15 = [NSString stringWithValidatedFormat:v10, @"%@", &v29, v6 validFormatSpecifiers error];
    id v19 = v29;
  }
  else
  {
    v17 = [(HDSPWakeUpResultsNotificationLocalizer *)self _regularLocalizedStringKey];
    HDSPLocalizedCoachingString(v17);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    id v18 = [(HDSPWakeUpResultsNotificationLocalizer *)self _regularSubstitutionStringKey];
    id v12 = HDSPLocalizedCoachingSubstitutionString(v18);

    if (v12)
    {
      id v28 = 0;
      uint64_t v13 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, @"%ld", &v28, -[HDSPWakeUpResultsNotificationLocalizer weeklyGoalAchieved](self, "weeklyGoalAchieved"));
      id v14 = v28;
      id v27 = v14;
      uint64_t v15 = [NSString stringWithValidatedFormat:v10, @"%@", &v27, v13 validFormatSpecifiers error];
      v16 = v27;
      goto LABEL_9;
    }
    id v10 = v10;
    id v19 = 0;
    uint64_t v15 = v10;
  }
LABEL_12:

  if (v15)
  {
    id v20 = v15;
  }
  else
  {
    id v21 = v19;
    id v22 = v21;
    if (v21)
    {
      if (a3)
      {
        *a3 = v21;
      }
      else
      {
        v23 = HKSPLogForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v33 = v22;
          _os_log_error_impl(&dword_221A52000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected formatting error: %{public}@", buf, 0xCu);
        }
      }
    }
  }

  return v15;
}

- (unint64_t)category
{
  v2 = [(HDSPWakeUpResultsNotificationLocalizer *)self notification];
  unint64_t v3 = [v2 category];

  return v3;
}

- (int64_t)notificationVariant
{
  v2 = [(HDSPWakeUpResultsNotificationLocalizer *)self notification];
  int64_t v3 = [v2 notificationVariant];

  return v3;
}

- (double)dailySleepDurationGoal
{
  if ([(HDSPWakeUpResultsNotificationLocalizer *)self category])
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"HDSPWakeUpResultsNotificationLocalizer.m" lineNumber:226 description:@"Daily sleep duration goal requires OneDay category"];
  }
  uint64_t v4 = [(HDSPWakeUpResultsNotificationLocalizer *)self notification];
  double v5 = [v4 goalAchieved];
  int64_t v6 = [MEMORY[0x263F0A830] secondUnit];
  [v5 doubleValueForUnit:v6];
  double v8 = v7;

  return v8;
}

- (int64_t)weeklyGoalAchieved
{
  if (![(HDSPWakeUpResultsNotificationLocalizer *)self category])
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"HDSPWakeUpResultsNotificationLocalizer.m" lineNumber:235 description:@"Weekly goal achieved requires OneWeek or TwoWeek category"];
  }
  uint64_t v4 = [(HDSPWakeUpResultsNotificationLocalizer *)self notification];
  double v5 = [v4 goalAchieved];
  int64_t v6 = [MEMORY[0x263F0A830] dayUnit];
  [v5 doubleValueForUnit:v6];
  int64_t v8 = (unint64_t)v7;

  return v8;
}

- (id)userFirstName
{
  v2 = [(HDSPWakeUpResultsNotificationLocalizer *)self notification];
  int64_t v3 = [v2 userFirstName];

  return v3;
}

- (id)_localizedStringKeyBase
{
  int64_t v3 = [(HDSPWakeUpResultsNotificationLocalizer *)self notification];
  uint64_t v4 = [v3 category];

  if (v4)
  {
    if (v4 == 2)
    {
      double v7 = @"WAKE_UP_RESULT_TWO_WEEK_GOAL_ACHIEVED";
    }
    else if (v4 == 1)
    {
      int64_t v5 = [(HDSPWakeUpResultsNotificationLocalizer *)self weeklyGoalAchieved];
      int64_t v6 = @"WAKE_UP_RESULT_FOUR_DAY_GOAL_ACHIEVED";
      if (v5 == 3) {
        int64_t v6 = @"WAKE_UP_RESULT_THREE_DAY_GOAL_ACHIEVED";
      }
      double v7 = v6;
    }
    else
    {
      double v7 = &stru_26D3FAEE0;
    }
  }
  else
  {
    double v7 = @"WAKE_UP_RESULT_ONE_DAY_DURATION";
  }

  return v7;
}

- (id)_regularLocalizedStringKey
{
  int64_t v3 = NSString;
  uint64_t v4 = [(HDSPWakeUpResultsNotificationLocalizer *)self _localizedStringKeyBase];
  int64_t v5 = [v3 stringWithFormat:@"%@_%ld", v4, -[HDSPWakeUpResultsNotificationLocalizer notificationVariant](self, "notificationVariant")];

  return v5;
}

- (id)_regularSubstitutionStringKey
{
  int64_t v3 = NSString;
  uint64_t v4 = [(HDSPWakeUpResultsNotificationLocalizer *)self _localizedStringKeyBase];
  int64_t v5 = [v3 stringWithFormat:@"%@_%ld_SUBSTITUTION", v4, -[HDSPWakeUpResultsNotificationLocalizer notificationVariant](self, "notificationVariant")];

  return v5;
}

- (id)_embeddedNameLocalizedStringKey
{
  int64_t v3 = NSString;
  uint64_t v4 = [(HDSPWakeUpResultsNotificationLocalizer *)self _localizedStringKeyBase];
  int64_t v5 = [v3 stringWithFormat:@"%@_NAME_%ld", v4, -[HDSPWakeUpResultsNotificationLocalizer notificationVariant](self, "notificationVariant")];

  return v5;
}

- (id)_embeddedNameSubstitutionStringKey
{
  int64_t v3 = NSString;
  uint64_t v4 = [(HDSPWakeUpResultsNotificationLocalizer *)self _localizedStringKeyBase];
  int64_t v5 = [v3 stringWithFormat:@"%@_NAME_%ld_SUBSTITUTION", v4, -[HDSPWakeUpResultsNotificationLocalizer notificationVariant](self, "notificationVariant")];

  return v5;
}

- (HDSPWakeUpResultsNotification)notification
{
  return self->_notification;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

@end