@interface TPSReminderCompletedItemValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSReminderCompletedItemValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F94CB8];
  v5 = (void (**)(id, BOOL, id))a3;
  id v6 = objc_alloc_init(v4);
  id v11 = 0;
  unint64_t v7 = [v6 completedRemindersCountForTipKitWithError:&v11];
  id v8 = v11;
  unint64_t v9 = [(TPSTargetingValidation *)self unsignedIntegerValue];
  v10 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v10];
  }

  v5[2](v5, v7 >= v9, v8);
}

@end