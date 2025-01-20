id sub_1000054C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) recordClassName];
}

id sub_1000054D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) changedValue];
}

void sub_100005794(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) recordDictionary];
  v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (!v3)
  {
    v4 = [*(id *)(a1 + 32) recordDictionary];
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [v4 setValue:v5 forKey:*(void *)(a1 + 40)];
  }
  if ([*(id *)(a1 + 48) isEqual:&stru_100019060])
  {
    v6 = PTLogObjectForTopic();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "keyPath is an empty string.", buf, 2u);
    }
  }
  else
  {
    id v18 = [*(id *)(a1 + 48) componentsSeparatedByString:@"."];
    v7 = [*(id *)(a1 + 32) recordDictionary];
    v8 = [v7 objectForKey:*(void *)(a1 + 40)];

    if ([v18 count] == (id)1)
    {
      v9 = v8;
    }
    else
    {
      v10 = 0;
      do
      {
        v11 = [v18 objectAtIndexedSubscript:v10];
        v12 = [v8 objectForKey:v11];

        if (!v12)
        {
          id v13 = objc_alloc_init((Class)NSMutableDictionary);
          v14 = [v18 objectAtIndexedSubscript:v10];
          [v8 setValue:v13 forKey:v14];
        }
        v15 = [v18 objectAtIndexedSubscript:v10];
        v9 = [v8 objectForKey:v15];

        ++v10;
        v8 = v9;
      }
      while ((char *)[v18 count] - 1 > v10);
    }
    v16 = [[PTParameterRecordLeaf alloc] initWithRecordClassName:*(void *)(a1 + 56) value:*(void *)(a1 + 64)];
    v17 = [v18 lastObject];
    [v9 setValue:v16 forKey:v17];
  }
}

void sub_100005AE8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) recordDictionary];
  v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v21 = [*(id *)(a1 + 48) componentsSeparatedByString:@"."];
    id v4 = objc_alloc_init((Class)NSArray);
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = [*(id *)(a1 + 32) recordDictionary];
    v7 = [v6 objectForKey:*(void *)(a1 + 40)];

    [v5 addObject:*(void *)(a1 + 40)];
    if ([v21 count])
    {
      unint64_t v8 = 0;
      v9 = v21;
      while (1)
      {
        v10 = [v9 objectAtIndexedSubscript:v8];
        v11 = [v7 objectForKey:v10];

        if (!v11) {
          break;
        }
        v12 = [v7 allKeys];
        id v13 = [v12 count];

        if ((unint64_t)v13 >= 2)
        {
          id v14 = [v5 copy];

          id v4 = v14;
        }
        v15 = [v21 objectAtIndexedSubscript:v8];
        [v5 addObject:v15];

        ++v8;
        v7 = v11;
        BOOL v16 = (unint64_t)[v21 count] > v8;
        v9 = v21;
        if (!v16) {
          goto LABEL_11;
        }
      }
    }
    else
    {
      v11 = v7;
LABEL_11:
      v17 = [*(id *)(a1 + 32) recordDictionary];

      if ([v4 count])
      {
        unint64_t v18 = 0;
        do
        {
          v19 = [v4 objectAtIndexedSubscript:v18];
          v7 = [v17 objectForKey:v19];

          ++v18;
          v17 = v7;
        }
        while ((unint64_t)[v4 count] > v18);
      }
      else
      {
        v7 = v17;
      }
      v20 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "count"));
      [v7 removeObjectForKey:v20];
    }
  }
}

void sub_100005D7C(void *a1)
{
  id v1 = a1;
  v2 = +[NSFileManager defaultManager];
  NSFileAttributeKey v4 = NSFileProtectionKey;
  NSFileProtectionType v5 = NSFileProtectionNone;
  v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  [v2 setAttributes:v3 ofItemAtPath:v1 error:0];
}

id sub_100005E54()
{
  v0 = NSHomeDirectoryForUser(@"mobile");
  id v1 = v0;
  if (v0)
  {
    id v2 = v0;
  }
  else
  {
    NSHomeDirectory();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

id sub_100005EB4()
{
  if (qword_1000205C0 != -1) {
    dispatch_once(&qword_1000205C0, &stru_1000188B8);
  }
  v0 = (void *)qword_1000205B8;

  return v0;
}

void sub_100005F08(id a1)
{
  id v1 = sub_100005E54();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Library/Prototyping"];
  v3 = (void *)qword_1000205B8;
  qword_1000205B8 = v2;

  NSFileAttributeKey v4 = +[NSFileManager defaultManager];
  uint64_t v5 = qword_1000205B8;
  NSFileAttributeKey v7 = NSFileOwnerAccountName;
  CFStringRef v8 = @"mobile";
  v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v6 error:0];

  sub_100005D7C((void *)qword_1000205B8);
}

id sub_100006008()
{
  v0 = sub_100005EB4();
  id v1 = [v0 stringByAppendingPathComponent:@"ParameterRecords.archive"];

  return v1;
}

void sub_1000063C8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) recordDictionary];
  id v14 = 0;
  v3 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v14];
  id v4 = v14;

  if (!v3) {
    goto LABEL_3;
  }
  uint64_t v5 = [*(id *)(a1 + 40) path];
  id v13 = v4;
  unsigned __int8 v6 = [v3 writeToFile:v5 options:1 error:&v13];
  id v7 = v13;

  id v4 = v7;
  if ((v6 & 1) == 0)
  {
LABEL_3:
    CFStringRef v8 = PTLogObjectForTopic();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [*(id *)(a1 + 40) path];
      v10 = [v4 localizedDescription];
      *(_DWORD *)buf = 138412546;
      BOOL v16 = v9;
      __int16 v17 = 2112;
      unint64_t v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to write test recipe dictionary to file %@: %@", buf, 0x16u);
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  v12 = *(void **)(v11 + 8);
  *(void *)(v11 + 8) = 0;
}

void sub_1000065F8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[1];
  if (v3)
  {
    [v3 invalidate];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  objc_initWeak(&location, v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006708;
  v7[3] = &unk_100018908;
  objc_copyWeak(&v9, &location);
  id v8 = *(id *)(a1 + 40);
  uint64_t v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v7 block:0.25];
  uint64_t v5 = *(void *)(a1 + 32);
  unsigned __int8 v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void sub_1000066EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100006708(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _writeToDiskWithParameterRecords:*(void *)(a1 + 32)];
}

