void sub_1000017E4(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  long long v6;
  long long v7;
  long long v8;
  long long v9;
  long long v10;

  v1 = a1;
  if (qword_10003AE58)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
    v4 = 0;
    v5 = 0;
    if (sub_10001E79C(qword_10003AE58, &v6, &v4))
    {
      v2 = v1;
      v3 = getpid();
      NSLog(@"%@, performance counters: pid: %u, context switchings: %d, CPU-time: %llu, memory footprint min/max/avg(K): %llu %llu %llu, memory sample count: %u, leak count/size(K): %llu %llu", v2, v3, (DWORD2(v7) - v6), (void)v8 + *((void *)&v8 + 1) - (*((void *)&v6 + 1) + (void)v7), (unint64_t)v9 >> 10, *((void *)&v9 + 1) >> 10, (unint64_t)v10 >> 10, DWORD2(v10), v4, v5 >> 10);
    }
    qword_10003AE58 = 0;
  }
}

void sub_100001D34(id a1)
{
  v1 = +[IMChatRegistry sharedRegistry];
  v2 = +[CKUIBehavior sharedBehaviors];
  [v1 _setDefaultNumberOfMessagesToLoad:[v2 defaultConversationViewingMessageCount]];

  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  v4 = dispatch_get_global_queue(9, 0);
  dispatch_after(v3, v4, &stru_100031120);
}

uint64_t start(int a1, char **a2)
{
  v5 = dispatch_get_global_queue(25, 0);
  dispatch_async(v5, &stru_100031228);

  id v6 = [objc_alloc((Class)NSURLCache) initWithMemoryCapacity:0 diskCapacity:0 diskPath:0];
  +[NSURLCache setSharedURLCache:v6];
  IMSetEmbeddedTempDirectory();
  v7 = +[IMImagePreviewGenerator UTITypes];
  id v8 = [v7 mutableCopy];

  v9 = +[IMAnimatedImagePreviewGenerator UTITypes];
  [v8 addObjectsFromArray:v9];

  CGImageSourceSetAllowableTypes();
  UIApplicationMain(a1, a2, @"SMSApplication", @"SMSApplicationDelegate");

  return 0;
}

void sub_100002544(id a1)
{
  IMPrewarmXPCInterfaces();
  id v1 = +[IMSuggestionsService sharedInstance];
  id v2 = +[IMMobileNetworkManager sharedInstance];
  IMIsSupportedUTIType();
  id v3 = +[IMHandleRegistrar sharedInstance];
  id v4 = +[IMParentalControls standardControls];
  id v5 = +[IMSystemMonitor sharedInstance];
  id v6 = +[FTEntitlementSupport sharedInstance];
  id v7 = +[FTDeviceSupport sharedInstance];
  +[CKFaceTimeUtilities initializeCachedValues];
  id v8 = +[IDSServerBag sharedInstanceForBagType:1];
}

void sub_100002624(id a1)
{
  qword_10003AEE0 = (uint64_t)os_log_create("com.apple.Messages", "SMSApplicationDelegate");

  _objc_release_x1();
}

void sub_10000492C(id a1)
{
  [+[UIScreen mainScreen](UIScreen, "mainScreen") scale];
  qword_10003AE40 = v1;
}

void sub_100004B64(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:1];

  dispatch_time_t v3 = dispatch_time(0, 4000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C2C;
  block[3] = &unk_100030A30;
  id v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100004C2C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) valueForKey:@"processCount"];
  id v2 = [@"/AppleInternal/XCTests/com.apple.mobilesms/screenshotTest.xctest" lastPathComponent];
  dispatch_time_t v3 = [v2 stringByDeletingPathExtension];

  uint64_t v4 = +[NSString stringWithFormat:@"MobileSMS invoking App test for %@\n", @"/AppleInternal/XCTests/com.apple.mobilesms/screenshotTest.xctest"];
  uint64_t v5 = +[NSString stringWithFormat:@"%@_image%@", v3, v1];

  +[SMSScreenshotUIImages captureScreenshot];
  +[SMSScreenshotUIImages saveImage:objc_claimAutoreleasedReturnValue() filePath:@"/tmp/" fileName:v5 withHeader:v4];
  exit(0);
}

uint64_t sub_100005120(uint64_t a1)
{
  if ([*(id *)(a1 + 32) runTestNameOrFallback:*(void *)(a1 + 40)]) {
    return 1;
  }
  uint64_t v2 = kShowMessagesTest;
  if ([*(id *)(a1 + 40) rangeOfString:kShowMessagesTest] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"ScrollConversations"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"ScrollTranscript"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"StaticTranscript"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"Rotat"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"Present"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:kShowPeoplePickerTest] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:kSelectContactPeoplePickerTest] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:kCancelPeoplePickerTest] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:kShowNewComposeTest] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"ResolveContact"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"Photo"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:kThrowAnimationPPTTestNamePrefix] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"ScrollPseudoContactNames"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"ComposeToPseudoContact"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"DetailsView"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"AudioReply"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"InvisibleInkStaticFPSTest"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"AudioWaveformFPSTest"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"GifPlaybackStaticFPSTest"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"StickerDragFPSTest"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"ExtensionLaunch"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"ExtensionTest"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"perfTestPushTranscriptToAppsShelf"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"perfTestScrollAppsDrawer"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"TestPriorityBoosting"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:CKAudioBalloonPlaybackPPTName] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:CKPluginChatItemPPTName] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"TestMarkAsRead"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"Resize"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"MacResize"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"MacActivate"] == (id)0x7FFFFFFFFFFFFFFFLL
    && [*(id *)(a1 + 40) rangeOfString:@"MacEnterExitFullscreen"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 40) rangeOfString:@"Nano"];
    return 1;
  }
  uint64_t v3 = [*(id *)(a1 + 40) rangeOfString:@"Landscape"] == (id)0x7FFFFFFFFFFFFFFFLL ? 1 : 3;
  if ([UIApp rotateIfNeeded:v3]) {
    return 1;
  }
  if ([*(id *)(a1 + 40) rangeOfString:v2] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 32) startShowMessagesTest:*(void *)(a1 + 48)];
    return 1;
  }
  if ([*(id *)(a1 + 40) rangeOfString:kShowPeoplePickerTest] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = "startShowPeoplePickerTest:";
LABEL_61:
    [v6 performSelector:v7 withObject:*(void *)(a1 + 48) afterDelay:1.0];
    return 1;
  }
  if ([*(id *)(a1 + 40) rangeOfString:kCancelPeoplePickerTest] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = "startCancelPeoplePickerTest:";
    goto LABEL_61;
  }
  if ([*(id *)(a1 + 40) rangeOfString:kSelectContactPeoplePickerTest] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = "startSelectContactPeoplePickerTest:";
    goto LABEL_61;
  }
  if ([*(id *)(a1 + 40) rangeOfString:kShowNewComposeTest] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = "startShowNewComposeTest:";
    goto LABEL_61;
  }
  if ([*(id *)(a1 + 40) rangeOfString:kResolveContactExistingConvTest] != (id)0x7FFFFFFFFFFFFFFFLL
    || [*(id *)(a1 + 40) rangeOfString:kResolveContactNewConvTest] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 32) startResolveContactTest:*(void *)(a1 + 48)];
    return 1;
  }
  if ([*(id *)(a1 + 40) rangeOfString:@"ComposeToPseudoContact"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = "startComposeMessageToPseudoContactTest:";
    goto LABEL_61;
  }
  if ([*(id *)(a1 + 40) rangeOfString:@"ScrollConversations"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 32) startScrollConversationsTest:*(void *)(a1 + 48)];
    return 1;
  }
  if ([*(id *)(a1 + 40) rangeOfString:@"ScrollTranscript"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 32) startScrollTranscriptTest:*(void *)(a1 + 48)];
    return 1;
  }
  id v4 = [*(id *)(a1 + 40) rangeOfString:@"StaticTranscript"];
  uint64_t v5 = *(void **)(a1 + 40);
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [v5 rangeOfString:@"FSM"];
    v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
      [v10 startStaticTranscriptFPSTest:v11];
    }
    else {
      [v10 startStaticFSMFPSTest:v11];
    }
    return 1;
  }
  if ([v5 rangeOfString:CKAudioBalloonPlaybackPPTName] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 32) startAudioBalloonPlaybackTest:*(void *)(a1 + 48)];
    return 1;
  }
  if ([*(id *)(a1 + 40) rangeOfString:@"ScrollPseudoContactNames"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 32) startScrollPseudoContactNamesTest:*(void *)(a1 + 48)];
    return 1;
  }
  if ([*(id *)(a1 + 40) rangeOfString:@"Rotation"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 32) startRotationTest:*(void *)(a1 + 48)];
    return 1;
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"InvisibleInkStaticFPSTest"])
  {
    [*(id *)(a1 + 32) startInvisibleInkStaticFPSTest];
    return 1;
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"AudioWaveformFPSTest"])
  {
    [*(id *)(a1 + 32) startAudioWaveformFPSTest];
    return 1;
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"GifPlaybackStaticFPSTest"])
  {
    [*(id *)(a1 + 32) startGifPlaybackStaticFPSTest];
    return 1;
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"RotateTranscript"])
  {
    [*(id *)(a1 + 32) startRotationTestWithTranscript:*(void *)(a1 + 48)];
    return 1;
  }
  id v12 = [*(id *)(a1 + 40) rangeOfString:@"Photo"];
  v13 = *(void **)(a1 + 40);
  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = [v13 rangeOfString:kThrowAnimationPPTTestNamePrefix];
    v15 = *(void **)(a1 + 40);
    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v16 = [v15 rangeOfString:@"NewCompose"];
      v17 = *(void **)(a1 + 32);
      if (v16 == (id)0x7FFFFFFFFFFFFFFFLL) {
        [v17 startSendAnimationExistingTest];
      }
      else {
        [v17 startSendAnimationNewComposeTest:*(void *)(a1 + 48)];
      }
      return 1;
    }
    if ([v15 rangeOfString:@"DetailsView"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 32) startDetailsTest:*(void *)(a1 + 48)];
      return 1;
    }
    if ([*(id *)(a1 + 40) rangeOfString:@"AudioReply"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 32) startStuckAudioPillTest:*(void *)(a1 + 48)];
      return 1;
    }
    if ([*(id *)(a1 + 40) rangeOfString:@"PresentKeyboardTest"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 32) startKeyboardPresentationTest:*(void *)(a1 + 48)];
      return 1;
    }
    if ([*(id *)(a1 + 40) rangeOfString:@"PresentKeyboardResponsivenessTest"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 32) startKeyboardResponsivenessTest:*(void *)(a1 + 48)];
      return 1;
    }
    if ([*(id *)(a1 + 40) rangeOfString:@"PresentQuicklookTest"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 32) startQuicklookPresentationTest:*(void *)(a1 + 48)];
      return 1;
    }
    if ([*(id *)(a1 + 40) rangeOfString:@"StickerDragFPSTest"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 32) startInteractiveStickerDragTest:*(void *)(a1 + 48)];
      return 1;
    }
    if ([*(id *)(a1 + 40) rangeOfString:@"ExtensionLaunch"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([*(id *)(a1 + 40) rangeOfString:@"ExtensionTest"] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([*(id *)(a1 + 40) rangeOfString:@"TestPriorityBoosting"] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if ([*(id *)(a1 + 40) rangeOfString:CKPluginChatItemPPTName] == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if ([*(id *)(a1 + 40) rangeOfString:@"TestMarkAsReadLocally"] == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if ([*(id *)(a1 + 40) rangeOfString:@"TestMarkAsReadReceived"] == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                if ([*(id *)(a1 + 40) rangeOfString:@"Resize"] == (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  if ([*(id *)(a1 + 40) rangeOfString:@"MacResize"] == (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    if ([*(id *)(a1 + 40) rangeOfString:@"MacActivate"] == (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      if ([*(id *)(a1 + 40) rangeOfString:@"MacEnterExitFullscreen"] != (id)0x7FFFFFFFFFFFFFFFLL) {
                        [*(id *)(a1 + 32) startMacFullscreenTestWithOptions:*(void *)(a1 + 48)];
                      }
                    }
                    else
                    {
                      [*(id *)(a1 + 32) startMacActivateTestWithOptions:*(void *)(a1 + 48)];
                    }
                  }
                  else
                  {
                    [*(id *)(a1 + 32) startMacResizeTestWithOptions:*(void *)(a1 + 48)];
                  }
                }
                else
                {
                  [*(id *)(a1 + 32) startResizeTestWithOptions:*(void *)(a1 + 48)];
                }
              }
              else
              {
                [*(id *)(a1 + 32) startMarkAsReadReceivedTestWithOptions:*(void *)(a1 + 48)];
              }
            }
            else
            {
              [*(id *)(a1 + 32) startMarkAsReadLocallyTestWithOptions:*(void *)(a1 + 48)];
            }
          }
          else
          {
            [*(id *)(a1 + 32) startLiveBubbleLoadingTest:qword_10003AE50];
          }
        }
        else
        {
          [*(id *)(a1 + 32) startPriorityBoostingTestWithOptions:*(void *)(a1 + 48)];
        }
        return 1;
      }
      v18 = *(void **)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 48);
      uint64_t v20 = 0;
    }
    else
    {
      v18 = *(void **)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 48);
      uint64_t v20 = 1;
    }
    [v18 startExtensionTest:v19 launch:v20];
    return 1;
  }
  if ([v13 isEqualToString:@"ScrollPhotoPicker"]) {
    [*(id *)(a1 + 32) scrollPhotoPickerTestWithOptions:*(void *)(a1 + 48)];
  }
  return 1;
}

void sub_100005E48(uint64_t a1)
{
  uint64_t v2 = +[CKConversationList sharedConversationList];
  uint64_t v3 = [v2 conversationForExistingChatWithChatIdentifier:*(void *)(a1 + 32)];

  if (v3)
  {
    id v4 = +[CKDraftManager sharedInstance];
    [v4 setDraft:0 forConversation:v3];

    uint64_t v5 = +[CKDraftManager sharedInstance];
    [v5 saveCompositionAndFlushCache:1];

    id v6 = *(void **)(a1 + 40);
    id v7 = +[NSNotificationCenter defaultCenter];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100005FD0;
    v10[3] = &unk_100030AA8;
    id v11 = *(id *)(a1 + 48);
    [v6 installNotificationObserverForNotificationName:v7 notificationName:@"PPTDidShowConversationEvent" forOneNotification:1 usingBlock:v10];

    uint64_t v8 = *(void *)(a1 + 56);
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
    id v9 = [*(id *)(a1 + 40) messagesController];
    [v9 showConversation:v3 animate:1];
  }
  else
  {
    [*(id *)(a1 + 40) startedTest:__CurrentTestName];
    [*(id *)(a1 + 40) failedTest:__CurrentTestName];
  }
}

uint64_t sub_100005FD0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100006104(uint64_t a1)
{
  return [*(id *)(a1 + 32) startedTest:__CurrentTestName];
}

uint64_t sub_100006118(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void sub_1000061D0(uint64_t a1)
{
  unsigned int v2 = +[UIDevice __ck_currentDeviceIsPadOrMac];
  uint64_t v3 = [*(id *)(a1 + 32) messagesController];
  id v5 = v3;
  if (v2)
  {
    [v3 _hideConversationListForIPadPPTTest];

    id v4 = *(void **)(a1 + 32);
    [v4 didShowTranscriptList];
  }
  else
  {
    [v3 showConversationListWithAnimation:*(unsigned __int8 *)(a1 + 40)];
  }
}

id sub_100006750()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_10003AEB0;
  uint64_t v7 = qword_10003AEB0;
  if (!qword_10003AEB0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001AFE4;
    v3[3] = &unk_100031068;
    v3[4] = &v4;
    sub_10001AFE4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10000681C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100006834()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_10003AEC0;
  uint64_t v7 = qword_10003AEC0;
  if (!qword_10003AEC0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001B1A4;
    v3[3] = &unk_100031068;
    v3[4] = &v4;
    sub_10001B1A4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100006900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100006B40(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedSubTest:@"Close Message Responsiveness" forTest:__CurrentTestName];
}

void sub_100007008(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) indexPathForCell:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSLog(@"SHANA - trnscript cells %@ - index path %@", v9, v6);
    uint64_t v7 = [*(id *)(a1 + 40) collectionViewController];
    uint64_t v8 = [v9 balloonView];
    [v7 balloonViewTapped:v8 withModifierFlags:0 selectedText:0];

    *a4 = 1;
  }
}

