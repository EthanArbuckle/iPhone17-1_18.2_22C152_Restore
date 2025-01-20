@interface PKUserNotificationAgent
+ (__CFUserNotification)presentNotificationWithParameters:(id)a3 flags:(unint64_t)a4 responseHandler:(id)a5;
+ (__CFUserNotification)presentNotificationWithParameters:(id)a3 responseHandler:(id)a4;
@end

@implementation PKUserNotificationAgent

+ (__CFUserNotification)presentNotificationWithParameters:(id)a3 responseHandler:(id)a4
{
  return +[PKUserNotificationAgent presentNotificationWithParameters:a3 flags:0 responseHandler:a4];
}

+ (__CFUserNotification)presentNotificationWithParameters:(id)a3 flags:(unint64_t)a4 responseHandler:(id)a5
{
  id v7 = a5;
  v8 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, a4, 0, (CFDictionaryRef)a3);
  v9 = _Queue();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PKUserNotificationAgent_presentNotificationWithParameters_flags_responseHandler___block_invoke;
  v13[3] = &unk_1E56DC4C0;
  id v14 = v7;
  v15 = v8;
  v10 = v13;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_22;
  block[3] = &unk_1E56D8360;
  id v17 = v10;
  id v11 = v7;
  dispatch_async(v9, block);

  return v8;
}

void __83__PKUserNotificationAgent_presentNotificationWithParameters_flags_responseHandler___block_invoke(uint64_t a1)
{
  v2 = *(const void **)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (!v3) {
      return;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__PKUserNotificationAgent_presentNotificationWithParameters_flags_responseHandler___block_invoke_2;
    block[3] = &unk_1E56D8360;
    id v12 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);

    v2 = *(const void **)(a1 + 40);
    if (!v2) {
      return;
    }
LABEL_7:
    CFRelease(v2);
    return;
  }
  if (!v3) {
    goto LABEL_7;
  }
  v4 = _NotificationHandlerMap();
  v5 = (void *)[*(id *)(a1 + 32) copy];
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 40)];
  [v4 setObject:v5 forKey:v6];

  CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, *(CFUserNotificationRef *)(a1 + 40), (CFUserNotificationCallBack)_NotificationResponseHandler, 0);
  if (RunLoopSource)
  {
    v8 = RunLoopSource;
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v8, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    v10 = v8;
  }
  else
  {
    v10 = *(__CFRunLoopSource **)(a1 + 40);
  }
  CFRelease(v10);
}

uint64_t __83__PKUserNotificationAgent_presentNotificationWithParameters_flags_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end