void sub_100006C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
}

PTUIModifiedChangesViewController *sub_100006CA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained parameterRecordsOfTunedSettings];
  }
  else
  {
    uint64_t v4 = [PTParameterRecords alloc];
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    v3 = [(PTParameterRecords *)v4 initWithDictionary:v5];
  }
  unsigned __int8 v6 = [[PTUIModifiedChangesViewController alloc] initWithParameterRecords:v3 withTitle:@"Show Modified Settings"];

  return v6;
}

id sub_100006EB8(id a1)
{
  int v5 = 1056964608;
  id v1 = +[AVSystemController sharedAVSystemController];
  [v1 getActiveCategoryVolume:&v5 andName:0];

  LODWORD(v2) = v5;
  v3 = +[NSNumber numberWithFloat:v2];

  return v3;
}

void sub_100006F2C(id a1, id a2)
{
  [a2 floatValue];
  int v3 = v2;
  id v5 = +[AVSystemController sharedAVSystemController];
  LODWORD(v4) = v3;
  [v5 setActiveCategoryVolumeTo:v4];
}

void sub_100006F8C(id a1, PTRow *a2)
{
  int v2 = a2;
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:v2];
}

void sub_1000070CC(id a1)
{
  v10[0] = AVSystemController_SystemVolumeDidChangeNotification;
  v10[1] = AVSystemController_ServerConnectionDiedNotification;
  id v1 = +[NSArray arrayWithObjects:v10 count:2];
  int v2 = +[AVSystemController sharedAVSystemController];
  id v7 = 0;
  unsigned int v3 = [v2 setAttribute:v1 forKey:AVSystemController_SubscribeToNotificationsAttribute error:&v7];
  id v4 = v7;
  id v5 = PTLogObjectForTopic();
  unsigned __int8 v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully subscribed to all necessary AVSystemController notifications: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10000F1F8((uint64_t)v4, v6);
  }
}

void sub_100007404(uint64_t a1, uint64_t a2)
{
  if (PTPrototypingEventAvailable())
  {
    id v4 = PTPrototypingEventName();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000766C;
    v22[3] = &unk_100018A38;
    id v23 = *(id *)(a1 + 32);
    uint64_t v24 = a2;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000076A8;
    v19[3] = &unk_100018A60;
    id v20 = *(id *)(a1 + 32);
    uint64_t v21 = a2;
    id v5 = +[PTSwitchRow rowWithTitle:v4 valueGetter:v22 valueSetter:v19];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000076E8;
    v16[3] = &unk_100018A88;
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = a2;
    [v5 setExternalCondition:v16];
    unsigned __int8 v6 = *(void **)(a1 + 32);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000076F4;
    v14[3] = &unk_100018AB0;
    id v15 = v5;
    id v7 = v5;
    [v6 observeShowUISwitchDefaultsOnQueue:&_dispatch_main_q withBlock:v14];
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    uint64_t v11 = sub_1000076FC;
    v12 = &unk_100018AD8;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v13;
    [v7 setUnregisterBlock:&v9];
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7, v9, v10, v11, v12);
  }
}

id sub_10000766C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) displayedShowsUIValueForEvent:*(void *)(a1 + 40)];

  return +[NSNumber numberWithBool:v1];
}

id sub_1000076A8(uint64_t a1, void *a2)
{
  id v3 = [a2 BOOLValue];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return _[v4 setShowsUI:v3 forEvent:v5];
}

id sub_1000076E8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) canEditShowsUIForEvent:*(void *)(a1 + 40)];
}

id sub_1000076F4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) reloadRow];
}

id sub_1000076FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

id sub_100007704(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) multiWindowEnabled];

  return +[NSNumber numberWithBool:v1];
}

void sub_100007748(uint64_t a1, void *a2)
{
  id v3 = [a2 BOOLValue];
  unsigned int v4 = [*(id *)(a1 + 32) multiWindowEnabled];
  [*(id *)(a1 + 32) setMultiWindowEnabled:v3];
  if (v3 != v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = +[UIApplication sharedApplication];
    unsigned __int8 v6 = [v5 connectedScenes];

    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
          v12 = +[UIApplication sharedApplication];
          id v13 = [v11 session];
          [v12 requestSceneSessionDestruction:v13 options:0 errorHandler:0];

          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    id v14 = +[UIApplication sharedApplication];
    id v15 = +[UISceneSessionActivationRequest request];
    [v14 activateSceneSessionForRequest:v15 errorHandler:0];
  }
}

id sub_100007A18(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _sendKillSpringBoard];
}

uint64_t sub_100007C2C(uint64_t a1)
{
  return 1;
}

void sub_100008028(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100008040(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) == *(void *)(v1 + 16))
  {
    unsigned int v3 = [*(id *)(v1 + 8) didStartAcceptingConnections];
    unsigned int v4 = PTLogObjectForTopic();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote editing server did start accepting connections.", buf, 2u);
      }
    }
    else
    {
      if (v5)
      {
        *(_WORD *)unsigned __int8 v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote editing server couldn't start accepting connection.", v6, 2u);
      }

      [*(id *)(a1 + 32) _disableRemoteEditingServer];
    }
  }
}

void sub_100008310(id *a1)
{
  id v2 = [a1[4] stateType];
  id v3 = [a1[4] actionRevision];
  if (v2 == (id)2)
  {
    id v4 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [a1[5] objectForKey:@"selector"];
      SEL v6 = NSSelectorFromString(v5);
      if (objc_opt_respondsToSelector())
      {
        id v7 = [a1[5] objectForKey:@"Method"];
        unsigned int v8 = [v7 isEqualToString:@"GET"];

        if (v8)
        {
          uint64_t v9 = [a1[6] performSelector:v6 withObject:a1[5]];
          if (v9)
          {
            uint64_t v17 = 0;
            long long v18 = &v17;
            uint64_t v19 = 0x2050000000;
            uint64_t v10 = (void *)qword_1000205D8;
            uint64_t v20 = qword_1000205D8;
            if (!qword_1000205D8)
            {
              v16[0] = _NSConcreteStackBlock;
              v16[1] = 3221225472;
              v16[2] = sub_100008CB0;
              v16[3] = &unk_100018BA0;
              void v16[4] = &v17;
              sub_100008CB0((uint64_t)v16);
              uint64_t v10 = (void *)v18[3];
            }
            uint64_t v11 = v10;
            _Block_object_dispose(&v17, 8);
            id v12 = [[v11 alloc] initWithType:2 revision:v4];
            id v13 = +[NSMutableDictionary dictionaryWithDictionary:a1[5]];
            [v13 setObject:v9 forKey:@"responsePayload"];
            [a1[6] _broadCastState:v13 withStateInfo:v12];
          }
        }
        else
        {
          id v14 = [a1[5] objectForKey:@"Method"];
          unsigned int v15 = [v14 isEqualToString:@"POST"];

          if (v15 && v4 == (id)-1) {
            [a1[6] performSelector:v6 withObject:a1[5]];
          }
        }
      }
    }
  }
}