void sub_10000723C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) entryView];
  [v2 performSelector:"audioReplyButtonStart:" withObject:0];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000730C;
  v6[3] = &unk_100030B70;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_10000730C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) entryView];
  [v2 performSelector:"audioReplyButtonStop:" withObject:0];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000073DC;
  v6[3] = &unk_100030B70;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_1000073DC(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) entryView];
  [v2 touchUpInsideSendButton:0];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000748C;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 40);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000748C(uint64_t a1)
{
  return [*(id *)(a1 + 32) playAudioMessage];
}

void sub_100007670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007690(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000076A0(uint64_t a1)
{
}

void sub_1000076A8(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showNewMessageCompositionPanelWithRecipients:*(void *)(a1 + 40) composition:*(void *)(a1 + 48) animated:1];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007760;
  v5[3] = &unk_100030BC0;
  uint64_t v4 = *(void *)(a1 + 56);
  v5[4] = *(void *)(a1 + 32);
  v5[5] = v4;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_100007760(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  dispatch_time_t v3 = [v2 composeChatController];
  uint64_t v4 = [v3 entryView];
  [v4 touchUpInsideSendButton:0];

  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007838;
  v6[3] = &unk_100030BC0;
  long long v7 = *(_OWORD *)(a1 + 32);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_100007838(uint64_t a1)
{
  [*(id *)(a1 + 32) showTranscriptListNotAnimated];
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000078D4;
  v3[3] = &unk_100030BC0;
  long long v4 = *(_OWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_1000078D4(uint64_t a1)
{
  [*(id *)(a1 + 32) sendAudioMessage];
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007974;
  v3[3] = &unk_100030B98;
  long long v4 = *(_OWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_100007974(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) messagesController];
  uint64_t v3 = [v2 chatController];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v7 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) expected:1 withResultsDictionary:v6];
  unsigned int v8 = v7 & [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) expected:0 withResultsDictionary:v6];
  unsigned int v9 = [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) expected:1 withResultsDictionary:v6];
  unsigned int v10 = v8 & v9 & [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) expected:0 withResultsDictionary:v6];
  unsigned int v11 = v10 & [*(id *)(a1 + 32) validateIAVisExpanded:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) expected:0 withResultsDictionary:v6];
  unsigned int v12 = [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) expected:1 withResultsDictionary:v6];
  if ((v11 & v12) != 0) {
    CFStringRef v13 = @":D";
  }
  else {
    CFStringRef v13 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v11 & v12 forKey:@"|--All Tests Passed--|" comment:v13 resultsDictionary:v6];
  dispatch_time_t v14 = dispatch_time(0, 1000000000);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100007B44;
  v16[3] = &unk_100030B70;
  v16[4] = *(void *)(a1 + 32);
  id v17 = v6;
  id v15 = v6;
  dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v16);
}

id sub_100007B44(uint64_t a1)
{
  [*(id *)(a1 + 32) deleteTopChat];
  uint64_t v2 = __CurrentTestName;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 finishedTest:v2 extraResults:v4];
}

void sub_100007CCC(uint64_t a1)
{
  uint64_t v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Test Alert" value:&stru_100031290 table:0];
  uint64_t v4 = +[UIAlertController alertControllerWithTitle:0 message:v3 preferredStyle:1];

  dispatch_time_t v5 = [*(id *)(a1 + 32) messagesController];
  [v5 presentViewController:v4 animated:1 completion:0];

  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007E08;
  v8[3] = &unk_100030B70;
  unsigned int v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);
}

void sub_100007E08(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007EBC;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100007EBC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  id v8 = [v2 chatController];

  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:v8 expected:1 withResultsDictionary:v3];
  unsigned int v5 = v4 & [*(id *)(a1 + 32) validateTranscriptControllerIsFirstResponder:v8 expected:1 withResultsDictionary:v3];
  unsigned int v6 = [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:v8 expected:1 withResultsDictionary:v3];
  if ((v5 & v6) != 0) {
    CFStringRef v7 = @":D";
  }
  else {
    CFStringRef v7 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v5 & v6 forKey:@"|--All Tests Passed--|" comment:v7 resultsDictionary:v3];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v3];
}

void sub_100008100(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000081B4;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000081B4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  dispatch_time_t v3 = [v2 chatController];

  [v3 performSelector:"actionMenuGestureRecognizerButtonGestureDidBegin:" withObject:0];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000082A0;
  v7[3] = &unk_100030B70;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v7);
}

void sub_1000082A0(uint64_t a1)
{
  [UIApp rotateIfNeeded:4];
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008360;
  v5[3] = &unk_100030B70;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_100008360(uint64_t a1)
{
  [*(id *)(a1 + 32) ckVideoMessageRecordingViewControllerRecordingCanceled:0];
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008418;
  v5[3] = &unk_100030B70;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_100008418(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) entryView];
  [v2 performSelector:"actionMenuGestureRecognizerButtonGestureDidBegin:" withObject:0];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000084F4;
  block[3] = &unk_100030B70;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000084F4(uint64_t a1)
{
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v2 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(a1 + 40) expected:1 withResultsDictionary:v5];
  unsigned int v3 = [*(id *)(a1 + 32) validateActionMenuWindowOrientationExpectedOrientation:4 withResultsDictionary:v5];
  if ((v2 & v3) != 0) {
    CFStringRef v4 = @":D";
  }
  else {
    CFStringRef v4 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v2 & v3 forKey:@"|--All Tests Passed--|" comment:v4 resultsDictionary:v5];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v5];
}

void sub_10000863C(uint64_t a1)
{
  unsigned int v2 = +[CKConversationList sharedConversationList];
  id v6 = [v2 conversations];

  uint64_t v3 = qword_10003AE88;
  CFStringRef v4 = (char *)[v6 count] + 1;
  id v5 = *(void **)(a1 + 32);
  if ((char *)v3 == v4) {
    [v5 finishedTest:__CurrentTestName];
  }
  else {
    [v5 failedTest:__CurrentTestName withFailure:@"conversation count not the same"];
  }
}

void sub_100008A74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  id v1 = [v2 conversationListController];
  [v1 batchDeleteButtonTapped:0];
}

id sub_100008AD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) batchDeleteButtonTapped:0];
}

void sub_100008DBC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100008D38);
  }
  _Unwind_Resume(a1);
}

void sub_100008F28(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  id v2 = *(void **)(a1 + 32);
  +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, [v2 mapSectionIdentifierForCurrentConversationListClass:6]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 deleteChat:v3];
}

void sub_10000909C(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  id v2 = +[CKConversationList sharedConversationList];
  id v3 = [v2 conversations];

  id v4 = [v3 count];
  id v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    [v5 failedTest:__CurrentTestName withFailure:@"No conversations in conversation list"];
    goto LABEL_11;
  }
  id v6 = [v5 messagesController];
  int8x16_t v7 = [v6 chatController];

  id v8 = +[CKConversationList sharedConversationList];
  uint64_t v9 = [v8 conversationForExistingChatWithChatIdentifier:*(void *)(a1 + 40)];

  unsigned int v10 = [*(id *)(a1 + 32) messagesController];
  if ([v10 isCollapsed]) {
    goto LABEL_8;
  }
  unsigned int v11 = [v7 conversation];
  if (v9 != v11 || (unint64_t)[v3 count] < 3)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  int v12 = *(unsigned __int8 *)(a1 + 48);

  if (v12)
  {
    unsigned int v10 = +[CKConversationList sharedConversationList];
    [v10 conversationForExistingChatWithChatIdentifier:@"+14087240720"];
    uint64_t v9 = v11 = v9;
    goto LABEL_7;
  }
LABEL_9:
  CFStringRef v13 = +[CKDraftManager sharedInstance];
  [v13 setDraft:0 forConversation:v9];

  dispatch_time_t v14 = +[CKDraftManager sharedInstance];
  [v14 saveCompositionAndFlushCache:1];

  id v15 = [*(id *)(a1 + 32) messagesController];
  [v15 showConversation:v9 animate:1];

  id v16 = [*(id *)(a1 + 32) messagesController];
  id v17 = [v16 chatController];

  dispatch_time_t v18 = dispatch_time(0, 1000000000);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100009310;
  v20[3] = &unk_100030B70;
  v20[4] = *(void *)(a1 + 32);
  id v21 = v17;
  id v19 = v17;
  dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, v20);

LABEL_11:
}

void sub_100009310(uint64_t a1)
{
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v2 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(a1 + 40) expected:1 withResultsDictionary:v10];
  unsigned int v3 = v2 & [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:*(void *)(a1 + 40) expected:0 withResultsDictionary:v10];
  unsigned int v4 = [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:*(void *)(a1 + 40) expected:1 withResultsDictionary:v10];
  unsigned int v5 = v3 & v4 & [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:*(void *)(a1 + 40) expected:0 withResultsDictionary:v10];
  unsigned int v6 = [*(id *)(a1 + 32) validateIAVisExpanded:*(void *)(a1 + 40) expected:0 withResultsDictionary:v10];
  unsigned int v7 = v5 & v6 & [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:*(void *)(a1 + 40) expected:1 withResultsDictionary:v10];
  unsigned int v8 = [*(id *)(a1 + 32) validateTranscriptPreviewCacheHasResumed:*(void *)(a1 + 40) expected:1 withResultsDictionary:v10];
  if ((v7 & v8) != 0) {
    CFStringRef v9 = @":D";
  }
  else {
    CFStringRef v9 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v7 & v8 forKey:@"|--All Tests Passed--|" comment:v9 resultsDictionary:v10];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v10];
}

void sub_100009590(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  id v12 = [v2 chatController];

  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:v12 expected:1 withResultsDictionary:v3];
  unsigned int v5 = v4 & [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:v12 expected:1 withResultsDictionary:v3];
  unsigned int v6 = [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:v12 expected:1 withResultsDictionary:v3];
  unsigned int v7 = v5 & v6 & [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:v12 expected:1 withResultsDictionary:v3];
  unsigned int v8 = [*(id *)(a1 + 32) validateIAVisExpanded:v12 expected:0 withResultsDictionary:v3];
  unsigned int v9 = v7 & v8 & [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:v12 expected:1 withResultsDictionary:v3];
  unsigned int v10 = [*(id *)(a1 + 32) validateTranscriptPreviewCacheHasResumed:v12 expected:1 withResultsDictionary:v3];
  if ((v9 & v10) != 0) {
    CFStringRef v11 = @":D";
  }
  else {
    CFStringRef v11 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v9 & v10 forKey:@"|--All Tests Passed--|" comment:v11 resultsDictionary:v3];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v3];
}

void sub_100009790(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = +[CKConversationList sharedConversationList];
  id v3 = [v2 conversations];

  id v4 = [v3 count];
  unsigned int v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    [v5 failedTest:__CurrentTestName withFailure:@"No conversations in conversation list"];
    goto LABEL_10;
  }
  unsigned int v6 = [v5 messagesController];
  unsigned int v7 = [v6 chatController];

  unsigned int v8 = +[CKConversationList sharedConversationList];
  unsigned int v9 = [v8 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

  unsigned int v10 = [*(id *)(a1 + 32) messagesController];
  if ([v10 isCollapsed]) {
    goto LABEL_7;
  }
  CFStringRef v11 = [v7 conversation];
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  id v12 = [v3 count];

  if ((unint64_t)v12 >= 3)
  {
    unsigned int v10 = +[CKConversationList sharedConversationList];
    uint64_t v13 = [v10 conversationForExistingChatWithChatIdentifier:@"+14087240720"];
    CFStringRef v11 = v9;
    unsigned int v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  id v14 = objc_alloc((Class)NSAttributedString);
  id v15 = +[NSBundle mainBundle];
  id v16 = [v15 localizedStringForKey:@"Test Draft!" value:&stru_100031290 table:0];
  id v17 = [v14 initWithString:v16];

  id v18 = [objc_alloc((Class)CKComposition) initWithText:v17 subject:0];
  id v19 = +[CKDraftManager sharedInstance];
  [v19 setDraft:v18 forConversation:v9];

  uint64_t v20 = +[CKDraftManager sharedInstance];
  [v20 saveCompositionAndFlushCache:1];

  id v21 = [*(id *)(a1 + 32) messagesController];
  [v21 showConversation:v9 animate:1];

  v22 = [*(id *)(a1 + 32) messagesController];
  v23 = [v22 chatController];

  dispatch_time_t v24 = dispatch_time(0, 2000000000);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100009A84;
  v26[3] = &unk_100030B70;
  v26[4] = *(void *)(a1 + 32);
  id v27 = v23;
  id v25 = v23;
  dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, v26);

LABEL_10:
}

