@interface _TRUserNotification
+ (id)userNotificationDictionaryWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6;
+ (id)userNotificationDictionaryWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 isTopMost:(BOOL)a7 dismissOnUnlock:(BOOL)a8;
- (BOOL)didAccept;
- (_TRUserNotification)initWithDictionary:(id)a3 options:(unint64_t)a4 error:(int *)a5;
- (__CFUserNotification)CFUserNotification;
- (id)textFieldValueAtIndex:(unint64_t)a3;
- (int)response;
- (unint64_t)responseFlags;
- (void)cancel;
- (void)dealloc;
- (void)show;
@end

@implementation _TRUserNotification

- (_TRUserNotification)initWithDictionary:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  CFDictionaryRef v8 = (const __CFDictionary *)a3;
  v14.receiver = self;
  v14.super_class = (Class)_TRUserNotification;
  v9 = [(_TRUserNotification *)&v14 init];
  if (v9
    && (SInt32 error = 0,
        CFUserNotificationRef v10 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, a4, &error, v8),
        (v9->_userNotification = v10) == 0))
  {
    if (a5) {
      *a5 = error;
    }
    v11 = 0;
  }
  else
  {
    v11 = v9;
  }

  return v11;
}

- (void)dealloc
{
  userNotification = self->_userNotification;
  if (userNotification)
  {
    CFUserNotificationCancel(userNotification);
    CFRelease(self->_userNotification);
  }
  v4.receiver = self;
  v4.super_class = (Class)_TRUserNotification;
  [(_TRUserNotification *)&v4 dealloc];
}

- (void)cancel
{
}

- (__CFUserNotification)CFUserNotification
{
  return self->_userNotification;
}

- (void)show
{
  self->_response = CFUserNotificationReceiveResponse(self->_userNotification, 0.0, &self->_responseFlags);
}

- (BOOL)didAccept
{
  return self->_userNotification && !self->_response && self->_responseFlags == 0;
}

- (id)textFieldValueAtIndex:(unint64_t)a3
{
  v3 = (void *)[(__CFString *)(id)CFUserNotificationGetResponseValue(self->_userNotification, (CFStringRef)*MEMORY[0x263F00030], a3) copy];
  return v3;
}

+ (id)userNotificationDictionaryWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6
{
  return (id)[a1 userNotificationDictionaryWithTitle:a3 message:a4 defaultButtonTitle:a5 alternateButtonTitle:a6 isTopMost:1 dismissOnUnlock:0];
}

+ (id)userNotificationDictionaryWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 isTopMost:(BOOL)a7 dismissOnUnlock:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = [MEMORY[0x263EFF9A0] dictionary];
  v18 = v17;
  if (v13) {
    [v17 setObject:v13 forKeyedSubscript:*MEMORY[0x263EFFFC8]];
  }
  if (v14) {
    [v18 setObject:v14 forKeyedSubscript:*MEMORY[0x263EFFFD8]];
  }
  if (v16) {
    [v18 setObject:v16 forKeyedSubscript:*MEMORY[0x263EFFFE8]];
  }
  if (v15)
  {
    [v18 setObject:v15 forKeyedSubscript:*MEMORY[0x263F00000]];
    [v18 setObject:&unk_26C58CD10 forKeyedSubscript:*MEMORY[0x263F79600]];
  }
  v19 = [NSNumber numberWithBool:v9];
  [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x263EFFFE0]];

  v20 = [NSNumber numberWithInt:!v8];
  [v18 setObject:v20 forKeyedSubscript:*MEMORY[0x263F79628]];

  return v18;
}

- (int)response
{
  return self->_response;
}

- (unint64_t)responseFlags
{
  return self->_responseFlags;
}

@end