void sub_10000853C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100008618(void *a1)
{
  return _[*(id *)(a1[4] + 8) sendState:a1[5] withInfo:a1[6] toPeer:0];
}

Class sub_100008AE8(uint64_t a1)
{
  sub_100008B40();
  Class result = objc_getClass("RSPeerToPeerServerController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000F270();
  }
  qword_1000205C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100008B40()
{
  v1[0] = 0;
  if (!qword_1000205D0)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100008C3C;
    v1[4] = &unk_100018BD8;
    v1[5] = v1;
    long long v2 = off_100018BC0;
    uint64_t v3 = 0;
    qword_1000205D0 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_1000205D0)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100008C3C()
{
  uint64_t result = _sl_dlopen();
  qword_1000205D0 = result;
  return result;
}

Class sub_100008CB0(uint64_t a1)
{
  sub_100008B40();
  Class result = objc_getClass("RSStateInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000F298();
  }
  qword_1000205D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id SceneDelegate.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_100008D40()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t sub_100008E34()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100008F8C();

  return swift_release();
}

id SceneDelegate.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100008F8C();
  swift_release();
  return 0;
}

void sub_100008F8C()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v0 = static CommandLine.argc.getter();
  id v1 = (char **)static CommandLine.unsafeArgv.getter();
  type metadata accessor for Application();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v3 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v3 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for AppDelegate();
  id v4 = (objc_class *)swift_getObjCClassFromMetadata();
  BOOL v5 = NSStringFromClass(v4);
  if (!v5)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    delegateClassNamea = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    BOOL v5 = delegateClassNamea;
  }
  delegateClassName = v5;
  UIApplicationMain(v0, v1, v3, v5);
  swift_release();
}

uint64_t type metadata accessor for Application()
{
  return self;
}

uint64_t sub_1000090F0()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 1;
}

id sub_100009258(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithWindowScene:a1];

  return v3;
}

id sub_10000929C(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Window();
  id v3 = objc_msgSendSuper2(&v5, "initWithWindowScene:", a1);

  return v3;
}

uint64_t type metadata accessor for Window()
{
  return self;
}

id sub_1000093D0(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, "initWithFrame:", a1, a2, a3, a4);
}

id sub_100009434(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for Window();
  return objc_msgSendSuper2(&v10, "initWithFrame:", a1, a2, a3, a4);
}

id sub_100009578(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_1000095BC(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Window();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_1000096CC(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, "initWithContentRect:", a1, a2, a3, a4);
}

id sub_100009730(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for Window();
  return objc_msgSendSuper2(&v10, "initWithContentRect:", a1, a2, a3, a4);
}

id sub_100009874()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Window();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_1000098AC()
{
  uint64_t v1 = v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___rootModuleController;
  id v3 = *(void **)(v0 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___rootModuleController);
  if (v3) {
    goto LABEL_15;
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = self;
  id v5 = [v4 sharedApplication];
  id v6 = [v5 delegate];

  if (!v6)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_release();
  type metadata accessor for AppDelegate();
  swift_dynamicCastClassUnconditional();
  id v7 = sub_10000B500();
  swift_unknownObjectRelease();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = [v4 sharedApplication];
  id v9 = [v8 delegate];

  if (!v9) {
    goto LABEL_17;
  }
  swift_release();
  swift_dynamicCastClassUnconditional();
  id v10 = sub_10000B5B8();
  swift_unknownObjectRelease();
  id v11 = [objc_allocWithZone((Class)PTDRootModuleController) initWithDomainServer:v7 editingServer:v10];

  if (!v11)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v12 = [v4 sharedApplication];
  id v13 = [v12 delegate];

  if (v13)
  {
    swift_release();
    [v11 setDelegate:swift_dynamicCastClassUnconditional()];
    swift_unknownObjectRelease();
    id v14 = *(void **)(v1 + v2);
    *(void *)(v1 + v2) = v11;
    v11;

    id v3 = 0;
LABEL_15:
    id v15 = v3;
    swift_release();
    return;
  }
LABEL_19:
  __break(1u);
}

void sub_100009C1C()
{
  uint64_t v1 = v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___settingsViewController;
  id v3 = *(void **)(v0 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___settingsViewController);
  if (v3) {
    goto LABEL_6;
  }
  sub_1000098AC();
  id v5 = v4;
  id v6 = [v4 module];

  id v7 = [objc_allocWithZone((Class)PTUISettingsController) initWithRootModule:v6];
  if (v7)
  {
    id v8 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v1 action:"didSelectDone"];
    [v7 setDismissButton:v8];

    id v9 = *(void **)(v1 + v2);
    *(void *)(v1 + v2) = v7;
    v7;

    id v3 = 0;
LABEL_6:
    id v10 = v3;
    swift_release();
    return;
  }
  __break(1u);
}

id sub_100009D84(uint64_t a1, uint64_t *a2, void *a3, Class *a4)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v8 = *a2;
  id v9 = *(void **)(v4 + v8);
  if (v9)
  {
    id v10 = *(id *)(v4 + v8);
  }
  else
  {
    id v11 = [objc_allocWithZone(*a4) initWithTarget:v4 action:*a3];
    id v12 = *(void **)(v4 + v8);
    *(void *)(v4 + v8) = v11;
    id v10 = v11;

    id v9 = 0;
  }
  id v13 = v9;
  swift_release();
  return v10;
}