void sub_100009A84(uint64_t a1)
{
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v2 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  unsigned int v3 = v2 & [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  uint64_t v4 = v3 & [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  unsigned int v5 = [*(id *)(a1 + 32) messagesController];
  unsigned int v6 = [v5 isCollapsed];

  if (v6)
  {
    unsigned int v7 = [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
    uint64_t v4 = v4 & v7 & [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  }
  if (v4) {
    CFStringRef v8 = @":D";
  }
  else {
    CFStringRef v8 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v4 forKey:@"|--All Tests Passed--|" comment:v8 resultsDictionary:v9];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v9];
}

void sub_100009C3C(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = +[CKConversationList sharedConversationList];
  unsigned int v3 = [v2 conversations];

  id v4 = [v3 count];
  unsigned int v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    [v5 failedTest:__CurrentTestName withFailure:@"No conversations in conversation list"];
    goto LABEL_10;
  }
  unsigned int v6 = [v5 messagesController];
  unsigned int v7 = [v6 chatController];

  CFStringRef v8 = +[CKConversationList sharedConversationList];
  id v9 = [v8 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

  unsigned int v10 = [*(id *)(a1 + 32) messagesController];
  if ([v10 isCollapsed]) {
    goto LABEL_7;
  }
  CFStringRef v11 = [v7 conversation];
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  id v12 = [v3 count];

  if ((unint64_t)v12 >= 3)
  {
    unsigned int v10 = +[CKConversationList sharedConversationList];
    uint64_t v13 = [v10 conversationForExistingChatWithChatIdentifier:@"+14087240720"];
    CFStringRef v11 = v9;
    id v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  id v14 = objc_alloc((Class)NSAttributedString);
  id v15 = +[NSBundle mainBundle];
  id v16 = [v15 localizedStringForKey:@"This is a test draft that is very long so that it may expand the entry view." value:&stru_100031290 table:0];
  id v17 = [v14 initWithString:v16];

  id v18 = [objc_alloc((Class)CKComposition) initWithText:v17 subject:0];
  id v19 = +[CKDraftManager sharedInstance];
  [v19 setDraft:v18 forConversation:v9];

  uint64_t v20 = +[CKDraftManager sharedInstance];
  [v20 saveCompositionAndFlushCache:0];

  id v21 = [*(id *)(a1 + 32) messagesController];
  [v21 showConversation:v9 animate:1];

  v22 = [*(id *)(a1 + 32) messagesController];
  v23 = [v22 chatController];

  dispatch_time_t v24 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009F44;
  block[3] = &unk_100030A58;
  uint64_t v25 = *(void *)(a1 + 32);
  id v29 = v23;
  uint64_t v30 = v25;
  id v31 = v9;
  id v26 = v9;
  id v27 = v23;
  dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, block);

LABEL_10:
}

void sub_100009F44(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissKeyboard];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A018;
  block[3] = &unk_100030A58;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  id v7 = *(id *)(a1 + 48);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000A018(uint64_t a1)
{
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v2 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(a1 + 40) expected:1 withResultsDictionary:v12];
  unsigned int v3 = v2 & [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:*(void *)(a1 + 40) expected:1 withResultsDictionary:v12];
  unsigned int v4 = [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:*(void *)(a1 + 40) expected:1 withResultsDictionary:v12];
  uint64_t v5 = v3 & v4 & [*(id *)(a1 + 32) validateIAVisExpanded:*(void *)(a1 + 40) expected:0 withResultsDictionary:v12];
  int8x16_t v6 = [*(id *)(a1 + 32) messagesController];
  unsigned int v7 = [v6 isCollapsed];

  if (v7)
  {
    unsigned int v8 = [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:*(void *)(a1 + 40) expected:0 withResultsDictionary:v12];
    uint64_t v5 = v5 & v8 & [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:*(void *)(a1 + 40) expected:0 withResultsDictionary:v12];
  }
  if (v5) {
    CFStringRef v9 = @":D";
  }
  else {
    CFStringRef v9 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v5 forKey:@"|--All Tests Passed--|" comment:v9 resultsDictionary:v12];
  unsigned int v10 = +[CKDraftManager sharedInstance];
  [v10 setDraft:0 forConversation:*(void *)(a1 + 48)];

  CFStringRef v11 = +[CKDraftManager sharedInstance];
  [v11 saveCompositionAndFlushCache:1];

  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v12];
}

void sub_10000A228(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = +[CKConversationList sharedConversationList];
  unsigned int v3 = [v2 conversations];

  id v4 = [v3 count];
  uint64_t v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    [v5 failedTest:__CurrentTestName withFailure:@"No conversations in conversation list"];
    goto LABEL_10;
  }
  int8x16_t v6 = [v5 messagesController];
  unsigned int v7 = [v6 chatController];

  unsigned int v8 = +[CKConversationList sharedConversationList];
  CFStringRef v9 = [v8 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

  unsigned int v10 = [*(id *)(a1 + 32) messagesController];
  if ([v10 isCollapsed]) {
    goto LABEL_7;
  }
  CFStringRef v11 = [v7 conversation];
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  id v12 = [v3 count];

  if ((unint64_t)v12 >= 3)
  {
    unsigned int v10 = +[CKConversationList sharedConversationList];
    uint64_t v13 = [v10 conversationForExistingChatWithChatIdentifier:@"+14087240720"];
    CFStringRef v11 = v9;
    CFStringRef v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  id v14 = +[CKDraftManager sharedInstance];
  [v14 setDraft:0 forConversation:v9];

  id v15 = +[CKDraftManager sharedInstance];
  [v15 saveCompositionAndFlushCache:1];

  id v16 = [*(id *)(a1 + 32) messagesController];
  [v16 showConversation:v9 animate:1];

  id v17 = [*(id *)(a1 + 32) messagesController];
  id v18 = [v17 chatController];

  dispatch_time_t v19 = dispatch_time(0, 1000000000);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000A49C;
  v22[3] = &unk_100030B70;
  uint64_t v20 = *(void *)(a1 + 32);
  id v23 = v18;
  uint64_t v24 = v20;
  id v21 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v22);

LABEL_10:
}

void sub_10000A49C(uint64_t a1)
{
  [*(id *)(a1 + 32) performSelector:"_detailsButtonPressed" withObject:0];
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A55C;
  v5[3] = &unk_100030B70;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_10000A55C(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) navigationController];
  id v3 = [v2 popToRootViewControllerAnimated:1];

  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A638;
  block[3] = &unk_100030B70;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000A638(uint64_t a1)
{
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v2 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  unsigned int v3 = v2 & [*(id *)(a1 + 32) validateIAVisExpanded:*(void *)(a1 + 40) expected:0 withResultsDictionary:v9];
  unsigned int v4 = [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:*(void *)(a1 + 40) expected:0 withResultsDictionary:v9];
  unsigned int v5 = v3 & v4 & [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  unsigned int v6 = v5 & [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:*(void *)(a1 + 40) expected:0 withResultsDictionary:v9];
  unsigned int v7 = [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  if ((v6 & v7) != 0) {
    CFStringRef v8 = @":D";
  }
  else {
    CFStringRef v8 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v6 & v7 forKey:@"|--All Tests Passed--|" comment:v8 resultsDictionary:v9];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v9];
}

void sub_10000A7E0(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = +[CKConversationList sharedConversationList];
  unsigned int v3 = [v2 conversations];

  id v4 = [v3 count];
  unsigned int v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    [v5 failedTest:__CurrentTestName withFailure:@"No conversations in conversation list"];
    goto LABEL_10;
  }
  unsigned int v6 = [v5 messagesController];
  unsigned int v7 = [v6 chatController];

  CFStringRef v8 = +[CKConversationList sharedConversationList];
  id v9 = [v8 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

  unsigned int v10 = [*(id *)(a1 + 32) messagesController];
  if ([v10 isCollapsed]) {
    goto LABEL_7;
  }
  CFStringRef v11 = [v7 conversation];
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  id v12 = [v3 count];

  if ((unint64_t)v12 >= 3)
  {
    unsigned int v10 = +[CKConversationList sharedConversationList];
    uint64_t v13 = [v10 conversationForExistingChatWithChatIdentifier:@"+14087240720"];
    CFStringRef v11 = v9;
    id v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  id v14 = +[CKDraftManager sharedInstance];
  [v14 setDraft:0 forConversation:v9];

  id v15 = +[CKDraftManager sharedInstance];
  [v15 saveCompositionAndFlushCache:1];

  id v16 = [*(id *)(a1 + 32) messagesController];
  [v16 showConversation:v9 animate:1];

  id v17 = [*(id *)(a1 + 32) messagesController];
  id v18 = [v17 chatController];

  dispatch_time_t v19 = dispatch_time(0, 1000000000);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000AA54;
  v22[3] = &unk_100030B70;
  uint64_t v20 = *(void *)(a1 + 32);
  id v23 = v18;
  uint64_t v24 = v20;
  id v21 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v22);

LABEL_10:
}

void sub_10000AA54(uint64_t a1)
{
  [*(id *)(a1 + 32) showKeyboardForReply];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000AB08;
  v5[3] = &unk_100030B70;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_10000AB08(uint64_t a1)
{
  [*(id *)(a1 + 32) performSelector:"_detailsButtonPressed" withObject:0];
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000ABC8;
  v5[3] = &unk_100030B70;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_10000ABC8(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) navigationController];
  id v3 = [v2 presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ACB8;
  block[3] = &unk_100030B70;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000ACB8(uint64_t a1)
{
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v2 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  unsigned int v3 = v2 & [*(id *)(a1 + 32) validateIAVisExpanded:*(void *)(a1 + 40) expected:0 withResultsDictionary:v9];
  unsigned int v4 = [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  unsigned int v5 = v3 & v4 & [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  unsigned int v6 = v5 & [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  unsigned int v7 = [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:*(void *)(a1 + 40) expected:1 withResultsDictionary:v9];
  if ((v6 & v7) != 0) {
    CFStringRef v8 = @":D";
  }
  else {
    CFStringRef v8 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v6 & v7 forKey:@"|--All Tests Passed--|" comment:v8 resultsDictionary:v9];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v9];
}

void sub_10000AF08(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) sceneController];
  unsigned int v3 = [v2 messagesSceneDelegate];

  unsigned int v4 = [v3 madridRegistrationController];
  [v3 setShouldShowRegistrationOverride:0];
  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:IMAccountControllerOperationalAccountsChangedNotification object:0];

  unsigned int v6 = [v4 completionBlock];
  v6[2](v6, 1);

  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B038;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000B038(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  id v6 = [v2 presentedViewController];

  if (v6)
  {
    unsigned int v3 = *(void **)(a1 + 32);
    uint64_t v4 = __CurrentTestName;
    id v5 = +[NSString stringWithFormat:@"Still presenting %@", v6];
    [v3 failedTest:v4 withFailure:v5];
  }
  else
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [*(id *)(a1 + 32) _recordAllTestsPassed:1 resultsDictionary:v5];
    [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v5];
  }
}

void sub_10000B1B8(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = +[CKConversationList sharedConversationList];
  unsigned int v3 = [v2 conversations];

  id v4 = [v3 count];
  id v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    [v5 failedTest:__CurrentTestName withFailure:@"No conversations in conversation list"];
    goto LABEL_10;
  }
  id v6 = [v5 messagesController];
  dispatch_time_t v7 = [v6 chatController];

  CFStringRef v8 = +[CKConversationList sharedConversationList];
  id v9 = [v8 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

  unsigned int v10 = [*(id *)(a1 + 32) messagesController];
  if ([v10 isCollapsed]) {
    goto LABEL_7;
  }
  CFStringRef v11 = [v7 conversation];
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  id v12 = [v3 count];

  if ((unint64_t)v12 >= 3)
  {
    unsigned int v10 = +[CKConversationList sharedConversationList];
    uint64_t v13 = [v10 conversationForExistingChatWithChatIdentifier:@"+14087240720"];
    CFStringRef v11 = v9;
    id v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  id v14 = +[CKDraftManager sharedInstance];
  [v14 setDraft:0 forConversation:v9];

  id v15 = +[CKDraftManager sharedInstance];
  [v15 saveCompositionAndFlushCache:1];

  id v16 = [*(id *)(a1 + 32) messagesController];
  [v16 showConversation:v9 animate:1];

  id v17 = [*(id *)(a1 + 32) messagesController];
  id v18 = [v17 chatController];

  dispatch_time_t v19 = dispatch_time(0, 1000000000);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000B42C;
  v21[3] = &unk_100030B70;
  v21[4] = *(void *)(a1 + 32);
  id v22 = v18;
  id v20 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v21);

LABEL_10:
}

void sub_10000B42C(uint64_t a1)
{
  [UIApp rotateIfNeeded:3];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000B4EC;
  v4[3] = &unk_100030B70;
  unsigned int v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_10000B4EC(uint64_t a1)
{
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v2 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v3 = v2 & [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v4 = [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:*(void *)(a1 + 40) expected:0 withResultsDictionary:v8];
  unsigned int v5 = v3 & v4 & [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v6 = [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:*(void *)(a1 + 40) expected:0 withResultsDictionary:v8];
  if ((v5 & v6) != 0) {
    CFStringRef v7 = @":D";
  }
  else {
    CFStringRef v7 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v5 & v6 forKey:@"|--All Tests Passed--|" comment:v7 resultsDictionary:v8];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v8];
}

void sub_10000B680(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = +[CKConversationList sharedConversationList];
  unsigned int v3 = [v2 conversations];

  id v4 = [v3 count];
  unsigned int v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    [v5 failedTest:__CurrentTestName withFailure:@"No conversations in conversation list"];
    goto LABEL_10;
  }
  unsigned int v6 = [v5 messagesController];
  CFStringRef v7 = [v6 chatController];

  id v8 = +[CKConversationList sharedConversationList];
  id v9 = [v8 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

  unsigned int v10 = [*(id *)(a1 + 32) messagesController];
  if ([v10 isCollapsed]) {
    goto LABEL_7;
  }
  CFStringRef v11 = [v7 conversation];
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  id v12 = [v3 count];

  if ((unint64_t)v12 >= 3)
  {
    unsigned int v10 = +[CKConversationList sharedConversationList];
    uint64_t v13 = [v10 conversationForExistingChatWithChatIdentifier:@"+14087240720"];
    CFStringRef v11 = v9;
    id v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  id v14 = +[CKDraftManager sharedInstance];
  [v14 setDraft:0 forConversation:v9];

  id v15 = +[CKDraftManager sharedInstance];
  [v15 saveCompositionAndFlushCache:1];

  id v16 = [*(id *)(a1 + 32) messagesController];
  [v16 showConversation:v9 animate:1];

  id v17 = [*(id *)(a1 + 32) messagesController];
  id v18 = [v17 chatController];

  dispatch_time_t v19 = dispatch_time(0, 1000000000);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000B8F4;
  v22[3] = &unk_100030B70;
  uint64_t v20 = *(void *)(a1 + 32);
  id v23 = v18;
  uint64_t v24 = v20;
  id v21 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v22);

LABEL_10:
}

void sub_10000B8F4(uint64_t a1)
{
  [*(id *)(a1 + 32) showKeyboardForReply];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B9B4;
  block[3] = &unk_100030B70;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000B9B4(uint64_t a1)
{
  [UIApp rotateIfNeeded:3];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BA74;
  v4[3] = &unk_100030B70;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_10000BA74(uint64_t a1)
{
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v2 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v3 = v2 & [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v4 = [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v5 = v3 & v4 & [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v6 = [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  if ((v5 & v6) != 0) {
    CFStringRef v7 = @":D";
  }
  else {
    CFStringRef v7 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v5 & v6 forKey:@"|--All Tests Passed--|" comment:v7 resultsDictionary:v8];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v8];
}

void sub_10000BC08(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = +[CKConversationList sharedConversationList];
  unsigned int v3 = [v2 conversations];

  id v4 = [v3 count];
  unsigned int v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    [v5 failedTest:__CurrentTestName withFailure:@"No conversations in conversation list"];
    goto LABEL_10;
  }
  unsigned int v6 = [v5 messagesController];
  CFStringRef v7 = [v6 chatController];

  id v8 = +[CKConversationList sharedConversationList];
  id v9 = [v8 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

  unsigned int v10 = [*(id *)(a1 + 32) messagesController];
  if ([v10 isCollapsed]) {
    goto LABEL_7;
  }
  CFStringRef v11 = [v7 conversation];
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  id v12 = [v3 count];

  if ((unint64_t)v12 >= 3)
  {
    unsigned int v10 = +[CKConversationList sharedConversationList];
    uint64_t v13 = [v10 conversationForExistingChatWithChatIdentifier:@"+14087240720"];
    CFStringRef v11 = v9;
    id v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  id v14 = +[CKDraftManager sharedInstance];
  [v14 setDraft:0 forConversation:v9];

  id v15 = +[CKDraftManager sharedInstance];
  [v15 saveCompositionAndFlushCache:1];

  id v16 = [*(id *)(a1 + 32) messagesController];
  [v16 showConversation:v9 animate:1];

  id v17 = [*(id *)(a1 + 32) messagesController];
  id v18 = [v17 chatController];

  dispatch_time_t v19 = dispatch_time(0, 1000000000);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000BE7C;
  v21[3] = &unk_100030B70;
  v21[4] = *(void *)(a1 + 32);
  id v22 = v18;
  id v20 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v21);

LABEL_10:
}

void sub_10000BE7C(uint64_t a1)
{
  [UIApp rotateIfNeeded:3];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BF3C;
  v4[3] = &unk_100030B70;
  unsigned int v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_10000BF3C(uint64_t a1)
{
  [UIApp rotateIfNeeded:1];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BFFC;
  v4[3] = &unk_100030B70;
  unsigned int v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_10000BFFC(uint64_t a1)
{
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v2 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v3 = v2 & [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v4 = [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:*(void *)(a1 + 40) expected:0 withResultsDictionary:v8];
  unsigned int v5 = v3 & v4 & [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v6 = [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:*(void *)(a1 + 40) expected:0 withResultsDictionary:v8];
  if ((v5 & v6) != 0) {
    CFStringRef v7 = @":D";
  }
  else {
    CFStringRef v7 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v5 & v6 forKey:@"|--All Tests Passed--|" comment:v7 resultsDictionary:v8];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v8];
}

void sub_10000C190(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = +[CKConversationList sharedConversationList];
  unsigned int v3 = [v2 conversations];

  id v4 = [v3 count];
  unsigned int v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    [v5 failedTest:__CurrentTestName withFailure:@"No conversations in conversation list"];
    goto LABEL_10;
  }
  unsigned int v6 = [v5 messagesController];
  CFStringRef v7 = [v6 chatController];

  id v8 = +[CKConversationList sharedConversationList];
  id v9 = [v8 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

  unsigned int v10 = [*(id *)(a1 + 32) messagesController];
  if ([v10 isCollapsed]) {
    goto LABEL_7;
  }
  CFStringRef v11 = [v7 conversation];
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  id v12 = [v3 count];

  if ((unint64_t)v12 >= 3)
  {
    unsigned int v10 = +[CKConversationList sharedConversationList];
    uint64_t v13 = [v10 conversationForExistingChatWithChatIdentifier:@"+14087240720"];
    CFStringRef v11 = v9;
    id v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  id v14 = +[CKDraftManager sharedInstance];
  [v14 setDraft:0 forConversation:v9];

  id v15 = +[CKDraftManager sharedInstance];
  [v15 saveCompositionAndFlushCache:1];

  id v16 = [*(id *)(a1 + 32) messagesController];
  [v16 showConversation:v9 animate:1];

  id v17 = [*(id *)(a1 + 32) messagesController];
  id v18 = [v17 chatController];

  dispatch_time_t v19 = dispatch_time(0, 1000000000);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000C404;
  v22[3] = &unk_100030B70;
  uint64_t v20 = *(void *)(a1 + 32);
  id v23 = v18;
  uint64_t v24 = v20;
  id v21 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v22);

LABEL_10:
}

void sub_10000C404(uint64_t a1)
{
  [*(id *)(a1 + 32) showKeyboardForReply];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C4C4;
  block[3] = &unk_100030B70;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000C4C4(uint64_t a1)
{
  [UIApp rotateIfNeeded:3];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000C584;
  v4[3] = &unk_100030B70;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_10000C584(uint64_t a1)
{
  [UIApp rotateIfNeeded:1];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000C644;
  v4[3] = &unk_100030B70;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_10000C644(uint64_t a1)
{
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v2 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v3 = v2 & [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v4 = [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v5 = v3 & v4 & [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  unsigned int v6 = [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:*(void *)(a1 + 40) expected:1 withResultsDictionary:v8];
  if ((v5 & v6) != 0) {
    CFStringRef v7 = @":D";
  }
  else {
    CFStringRef v7 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v5 & v6 forKey:@"|--All Tests Passed--|" comment:v7 resultsDictionary:v8];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v8];
}

void sub_10000C7D8(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C8A4;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000C8A4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  id v10 = [v2 composeChatController];

  if (v10
    || ([*(id *)(a1 + 32) messagesController],
        dispatch_time_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 isCollapsed],
        v3,
        !v4))
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v6 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:v10 expected:1 withResultsDictionary:v5];
    unsigned int v7 = v6 & [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:v10 expected:0 withResultsDictionary:v5];
    unsigned int v8 = [*(id *)(a1 + 32) validateRecipientSelectionControllerIsFirstResponder:v10 expected:1 withResultsDictionary:v5];
    if ((v7 & v8) != 0) {
      CFStringRef v9 = @":D";
    }
    else {
      CFStringRef v9 = CFSTR(":(");
    }
    [*(id *)(a1 + 32) _recordResult:v7 & v8 forKey:@"|--All Tests Passed--|" comment:v9 resultsDictionary:v5];
    [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v5];
  }
  else
  {
    [*(id *)(a1 + 32) failedTest:__CurrentTestName, @"Couldn't find modal transcript controller, when one should exist" withFailure];
  }
}

void sub_10000CB64(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showNewMessageCompositionPanelWithRecipients:*(void *)(a1 + 40) composition:*(void *)(a1 + 48) animated:1];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CC2C;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000CC2C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  id v10 = [v2 composeChatController];

  if (v10
    || ([*(id *)(a1 + 32) messagesController],
        dispatch_time_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 isCollapsed],
        v3,
        !v4))
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v6 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:v10 expected:1 withResultsDictionary:v5];
    unsigned int v7 = v6 & [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:v10 expected:1 withResultsDictionary:v5];
    unsigned int v8 = [*(id *)(a1 + 32) validateRecipientSelectionControllerIsFirstResponder:v10 expected:0 withResultsDictionary:v5];
    if ((v7 & v8) != 0) {
      CFStringRef v9 = @":D";
    }
    else {
      CFStringRef v9 = CFSTR(":(");
    }
    [*(id *)(a1 + 32) _recordResult:v7 & v8 forKey:@"|--All Tests Passed--|" comment:v9 resultsDictionary:v5];
    [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v5];
  }
  else
  {
    [*(id *)(a1 + 32) failedTest:__CurrentTestName, @"Couldn't find modal transcript controller, when one should exist" withFailure];
  }
}

void sub_10000CEEC(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showNewMessageCompositionPanelWithRecipients:*(void *)(a1 + 40) composition:*(void *)(a1 + 48) animated:1];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CFB4;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000CFB4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D07C;
  v5[3] = &unk_100030B70;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v4 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_10000D07C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  dispatch_time_t v3 = [v2 composeChatController];
  id v4 = [v3 entryView];
  [v4 touchUpInsideSendButton:0];

  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D16C;
  v7[3] = &unk_100030B70;
  id v6 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

void sub_10000D16C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  dispatch_time_t v3 = [(id)v2 chatController];

  LODWORD(v2) = [*(id *)(a1 + 32) validateTranscriptVendingIAV:v3 expected:1 withResultsDictionary:*(void *)(a1 + 40)];
  int v4 = v2 & [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:v3 expected:1 withResultsDictionary:*(void *)(a1 + 40)];
  LODWORD(v2) = [*(id *)(a1 + 32) validateNonzeroTranscriptInsets:v3 expected:1 withResultsDictionary:*(void *)(a1 + 40)];
  LODWORD(v2) = v4 & v2 & [*(id *)(a1 + 32) validateBottomInsetGreaterThanIAVHeight:v3 expected:1 withResultsDictionary:*(void *)(a1 + 40)];
  int v5 = v2 & [*(id *)(a1 + 32) validateTranscriptIsScrolledToBottom:v3 expected:1 withResultsDictionary:*(void *)(a1 + 40)];
  unsigned int v6 = [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:v3 expected:1 withResultsDictionary:*(void *)(a1 + 40)];
  if ((v5 & v6) != 0) {
    CFStringRef v7 = @":D";
  }
  else {
    CFStringRef v7 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v5 & v6 forKey:@"|--All Tests Passed--|" comment:v7 resultsDictionary:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) showTranscriptListNotAnimated];
  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000D2EC;
  v10[3] = &unk_100030B70;
  CFStringRef v9 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v9;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);
}

void sub_10000D2EC(uint64_t a1)
{
  uint64_t v2 = +[CKConversationList sharedConversationList];
  dispatch_time_t v3 = [v2 conversations];

  if ([v3 count])
  {
    int v4 = +[CKConversationList sharedConversationList];
    int v5 = [v4 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

    unsigned int v6 = [*(id *)(a1 + 32) messagesController];
    id v15 = v5;
    CFStringRef v7 = +[NSArray arrayWithObjects:&v15 count:1];
    [v6 conversationListIsDeletingConversations:v7];

    dispatch_time_t v8 = [*(id *)(a1 + 32) messagesController];
    CFStringRef v9 = [v8 conversationListController];
    id v10 = [v9 conversationList];
    [v10 deleteConversation:v5];

    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000D4D4;
    v13[3] = &unk_100030B70;
    id v12 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v12;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v13);
  }
  else
  {
    [*(id *)(a1 + 32) failedTest:__CurrentTestName withFailure:@"New compose message draft wasn't sent"];
  }
}

id sub_10000D4D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:*(void *)(a1 + 40)];
}

void sub_10000D58C(uint64_t a1, void *a2)
{
  dispatch_time_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _recordAllTestsPassed:1 resultsDictionary:v4];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v4];
}

void sub_10000D68C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  id v8 = [v2 composeChatController];

  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:v8 expected:1 withResultsDictionary:v3];
  unsigned int v5 = v4 & [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:v8 expected:0 withResultsDictionary:v3];
  unsigned int v6 = [*(id *)(a1 + 32) validateRecipientSelectionControllerIsFirstResponder:v8 expected:1 withResultsDictionary:v3];
  if ((v5 & v6) != 0) {
    CFStringRef v7 = @":D";
  }
  else {
    CFStringRef v7 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v5 & v6 forKey:@"|--All Tests Passed--|" comment:v7 resultsDictionary:v3];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v3];
}

id sub_10000D84C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D8C0;
  v4[3] = &unk_100030A30;
  v4[4] = v2;
  return [v2 _dismissPeoplePickerWithCompletion:v1 completion:v4];
}

