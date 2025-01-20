@interface WolfAirDropNoticeSessionsController
- (_TtC13AirDropNotice35WolfAirDropNoticeSessionsController)init;
- (void)dealloc;
- (void)transferEndedForIdentifier:(id)a3;
- (void)transferStartedForIdentifier:(id)a3 isFromMe:(id)a4 withTransferState:(id)a5 itemCount:(id)a6 isDestinationDownloads:(id)a7 senderName:(id)a8 localizedTransferDescription:(id)a9 previewImageData:(id)a10 contactIdentifier:(id)a11;
- (void)transferUpdatedForIdentifier:(id)a3 withTransferState:(id)a4 transferAccepted:(id)a5 completedUnitCount:(id)a6 totalUnitCount:(id)a7 localizedTransferDescription:(id)a8;
@end

@implementation WolfAirDropNoticeSessionsController

- (_TtC13AirDropNotice35WolfAirDropNoticeSessionsController)init
{
  return (_TtC13AirDropNotice35WolfAirDropNoticeSessionsController *)sub_100005AB0();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_100014AA0;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10000D0D0();
  sub_10000A948(v6, (uint64_t)qword_100014AA8);
  v7 = sub_10000D0B0();
  os_log_type_t v8 = sub_10000D1D0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "WolfAirDropNoticeSessionsController deinit", v9, 2u);
    swift_slowDealloc();
  }

  sub_100006A84();
  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(WolfAirDropNoticeSessionsController *)&v10 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController_connection));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController__airDropSessionsByID;
  uint64_t v4 = sub_10000B0A0(&qword_100015108);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (void)transferStartedForIdentifier:(id)a3 isFromMe:(id)a4 withTransferState:(id)a5 itemCount:(id)a6 isDestinationDownloads:(id)a7 senderName:(id)a8 localizedTransferDescription:(id)a9 previewImageData:(id)a10 contactIdentifier:(id)a11
{
  uint64_t v17 = (uint64_t)a10;
  uint64_t v36 = sub_10000D170();
  unint64_t v38 = v18;
  if (a8)
  {
    uint64_t v35 = sub_10000D170();
    unint64_t v37 = v19;
    if (a9)
    {
LABEL_3:
      uint64_t v20 = sub_10000D170();
      v39 = v21;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v35 = 0;
    unint64_t v37 = 0;
    if (a9) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = 0;
  v39 = 0;
LABEL_6:
  id v34 = a4;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  v22 = self;
  id v23 = a11;
  v24 = v23;
  if (a10)
  {
    id v25 = a10;
    uint64_t v17 = sub_10000D070();
    unint64_t v27 = v26;

    if (v24)
    {
LABEL_8:
      uint64_t v28 = sub_10000D170();
      unint64_t v30 = v29;

      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v27 = 0xF000000000000000;
    if (v23) {
      goto LABEL_8;
    }
  }
  uint64_t v28 = 0;
  unint64_t v30 = 0;
LABEL_11:
  sub_1000071F4(v36, v38, v34, v33, (uint64_t)v32, v31, v35, v37, v20, v39, v17, v27, v28, v30);
  swift_bridgeObjectRelease();
  sub_10000C04C(v17, v27);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)transferUpdatedForIdentifier:(id)a3 withTransferState:(id)a4 transferAccepted:(id)a5 completedUnitCount:(id)a6 totalUnitCount:(id)a7 localizedTransferDescription:(id)a8
{
  uint64_t v14 = sub_10000D170();
  unint64_t v16 = v15;
  if (a8)
  {
    uint64_t v17 = sub_10000D170();
    a8 = v18;
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  v22 = (char *)a7;
  id v23 = self;
  sub_1000083D8(v14, v16, v19, v20, v21, v22, v17, (uint64_t)a8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)transferEndedForIdentifier:(id)a3
{
  uint64_t v4 = sub_10000D170();
  unint64_t v6 = v5;
  v7 = self;
  sub_100007DF4(v4, v6);

  swift_bridgeObjectRelease();
}

@end