Swift::Void __swiftcall SceneDelegate.sceneDidDisconnect(_:)(UIScene a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = OBJC_IVAR____TtC10prototyped13SceneDelegate_window;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
  if (v4
    && (id v5 = (objc_class *)[v4 windowScene]) != 0
    && (id v6 = v5, v5, v6 == a1.super.super.isa))
  {
    id v7 = *(void **)(v1 + v3);
    if (!v7) {
      goto LABEL_16;
    }
    id v8 = [v7 rootViewController];
    if (v8)
    {
      id v9 = v8;
      id v10 = [v8 view];

      if (!v10)
      {
        __break(1u);
        return;
      }
      [v10 removeFromSuperview];
    }
    id v11 = *(void **)(v1 + v3);
    if (v11 && ([v11 setRootViewController:0], (id v12 = *(void **)(v1 + v3)) != 0))
    {
      [v12 removeFromSuperview];
      id v13 = *(id *)(v1 + v3);
    }
    else
    {
LABEL_16:
      id v13 = 0;
    }
    *(void *)(v1 + v3) = 0;
    swift_release();
  }
  else
  {
    swift_release();
  }
}

double sub_10000A148()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = v0 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalOrigin;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalOrigin + 16))
  {
    uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
    if (v2)
    {
      [v2 frame];
      double v4 = v3;
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v6 = 0;
      double v4 = 0.0;
    }
    *(double *)uint64_t v1 = v4;
    *(void *)(v1 + 8) = v6;
    *(unsigned char *)(v1 + 16) = 0;
  }
  else
  {
    double v4 = *(double *)v1;
  }
  swift_release();
  return v4;
}

uint64_t variable initialization expression of SceneDelegate.$__lazy_storage_$_originalOrigin()
{
  return 0;
}

double sub_10000A244()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = v0 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalBounds;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalBounds + 32))
  {
    uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
    if (v2)
    {
      [v2 bounds];
      double v4 = v3;
      uint64_t v6 = v5;
      uint64_t v8 = v7;
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
      double v4 = 0.0;
      uint64_t v6 = 0;
    }
    *(double *)uint64_t v1 = v4;
    *(void *)(v1 + 8) = v6;
    *(void *)(v1 + 16) = v8;
    *(void *)(v1 + 24) = v10;
    *(unsigned char *)(v1 + 32) = 0;
  }
  else
  {
    double v4 = *(double *)v1;
  }
  swift_release();
  return v4;
}

double variable initialization expression of SceneDelegate.$__lazy_storage_$_originalBounds@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 32) = 1;
  return result;
}

uint64_t variable initialization expression of SceneDelegate.window()
{
  return 0;
}

void sub_10000A374()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
  if (v1
    && (id v2 = [v1 windowScene]) != 0
    && (v3 = v2, id v4 = [v2 session], v3, v4))
  {
    id v5 = [self sharedApplication];
    [v5 requestSceneSessionDestruction:v4 options:0 errorHandler:0];
    swift_release();
  }
  else
  {
    swift_release();
  }
}

void sub_10000A584(void *a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v3 = *(void **)(v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
  if (!v3) {
    goto LABEL_10;
  }
  id v4 = v3;
  [v4 endEditing:1];
  id v5 = [a1 state];
  if ((unint64_t)v5 < 2)
  {
LABEL_7:
    [v4 frame];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v10 = v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalOrigin;
    *(void *)uint64_t v10 = v7;
    *(void *)(v10 + 8) = v9;
    *(unsigned char *)(v10 + 16) = 0;
    swift_release();

LABEL_10:
    swift_release();
    return;
  }
  if (v5 == (id)2)
  {
    [a1 translationInView:v4];
    double v12 = v11;
    double v14 = v13;
    objc_msgSend(a1, "setTranslation:inView:", v4, 0.0, 0.0);
    id v15 = v4;
    [v15 frame];
    [v15 setFrame:v12 + v16];

    id v22 = v15;
    [v22 frame];
    objc_msgSend(v22, "setFrame:", v18, v14 + v17);
  }
  else
  {
    if (v5 == (id)3) {
      goto LABEL_7;
    }
    id v22 = v4;
    double v19 = sub_10000A148();
    double v21 = v20;
    [v22 frame];
    objc_msgSend(v22, "setFrame:", v19, v21);
  }
  swift_release();
}

void sub_10000A830(void *a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v3 = *(void **)(v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
  if (!v3) {
    goto LABEL_10;
  }
  id v4 = v3;
  id v5 = [a1 state];
  if ((unint64_t)v5 < 2) {
    goto LABEL_7;
  }
  if (v5 == (id)2)
  {
    id v15 = v4;
    double v16 = sub_10000A244();
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    [a1 scale];
    CGFloat v24 = v23;
    [a1 scale];
    CGAffineTransformMakeScale(&v27, v24, v25);
    v29.origin.x = v16;
    v29.origin.y = v18;
    v29.size.width = v20;
    v29.size.height = v22;
    CGRect v30 = CGRectApplyAffineTransform(v29, &v27);
    objc_msgSend(v15, "setBounds:", 0.0, 0.0, v30.size.width, v30.size.height);
    swift_release();

    return;
  }
  if (v5 == (id)3)
  {
LABEL_7:
    [v4 bounds];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v14 = v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalBounds;
    *(void *)uint64_t v14 = v7;
    *(void *)(v14 + 8) = v9;
    *(void *)(v14 + 16) = v11;
    *(void *)(v14 + 24) = v13;
    *(unsigned char *)(v14 + 32) = 0;
    swift_release();

LABEL_10:
    swift_release();
    return;
  }
  id v26 = v4;
  [v26 setBounds:sub_10000A244()];
  swift_release();
}

void sub_10000AB10(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(id))
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = a3;
  id v9 = a1;
  a5(v8);
  swift_release();
}

id SceneDelegate.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v2 = &v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalOrigin];
  *(void *)id v2 = 0;
  *((void *)v2 + 1) = 0;
  v2[16] = 1;
  double v3 = &v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalBounds];
  *(_OWORD *)double v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  v3[32] = 1;
  *(void *)&v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___rootModuleController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___panGesture] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___pinchGesture] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___settingsViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10prototyped13SceneDelegate_window] = 0;
  v5.receiver = v0;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, "init");
}