void sub_10000D8C0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D978;
  v4[3] = &unk_100030C60;
  v4[4] = *(void *)(a1 + 32);
  [v2 installNotificationObserverForNotificationName:v3 notificationName:CNContactPickerViewControllerPickerDidHideNotification forOneNotification:1 usingBlock:v4];
}

id sub_10000D978(uint64_t a1)
{
  return [*(id *)(a1 + 32) contactPickerDidHide];
}

void sub_10000DA14(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DAE0;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000DAE0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  dispatch_time_t v3 = [v2 composeChatController];

  unsigned int v4 = [v3 composeRecipientSelectionController];
  unsigned int v5 = *(void **)(a1 + 32);
  unsigned int v6 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v7 = CNContactPickerViewControllerPickerDidShowNotification;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10000DC0C;
  uint64_t v13 = &unk_100030C88;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v4;
  id v8 = v4;
  [v5 installNotificationObserverForNotificationName:v6 notificationName:v7 forOneNotification:1 usingBlock:&v10];

  CFStringRef v9 = [v8 toField:v10, v11, v12, v13, v14];
  [v8 composeRecipientViewRequestAddRecipient:v9];
}

id sub_10000DC0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) newComposeDismissContactPicker:*(void *)(a1 + 40)];
}

void sub_10000DCAC(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DD78;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000DD78(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  dispatch_time_t v3 = [v2 composeChatController];

  [v3 performSelector:"cancelButtonTapped:" withObject:0];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000DE64;
  v6[3] = &unk_100030B70;
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_10000DE64(uint64_t a1)
{
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  uint64_t v3 = [v2 isCollapsed] ^ 1;

  unsigned int v4 = [*(id *)(a1 + 32) validateTranscriptVendingIAV:*(void *)(a1 + 40) expected:v3 withResultsDictionary:v7];
  unsigned int v5 = [*(id *)(a1 + 32) validateEntryViewIsFirstResponder:*(void *)(a1 + 40) expected:v3 withResultsDictionary:v7];
  if ((v4 & v5) != 0) {
    CFStringRef v6 = @":D";
  }
  else {
    CFStringRef v6 = CFSTR(":(");
  }
  [*(id *)(a1 + 32) _recordResult:v4 & v5 forKey:@"|--All Tests Passed--|" comment:v6 resultsDictionary:v7];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v7];
}

void sub_10000E01C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) __ck_shuffledArray];
  id v3 = [v2 mutableCopy];

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E0F0;
  v7[3] = &unk_100030CB0;
  void v7[4] = v5;
  id v8 = v4;
  id v6 = v4;
  [v5 _performNextSearchWithRemainingSearches:v3 passedSoFar:1 resultsDictionary:v6 finalCompletion:v7];
}

id sub_10000E0F0(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _recordAllTestsPassed:a2 resultsDictionary:*(void *)(a1 + 40)];
  uint64_t v3 = __CurrentTestName;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 finishedTest:v3 extraResults:v5];
}

void sub_10000E21C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) __ck_shuffledArray];
  id v3 = [v2 mutableCopy];

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E2F0;
  v7[3] = &unk_100030CB0;
  void v7[4] = v5;
  id v8 = v4;
  id v6 = v4;
  [v5 _performNextSearchResultsClearingTestWithRemainingSearches:v3 passedSoFar:1 resultsDictionary:v6 finalCompletion:v7];
}

id sub_10000E2F0(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _recordAllTestsPassed:a2 resultsDictionary:*(void *)(a1 + 40)];
  uint64_t v3 = __CurrentTestName;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 finishedTest:v3 extraResults:v5];
}

void sub_10000E41C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) __ck_shuffledArray];
  id v3 = [v2 mutableCopy];

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E4F0;
  v7[3] = &unk_100030CB0;
  void v7[4] = v5;
  id v8 = v4;
  id v6 = v4;
  [v5 _performNextSearchPartialFirstWithRemainingSearches:v3 passedSoFar:1 resultsDictionary:v6 finalCompletion:v7];
}

id sub_10000E4F0(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _recordAllTestsPassed:a2 resultsDictionary:*(void *)(a1 + 40)];
  uint64_t v3 = __CurrentTestName;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 finishedTest:v3 extraResults:v5];
}

void sub_10000E61C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) __ck_shuffledArray];
  id v3 = [v2 mutableCopy];

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = +[NSDate date];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000E72C;
  v10[3] = &unk_100030CB0;
  void v10[4] = *(void *)(a1 + 40);
  id v11 = v4;
  id v9 = v4;
  [v5 _performNextTapIntoTapOutOfTestWithRemainingSearches:v3 startTime:1 passedSoFar:v9 resultsDictionary:v10 finalCompletion:v8];
}

id sub_10000E72C(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _recordAllTestsPassed:a2 resultsDictionary:*(void *)(a1 + 40)];
  uint64_t v3 = __CurrentTestName;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 finishedTest:v3 extraResults:v5];
}

void sub_10000E810(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) messagesController];
  uint64_t v2 = [v1 conversationListController];
  uint64_t v3 = [v2 searchResultsController];

  uint64_t v5 = [v3 collectionView];
  id v4 = v5;
  ck_dispatch_main_after_seconds();
}

uint64_t sub_10000E8EC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = +[NSIndexPath indexPathForRow:0 inSection:0];
  [v1 selectItemAtIndexPath:v2 animated:0 scrollPosition:0];

  return ck_dispatch_main_after_seconds();
}

void sub_10000E9AC(uint64_t a1)
{
  id v24 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v2 = [*(id *)(a1 + 32) messagesController];
  uint64_t v3 = [v2 chatController];

  id v4 = [v3 collectionViewController];
  uint64_t v5 = [v4 chatItems];

  id v6 = [v5 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v8 = [v3 collectionView];
    id v9 = +[NSIndexPath indexPathForItem:0 inSection:0];
    id v10 = [v8 layoutAttributesForItemAtIndexPath:v9];
    [v10 frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v26.origin.x = v12;
    v26.origin.y = v14;
    v26.size.width = v16;
    v26.size.height = v18;
    double MaxY = CGRectGetMaxY(v26);
    [v8 contentOffset];
    double v21 = MaxY - v20;
    [v8 contentInset];
    BOOL v23 = v21 <= v22;
  }
  else
  {
    BOOL v23 = 0;
  }
  [*(id *)(a1 + 32) _recordAllTestsPassed:v23 resultsDictionary:v24];
  [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:v24];
}

void sub_10000ED90(id *a1)
{
  uint64_t v2 = [a1[4] messagesController];
  uint64_t v3 = [v2 conversationListController];
  id v4 = [v3 searchResultsController];

  uint64_t v5 = [v4 collectionView];
  id v6 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", arc4random() % (uint64_t)[v5 numberOfItemsInSection:0], 0);
  [v5 cellForItemAtIndexPath:v6];

  [v5 scrollToItemAtIndexPath:v6 atScrollPosition:16 animated:1];
  id v9 = v5;
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = a1[7];
  id v13 = a1[8];
  id v14 = a1[9];
  id v7 = v6;
  id v8 = v5;
  ck_dispatch_main_after_seconds();
}

void sub_10000EF78(uint64_t a1)
{
  [*(id *)(a1 + 32) selectItemAtIndexPath:*(void *)(a1 + 40) animated:0 scrollPosition:0];
  id v2 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 64);
  id v4 = *(id *)(a1 + 72);
  id v5 = *(id *)(a1 + 80);
  id v6 = *(id *)(a1 + 88);
  ck_dispatch_main_after_seconds();
}

