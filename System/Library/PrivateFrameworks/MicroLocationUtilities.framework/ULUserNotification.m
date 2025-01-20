@interface ULUserNotification
+ (id)_queue;
+ (int64_t)_responseButtonFromOptionFlags:(unint64_t)a3;
+ (unint64_t)_userNotificationAlertLevelFlagsFromAlertLevel:(int64_t)a3;
+ (void)_postNotificationWithAlertLevel:(int64_t)a3 alertOptions:(id)a4 handler:(id)a5;
+ (void)_presentWithAlertLevel:(int64_t)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 cancelButton:(id)a7 otherButton:(id)a8 handler:(id)a9;
+ (void)presentWithAlertLevel:(int64_t)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 cancelButton:(id)a7 otherButton:(id)a8 handler:(id)a9;
@end

@implementation ULUserNotification

+ (void)presentWithAlertLevel:(int64_t)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 cancelButton:(id)a7 otherButton:(id)a8 handler:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = [a1 _queue];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __105__ULUserNotification_presentWithAlertLevel_title_message_defaultButton_cancelButton_otherButton_handler___block_invoke;
  v28[3] = &unk_2653FDB38;
  id v35 = a1;
  int64_t v36 = a3;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v34 = v20;
  id v22 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  id v27 = v15;
  dispatch_async(v21, v28);
}

uint64_t __105__ULUserNotification_presentWithAlertLevel_title_message_defaultButton_cancelButton_otherButton_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 80) _presentWithAlertLevel:*(void *)(a1 + 88) title:*(void *)(a1 + 32) message:*(void *)(a1 + 40) defaultButton:*(void *)(a1 + 48) cancelButton:*(void *)(a1 + 56) otherButton:*(void *)(a1 + 64) handler:*(void *)(a1 + 72)];
}

+ (void)_presentWithAlertLevel:(int64_t)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 cancelButton:(id)a7 otherButton:(id)a8 handler:(id)a9
{
  id v22 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (void (**)(id, uint64_t))a9;
  if (+[ULPlatform isInternalInstall])
  {
    id v20 = [MEMORY[0x263EFF9A0] dictionary];
    [v20 setObject:v22 forKeyedSubscript:*MEMORY[0x263EFFFC8]];
    [v20 setObject:v15 forKeyedSubscript:*MEMORY[0x263EFFFD8]];
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x263F00000]];
    [v20 setObject:v17 forKeyedSubscript:*MEMORY[0x263EFFFE8]];
    if (v18) {
      [v20 setObject:v18 forKeyedSubscript:*MEMORY[0x263F00020]];
    }
    v21 = (void *)[v20 copy];
    [a1 _postNotificationWithAlertLevel:a3 alertOptions:v21 handler:v19];
  }
  else
  {
    v19[2](v19, 1);
  }
}

+ (void)_postNotificationWithAlertLevel:(int64_t)a3 alertOptions:(id)a4 handler:(id)a5
{
  v8 = (void (**)(id, uint64_t))a5;
  CFDictionaryRef v9 = (const __CFDictionary *)a4;
  v10 = CFUserNotificationCreate(0, 0.0, [a1 _userNotificationAlertLevelFlagsFromAlertLevel:a3], 0, v9);

  if (v10)
  {
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v10, 0.0, &responseFlags);
    CFRelease(v10);
    v8[2](v8, [a1 _responseButtonFromOptionFlags:responseFlags]);
  }
  else
  {
    v8[2](v8, 1);
  }
}

+ (int64_t)_responseButtonFromOptionFlags:(unint64_t)a3
{
  int64_t v3 = 1;
  if ((a3 & 3) == 2) {
    int64_t v3 = 2;
  }
  if ((a3 & 3) != 0) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (unint64_t)_userNotificationAlertLevelFlagsFromAlertLevel:(int64_t)a3
{
  if ((unint64_t)a3 >= 3) {
    return 3;
  }
  else {
    return a3;
  }
}

+ (id)_queue
{
  if (_queue_ul_once_token_0 != -1) {
    dispatch_once(&_queue_ul_once_token_0, &__block_literal_global);
  }
  v2 = (void *)_queue_ul_once_object_0;

  return v2;
}

void __28__ULUserNotification__queue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MicroLocationUtilities.ULUserNotification", v2);
  v1 = (void *)_queue_ul_once_object_0;
  _queue_ul_once_object_0 = (uint64_t)v0;
}

@end