void _s10prototyped13SceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0I7SessionCSo0I17ConnectionOptionsCtF_0(void *a1)
{
  uint64_t v2 = v1;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_allocWithZone((Class)type metadata accessor for Window());
    id v7 = a1;
    id v8 = [v6 initWithWindowScene:v5];
    sub_1000098AC();
    uint64_t v10 = v9;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v11 = self;
    id v12 = [v11 sharedApplication];
    id v13 = [v12 delegate];

    if (v13)
    {
      swift_release();
      type metadata accessor for AppDelegate();
      swift_dynamicCastClassUnconditional();
      id v14 = sub_10000B500();
      swift_unknownObjectRelease();
      id v15 = [v14 parameterRecordsOfTunedSettings];

      [v10 setParameterRecordsOfTunedSettings:v15];
      id v16 = v8;
      sub_100009C1C();
      CGFloat v18 = v17;
      [v16 setRootViewController:v17];

      [v16 makeKeyAndVisible];
      id v19 = [self sharedInstance];
      if (v19)
      {
        CGFloat v20 = v19;
        unsigned int v21 = [v19 multiWindowEnabled];

        if (!v21)
        {
LABEL_16:

          id v36 = *(id *)(v2 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
          *(void *)(v2 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window) = v16;
          swift_release();

          return;
        }
        id v22 = v16;
        [v22 bounds];
        objc_msgSend(v22, "setBounds:");

        id v23 = v22;
        [v23 bounds];
        objc_msgSend(v23, "setBounds:");

        id v24 = v23;
        [v24 bounds];
        id v25 = [v11 sharedApplication];
        id v26 = [v25 connectedScenes];

        sub_10000B3BC();
        sub_10000B3FC();
        uint64_t v27 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

        if ((v27 & 0xC000000000000001) != 0) {
          __CocoaSet.count.getter();
        }
        swift_bridgeObjectRelease();
        [v24 center];
        objc_msgSend(v24, "setCenter:");

        sub_100009C1C();
        CGRect v29 = v28;
        id v30 = [v28 navigationBar];

        id v31 = sub_100009D84(55, &OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___panGesture, &selRef_didDrag_, (Class *)UIPanGestureRecognizer_ptr);
        [v30 addGestureRecognizer:v31];

        sub_100009C1C();
        v33 = v32;
        id v34 = [v32 view];

        if (v34)
        {
          id v35 = sub_100009D84(56, &OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___pinchGesture, &selRef_didPinch_, (Class *)UIPinchGestureRecognizer_ptr);
          [v34 addGestureRecognizer:v35];

          goto LABEL_16;
        }
LABEL_21:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_21;
  }

  swift_release();
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

uint64_t sub_10000B2F8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_10000B330(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000B33C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000B35C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 sub_10000B39C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

unint64_t sub_10000B3BC()
{
  unint64_t result = qword_100020208;
  if (!qword_100020208)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100020208);
  }
  return result;
}

unint64_t sub_10000B3FC()
{
  unint64_t result = qword_100020210;
  if (!qword_100020210)
  {
    sub_10000B3BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020210);
  }
  return result;
}

uint64_t sub_10000B454(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000B474(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_10000B4B0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_10000B500()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = objc_retain(*(id *)(*(void *)(*(void *)(v0 + OBJC_IVAR____TtC10prototyped11AppDelegate_listener)
                                     + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_uiServer)
                         + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer_domainServer));
  swift_release();
  return v1;
}

id sub_10000B5B8()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = objc_retain(*(id *)(*(void *)(v0 + OBJC_IVAR____TtC10prototyped11AppDelegate_listener)
                         + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_uiServer));
  id v2 = sub_10000B674();
  swift_release();

  return v2;
}

id sub_10000B674()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer____lazy_storage___editingServer;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer____lazy_storage___editingServer);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer____lazy_storage___editingServer);
LABEL_7:
    id v6 = v2;
    swift_release();
    return v3;
  }
  id result = [objc_allocWithZone((Class)PTUIEditingServer) initWithDataSource:*(void *)(v0 + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer_domainServer) delegate:*(void *)(v0 + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer_domainServer) forRemoteEditing:0];
  if (result)
  {
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = result;
    id v3 = result;

    id v2 = 0;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

id sub_10000B76C()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for Listener());

  return [v0 init];
}

uint64_t type metadata accessor for Listener()
{
  return self;
}

uint64_t sub_10000B7C4(uint64_t a1, uint64_t a2)
{
  return sub_10000DE18(a2);
}

uint64_t sub_10000B7CC()
{
  if (qword_1000205E0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return sub_10000E250(v0, (uint64_t)qword_1000208F0);
}

id sub_10000B960()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC10prototyped11AppDelegate_listener;
  id v3 = objc_allocWithZone((Class)type metadata accessor for Listener());
  uint64_t v4 = v0;
  *(void *)&v0[v2] = [v3 init];

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, "init");
}

uint64_t sub_10000BAEC()
{
  sub_10000E288(&qword_1000202F8);
  __chkstk_darwin();
  uint64_t v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  type metadata accessor for MainActor();
  id v4 = v0;
  uint64_t v5 = static MainActor.shared.getter();
  objc_super v6 = (void *)swift_allocObject();
  v6[2] = v5;
  v6[3] = &protocol witness table for MainActor;
  v6[4] = v4;
  sub_10000BDB0((uint64_t)v2, (uint64_t)&unk_100020308, (uint64_t)v6);
  return swift_release();
}

uint64_t sub_10000BC04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a1;
  v4[8] = a4;
  type metadata accessor for MainActor();
  v4[9] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000BC9C, v6, v5);
}

uint64_t sub_10000BC9C()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_release();
  uint64_t v2 = *(void **)(*(void *)(v1 + OBJC_IVAR____TtC10prototyped11AppDelegate_listener)
                + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection);
  if (v2
    && (id v3 = [v2 remoteObjectProxy],
        _bridgeAnyObjectToAny(_:)(),
        swift_unknownObjectRelease(),
        sub_10000E288(&qword_100020578),
        (swift_dynamicCast() & 1) != 0))
  {
    [*(id *)(v0 + 48) killSpringBoard];
    swift_unknownObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v4 = 1;
  }
  **(unsigned char **)(v0 + 56) = v4;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_10000BDB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000E540(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_10000E288(&qword_100020570);
  return swift_task_create();
}