void sub_10000F07C(id *a1)
{
  id v2 = [a1[4] messagesController];
  id v3 = [v2 conversationListController];
  id v4 = [v3 navigationController];
  id v5 = [v4 popViewControllerAnimated:1];

  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  id v9 = a1[8];
  id v10 = a1[9];
  ck_dispatch_main_after_seconds();
}

id sub_10000F1B8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 messagesController];
  id v4 = [v3 conversationListController];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"Count"];
  unsigned int v7 = [v2 validateNumberOfSearchResultsInConversationListController:v4 searchText:v5 expectedNumber:[v6 integerValue] withResultsDictionary:*(void *)(a1 + 56)];

  id v8 = *(void **)(a1 + 32);
  double v9 = *(double *)(a1 + 80);
  if (*(unsigned char *)(a1 + 88)) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);

  return [v8 _performNextTapIntoTapOutOfTestWithRemainingSearches:v11 startTime:v10 passedSoFar:v12 resultsDictionary:v13 finalCompletion:v9];
}

id sub_10000F4F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextSearchPartialFirstWithRemainingSearches:*(void *)(a1 + 40) passedSoFar:*(unsigned __int8 *)(a1 + 64) resultsDictionary:*(void *)(a1 + 48) finalCompletion:*(void *)(a1 + 56)];
}

void sub_10000F508(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000F5EC;
  v6[3] = &unk_100030D50;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 64);
  char v10 = *(unsigned char *)(a1 + 80);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 72);
  [v2 _searchForString:v3 validateExpectedSearchResults:v4 resultsDictionary:v5 completion:v6];
}

id sub_10000F5EC(uint64_t a1, unsigned int a2)
{
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v2 = a2;
  }
  else {
    uint64_t v2 = 0;
  }
  return [*(id *)(a1 + 32) _performNextSearchPartialFirstWithRemainingSearches:*(void *)(a1 + 40) passedSoFar:v2 resultsDictionary:*(void *)(a1 + 48) finalCompletion:*(void *)(a1 + 56)];
}

void sub_10000F7A8(uint64_t a1, char a2)
{
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 56) stringByAppendingString:@" Great Googly Moogly!"];
  uint64_t v6 = *(void *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F8C0;
  v7[3] = &unk_100030DA0;
  void v7[4] = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 80);
  char v12 = a2;
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  [v4 _searchForString:v5 validateExpectedSearchResults:&off_100034DE8 resultsDictionary:v6 completion:v7];
}

id sub_10000F8C0(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(unsigned char *)(a1 + 65)) {
      uint64_t v4 = a2;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return [v3 _performNextSearchResultsClearingTestWithRemainingSearches:*(void *)(a1 + 40) passedSoFar:v4 resultsDictionary:*(void *)(a1 + 48) finalCompletion:*(void *)(a1 + 56)];
}

void sub_10000FA90(uint64_t a1, char a2)
{
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FB84;
  v7[3] = &unk_100030DA0;
  void v7[4] = v4;
  id v8 = *(id *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 80);
  char v12 = a2;
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  [v4 _clearSearchStringWithPreviousSearchText:v5 resultsDictionary:v6 completion:v7];
}

id sub_10000FB84(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(unsigned char *)(a1 + 65)) {
      uint64_t v4 = a2;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return [v3 _performNextSearchWithRemainingSearches:*(void *)(a1 + 40) passedSoFar:v4 resultsDictionary:*(void *)(a1 + 48) finalCompletion:*(void *)(a1 + 56)];
}

void sub_10000FCF4(id *a1)
{
  id v2 = a1[4];
  id v3 = a1[6];
  id v4 = a1[7];
  id v5 = a1[8];
  ck_dispatch_main_after_seconds();
}

uint64_t sub_10000FDBC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Count"];
  id v3 = [v2 integerValue];

  id v4 = *(void **)(a1 + 40);
  id v5 = [v4 messagesController];
  uint64_t v6 = [v5 conversationListController];
  [v4 validateNumberOfSearchResultsInConversationListController:v6 searchText:*(void *)(a1 + 48) expectedNumber:v3 withResultsDictionary:*(void *)(a1 + 56)];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v7();
}

void sub_100010018(id *a1)
{
  id v2 = a1[5];
  id v3 = a1[6];
  id v4 = a1[7];
  ck_dispatch_main_after_seconds();
}

uint64_t sub_1000100D0(void *a1)
{
  id v2 = (void *)a1[4];
  id v3 = [v2 messagesController];
  id v4 = [v3 conversationListController];
  [v2 validateAtConversationListInConversationListController:v4 previousSearchText:a1[5] withResultsDictionary:a1[6]];

  id v5 = *(uint64_t (**)(void))(a1[7] + 16);

  return v5();
}

void sub_1000110C4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showNewMessageCompositionPanelWithRecipients:*(void *)(a1 + 40) composition:*(void *)(a1 + 48) animated:1];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011178;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100011178(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  dispatch_time_t v3 = [v2 composeChatController];
  id v4 = [v3 entryView];
  [v4 touchUpInsideSendButton:0];

  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011250;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100011250(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:0];
}

void sub_1000113B0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isMuted])
  {
    [*(id *)(a1 + 32) unmute];
  }
  else
  {
    id v2 = +[NSDate date];
    id v3 = objc_alloc_init((Class)NSDateComponents);
    [v3 setHour:4];
    id v4 = +[NSCalendar currentCalendar];
    dispatch_time_t v5 = [v4 dateByAddingComponents:v3 toDate:v2 options:0];

    [*(id *)(a1 + 32) setMutedUntilDate:v5];
  }
  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000114E0;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 40);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1000114E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:0];
}

id sub_1000116B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:0];
}

id sub_100011988(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedSubTest:@"Open Message Responsiveness" forTest:__CurrentTestName];
}

void sub_1000119A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  uint64_t v1 = [v2 conversationListController];
  [v1 endHoldingConversationListUpdatesForPPTTests];
}

uint64_t sub_100011C40(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100011CEC(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"ShowPeoplePicker" forTest:__CurrentTestName];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100011D9C;
  v3[3] = &unk_100030B70;
  id v2 = *(void **)(a1 + 40);
  void v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_100011D9C(uint64_t a1)
{
  if (dword_10003AE60 < 1)
  {
    id v4 = [*(id *)(a1 + 32) messagesController];
    dispatch_time_t v5 = [v4 ppt_chatController];
    [v5 performSelector:"cancelButtonTapped:" withObject:0];

    dispatch_time_t v6 = *(void **)(a1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100011FB0;
    v7[3] = &unk_100030A30;
    void v7[4] = v6;
    [v6 installCACommitCompletionBlock:v7];
  }
  else
  {
    --dword_10003AE60;
    id v3 = *(void **)(a1 + 32);
    id v2 = *(void **)(a1 + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011ED8;
    v8[3] = &unk_100030B70;
    v8[4] = v3;
    id v9 = v2;
    [v3 _dismissPeoplePickerWithCompletion:v9 completion:v8];
  }
}

void sub_100011ED8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v4 = CNContactPickerViewControllerPickerDidHideNotification;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011FA4;
  v6[3] = &unk_100030C88;
  dispatch_time_t v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 installNotificationObserverForNotificationName:v3 notificationName:v4 forOneNotification:1 usingBlock:v6];
}

id sub_100011FA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showPeoplePickerTest:*(void *)(a1 + 40)];
}

id sub_100011FB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName];
}

void sub_100012030(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"ShowPeoplePicker" forTest:__CurrentTestName];
  id v2 = [*(id *)(a1 + 32) messagesController];
  id v3 = [v2 ppt_chatController];

  uint64_t v4 = [v3 composeRecipientSelectionController];
  dispatch_time_t v5 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001210C;
  v6[3] = &unk_100030A30;
  void v6[4] = v5;
  [v5 _dismissPeoplePickerWithCompletion:v4 completion:v6];
}

id sub_10001210C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001217C;
  v3[3] = &unk_100030A30;
  void v3[4] = v1;
  return [v1 installCACommitCompletionBlock:v3];
}

id sub_10001217C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  id v3 = [v2 ppt_chatController];
  [v3 performSelector:"cancelButtonTapped:" withObject:0];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = __CurrentTestName;

  return [v4 finishedTest:v5];
}

id sub_100012304(uint64_t a1)
{
  return [*(id *)(a1 + 32) tearDownShowPeoplePickerTest:*(void *)(a1 + 40)];
}

id sub_100012468(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startPeoplePickerTest];
}

void sub_1000124DC(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"SelectContact" forTest:__CurrentTestName];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001257C;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10001257C(uint64_t a1)
{
  if (dword_10003AE60 < 1)
  {
    id v3 = [*(id *)(a1 + 32) messagesController];
    uint64_t v4 = [v3 ppt_chatController];
    [v4 cancelButtonTapped];

    uint64_t v5 = *(void **)(a1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100012664;
    v7[3] = &unk_100030A30;
    void v7[4] = v5;
    return [v5 installCACommitCompletionBlock:v7];
  }
  else
  {
    --dword_10003AE60;
    id v2 = *(void **)(a1 + 32);
    return [v2 _startSelectContactPeoplePickerTest];
  }
}

id sub_100012664(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName];
}

void sub_1000129C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000129F4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = [v6 phoneNumbers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012AC4;
  v9[3] = &unk_100030E68;
  id v10 = *(id *)(a1 + 32);
  id v11 = v6;
  long long v12 = *(_OWORD *)(a1 + 40);
  uint64_t v13 = a4;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

void sub_100012AC4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 value];
  unsigned int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    **(unsigned char **)(a1 + 64) = 1;
    *a4 = 1;
  }
}

id sub_100012D10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _selectContact:*(void *)(a1 + 40)];
}

id sub_100012D1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) tearDownSelectContactPeoplePickerTest];
}

void sub_100012E04(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012E98;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100012E98(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSelectContactPeoplePickerTest];
}

void sub_100012F0C(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"CancelPeoplePicker" forTest:__CurrentTestName];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012FAC;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100012FAC(uint64_t a1)
{
  if (dword_10003AE60 < 1)
  {
    id v3 = [*(id *)(a1 + 32) messagesController];
    uint64_t v4 = [v3 ppt_chatController];
    [v4 performSelector:"cancelButtonTapped:" withObject:0];

    uint64_t v5 = *(void **)(a1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000130A0;
    v7[3] = &unk_100030A30;
    void v7[4] = v5;
    return [v5 installCACommitCompletionBlock:v7];
  }
  else
  {
    --dword_10003AE60;
    dispatch_time_t v2 = *(void **)(a1 + 32);
    return [v2 _startCancelPeoplePickerTest];
  }
}

id sub_1000130A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName];
}

id sub_1000132FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelPeoplePicker];
}

id sub_100013304(uint64_t a1)
{
  return [*(id *)(a1 + 32) tearDownCancelPeoplePickerTest];
}

id sub_1000133EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startCancelPeoplePickerTest];
}

uint64_t sub_100013500(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000138D4(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013994;
  block[3] = &unk_100030A58;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100013994(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:*(void *)(a1 + 40)];
  dispatch_time_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 typeInContactName:v3];
}

id sub_1000139D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:*(void *)(a1 + 40)];
}

void sub_100013C68(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013D14;
  v4[3] = &unk_100030B70;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

id sub_100013D14(uint64_t a1)
{
  return [*(id *)(a1 + 32) typeInContactName:*(void *)(a1 + 40)];
}

id sub_100013D20(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isSearchResultsHidden] & 1) == 0) {
    [*(id *)(a1 + 40) startedTest:*(void *)(a1 + 48)];
  }
  dispatch_time_t v2 = *(void **)(a1 + 40);

  return [v2 scrollPseudoContacts];
}

void sub_100013ED4(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013F80;
  v4[3] = &unk_100030B70;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

id sub_100013F80(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  dispatch_time_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _resolveContactTest:v3];
}

id sub_100013FC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName];
}

void sub_100014150(uint64_t a1)
{
  dispatch_time_t v2 = +[NSNotificationCenter defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:"_keyboardDidShow:" name:UIKeyboardDidShowNotification object:0];

  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:"didShowNewCompose" name:@"PPTDidShowNewComposeEvent" object:0];

  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  id v4 = [*(id *)(a1 + 32) messagesController];
  [v4 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];
}

void sub_100014334(uint64_t a1)
{
  [*(id *)(a1 + 32) showTranscriptListNotAnimated];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000143D0;
  v3[3] = &unk_100030BC0;
  long long v4 = *(_OWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_1000143D0(uint64_t a1)
{
  dispatch_time_t v2 = +[CKConversationList sharedConversationList];
  uint64_t v3 = [v2 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000144B8;
  block[3] = &unk_100030EE0;
  uint64_t v5 = *(void *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000144B8(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014570;
  v5[3] = &unk_100030B98;
  uint64_t v4 = *(void *)(a1 + 48);
  void v5[4] = *(void *)(a1 + 32);
  void v5[5] = v4;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_100014570(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) messagesController];
  uint64_t v3 = [v2 chatController];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [*(id *)(a1 + 32) showKeyboard];
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001463C;
  v7[3] = &unk_100030B98;
  long long v8 = *(_OWORD *)(a1 + 32);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
}

void sub_10001463C(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) entryView];
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  [v5 startRecordingForRaiseGesture];
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v5 waveformView];
  [v3 _recordResult:v4 == 0 forKey:@"Photo is zoomed" comment:0 resultsDictionary:v2];

  [*(id *)(a1 + 32) finishedTest:__CurrentTestName];
}

void sub_100014804(id *a1)
{
  [a1[4] startedSubTest:@"SendAnimation-FPS" forTest:__CurrentTestName withMetrics:&off_100034E50];
  [a1[5] touchUpInsideSendButton:0];
  id v2 = a1[4];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000148C8;
  v3[3] = &unk_100030F08;
  void v3[4] = v2;
  id v4 = a1[6];
  [v2 installCACommitCompletionBlock:v3];
}

void sub_1000148C8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100014958;
  v2[3] = &unk_100030F08;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 installCACommitCompletionBlock:v2];
}

void sub_100014958(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000149E8;
  v2[3] = &unk_100030F08;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 installCACommitCompletionBlock:v2];
}

void sub_1000149E8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100014A78;
  v2[3] = &unk_100030F08;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 installCACommitCompletionBlock:v2];
}

uint64_t sub_100014A78(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"SendAnimation-FPS" forTest:__CurrentTestName];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void sub_100014BD4(uint64_t a1)
{
  [*(id *)(a1 + 32) showTranscriptListNotAnimated];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100014C70;
  v3[3] = &unk_100030BC0;
  long long v4 = *(_OWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_100014C70(uint64_t a1)
{
  dispatch_time_t v2 = +[CKConversationList sharedConversationList];
  id v3 = [v2 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014D58;
  block[3] = &unk_100030EE0;
  uint64_t v5 = *(void *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100014D58(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014E34;
  block[3] = &unk_100030F58;
  void block[4] = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100014E34(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) messagesController];
  uint64_t v3 = [v2 chatController];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [objc_alloc((Class)CKDetailsControllerAdapter) initWithConversation:*(void *)(a1 + 40)];
  long long v7 = [v6 detailsController];
  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) navigationController];
  [v8 pushViewController:v7 animated:1];

  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100014F6C;
  v11[3] = &unk_100030B70;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v7;
  id v10 = v7;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v11);
}

void sub_100014F6C(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  if ([__CurrentTestName rangeOfString:@"DetailsViewScrollingPerfTest"] == (id)0x7FFFFFFFFFFFFFFFLL) {
    NSLog(@"Unrecognized TranscriptManagement test found");
  }
  else {
    [*(id *)(a1 + 32) _detailsViewScrollingPerfTest:*(void *)(a1 + 40)];
  }
  id v2 = objc_alloc_init((Class)NSDictionary);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015080;
  v5[3] = &unk_100030B70;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v4 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);
}

id sub_100015080(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:*(void *)(a1 + 40)];
}

