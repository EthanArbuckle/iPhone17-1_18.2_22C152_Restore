@interface ReadingActivityDonor
- (_TtC5Books20ReadingActivityDonor)init;
- (_TtC5Books20ReadingActivityDonor)initWithType:(id)a3;
- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5;
@end

@implementation ReadingActivityDonor

- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_1007FDC70();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a3;
  v12 = self;
  sub_10005C7B4((uint64_t)v11, v9, (uint64_t)a4, (uint64_t)v12, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (_TtC5Books20ReadingActivityDonor)initWithType:(id)a3
{
  self->BMBaseDonor_opaque[OBJC_IVAR____TtC5Books20ReadingActivityDonor_coachingPermissionApproved] = 0;
  uint64_t v4 = OBJC_IVAR____TtC5Books20ReadingActivityDonor_coachingPermissionApprovedConfig;
  id v5 = objc_allocWithZone((Class)sub_1007F57D0());
  *(void *)&self->BMBaseDonor_opaque[v4] = sub_1007F57C0();

  result = (_TtC5Books20ReadingActivityDonor *)sub_1007FF260();
  __break(1u);
  return result;
}

- (_TtC5Books20ReadingActivityDonor)init
{
  result = (_TtC5Books20ReadingActivityDonor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s5Books15CurrentPageViewVwxx_0((uint64_t)&self->BMBaseDonor_opaque[OBJC_IVAR____TtC5Books20ReadingActivityDonor_goalsStateProvider]);
  _s5Books15CurrentPageViewVwxx_0((uint64_t)&self->BMBaseDonor_opaque[OBJC_IVAR____TtC5Books20ReadingActivityDonor_historyStateProvider]);
  _s5Books15CurrentPageViewVwxx_0((uint64_t)&self->BMBaseDonor_opaque[OBJC_IVAR____TtC5Books20ReadingActivityDonor_booksFinishedStateProvider]);
  v3 = *(void **)&self->BMBaseDonor_opaque[OBJC_IVAR____TtC5Books20ReadingActivityDonor_coachingPermissionApprovedConfig];
}

@end