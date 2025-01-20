@interface ICUserNotificationBuilder
- (BOOL)allowInCar;
- (BOOL)displaysActionButtonOnLockScreen;
- (BOOL)displaysAsTopMost;
- (BOOL)forcesModalAppearance;
- (ICUserNotificationBuilder)init;
- (ICUserNotificationBuilder)initWithStoreDialog:(id)a3;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)message;
- (NSString)otherButtonTitle;
- (NSString)title;
- (__CFUserNotification)createCFUserNotification;
- (double)timeoutInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)alertLevel;
- (void)_setBoolValue:(BOOL)a3 forKey:(__CFString *)a4;
- (void)setAlertLevel:(int64_t)a3;
- (void)setAllowInCar:(BOOL)a3;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setDefaultButtonTitle:(id)a3;
- (void)setDisplaysActionButtonOnLockScreen:(BOOL)a3;
- (void)setDisplaysAsTopMost:(BOOL)a3;
- (void)setForcesModalAppearance:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setOtherButtonTitle:(id)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICUserNotificationBuilder

- (void).cxx_destruct
{
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setAlertLevel:(int64_t)a3
{
  self->_alertLevel = a3;
}

- (int64_t)alertLevel
{
  return self->_alertLevel;
}

- (void)_setBoolValue:(BOOL)a3 forKey:(__CFString *)a4
{
  userNotificationDictionary = self->_userNotificationDictionary;
  v5 = (void *)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    v5 = (void *)MEMORY[0x1E4F1CFC8];
  }
  [(NSMutableDictionary *)userNotificationDictionary setObject:*v5 forKey:a4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (v5)
  {
    *(void *)(v5 + 16) = self->_alertLevel;
    *(double *)(v5 + 24) = self->_timeoutInterval;
    uint64_t v7 = [(NSMutableDictionary *)self->_userNotificationDictionary mutableCopyWithZone:a3];
    v8 = (void *)v6[1];
    v6[1] = v7;
  }
  return v6;
}

- (NSString)title
{
  v2 = [(NSMutableDictionary *)self->_userNotificationDictionary objectForKey:*MEMORY[0x1E4F1D990]];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1EF5F5C40;
  }
  v4 = v2;

  return v4;
}

- (void)setTitle:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_userNotificationDictionary setObject:v4 forKey:*MEMORY[0x1E4F1D990]];
}

- (void)setOtherButtonTitle:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_userNotificationDictionary setObject:v4 forKey:*MEMORY[0x1E4F1DA10]];
}

- (void)setMessage:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_userNotificationDictionary setObject:v4 forKey:*MEMORY[0x1E4F1D9A8]];
}

- (void)setForcesModalAppearance:(BOOL)a3
{
}

- (void)setDisplaysAsTopMost:(BOOL)a3
{
}

- (void)setDisplaysActionButtonOnLockScreen:(BOOL)a3
{
}

- (void)setDefaultButtonTitle:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_userNotificationDictionary setObject:v4 forKey:*MEMORY[0x1E4F1D9E0]];
}

- (void)setAlternateButtonTitle:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_userNotificationDictionary setObject:v4 forKey:*MEMORY[0x1E4F1D9D0]];
}

- (void)setAllowInCar:(BOOL)a3
{
}

- (NSString)otherButtonTitle
{
  v2 = [(NSMutableDictionary *)self->_userNotificationDictionary objectForKey:*MEMORY[0x1E4F1DA10]];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1EF5F5C40;
  }
  id v4 = v2;

  return v4;
}

- (NSString)message
{
  v2 = [(NSMutableDictionary *)self->_userNotificationDictionary objectForKey:*MEMORY[0x1E4F1D9A8]];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1EF5F5C40;
  }
  id v4 = v2;

  return v4;
}

- (BOOL)forcesModalAppearance
{
  v2 = [(NSMutableDictionary *)self->_userNotificationDictionary objectForKey:*MEMORY[0x1E4FA7358]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)displaysAsTopMost
{
  v2 = [(NSMutableDictionary *)self->_userNotificationDictionary objectForKey:*MEMORY[0x1E4F1D9B8]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)displaysActionButtonOnLockScreen
{
  v2 = [(NSMutableDictionary *)self->_userNotificationDictionary objectForKey:*MEMORY[0x1E4FA7338]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)defaultButtonTitle
{
  v2 = [(NSMutableDictionary *)self->_userNotificationDictionary objectForKey:*MEMORY[0x1E4F1D9E0]];
  char v3 = v2;
  if (!v2) {
    v2 = &stru_1EF5F5C40;
  }
  id v4 = v2;

  return v4;
}

- (__CFUserNotification)createCFUserNotification
{
  unint64_t alertLevel = self->_alertLevel;
  BOOL v3 = alertLevel > 3;
  CFOptionFlags v4 = 3 - alertLevel;
  if (v3) {
    CFOptionFlags v5 = 3;
  }
  else {
    CFOptionFlags v5 = v4;
  }
  return CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->_timeoutInterval, v5, 0, (CFDictionaryRef)self->_userNotificationDictionary);
}

- (NSString)alternateButtonTitle
{
  v2 = [(NSMutableDictionary *)self->_userNotificationDictionary objectForKey:*MEMORY[0x1E4F1D9D0]];
  BOOL v3 = v2;
  if (!v2) {
    v2 = &stru_1EF5F5C40;
  }
  CFOptionFlags v4 = v2;

  return v4;
}

- (BOOL)allowInCar
{
  v2 = [(NSMutableDictionary *)self->_userNotificationDictionary objectForKey:*MEMORY[0x1E4FA7280]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (ICUserNotificationBuilder)initWithStoreDialog:(id)a3
{
  id v4 = a3;
  CFOptionFlags v5 = [(ICUserNotificationBuilder *)self init];
  if (v5)
  {
    v6 = [v4 message];
    if ([v6 length]) {
      [(ICUserNotificationBuilder *)v5 setTitle:v6];
    }
    uint64_t v7 = [v4 explanation];
    if ([v7 length]) {
      [(ICUserNotificationBuilder *)v5 setMessage:v7];
    }
    v8 = [v4 buttons];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__ICUserNotificationBuilder_initWithStoreDialog___block_invoke;
    v10[3] = &unk_1E5AC8068;
    v11 = v5;
    [v8 enumerateObjectsUsingBlock:v10];
  }
  return v5;
}

void __49__ICUserNotificationBuilder_initWithStoreDialog___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  char v3 = [v5 title];
  if ([v3 length])
  {
    uint64_t v4 = [v5 type];
    switch(v4)
    {
      case 1:
        [*(id *)(a1 + 32) setDefaultButtonTitle:v3];
        break;
      case 3:
        [*(id *)(a1 + 32) setOtherButtonTitle:v3];
        break;
      case 2:
        [*(id *)(a1 + 32) setAlternateButtonTitle:v3];
        break;
    }
  }
}

- (ICUserNotificationBuilder)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICUserNotificationBuilder;
  v2 = [(ICUserNotificationBuilder *)&v7 init];
  if (v2)
  {
    char v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userNotificationDictionary = v2->_userNotificationDictionary;
    v2->_userNotificationDictionary = v3;

    id v5 = (void *)[objc_alloc(NSNumber) initWithInteger:0];
    [(NSMutableDictionary *)v2->_userNotificationDictionary setObject:v5 forKey:*MEMORY[0x1E4FA7308]];
  }
  return v2;
}

@end