void sub_1000152F8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showNewMessageCompositionPanelWithRecipients:*(void *)(a1 + 40) composition:*(void *)(a1 + 48) animated:1];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000153C8;
  v4[3] = &unk_100030B70;
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_1000153C8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  dispatch_time_t v3 = [v2 composeChatController];

  id v4 = [v3 entryView];
  [v4 touchUpInsideSendButton:0];
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  id v5 = [*(id *)(a1 + 32) messagesController];
  id v6 = [v5 chatController];

  long long v7 = [v6 entryView];

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000154E4;
  v10[3] = &unk_100030A30;
  void v10[4] = v8;
  [v8 sendMultipleMessagesEntryView:v7 composition:v9 handler:v10];
}

void sub_1000154E4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000155AC;
  v5[3] = &unk_100030B70;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v4 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_1000155AC(uint64_t a1)
{
  [*(id *)(a1 + 32) showTranscriptListNotAnimated];
  id v2 = +[CKConversationList sharedConversationList];
  dispatch_time_t v3 = [v2 conversations];

  if (v3)
  {
    qword_10003AE88 = (uint64_t)[v3 count];
    dispatch_time_t v4 = dispatch_time(0, 500000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000156A4;
    v6[3] = &unk_100030B70;
    id v5 = *(void **)(a1 + 40);
    void v6[4] = *(void *)(a1 + 32);
    id v7 = v5;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

void sub_1000156A4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  dispatch_time_t v3 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, [v2 mapSectionIdentifierForCurrentConversationListClass:6]);
  [v2 deleteChat:v3];

  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015798;
  v6[3] = &unk_100030B70;
  id v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);
}

id sub_100015798(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:*(void *)(a1 + 40)];
}

void sub_100015BAC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];
}

void sub_100015C7C(id a1)
{
}

void sub_100015F34(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];
}

id sub_100016058(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:0];
}

void sub_100016220(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];
}

id sub_100016380(uint64_t a1)
{
  return [*(id *)(a1 + 32) startedTest:__CurrentTestName];
}

id sub_1000168CC(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) setHidden:1];
  id v2 = (void *)qword_10003AE90;
  qword_10003AE90 = 0;

  xmmword_10003AEA0 = (__int128)CGPointZero;
  dispatch_time_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = __CurrentTestName;

  return [v3 finishedTest:v4 extraResults:0];
}

void sub_100016BD4(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:"_chatControllerWillRotate:" name:kPPTChatControllerWillRotateNotification object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:"_chatControllerDidRotate:" name:kPPTChatControllerDidRotateNotification object:0];
  [UIApp rotateIfNeeded:3];
}

void sub_100016C7C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016D44;
  block[3] = &unk_100030E40;
  id v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100016D44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100016DE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) startedTest:__CurrentTestName];
}

void sub_100017084(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  dispatch_time_t v3 = [v2 chatController];

  uint64_t v4 = [v3 entryView];
  [v4 performSelector:"audioReplyButtonStart:" withObject:0];

  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017198;
  v8[3] = &unk_100030B70;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v8);
}

id sub_100017198(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) entryView];
  [v2 performSelector:"audioReplyButtonStop:" withObject:0];

  dispatch_time_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = __CurrentTestName;

  return [v3 finishedTest:v4 extraResults:0];
}

void sub_100017200(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000172C8;
  block[3] = &unk_100030E40;
  id v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_1000172C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000174CC(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017578;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100017578(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:0];
}

void sub_100017590(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017658;
  block[3] = &unk_100030E40;
  id v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100017658(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001785C(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017908;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100017908(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName extraResults:0];
}

void sub_100017920(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000179EC;
  block[3] = &unk_100030E40;
  id v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_1000179EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100017C28(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:"_keyboardWillShow:" name:UIKeyboardRenderDidFinishNotification object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:"_keyboardDidShow:" name:UIKeyboardDidShowNotification object:0];
  [*(id *)(a1 + 32) showKeyboard];
}

void sub_100017CC4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017D8C;
  block[3] = &unk_100030E40;
  id v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100017D8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100017FC8(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:"_keyboardDidShow:" name:UIKeyboardDidShowNotification object:0];
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  [*(id *)(a1 + 32) showKeyboard];
}

void sub_100018054(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001811C;
  block[3] = &unk_100030E40;
  id v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10001811C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100018430(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  dispatch_time_t v3 = [v2 chatController];

  uint64_t v4 = [v3 collectionView];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [v4 visibleCells];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v6)
  {

    uint64_t v13 = 0;
    goto LABEL_17;
  }
  double v17 = v4;
  uint64_t v7 = *(void *)v20;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v20 != v7) {
      objc_enumerationMutation(v5);
    }
    id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    id v10 = v9;
    id v11 = [v10 balloonView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      break;
    }

LABEL_9:
    if (v6 == (id)++v8)
    {
      id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        goto LABEL_3;
      }

      uint64_t v13 = 0;
      goto LABEL_16;
    }
  }
  id v6 = [v10 balloonView];
  uint64_t v14 = [v3 collectionViewController];
  uint64_t v13 = [v14 chatItemForCell:v10];

  if (!v6)
  {
LABEL_16:
    uint64_t v4 = v17;
    goto LABEL_17;
  }
  uint64_t v4 = v17;
  if (v13)
  {
    [*(id *)(a1 + 32) startedTest:__CurrentTestName];
    uint64_t v15 = [v3 collectionViewController];
    [v3 transcriptCollectionViewController:v15 balloonView:v6 tappedForChatItem:v13];

    dispatch_time_t v16 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000186D8;
    block[3] = &unk_100030A30;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);
  }
LABEL_17:
}

id sub_1000186D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:__CurrentTestName];
}

void sub_1000186EC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000187B4;
  block[3] = &unk_100030E40;
  id v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_1000187B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100018BBC(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isNewConversationList];
  dispatch_time_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 messagesController];
    id v5 = [v4 conversationListController];
    uint64_t v6 = [v5 collectionView];
  }
  else
  {
    if (![v3 isOldConversationList]) {
      return;
    }
    uint64_t v4 = [*(id *)(a1 + 32) messagesController];
    id v5 = [v4 conversationListController];
    uint64_t v6 = [v5 view];
  }
  id v13 = (id)v6;

  uint64_t v7 = [(id)qword_10003AE50 objectForKey:@"recapBased"];
  unsigned int v8 = [v7 BOOLValue];

  if (v8 && [sub_100006750() isRecapAvailable])
  {
    id v9 = [objc_alloc((Class)sub_100006834()) initWithTestName:__CurrentTestName scrollView:v13 completionHandler:0];
    [sub_100006750() runTestWithParameters:v9];
  }
  else
  {
    id v10 = [(id)qword_10003AE50 objectForKey:@"offset"];
    dword_10003AE74 = [v10 intValue];

    id v11 = [*(id *)(a1 + 40) objectForKey:@"length"];
    id v12 = [v11 intValue];

    [v13 _performScrollTest:__CurrentTestName iterations:dword_10003AE60 delta:dword_10003AE74 length:v12];
  }
}

id sub_1000190E0(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:__CurrentTestName];
  unsigned int v2 = *(void **)(a1 + 32);
  uint64_t v3 = __CurrentTestName;

  return [v2 failedTest:v3];
}

void sub_10001912C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  uint64_t v3 = [v2 chatController];

  uint64_t v4 = [v3 inputController];
  [v4 showPhotosBrowser];
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100019244;
  v10[3] = &unk_100030FA0;
  id v11 = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  unsigned int v8 = *(void **)(a1 + 40);
  id v14 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  id v9 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v10);
}

void sub_100019244(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) currentInputViewController];
  uint64_t v3 = [v2 viewController];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 view];
  dispatch_time_t v5 = [v4 subviews];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (!v11) {
      goto LABEL_12;
    }
    [*(id *)(a1 + 40) startedTest:__CurrentTestName];
    uint64_t v12 = [*(id *)(a1 + 48) objectForKey:@"offset"];
    [v12 floatValue];
    float v14 = v13;

    [v11 _performScrollTest:__CurrentTestName iterations:dword_10003AE60 delta:(int)v14 scrollAxis:1];
  }
  else
  {
LABEL_9:

LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10001941C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000194CC;
  v4[3] = &unk_100030E40;
  id v5 = *(id *)(a1 + 48);
  [v3 installCACommitCompletionBlock:v4];
}

uint64_t sub_1000194CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000195B8(uint64_t a1, char a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019668;
  v6[3] = &unk_100030FF0;
  char v10 = a2;
  id v3 = *(id *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_100019668(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"extensionIdentifier"];
    if (*(unsigned char *)(a1 + 57))
    {
      unsigned int v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"supportsLaunchSubtest"];
      id v3 = [v2 isEqualToString:@"YES"];
    }
    else
    {
      id v3 = 0;
    }
    [*(id *)(a1 + 40) showMessagesApplicationAndStartTestForIdentifier:v4 supportsLaunchSubtest:v3];
  }
  else
  {
    [*(id *)(a1 + 40) startAndFailTestNamed:__CurrentTestName, @"Failed to enter conversation with chat identifier %@", *(void *)(a1 + 48) withFailure];
  }
}

void sub_10001A558(uint64_t a1)
{
  unsigned int v2 = +[NSNotificationCenter defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:"_willConfigureCellWithTranscriptPluginChatItem:" name:CKPPTWillConfigureCellWithTranscriptPluginChatItemNotification object:0];

  id v3 = [*(id *)(a1 + 32) messagesController];
  [v3 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v4 = dispatch_time(0, 4000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A644;
  block[3] = &unk_100030A30;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10001A644(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) messagesController];
  unsigned int v2 = [v1 chatController];
  id v3 = [v2 collectionViewController];
  id v6 = [v3 collectionView];

  [v6 contentInset];
  [v6 setContentOffset:v5, v4];
}

void sub_10001A890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001AB8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001ABB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v9 = v3;
    if (*(unsigned char *)(a1 + 56))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = 0;
    }
    id v3 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v4 = v9;
  }

  return _objc_release_x1(v3, v4);
}

void sub_10001AE1C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) messagesController];
  [v2 showConversation:*(void *)(a1 + 40) animate:0];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AEE4;
  block[3] = &unk_100030E40;
  id v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10001AEE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

Class sub_10001AFE4(uint64_t a1)
{
  sub_10001B03C();
  Class result = objc_getClass("RPTTestRunner");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10001F514();
  }
  qword_10003AEB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10001B03C()
{
  v0[0] = 0;
  if (!qword_10003AEB8)
  {
    v0[1] = _NSConcreteStackBlock;
    v0[2] = (void *)3221225472;
    v0[3] = sub_10001B130;
    v0[4] = &unk_1000310A0;
    v0[5] = v0;
    long long v1 = off_100031088;
    uint64_t v2 = 0;
    qword_10003AEB8 = _sl_dlopen();
  }
  if (!qword_10003AEB8) {
    sub_10001F590(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t sub_10001B130()
{
  uint64_t result = _sl_dlopen();
  qword_10003AEB8 = result;
  return result;
}

Class sub_10001B1A4(uint64_t a1)
{
  sub_10001B03C();
  Class result = objc_getClass("RPTScrollViewTestParameters");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10001F610();
  }
  qword_10003AEC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10001B1FC(id a1)
{
  qword_10003AEC8 = IMWeakLinkClass();
}

Class sub_10001B22C(uint64_t a1)
{
  sub_10001B03C();
  Class result = objc_getClass("RPTResizeTestParameters");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10001F68C();
  }
  qword_10003AED8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10001BDC4(id a1)
{
  IMWeakLinkClass();
  +[IMChat _initializeFindMyController];

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100031140);
}

void sub_10001BE18(id a1)
{
  long long v1 = +[FTCServiceAvailabilityCenter sharedInstance];
  [v1 addListenerID:@"SMSApplication" forService:0];

  id v2 = +[IMNicknameController sharedInstance];
}

void sub_10001BE70(id a1)
{
  id v1 = +[IMChorosMonitor sharedInstance];
  [v1 startMonitor];
}

void sub_10001BEB8(uint64_t a1)
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"kHasSetupHashtagImages"];

  if ((v3 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Calling into CoreParsec to load their bag", buf, 2u);
      }
    }
    id v5 = (void *)IMWeakLinkClass();
    uint64_t v6 = [(id)IMWeakLinkClass() defaultSessionConfiguration];
    id v7 = [v5 sessionWithConfiguration:v6];

    [v7 setDelegate:*(void *)(a1 + 32)];
  }
  id v11 = 0;
  id v8 = [(id)objc_opt_class() addMessagesFileProviderDomain:&v11];
  id v9 = v11;
  if (v9)
  {
    char v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10001F708(v9, v10);
    }
  }
}

id sub_10001C4DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playMessageReceivedForMessage:*(void *)(a1 + 40) inChat:*(void *)(a1 + 48)];
}

void sub_10001C614(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) soundHelper];
  [v2 playSendSoundForMessage:*(void *)(a1 + 40)];
}

void sub_10001C93C(id a1, UIAlertAction *a2)
{
  id v2 = a2;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2050000000;
  unsigned __int8 v3 = (void *)qword_10003AF00;
  uint64_t v11 = qword_10003AF00;
  if (!qword_10003AF00)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001E244;
    v7[3] = &unk_100031068;
    void v7[4] = &v8;
    sub_10001E244((uint64_t)v7);
    unsigned __int8 v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  id v5 = [v4 defaultWorkspace];
  uint64_t v6 = +[NSURL URLWithString:@"prefs:"];
  [v5 openSensitiveURL:v6 withOptions:0];
}

void sub_10001CA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001DA50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001DA60(uint64_t a1)
{
}

id sub_10001DA68(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSFileProviderDomain) initWithIdentifier:@"MessagesAttachments" displayName:@"Messages" pathRelativeToDocumentStorage:@"MessagesAttachments"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DB30;
  v7[3] = &unk_1000311C8;
  void v7[4] = *(void *)(a1 + 40);
  return +[NSFileProviderManager addDomain:v5 completionHandler:v7];
}

void sub_10001DB30(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v4 debugDescription];
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "In addDomain completion block. Error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

