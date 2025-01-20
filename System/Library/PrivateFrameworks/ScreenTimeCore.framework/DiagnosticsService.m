@interface DiagnosticsService
- (void)configurationVersionWithCompletionHandler:(id)a3;
- (void)didReceiveInboundMessage:(id)a3;
- (void)didReceiveOutboundMessage:(id)a3;
- (void)killScreenTimeAgent:(NSString *)a3 completionHandler:(id)a4;
- (void)localConfigurationVersionWithCompletionHandler:(id)a3;
- (void)postNotificationWithContext:(STUserNotificationContext *)a3 completionHandler:(id)a4;
- (void)postWeeklyReportNotificationWithCompletionHandler:(id)a3;
- (void)registerForInboundMessages;
- (void)registerForOutboundMessages;
- (void)removeNotificationWithContext:(STUserNotificationContext *)a3 completionHandler:(id)a4;
- (void)repairBlueprintsWithCompletionHandler:(id)a3;
- (void)sendBlueprintChangesWithCompletionHandler:(id)a3;
- (void)sendBlueprintsWithCompletionHandler:(id)a3;
- (void)sendCheckInRequestOnV2WithCompletionHandler:(id)a3;
- (void)sendCheckInRequestWithCompletionHandler:(id)a3;
- (void)sendSettingsChangesWithCompletionHandler:(id)a3;
- (void)sendSettingsWithCompletionHandler:(id)a3;
- (void)sendUserDeviceStateWithCompletionHandler:(id)a3;
- (void)setLocalConfigurationVersion:(NSNumber *)a3 completionHandler:(id)a4;
@end

@implementation DiagnosticsService

- (void)localConfigurationVersionWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100342F58;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342F60;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342F68, (uint64_t)v12);
  swift_release();
}

- (void)setLocalConfigurationVersion:(NSNumber *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100342F38;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100342F40;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100342F48, (uint64_t)v14);
  swift_release();
}

- (void)configurationVersionWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100342F18;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342F20;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342F28, (uint64_t)v12);
  swift_release();
}

- (void)repairBlueprintsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100342EF8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342F00;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342F08, (uint64_t)v12);
  swift_release();
}

- (void)sendCheckInRequestWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100342ED0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342ED8;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342EE0, (uint64_t)v12);
  swift_release();
}

- (void)sendCheckInRequestOnV2WithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100342EA8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342EB0;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342EB8, (uint64_t)v12);
  swift_release();
}

- (void)sendBlueprintsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100342E80;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342E88;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342E90, (uint64_t)v12);
  swift_release();
}

- (void)sendBlueprintChangesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100342E58;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342E60;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342E68, (uint64_t)v12);
  swift_release();
}

- (void)sendSettingsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100342E30;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342E38;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342E40, (uint64_t)v12);
  swift_release();
}

- (void)sendSettingsChangesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100342E08;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342E10;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342E18, (uint64_t)v12);
  swift_release();
}

- (void)sendUserDeviceStateWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100342DE0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342DE8;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342DF0, (uint64_t)v12);
  swift_release();
}

- (void)registerForInboundMessages
{
}

- (void)registerForOutboundMessages
{
}

- (void)postWeeklyReportNotificationWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100342DC0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342DC8;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342DD0, (uint64_t)v12);
  swift_release();
}

- (void)postNotificationWithContext:(STUserNotificationContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100342DA0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100342DA8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100342DB0, (uint64_t)v14);
  swift_release();
}

- (void)removeNotificationWithContext:(STUserNotificationContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100342D80;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100342D88;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100342D90, (uint64_t)v14);
  swift_release();
}

- (void)didReceiveInboundMessage:(id)a3
{
}

- (void)didReceiveOutboundMessage:(id)a3
{
}

- (void)killScreenTimeAgent:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100342D68;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1003464F0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100346060, (uint64_t)v14);
  swift_release();
}

@end