uint64_t sub_10000BF5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000E540(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

char *sub_10000C22C()
{
  *(void *)&v0[OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection] = 0;
  uint64_t v1 = OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_listener;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v2 = objc_allocWithZone((Class)NSXPCListener);
  id v3 = v0;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v5 = [v2 initWithMachServiceName:v4];

  *(void *)&v0[v1] = v5;
  uint64_t v6 = OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_uiServer;
  *(void *)&v3[v6] = [objc_allocWithZone((Class)type metadata accessor for UIServer()) init];

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for Listener();
  uint64_t v7 = (char *)objc_msgSendSuper2(&v9, "init");
  [*(id *)&v7[OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_listener] setDelegate:v7];
  return v7;
}

uint64_t sub_10000C360(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_10000C404()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Listener();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000C494(uint64_t a1)
{
  objc_super v2 = v1;
  sub_10000E288(&qword_1000202F8);
  __chkstk_darwin();
  id v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000205E0 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10000E250(v6, (uint64_t)qword_1000208F0);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    objc_super v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)objc_super v9 = 136315138;
    unint64_t v10 = sub_10000C708(a1);
    uint64_t v17 = sub_10000D5CC(v10, v11, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "handle prototyping event: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 1, 1, v12);
  type metadata accessor for MainActor();
  id v13 = v2;
  uint64_t v14 = static MainActor.shared.getter();
  id v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = a1;
  v15[5] = v13;
  sub_10000BF5C((uint64_t)v5, (uint64_t)&unk_100020528, (uint64_t)v15);
  return swift_release();
}

unint64_t sub_10000C708(uint64_t a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 0:
      unint64_t result = 1701736302;
      break;
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v3);
      swift_bridgeObjectRelease();
      unint64_t result = 0x206E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t sub_10000C828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = type metadata accessor for UISceneSessionActivationRequest();
  v5[4] = v6;
  v5[5] = *(void *)(v6 - 8);
  v5[6] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[7] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000C91C, v8, v7);
}