Class sub_10001E244(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_10003AF08)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_10001E370;
    void v3[4] = &unk_1000310A0;
    void v3[5] = v3;
    long long v4 = off_100031210;
    uint64_t v5 = 0;
    qword_10003AF08 = _sl_dlopen();
  }
  if (!qword_10003AF08) {
    sub_10001F7A4(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("LSApplicationWorkspace");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10001F824();
  }
  qword_10003AF00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001E370()
{
  uint64_t result = _sl_dlopen();
  qword_10003AF08 = result;
  return result;
}

char *sub_10001E3E4()
{
  v0 = (char *)malloc_type_calloc(1uLL, 0xA0uLL, 0x10200401F787ECFuLL);
  id v1 = v0;
  if (v0)
  {
    char *v0 = 0;
    pthread_mutex_init((pthread_mutex_t *)(v0 + 16), 0);
    if (pthread_create((pthread_t *)v1 + 1, 0, (void *(__cdecl *)(void *))sub_10001E4B4, v1) < 0)
    {
      id v2 = __error();
      uint64_t v3 = strerror(*v2);
      NSLog(@"pthread_create failed, %s", v3);
      pthread_mutex_destroy((pthread_mutex_t *)(v1 + 16));
      free(v1);
      return 0;
    }
  }
  else
  {
    NSLog(@"out of memory");
  }
  return v1;
}

uint64_t sub_10001E4B4(unsigned __int8 *a1)
{
  uint64_t v2 = getpid();
  sub_10001EA1C(v2, (uint64_t)(a1 + 80));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  int v3 = *a1;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  if (v3) {
    goto LABEL_13;
  }
  usleep(0x2710u);
  if ((ledger() & 0x80000000) != 0)
  {
    NSLog(@"getMemoryFootPrint, ledger fails: %u", v2);
    goto LABEL_13;
  }
  long long v4 = malloc_type_malloc(0, 0x1000040565EDBD2uLL);
  if (!v4)
  {
    NSLog(@"getMemoryFootPrintIndex: out of memory");
LABEL_10:
    NSLog(@"getMemoryFootPrintIndex failed: %u", v2);
    goto LABEL_13;
  }
  uint64_t v5 = v4;
  if ((ledger() & 0x80000000) != 0)
  {
    free(v5);
    goto LABEL_10;
  }
  free(v5);
  uint64_t v6 = malloc_type_malloc(0, 0xAC4DD482uLL);
  if ((ledger() & 0x80000000) != 0) {
    NSLog(@"getMemoryFootPrintIndex, ledger failed: %u", v2);
  }
  else {
    NSLog(@"getMemoryFootPrintIndex, bad index: %lld %lld", 0, 0);
  }
  free(v6);
LABEL_13:
  sub_10001EA1C(v2, (uint64_t)(a1 + 104));
  *((void *)a1 + 16) = -1;
  *((void *)a1 + 17) = 0;
  *((_DWORD *)a1 + 38) = 0;
  return 0;
}

uint64_t sub_10001E79C(uint64_t result, _OWORD *a2, uint64_t *a3)
{
  if (result)
  {
    uint64_t v5 = (unsigned char *)result;
    uint64_t v6 = (pthread_mutex_t *)(result + 16);
    pthread_mutex_lock((pthread_mutex_t *)(result + 16));
    unsigned char *v5 = 1;
    pthread_mutex_unlock(v6);
    if (pthread_join(*((pthread_t *)v5 + 1), 0))
    {
      int v7 = __error();
      uint64_t v8 = strerror(*v7);
      NSLog(@"pthread_join failed, %s", v8);
      pthread_mutex_destroy(v6);
      free(v5);
      return 0;
    }
    if (a2)
    {
      *a2 = *((_OWORD *)v5 + 5);
      long long v9 = *((_OWORD *)v5 + 6);
      long long v10 = *((_OWORD *)v5 + 7);
      long long v11 = *((_OWORD *)v5 + 9);
      a2[3] = *((_OWORD *)v5 + 8);
      a2[4] = v11;
      a2[1] = v9;
      a2[2] = v10;
    }
    if (!a3) {
      goto LABEL_16;
    }
    long long v39 = 0u;
    long long v38 = 0u;
    long long v37 = 0u;
    long long v36 = 0u;
    long long v35 = 0u;
    long long v34 = 0u;
    long long v33 = 0u;
    long long v32 = 0u;
    long long v31 = 0u;
    long long v30 = 0u;
    long long v29 = 0u;
    long long v28 = 0u;
    long long v27 = 0u;
    long long v26 = 0u;
    long long v25 = 0u;
    *(_OWORD *)__str = 0u;
    bzero(__s1, 0x400uLL);
    pid_t v12 = getpid();
    strcpy(__s2, " leaks for ");
    snprintf(__str, 0x100uLL, "leaks %u 2>&1 | grep \"Process %u:\" | grep \"%s\"", v12, v12, __s2);
    float v13 = popen(__str, "r");
    if (v13)
    {
      float v14 = v13;
      if (fgets(__s1, 1024, v13))
      {
        pclose(v14);
        long long v15 = strstr(__s1, ": ");
        if (v15)
        {
          long long v16 = v15;
          long long v17 = strstr(__s1, __s2);
          if (v17)
          {
            char *v17 = 0;
            long long v18 = v17 + 11;
            long long v19 = strchr(v17 + 11, 32);
            if (v19)
            {
              *long long v19 = 0;
              *a3 = strtoll(v16 + 2, 0, 10);
              a3[1] = strtoll(v18, 0, 10);
LABEL_16:
              pthread_mutex_destroy(v6);
              free(v5);
              return 1;
            }
          }
        }
      }
      else
      {
        NSLog(@"getLeaks, no leak information");
        pclose(v14);
      }
    }
    else
    {
      long long v20 = __error();
      long long v21 = strerror(*v20);
      NSLog(@"getLeaks, popen failed: [%s], %s", __str, v21);
    }
    NSLog(@"getLeaks failed");
    *a3 = 0;
    a3[1] = 0;
    goto LABEL_16;
  }
  return result;
}

void sub_10001EA1C(uint64_t a1, uint64_t a2)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long buffer = 0u;
  long long v7 = 0u;
  if (proc_pidinfo(a1, 4, 0, &buffer, 96) == 96)
  {
    *(_DWORD *)a2 = v11;
    *(_OWORD *)(a2 + 8) = v7;
  }
  else
  {
    long long v4 = __error();
    uint64_t v5 = strerror(*v4);
    NSLog(@"getCPUCounter, proc_pidinfo failed: %u, %s", a1, v5);
  }
}

void sub_10001EB40(void *a1)
{
  uint64_t v2 = +[IMServiceImpl serviceWithInternalName:IMServiceNameiMessage];
  int v3 = +[IMServiceImpl serviceWithInternalName:IMServiceNameSMS];
  id v4 = objc_alloc((Class)CKIMSimulatedChat);
  uint64_t v47 = a1[4];
  uint64_t v5 = +[NSArray arrayWithObjects:&v47 count:1];
  id v6 = [v4 initWithIncomingIDs:v5 outgoingID:a1[5] messageIDOffset:100000 service:v2];
  long long v7 = (void *)qword_10003AF10;
  qword_10003AF10 = (uint64_t)v6;

  id v8 = objc_alloc((Class)CKIMSimulatedChat);
  uint64_t v46 = a1[5];
  long long v9 = +[NSArray arrayWithObjects:&v46 count:1];
  id v10 = [v8 initWithIncomingIDs:v9 outgoingID:a1[4] messageIDOffset:1 service:v2];
  long long v11 = (void *)qword_10003AF18;
  qword_10003AF18 = (uint64_t)v10;

  id v12 = objc_alloc((Class)CKIMSimulatedChat);
  uint64_t v45 = a1[6];
  float v13 = +[NSArray arrayWithObjects:&v45 count:1];
  id v14 = [v12 initWithIncomingIDs:v13 outgoingID:a1[7] messageIDOffset:300000 service:v2];
  long long v15 = (void *)qword_10003AF20;
  qword_10003AF20 = (uint64_t)v14;

  id v16 = objc_alloc((Class)CKIMSimulatedChat);
  uint64_t v44 = a1[7];
  long long v17 = +[NSArray arrayWithObjects:&v44 count:1];
  id v18 = [v16 initWithIncomingIDs:v17 outgoingID:a1[6] messageIDOffset:200001 service:v2];
  long long v19 = (void *)qword_10003AF28;
  qword_10003AF28 = (uint64_t)v18;

  id v20 = objc_alloc((Class)CKIMSimulatedChat);
  uint64_t v21 = a1[7];
  v43[0] = a1[6];
  v43[1] = v21;
  long long v22 = +[NSArray arrayWithObjects:v43 count:2];
  id v23 = [v20 initWithIncomingIDs:v22 outgoingID:a1[4] messageIDOffset:500000 service:v2];
  id v24 = (void *)qword_10003AF30;
  qword_10003AF30 = (uint64_t)v23;

  id v25 = objc_alloc((Class)CKIMSimulatedChat);
  uint64_t v26 = a1[7];
  v42[0] = a1[4];
  v42[1] = v26;
  long long v27 = +[NSArray arrayWithObjects:v42 count:2];
  id v28 = [v25 initWithIncomingIDs:v27 outgoingID:a1[6] messageIDOffset:400001 service:v2];
  long long v29 = (void *)qword_10003AF38;
  qword_10003AF38 = (uint64_t)v28;

  id v30 = objc_alloc((Class)CKIMSimulatedChat);
  uint64_t v31 = a1[5];
  v41[0] = a1[4];
  v41[1] = v31;
  long long v32 = +[NSArray arrayWithObjects:v41 count:2];
  id v33 = [v30 initWithIncomingIDs:v32 outgoingID:a1[8] messageIDOffset:700000 service:v3];
  long long v34 = (void *)qword_10003AF40;
  qword_10003AF40 = (uint64_t)v33;

  id v35 = objc_alloc((Class)CKIMSimulatedChat);
  uint64_t v36 = a1[8];
  v40[0] = a1[5];
  v40[1] = v36;
  long long v37 = +[NSArray arrayWithObjects:v40 count:2];
  id v38 = [v35 initWithIncomingIDs:v37 outgoingID:a1[4] messageIDOffset:600001 service:v3];
  long long v39 = (void *)qword_10003AF48;
  qword_10003AF48 = (uint64_t)v38;

  [(id)qword_10003AF10 setDelegate:qword_10003AF18];
  [(id)qword_10003AF18 setDelegate:qword_10003AF10];
  [(id)qword_10003AF20 setDelegate:qword_10003AF28];
  [(id)qword_10003AF28 setDelegate:qword_10003AF20];
  [(id)qword_10003AF30 setDelegate:qword_10003AF38];
  [(id)qword_10003AF38 setDelegate:qword_10003AF30];
  [(id)qword_10003AF40 setDelegate:qword_10003AF48];
  [(id)qword_10003AF48 setDelegate:qword_10003AF40];
  +[CKIMDaemonController beginSimulatingDaemon];
}

void sub_10001F178(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v17 = a1;
  +[NSURLComponents componentsWithURL:*(void *)(a1 + 32) resolvingAgainstBaseURL:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v18 = v22 = 0u;
  int v3 = [v18 queryItems];
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [v9 name];
        unsigned int v11 = [v10 isEqualToString:@"test"];

        id v12 = [v9 value];
        if (v11)
        {

          id v6 = v12;
          if (([v12 containsString:@"Screenshot"] & 1) == 0) {
            goto LABEL_14;
          }
        }
        else
        {
          float v13 = [v9 name];
          [v2 setObject:v12 forKey:v13];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v12 = v6;
    }
    while (v5);
  }
  else
  {
    id v12 = 0;
  }
LABEL_14:

  if ([v12 containsString:@"Screenshot"])
  {
    [*(id *)(v17 + 40) startScreenshotTestWithOptions:v2];
  }
  else if (v12)
  {
    id v14 = [v12 im_lastPathComponent];
    long long v15 = [@"/AppleInternal/XCTests/com.apple.mobilesms/" stringByAppendingPathComponent:v14];
    id v16 = +[CKUnitTestRunner sharedInstance];
    [v16 runUnitTestBundleAtPath:v15 writeToFile:1];
  }
}

void sub_10001F514()
{
  v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"Class getRPTTestRunnerClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"mSMSApplicationTesting.m" lineNumber:111 description:@"Unable to find class %s" RPTTestRunner];

  __break(1u);
}

