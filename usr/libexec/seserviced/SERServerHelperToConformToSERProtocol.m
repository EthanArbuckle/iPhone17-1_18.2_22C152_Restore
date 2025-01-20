@interface SERServerHelperToConformToSERProtocol
- (void)addReservationWithType:(NSString *)a3 metadata:(NSData *)a4 completionHandler:(id)a5;
- (void)clearReservationsWithCompletionHandler:(id)a3;
- (void)editReservationWithUuid:(NSUUID *)a3 metadata:(NSData *)a4 completionHandler:(id)a5;
- (void)findReservationWithUuid:(NSUUID *)a3 completionHandler:(id)a4;
- (void)getCredentialConfigUUIDFor:(NSUUID *)a3 completionHandler:(id)a4;
- (void)getCredentialSizesWithCompletionHandler:(id)a3;
- (void)getDeviceCapabilityWithCompletionHandler:(id)a3;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)isSPAppletWithData:(NSData *)a3 completionHandler:(id)a4;
- (void)removeReservationWithUuid:(NSUUID *)a3 completionHandler:(id)a4;
- (void)reservationsWithCompletionHandler:(id)a3;
@end

@implementation SERServerHelperToConformToSERProtocol

- (void)getStateWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1004562D0;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1004562D8;
  v13[5] = v12;
  swift_retain();
  sub_10013CE8C((uint64_t)v8, (uint64_t)&unk_1004562E0, (uint64_t)v13);
  swift_release();
}

- (void)addReservationWithType:(NSString *)a3 metadata:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v9 - 8, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1004562A8;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1004562B0;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  swift_retain();
  sub_10013CE8C((uint64_t)v12, (uint64_t)&unk_1004562B8, (uint64_t)v17);
  swift_release();
}

- (void)editReservationWithUuid:(NSUUID *)a3 metadata:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v9 - 8, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100456280;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100456288;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  swift_retain();
  sub_10013CE8C((uint64_t)v12, (uint64_t)&unk_100456290, (uint64_t)v17);
  swift_release();
}

- (void)findReservationWithUuid:(NSUUID *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100456258;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100456260;
  v15[5] = v14;
  v16 = a3;
  swift_retain();
  sub_10013CE8C((uint64_t)v10, (uint64_t)&unk_100456268, (uint64_t)v15);
  swift_release();
}

- (void)removeReservationWithUuid:(NSUUID *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100456230;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100456238;
  v15[5] = v14;
  v16 = a3;
  swift_retain();
  sub_10013CE8C((uint64_t)v10, (uint64_t)&unk_100456240, (uint64_t)v15);
  swift_release();
}

- (void)reservationsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100456200;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100456208;
  v13[5] = v12;
  swift_retain();
  sub_10013CE8C((uint64_t)v8, (uint64_t)&unk_100456210, (uint64_t)v13);
  swift_release();
}

- (void)clearReservationsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1004561D8;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1004561E0;
  v13[5] = v12;
  swift_retain();
  sub_10013CE8C((uint64_t)v8, (uint64_t)&unk_1004561E8, (uint64_t)v13);
  swift_release();
}

- (void)getCredentialSizesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1004561A0;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1004561A8;
  v13[5] = v12;
  swift_retain();
  sub_10013CE8C((uint64_t)v8, (uint64_t)&unk_1004561B0, (uint64_t)v13);
  swift_release();
}

- (void)isSPAppletWithData:(NSData *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100456180;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100456188;
  v15[5] = v14;
  v16 = a3;
  swift_retain();
  sub_10013CE8C((uint64_t)v10, (uint64_t)&unk_100456190, (uint64_t)v15);
  swift_release();
}

- (void)getCredentialConfigUUIDFor:(NSUUID *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100456160;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100456168;
  v15[5] = v14;
  v16 = a3;
  swift_retain();
  sub_10013CE8C((uint64_t)v10, (uint64_t)&unk_100456170, (uint64_t)v15);
  swift_release();
}

- (void)getDeviceCapabilityWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100456120;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100456130;
  v13[5] = v12;
  swift_retain();
  sub_10013CE8C((uint64_t)v8, (uint64_t)&unk_100456140, (uint64_t)v13);
  swift_release();
}

@end