__CFNotificationCenter *sub_10000C91C()
{
  swift_release();
  id v1 = [self sharedApplication];
  unint64_t result = (__CFNotificationCenter *)[self sharedInstance];
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  Swift::String v3 = result;
  if (![(__CFNotificationCenter *)result activeTestRecipeEatsEvent:v0[2]])
  {
    if (([(__CFNotificationCenter *)v3 multiWindowEnabled] & 1) == 0)
    {
      id v7 = [v1 connectedScenes];
      sub_10000B3BC();
      sub_10000EFA0((unint64_t *)&qword_100020210, (void (*)(uint64_t))sub_10000B3BC);
      uint64_t v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v9 = (v8 & 0xC000000000000001) != 0 ? __CocoaSet.count.getter() : *(void *)(v8 + 16);
      swift_bridgeObjectRelease();
      if (v9)
      {
        id v10 = [v1 connectedScenes];
        uint64_t v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

        id v12 = v1;
        sub_10000E984(v11, v12);

        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
    }
    unint64_t result = CFNotificationCenterGetDarwinNotifyCenter();
    if (PTPrototypingIsActiveDarwinNotification)
    {
      id v13 = result;
      uint64_t v15 = v0[5];
      uint64_t v14 = v0[6];
      uint64_t v16 = v0[4];
      CFNotificationCenterPostNotification(result, PTPrototypingIsActiveDarwinNotification, 0, 0, 1u);

      uint64_t v17 = UIWindowSceneSessionRoleApplication;
      UISceneSessionActivationRequest.init(role:userActivity:options:)();
      UIApplication.activateSceneSession(for:errorHandler:)();

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
      goto LABEL_12;
    }
LABEL_16:
    __break(1u);
    return result;
  }
  uint64_t v4 = v0[2];
  id v5 = *(void **)(v0[3] + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer_domainServer);
  id v6 = [(__CFNotificationCenter *)v3 activeTestRecipeIdentifier];
  [v5 sendEvent:v4 forTestRecipeID:v6];

LABEL_12:
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return (__CFNotificationCenter *)v18();
}

uint64_t sub_10000CE9C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000F0A0(v0, qword_1000208F0);
  sub_10000E250(v0, (uint64_t)qword_1000208F0);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000CF1C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000205E0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = sub_10000E250(v2, (uint64_t)qword_1000208F0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000CFC4(uint64_t a1, uint64_t a2)
{
  return sub_10000D0BC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000CFDC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000D030()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000D0A4(uint64_t a1, uint64_t a2)
{
  return sub_10000D0BC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000D0BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000D100(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_10000D178(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10000D1F8@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000D23C()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_10000D2C8@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000D310@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000D33C(uint64_t a1)
{
  uint64_t v2 = sub_10000EFA0(&qword_100020558, type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_10000EFA0(&qword_1000205A8, type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000D3F8(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10000D4D4;
  return v6(a1);
}

uint64_t sub_10000D4D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000D5CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000D6A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000E4E0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000E4E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000E490((uint64_t)v12);
  return v7;
}

uint64_t sub_10000D6A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000D85C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10000D85C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000D8F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000DAD4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000DAD4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000D8F4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10000DA6C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000DA6C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000E288(&qword_100020530);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000DAD4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000E288(&qword_100020530);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000DC24(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  size_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_10000DD04;
  return v5(v2 + 32);
}

uint64_t sub_10000DD04()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  unint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_10000DE18(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  uint64_t v8 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_1000205E0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10000E250(v4, (uint64_t)qword_1000208F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = Logger.logObject.getter();
  int v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, (os_log_type_t)v11))
  {
    int v18 = v11;
    uint64_t v19 = v8;
    uint64_t v20 = v2;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v22 = v17;
    *(_DWORD *)uint64_t v12 = 136315138;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    if (a1)
    {
      type metadata accessor for LaunchOptionsKey(0);
      sub_10000EFA0(&qword_100020558, type metadata accessor for LaunchOptionsKey);
      uint64_t v13 = Dictionary.description.getter();
      unint64_t v15 = v14;
      swift_release();
    }
    else
    {
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      swift_release();
      unint64_t v15 = 0xE300000000000000;
      uint64_t v13 = 7104878;
    }
    uint64_t v21 = sub_10000D5CC(v13, v15, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, (os_log_type_t)v18, "application didFinishLaunchingWithOptions: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v2 = v20;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  [*(id *)(*(void *)(v2 + OBJC_IVAR____TtC10prototyped11AppDelegate_listener)+ OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_listener) resume];
  swift_release();
  return 1;
}

uint64_t sub_10000E250(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000E288(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000E2D0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000F1F0;
  return sub_10000BC04(a1, v5, v6, v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

uint64_t type metadata accessor for UIServer()
{
  return self;
}

uint64_t sub_10000E3B8()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000E3F8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_10000F1F0;
  return sub_10000C828((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_10000E490(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000E4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000E540(uint64_t a1)
{
  uint64_t v2 = sub_10000E288(&qword_1000202F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E5A0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000E5D8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000F1F0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100020538 + dword_100020538);
  return v6(a1, v4);
}

BOOL sub_10000E690(void *a1)
{
  uint64_t v2 = v1;
  if (qword_1000205E0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000E250(v4, (uint64_t)qword_1000208F0);
  id v5 = a1;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    v20[0] = v5;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "listener shouldAcceptNewConnection: %@", v8, 0xCu);
    sub_10000E288(&qword_100020548);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v11 = OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection;
  uint64_t v12 = *(void *)(v2 + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection);
  if (!v12)
  {
    id v13 = (id)PTUIClientInterface();
    [v5 setRemoteObjectInterface:v13];

    id v14 = (id)PTUIServerInterface();
    [v5 setExportedInterface:v14];

    [v5 setExportedObject:*(void *)(v2 + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_uiServer)];
    uint64_t v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v20[4] = sub_10000ED3C;
    v20[5] = v15;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 1107296256;
    v20[2] = sub_10000C360;
    v20[3] = &unk_100018EE0;
    uint64_t v16 = _Block_copy(v20);
    swift_release();
    [v5 setInvalidationHandler:v16];
    _Block_release(v16);
    [v5 resume];
    uint64_t v17 = *(void **)(v2 + v11);
    *(void *)(v2 + v11) = v5;
    id v18 = v5;
  }
  return v12 == 0;
}

void sub_10000E984(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_10000B3BC();
    sub_10000EFA0((unint64_t *)&qword_100020210, (void (*)(uint64_t))sub_10000B3BC);
    Set.Iterator.init(_cocoa:)();
    uint64_t v3 = v21;
    uint64_t v20 = v22;
    uint64_t v4 = v23;
    uint64_t v5 = v24;
    unint64_t v6 = v25;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v20 = a1 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
  }
  uint64_t v18 = v4;
  int64_t v19 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_34;
    }
    sub_10000B3BC();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v14 = v26;
    swift_unknownObjectRelease();
    uint64_t v13 = v5;
    uint64_t v11 = v6;
    if (!v26) {
      goto LABEL_34;
    }
LABEL_32:
    type metadata accessor for MainActor();
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v10 = objc_msgSend(v14, "session", v18);
    [a2 requestSceneSessionDestruction:v10 options:0 errorHandler:0];

    swift_release();
    uint64_t v5 = v13;
    unint64_t v6 = v11;
  }
  if (v6)
  {
    uint64_t v11 = (v6 - 1) & v6;
    unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
    uint64_t v13 = v5;
LABEL_31:
    id v14 = *(id *)(*(void *)(v3 + 48) + 8 * v12);
    if (!v14) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  int64_t v15 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v15 >= v19) {
      goto LABEL_34;
    }
    unint64_t v16 = *(void *)(v20 + 8 * v15);
    uint64_t v13 = v5 + 1;
    if (!v16)
    {
      uint64_t v13 = v5 + 2;
      if (v5 + 2 >= v19) {
        goto LABEL_34;
      }
      unint64_t v16 = *(void *)(v20 + 8 * v13);
      if (!v16)
      {
        uint64_t v13 = v5 + 3;
        if (v5 + 3 >= v19) {
          goto LABEL_34;
        }
        unint64_t v16 = *(void *)(v20 + 8 * v13);
        if (!v16)
        {
          uint64_t v13 = v5 + 4;
          if (v5 + 4 >= v19) {
            goto LABEL_34;
          }
          unint64_t v16 = *(void *)(v20 + 8 * v13);
          if (!v16)
          {
            uint64_t v13 = v5 + 5;
            if (v5 + 5 >= v19) {
              goto LABEL_34;
            }
            unint64_t v16 = *(void *)(v20 + 8 * v13);
            if (!v16)
            {
              uint64_t v17 = v5 + 6;
              while (v19 != v17)
              {
                unint64_t v16 = *(void *)(v20 + 8 * v17++);
                if (v16)
                {
                  uint64_t v13 = v17 - 1;
                  goto LABEL_30;
                }
              }
LABEL_34:
              sub_10000ECFC();
              return;
            }
          }
        }
      }
    }
LABEL_30:
    uint64_t v11 = (v16 - 1) & v16;
    unint64_t v12 = __clz(__rbit64(v16)) + (v13 << 6);
    goto LABEL_31;
  }
  __break(1u);
}

uint64_t sub_10000ECFC()
{
  return swift_release();
}

uint64_t sub_10000ED04()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000ED3C()
{
  swift_beginAccess();
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = *(void **)&Strong[OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection];
    *(void *)&Strong[OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection] = 0;
  }
}

uint64_t sub_10000ED9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EDAC()
{
  return swift_release();
}

uint64_t sub_10000EDB8()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000EDF8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000EE98;
  return sub_10000BC04(a1, v5, v6, v4);
}

uint64_t sub_10000EE98()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

uint64_t sub_10000EFA0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000EFE8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000EE98;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100020560 + dword_100020560);
  return v6(a1, v4);
}

uint64_t *sub_10000F0A0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void type metadata accessor for PTPrototypingEvent(uint64_t a1)
{
}

uint64_t sub_10000F118()
{
  return sub_10000EFA0(&qword_100020590, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_10000F160()
{
  return sub_10000EFA0(&qword_100020598, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_10000F1A8()
{
  return sub_10000EFA0(&qword_1000205A0, type metadata accessor for LaunchOptionsKey);
}

void sub_10000F1F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to subscribe to AVSystemController notifications due to error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000F270()
{
  uint64_t v0 = abort_report_np();
  sub_10000F298(v0);
}

void sub_10000F298()
{
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t UISceneSessionActivationRequest.init(role:userActivity:options:)()
{
  return UISceneSessionActivationRequest.init(role:userActivity:options:)();
}

uint64_t type metadata accessor for UISceneSessionActivationRequest()
{
  return type metadata accessor for UISceneSessionActivationRequest();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t UIApplication.activateSceneSession(for:errorHandler:)()
{
  return UIApplication.activateSceneSession(for:errorHandler:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return _BSDispatchQueueCreateSerial();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return _NSHomeDirectoryForUser(userName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PTLogObjectForTopic()
{
  return _PTLogObjectForTopic();
}

uint64_t PTPrototypingEnumerateHardwareEventsWithBlock()
{
  return _PTPrototypingEnumerateHardwareEventsWithBlock();
}

uint64_t PTPrototypingEventAvailable()
{
  return _PTPrototypingEventAvailable();
}

uint64_t PTPrototypingEventName()
{
  return _PTPrototypingEventName();
}

uint64_t PTTransactionBegin()
{
  return _PTTransactionBegin();
}

uint64_t PTTransactionEnd()
{
  return _PTTransactionEnd();
}

uint64_t PTUIClientInterface()
{
  return _PTUIClientInterface();
}

uint64_t PTUIServerInterface()
{
  return _PTUIServerInterface();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

id objc_msgSend__broadCastState_withStateInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_broadCastState:withStateInfo:");
}

id objc_msgSend__disableRemoteEditingServer(void *a1, const char *a2, ...)
{
  return _[a1 _disableRemoteEditingServer];
}

id objc_msgSend__hardwareEventSection(void *a1, const char *a2, ...)
{
  return _[a1 _hardwareEventSection];
}

id objc_msgSend__killSection(void *a1, const char *a2, ...)
{
  return _[a1 _killSection];
}

id objc_msgSend__populateTableDataAndChildren(void *a1, const char *a2, ...)
{
  return _[a1 _populateTableDataAndChildren];
}

id objc_msgSend__subscribeToAVSystemControllerNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _subscribeToAVSystemControllerNotifications];
}

id objc_msgSend__volumeSection(void *a1, const char *a2, ...)
{
  return _[a1 _volumeSection];
}

id objc_msgSend__volumeSliderRow(void *a1, const char *a2, ...)
{
  return _[a1 _volumeSliderRow];
}

id objc_msgSend__writeToDiskWithParameterRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_writeToDiskWithParameterRecords:");
}

id objc_msgSend_abort(void *a1, const char *a2, ...)
{
  return _[a1 abort];
}

id objc_msgSend_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "action:");
}

id objc_msgSend_actionRevision(void *a1, const char *a2, ...)
{
  return _[a1 actionRevision];
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithViewControllerCreator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithViewControllerCreator:");
}

id objc_msgSend_activateSceneSessionForRequest_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateSceneSessionForRequest:errorHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_appendObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:");
}

id objc_msgSend_appendObject_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:counterpart:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appendString_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:counterpart:");
}

id objc_msgSend_applyArchiveValue_forRootSettingsKeyPath_domainID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyArchiveValue:forRootSettingsKeyPath:domainID:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_builder(void *a1, const char *a2, ...)
{
  return _[a1 builder];
}

id objc_msgSend_builderWithObject_ofExpectedClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builderWithObject:ofExpectedClass:");
}

id objc_msgSend_changedValue(void *a1, const char *a2, ...)
{
  return _[a1 changedValue];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _[a1 connectedScenes];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultContentConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultContentConfiguration];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didStartAcceptingConnections(void *a1, const char *a2, ...)
{
  return _[a1 didStartAcceptingConnections];
}

id objc_msgSend_displayedShowsUIValueForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayedShowsUIValueForEvent:");
}

id objc_msgSend_domainInfoByID(void *a1, const char *a2, ...)
{
  return _[a1 domainInfoByID];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_getActiveCategoryVolume_andName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActiveCategoryVolume:andName:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithParameterRecords_withTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameterRecords:withTitle:");
}

id objc_msgSend_initWithRecordClassName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordClassName:value:");
}

id objc_msgSend_initWithType_revision_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:revision:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invokeOutletAtKeyPath_domainID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeOutletAtKeyPath:domainID:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_killSpringBoard(void *a1, const char *a2, ...)
{
  return _[a1 killSpringBoard];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_localSettingsOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSettingsOfClass:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_moduleWithSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moduleWithSettings:");
}

id objc_msgSend_moduleWithTitle_contents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moduleWithTitle:contents:");
}

id objc_msgSend_multiWindowEnabled(void *a1, const char *a2, ...)
{
  return _[a1 multiWindowEnabled];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_observeShowUISwitchDefaultsOnQueue_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeShowUISwitchDefaultsOnQueue:withBlock:");
}

id objc_msgSend_parameterRecordsOfTunedSettings(void *a1, const char *a2, ...)
{
  return _[a1 parameterRecordsOfTunedSettings];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_prepareForConnection(void *a1, const char *a2, ...)
{
  return _[a1 prepareForConnection];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_recordClassName(void *a1, const char *a2, ...)
{
  return _[a1 recordClassName];
}

id objc_msgSend_recordDictionary(void *a1, const char *a2, ...)
{
  return _[a1 recordDictionary];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_restoreDefaultValuesForDomainID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreDefaultValuesForDomainID:");
}

id objc_msgSend_rootSettingsProxyDefinitionForDomainID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootSettingsProxyDefinitionForDomainID:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_rowWithTitle_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithTitle:action:");
}

id objc_msgSend_rowWithTitle_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithTitle:actionHandler:");
}

id objc_msgSend_rowWithTitle_valueGetter_valueSetter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithTitle:valueGetter:valueSetter:");
}

id objc_msgSend_rowWithTitle_valueKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithTitle:valueKeyPath:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_sectionWithRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionWithRows:");
}

id objc_msgSend_sectionWithRows_title_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionWithRows:title:");
}

id objc_msgSend_sendEvent_forTestRecipeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:forTestRecipeID:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setActiveCategoryVolumeTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveCategoryVolumeTo:");
}

id objc_msgSend_setActiveTestRecipeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveTestRecipeID:");
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttribute:forKey:error:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setChangedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangedValue:");
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentConfiguration:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExternalCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExternalCondition:");
}

id objc_msgSend_setMultiWindowEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultiWindowEnabled:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPreventLockover_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreventLockover:");
}

id objc_msgSend_setRecordClassName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordClassName:");
}

id objc_msgSend_setRecordDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordDictionary:");
}

id objc_msgSend_setSecondaryText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryText:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUnregisterBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnregisterBlock:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_settingsEditingModule(void *a1, const char *a2, ...)
{
  return _[a1 settingsEditingModule];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_stateType(void *a1, const char *a2, ...)
{
  return _[a1 stateType];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_submoduleWithModule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submoduleWithModule:");
}

id objc_msgSend_testRecipeSelectionModule(void *a1, const char *a2, ...)
{
  return _[a1 testRecipeSelectionModule];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}