void sub_10001F590(void *a1)
{
  id v2 = +[NSAssertionHandler currentHandler];
  int v3 = +[NSString stringWithUTF8String:"void *RecapPerformanceTestingLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"mSMSApplicationTesting.m" lineNumber:110 description:@"%s" *a1];

  __break(1u);
}

void sub_10001F610()
{
  v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"Class getRPTScrollViewTestParametersClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"mSMSApplicationTesting.m" lineNumber:113 description:@"Unable to find class %s" @"RPTScrollViewTestParameters"];

  __break(1u);
}

void sub_10001F68C()
{
  v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"Class getRPTResizeTestParametersClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"mSMSApplicationTesting.m" lineNumber:112 description:@"Unable to find class %s" RPTResizeTestParameters];

  __break(1u);
}

void sub_10001F708(void *a1, NSObject *a2)
{
  int v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to add Messages Fileprovider domain: %@", (uint8_t *)&v4, 0xCu);
}

void sub_10001F7A4(void *a1)
{
  id v2 = +[NSAssertionHandler currentHandler];
  int v3 = +[NSString stringWithUTF8String:"void *CoreServicesLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"SMSApplicationDelegate.m" lineNumber:80 description:@"%s" *a1];

  __break(1u);
}

void sub_10001F824()
{
  v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"Class getLSApplicationWorkspaceClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"SMSApplicationDelegate.m" lineNumber:81 description:@"Unable to find class %s" @"LSApplicationWorkspace"];

  __break(1u);
  CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

uint64_t CGImageSourceSetAllowableTypes()
{
  return _CGImageSourceSetAllowableTypes();
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

uint64_t CKFrameworkBundle()
{
  return _CKFrameworkBundle();
}

uint64_t CKIsRunningForDevelopmentOnSimulator()
{
  return _CKIsRunningForDevelopmentOnSimulator();
}

uint64_t CKIsRunningInMacCatalyst()
{
  return _CKIsRunningInMacCatalyst();
}

uint64_t CKIsRunningUITests()
{
  return _CKIsRunningUITests();
}

uint64_t CKIsSuppressingReceiveSoundForMessageGUID()
{
  return _CKIsSuppressingReceiveSoundForMessageGUID();
}

uint64_t CKListenerCapabilities()
{
  return _CKListenerCapabilities();
}

uint64_t CKMessageIsFromFilteredSenderIsUnderFirstUnlock()
{
  return _CKMessageIsFromFilteredSenderIsUnderFirstUnlock();
}

uint64_t CKPrewarmLaunch()
{
  return _CKPrewarmLaunch();
}

uint64_t CKSuppressionContextsForIdentifiers()
{
  return _CKSuppressionContextsForIdentifiers();
}

uint64_t ExtractURLQueries()
{
  return _ExtractURLQueries();
}

uint64_t IMClientTelemetryLogHandle()
{
  return _IMClientTelemetryLogHandle();
}

uint64_t IMCopyGUIDForChat()
{
  return _IMCopyGUIDForChat();
}

uint64_t IMGetDomainValueForKey()
{
  return _IMGetDomainValueForKey();
}

uint64_t IMIsRunningInScreenshotTesting()
{
  return _IMIsRunningInScreenshotTesting();
}

uint64_t IMIsSupportedUTIType()
{
  return _IMIsSupportedUTIType();
}

uint64_t IMLogHandleForCategory()
{
  return _IMLogHandleForCategory();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMPrewarmXPCInterfaces()
{
  return _IMPrewarmXPCInterfaces();
}

uint64_t IMSetEmbeddedTempDirectory()
{
  return _IMSetEmbeddedTempDirectory();
}

uint64_t IMSupportsUserNotifications()
{
  return _IMSupportsUserNotifications();
}

uint64_t IMWeakLinkClass()
{
  return _IMWeakLinkClass();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IMAlwaysLog()
{
  return __IMAlwaysLog();
}

uint64_t _IMWillLog()
{
  return __IMWillLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ck_dispatch_main_after_seconds()
{
  return _ck_dispatch_main_after_seconds();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t im_main_thread()
{
  return _im_main_thread();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t ledger()
{
  return _ledger();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

int pclose(FILE *a1)
{
  return _pclose(a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return _popen(a1, a2);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return [a1 ID];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return [a1 URLContexts];
}

id objc_msgSend_UTITypes(void *a1, const char *a2, ...)
{
  return [a1 UTITypes];
}

id objc_msgSend__backbuttonPressed(void *a1, const char *a2, ...)
{
  return [a1 _backbuttonPressed];
}

id objc_msgSend__clearFailureBadge(void *a1, const char *a2, ...)
{
  return [a1 _clearFailureBadge];
}

id objc_msgSend__connectToDaemon(void *a1, const char *a2, ...)
{
  return [a1 _connectToDaemon];
}

id objc_msgSend__dismissPeoplePicker(void *a1, const char *a2, ...)
{
  return [a1 _dismissPeoplePicker];
}

id objc_msgSend__hideConversationListForIPadPPTTest(void *a1, const char *a2, ...)
{
  return [a1 _hideConversationListForIPadPPTTest];
}

id objc_msgSend__initializeFindMyController(void *a1, const char *a2, ...)
{
  return [a1 _initializeFindMyController];
}

id objc_msgSend__isLoading(void *a1, const char *a2, ...)
{
  return [a1 _isLoading];
}

id objc_msgSend__orientationForViewTransform(void *a1, const char *a2, ...)
{
  return [a1 _orientationForViewTransform];
}

id objc_msgSend__registerForAppleEventsIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _registerForAppleEventsIfNecessary];
}

id objc_msgSend__resetIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 _resetIdleTimer];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return [a1 actionButton];
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return [a1 activationState];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_alertSuppressionContextsFromForegroundActiveScenes(void *a1, const char *a2, ...)
{
  return [a1 alertSuppressionContextsFromForegroundActiveScenes];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_avMode(void *a1, const char *a2, ...)
{
  return [a1 avMode];
}

id objc_msgSend_balloonView(void *a1, const char *a2, ...)
{
  return [a1 balloonView];
}

id objc_msgSend_beginHoldingConversationListUpdatesForPPTTests(void *a1, const char *a2, ...)
{
  return [a1 beginHoldingConversationListUpdatesForPPTTests];
}

id objc_msgSend_beginSimulatingDaemon(void *a1, const char *a2, ...)
{
  return [a1 beginSimulatingDaemon];
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return [a1 blockUntilConnected];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bottomSeperator(void *a1, const char *a2, ...)
{
  return [a1 bottomSeperator];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bulletinSuppressed(void *a1, const char *a2, ...)
{
  return [a1 bulletinSuppressed];
}

id objc_msgSend_cachedChats(void *a1, const char *a2, ...)
{
  return [a1 cachedChats];
}

id objc_msgSend_canRunTests(void *a1, const char *a2, ...)
{
  return [a1 canRunTests];
}

id objc_msgSend_cancelButtonTapped(void *a1, const char *a2, ...)
{
  return [a1 cancelButtonTapped];
}

id objc_msgSend_captureScreenshot(void *a1, const char *a2, ...)
{
  return [a1 captureScreenshot];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_chat(void *a1, const char *a2, ...)
{
  return [a1 chat];
}

id objc_msgSend_chatController(void *a1, const char *a2, ...)
{
  return [a1 chatController];
}

id objc_msgSend_chatIdentifier(void *a1, const char *a2, ...)
{
  return [a1 chatIdentifier];
}

id objc_msgSend_chatItems(void *a1, const char *a2, ...)
{
  return [a1 chatItems];
}

id objc_msgSend_cleanupCurrentTest(void *a1, const char *a2, ...)
{
  return [a1 cleanupCurrentTest];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_collectionViewController(void *a1, const char *a2, ...)
{
  return [a1 collectionViewController];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_composeChatController(void *a1, const char *a2, ...)
{
  return [a1 composeChatController];
}

id objc_msgSend_composeRecipientSelectionController(void *a1, const char *a2, ...)
{
  return [a1 composeRecipientSelectionController];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configureActionButton(void *a1, const char *a2, ...)
{
  return [a1 configureActionButton];
}

id objc_msgSend_configureIconView(void *a1, const char *a2, ...)
{
  return [a1 configureIconView];
}

id objc_msgSend_configureSubtitle(void *a1, const char *a2, ...)
{
  return [a1 configureSubtitle];
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return [a1 connectedScenes];
}

id objc_msgSend_contactImageSize(void *a1, const char *a2, ...)
{
  return [a1 contactImageSize];
}

id objc_msgSend_contactPickerViewController(void *a1, const char *a2, ...)
{
  return [a1 contactPickerViewController];
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return [a1 containingBundle];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return [a1 contentInset];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_conversation(void *a1, const char *a2, ...)
{
  return [a1 conversation];
}

id objc_msgSend_conversationList(void *a1, const char *a2, ...)
{
  return [a1 conversationList];
}

id objc_msgSend_conversationListController(void *a1, const char *a2, ...)
{
  return [a1 conversationListController];
}

id objc_msgSend_conversationListControllerClass(void *a1, const char *a2, ...)
{
  return [a1 conversationListControllerClass];
}

id objc_msgSend_conversations(void *a1, const char *a2, ...)
{
  return [a1 conversations];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentConversation(void *a1, const char *a2, ...)
{
  return [a1 currentConversation];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentInputViewController(void *a1, const char *a2, ...)
{
  return [a1 currentInputViewController];
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 currentNotificationCenter];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConversationViewingMessageCount(void *a1, const char *a2, ...)
{
  return [a1 defaultConversationViewingMessageCount];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteTopChat(void *a1, const char *a2, ...)
{
  return [a1 deleteTopChat];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_detailsController(void *a1, const char *a2, ...)
{
  return [a1 detailsController];
}

id objc_msgSend_detailsTUConversationDetailsSummaryImageDiameter(void *a1, const char *a2, ...)
{
  return [a1 detailsTUConversationDetailsSummaryImageDiameter];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dismissKeyboard(void *a1, const char *a2, ...)
{
  return [a1 dismissKeyboard];
}

id objc_msgSend_dissmissComposeSheet(void *a1, const char *a2, ...)
{
  return [a1 dissmissComposeSheet];
}

id objc_msgSend_endHoldingConversationListUpdatesForPPTTests(void *a1, const char *a2, ...)
{
  return [a1 endHoldingConversationListUpdatesForPPTTests];
}

id objc_msgSend_entryView(void *a1, const char *a2, ...)
{
  return [a1 entryView];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_expanseActivityViewIconTintColor(void *a1, const char *a2, ...)
{
  return [a1 expanseActivityViewIconTintColor];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return [a1 firstResponder];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_formatSubtitleForText(void *a1, const char *a2, ...)
{
  return [a1 formatSubtitleForText];
}

id objc_msgSend_formatTitle(void *a1, const char *a2, ...)
{
  return [a1 formatTitle];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_getContactStore(void *a1, const char *a2, ...)
{
  return [a1 getContactStore];
}

id objc_msgSend_getKeyWindow(void *a1, const char *a2, ...)
{
  return [a1 getKeyWindow];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return [a1 guid];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return [a1 iconView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_initializeCachedValues(void *a1, const char *a2, ...)
{
  return [a1 initializeCachedValues];
}

id objc_msgSend_inputAccessoryView(void *a1, const char *a2, ...)
{
  return [a1 inputAccessoryView];
}

id objc_msgSend_inputController(void *a1, const char *a2, ...)
{
  return [a1 inputController];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interitemSpacing(void *a1, const char *a2, ...)
{
  return [a1 interitemSpacing];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateTranscriptDrawerWidth(void *a1, const char *a2, ...)
{
  return [a1 invalidateTranscriptDrawerWidth];
}

id objc_msgSend_isAccessibilityPreferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 isAccessibilityPreferredContentSizeCategory];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAirplaneModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAirplaneModeEnabled];
}

id objc_msgSend_isApplicationActive(void *a1, const char *a2, ...)
{
  return [a1 isApplicationActive];
}

id objc_msgSend_isCarPlayConnected(void *a1, const char *a2, ...)
{
  return [a1 isCarPlayConnected];
}

id objc_msgSend_isCategorized(void *a1, const char *a2, ...)
{
  return [a1 isCategorized];
}

id objc_msgSend_isCollapsed(void *a1, const char *a2, ...)
{
  return [a1 isCollapsed];
}

id objc_msgSend_isFiltered(void *a1, const char *a2, ...)
{
  return [a1 isFiltered];
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return [a1 isFromMe];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isKeyWindow(void *a1, const char *a2, ...)
{
  return [a1 isKeyWindow];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return [a1 isMuted];
}

id objc_msgSend_isNewConversationList(void *a1, const char *a2, ...)
{
  return [a1 isNewConversationList];
}

id objc_msgSend_isOldConversationList(void *a1, const char *a2, ...)
{
  return [a1 isOldConversationList];
}

id objc_msgSend_isRead(void *a1, const char *a2, ...)
{
  return [a1 isRead];
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return [a1 isRecapAvailable];
}

id objc_msgSend_isRunningViaTestRunner(void *a1, const char *a2, ...)
{
  return [a1 isRunningViaTestRunner];
}

id objc_msgSend_isSearchResultsHidden(void *a1, const char *a2, ...)
{
  return [a1 isSearchResultsHidden];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return [a1 isSuspended];
}

id objc_msgSend_isWiFiEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWiFiEnabled];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_lastFinishedMessageItem(void *a1, const char *a2, ...)
{
  return [a1 lastFinishedMessageItem];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return [a1 layoutFrame];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leaveTUConversation(void *a1, const char *a2, ...)
{
  return [a1 leaveTUConversation];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_locationSubtitleFont(void *a1, const char *a2, ...)
{
  return [a1 locationSubtitleFont];
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return [a1 logHandle];
}

id objc_msgSend_madridRegistrationController(void *a1, const char *a2, ...)
{
  return [a1 madridRegistrationController];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_messagesController(void *a1, const char *a2, ...)
{
  return [a1 messagesController];
}

id objc_msgSend_messagesSceneDelegate(void *a1, const char *a2, ...)
{
  return [a1 messagesSceneDelegate];
}

id objc_msgSend_multiwayButtonColor(void *a1, const char *a2, ...)
{
  return [a1 multiwayButtonColor];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return [a1 persistentID];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 persistentIdentifier];
}

id objc_msgSend_personCentricID(void *a1, const char *a2, ...)
{
  return [a1 personCentricID];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_pinnedConversationIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 pinnedConversationIdentifiers];
}

id objc_msgSend_platformSupportsStagingArea(void *a1, const char *a2, ...)
{
  return [a1 platformSupportsStagingArea];
}

id objc_msgSend_preferencesActions(void *a1, const char *a2, ...)
{
  return [a1 preferencesActions];
}

id objc_msgSend_prepopulatedChat(void *a1, const char *a2, ...)
{
  return [a1 prepopulatedChat];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_primaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 primaryLabelColor];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_recipientNameFont(void *a1, const char *a2, ...)
{
  return [a1 recipientNameFont];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_resetsIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 resetsIdleTimer];
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return [a1 resourceSpecifier];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_sceneClass(void *a1, const char *a2, ...)
{
  return [a1 sceneClass];
}

id objc_msgSend_sceneController(void *a1, const char *a2, ...)
{
  return [a1 sceneController];
}

id objc_msgSend_searchListController(void *a1, const char *a2, ...)
{
  return [a1 searchListController];
}

id objc_msgSend_searchResultsController(void *a1, const char *a2, ...)
{
  return [a1 searchResultsController];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_sendAudioMessage(void *a1, const char *a2, ...)
{
  return [a1 sendAudioMessage];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return [a1 setupView];
}

id objc_msgSend_sharePlayIcon(void *a1, const char *a2, ...)
{
  return [a1 sharePlayIcon];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedBehaviors(void *a1, const char *a2, ...)
{
  return [a1 sharedBehaviors];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedConversationList(void *a1, const char *a2, ...)
{
  return [a1 sharedConversationList];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPreferencesController(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferencesController];
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return [a1 sharedRegistry];
}

id objc_msgSend_shouldAutorotate(void *a1, const char *a2, ...)
{
  return [a1 shouldAutorotate];
}

id objc_msgSend_shouldFilterConversationsByFocus(void *a1, const char *a2, ...)
{
  return [a1 shouldFilterConversationsByFocus];
}

id objc_msgSend_shouldGetBulletinSuppressedStateFromHelper(void *a1, const char *a2, ...)
{
  return [a1 shouldGetBulletinSuppressedStateFromHelper];
}

id objc_msgSend_showDTCompose(void *a1, const char *a2, ...)
{
  return [a1 showDTCompose];
}

id objc_msgSend_showHandwritingBrowser(void *a1, const char *a2, ...)
{
  return [a1 showHandwritingBrowser];
}

id objc_msgSend_showKeyboard(void *a1, const char *a2, ...)
{
  return [a1 showKeyboard];
}

id objc_msgSend_showKeyboardForReply(void *a1, const char *a2, ...)
{
  return [a1 showKeyboardForReply];
}

id objc_msgSend_showNextMessage(void *a1, const char *a2, ...)
{
  return [a1 showNextMessage];
}

id objc_msgSend_showPhotosBrowser(void *a1, const char *a2, ...)
{
  return [a1 showPhotosBrowser];
}

id objc_msgSend_showTranscriptListNotAnimated(void *a1, const char *a2, ...)
{
  return [a1 showTranscriptListNotAnimated];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_smsEnabled(void *a1, const char *a2, ...)
{
  return [a1 smsEnabled];
}

id objc_msgSend_soundHelper(void *a1, const char *a2, ...)
{
  return [a1 soundHelper];
}

id objc_msgSend_standardControls(void *a1, const char *a2, ...)
{
  return [a1 standardControls];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAudioWaveformFPSTest(void *a1, const char *a2, ...)
{
  return [a1 startAudioWaveformFPSTest];
}

id objc_msgSend_startGifPlaybackStaticFPSTest(void *a1, const char *a2, ...)
{
  return [a1 startGifPlaybackStaticFPSTest];
}

id objc_msgSend_startInvisibleInkStaticFPSTest(void *a1, const char *a2, ...)
{
  return [a1 startInvisibleInkStaticFPSTest];
}

id objc_msgSend_startMonitor(void *a1, const char *a2, ...)
{
  return [a1 startMonitor];
}

id objc_msgSend_startRecordingForRaiseGesture(void *a1, const char *a2, ...)
{
  return [a1 startRecordingForRaiseGesture];
}

id objc_msgSend_startSendAnimationExistingTest(void *a1, const char *a2, ...)
{
  return [a1 startSendAnimationExistingTest];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statusButton(void *a1, const char *a2, ...)
{
  return [a1 statusButton];
}

id objc_msgSend_stopPlayingAlert(void *a1, const char *a2, ...)
{
  return [a1 stopPlayingAlert];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return [a1 subtitleLabel];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_supportsFilteringExtensions(void *a1, const char *a2, ...)
{
  return [a1 supportsFilteringExtensions];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tapFSMIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 tapFSMIfNecessary];
}

id objc_msgSend_teamID(void *a1, const char *a2, ...)
{
  return [a1 teamID];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return [a1 textView];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return [a1 theme];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_toField(void *a1, const char *a2, ...)
{
  return [a1 toField];
}

id objc_msgSend_toFieldIsFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 toFieldIsFirstResponder];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topSeperator(void *a1, const char *a2, ...)
{
  return [a1 topSeperator];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_transcriptPreviewCache(void *a1, const char *a2, ...)
{
  return [a1 transcriptPreviewCache];
}

id objc_msgSend_tuConversationButtonInteritemSpacing(void *a1, const char *a2, ...)
{
  return [a1 tuConversationButtonInteritemSpacing];
}

id objc_msgSend_tuConversationButtonTitleHorizontalSpacing(void *a1, const char *a2, ...)
{
  return [a1 tuConversationButtonTitleHorizontalSpacing];
}

id objc_msgSend_tuConversationButtonTitleVerticalSpacing(void *a1, const char *a2, ...)
{
  return [a1 tuConversationButtonTitleVerticalSpacing];
}

id objc_msgSend_tuConversationInsetPadding(void *a1, const char *a2, ...)
{
  return [a1 tuConversationInsetPadding];
}

id objc_msgSend_tuConversationInteritemSpacing(void *a1, const char *a2, ...)
{
  return [a1 tuConversationInteritemSpacing];
}

id objc_msgSend_tuConversationJoinButtonCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 tuConversationJoinButtonCornerRadius];
}

id objc_msgSend_tuConversationJoinButtonHeight(void *a1, const char *a2, ...)
{
  return [a1 tuConversationJoinButtonHeight];
}

id objc_msgSend_tuConversationJoinButtonMinWidth(void *a1, const char *a2, ...)
{
  return [a1 tuConversationJoinButtonMinWidth];
}

id objc_msgSend_tuConversationViewActionButtonFont(void *a1, const char *a2, ...)
{
  return [a1 tuConversationViewActionButtonFont];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unmute(void *a1, const char *a2, ...)
{
  return [a1 unmute];
}

id objc_msgSend_updateView(void *a1, const char *a2, ...)
{
  return [a1 updateView];
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return [a1 userActivities];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return [a1 visibleCells];
}

id objc_msgSend_waveformView(void *a1, const char *a2, ...)
{
  return [a1 waveformView];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return [a1 windows];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:atomically:encoding:error:];
}