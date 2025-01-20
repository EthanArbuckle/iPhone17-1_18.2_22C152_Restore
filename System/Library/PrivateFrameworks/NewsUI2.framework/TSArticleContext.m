@interface TSArticleContext
- (BOOL)shouldAutoPlayVideo;
- (NSDate)userActionDate;
- (NSString)adPreviewID;
- (NSString)adPreviewSessionID;
- (NSString)adQToken;
- (NSString)notificationID;
- (NSString)notificationSenderChannelID;
- (NSString)previousArticleID;
- (NSString)previousArticleVersion;
- (NSString)sourceApplication;
- (NSString)title;
- (NSURL)url;
- (TSAnalyticsReferral)referral;
- (TSArticleContext)init;
- (TSArticleContext)initWithUrl:(id)a3 title:(id)a4 sourceApplication:(id)a5 previousArticleID:(id)a6 previousArticleVersion:(id)a7 adPreviewSessionID:(id)a8 adPreviewID:(id)a9 adQToken:(id)a10 maximumAdRequestsForCurrentAdPreviewID:(int64_t)a11 userActionDate:(id)a12 presentationReason:(int64_t)a13 notificationID:(id)a14 notificationSenderChannelID:(id)a15 referral:(id)a16 shouldAutoPlayVideo:(BOOL)a17;
- (int64_t)maximumAdRequestsForCurrentAdPreviewID;
- (int64_t)presentationReason;
- (void)setReferral:(id)a3;
@end

@implementation TSArticleContext

- (NSURL)url
{
  v3 = (void (*)(uint64_t))MEMORY[0x1E4F276F0];
  sub_1DE93634C(0, (unint64_t *)&qword_1EBAA6D40, MEMORY[0x1E4F276F0]);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v11 - v5;
  sub_1DEAEAB90((uint64_t)self + OBJC_IVAR___TSArticleContext_url, (uint64_t)&v11 - v5, (unint64_t *)&qword_1EBAA6D40, v3);
  uint64_t v7 = sub_1DFDE7220();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v9 = (void *)sub_1DFDE7130();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  return (NSURL *)v9;
}

- (NSString)title
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_title);
}

- (NSString)sourceApplication
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_sourceApplication);
}

- (NSString)previousArticleID
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_previousArticleID);
}

- (NSString)previousArticleVersion
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_previousArticleVersion);
}

- (NSString)adPreviewSessionID
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_adPreviewSessionID);
}

- (NSString)adPreviewID
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_adPreviewID);
}

- (NSString)adQToken
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_adQToken);
}

- (int64_t)maximumAdRequestsForCurrentAdPreviewID
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___TSArticleContext_maximumAdRequestsForCurrentAdPreviewID);
}

- (NSDate)userActionDate
{
  v3 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1DE93634C(0, (unint64_t *)&qword_1EBAA6DB0, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v11 - v5;
  sub_1DEAEAB90((uint64_t)self + OBJC_IVAR___TSArticleContext_userActionDate, (uint64_t)&v11 - v5, (unint64_t *)&qword_1EBAA6DB0, v3);
  uint64_t v7 = sub_1DFDE7600();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v9 = (void *)sub_1DFDE74D0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  return (NSDate *)v9;
}

- (int64_t)presentationReason
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___TSArticleContext_presentationReason);
}

- (NSString)notificationID
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_notificationID);
}

- (NSString)notificationSenderChannelID
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_notificationSenderChannelID);
}

- (BOOL)shouldAutoPlayVideo
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___TSArticleContext_shouldAutoPlayVideo);
}

- (TSAnalyticsReferral)referral
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___TSArticleContext_referral);
  swift_beginAccess();
  return (TSAnalyticsReferral *)*v2;
}

- (void)setReferral:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___TSArticleContext_referral);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (TSArticleContext)initWithUrl:(id)a3 title:(id)a4 sourceApplication:(id)a5 previousArticleID:(id)a6 previousArticleVersion:(id)a7 adPreviewSessionID:(id)a8 adPreviewID:(id)a9 adQToken:(id)a10 maximumAdRequestsForCurrentAdPreviewID:(int64_t)a11 userActionDate:(id)a12 presentationReason:(int64_t)a13 notificationID:(id)a14 notificationSenderChannelID:(id)a15 referral:(id)a16 shouldAutoPlayVideo:(BOOL)a17
{
  v82 = self;
  sub_1DE93634C(0, (unint64_t *)&qword_1EBAA6DB0, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v23 - 8);
  v25 = (char *)&v65 - v24;
  sub_1DE93634C(0, (unint64_t *)&qword_1EBAA6D40, MEMORY[0x1E4F276F0]);
  MEMORY[0x1F4188790](v26 - 8);
  v28 = (char *)&v65 - v27;
  if (a3)
  {
    sub_1DFDE7190();
    uint64_t v29 = sub_1DFDE7220();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 0, 1, v29);
  }
  else
  {
    uint64_t v30 = sub_1DFDE7220();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v28, 1, 1, v30);
  }
  v81 = v25;
  if (a4)
  {
    uint64_t v31 = sub_1DFDFDD20();
    uint64_t v78 = v32;
    uint64_t v79 = v31;
  }
  else
  {
    uint64_t v78 = 0;
    uint64_t v79 = 0;
  }
  id v84 = a14;
  id v85 = a15;
  id v83 = a12;
  if (a5)
  {
    uint64_t v33 = sub_1DFDFDD20();
    uint64_t v76 = v34;
    uint64_t v77 = v33;
    v80 = v28;
    if (a6)
    {
LABEL_9:
      uint64_t v35 = sub_1DFDFDD20();
      uint64_t v74 = v36;
      uint64_t v75 = v35;
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    v80 = v28;
    if (a6) {
      goto LABEL_9;
    }
  }
  uint64_t v74 = 0;
  uint64_t v75 = 0;
LABEL_12:
  id v37 = a7;
  id v38 = a8;
  id v39 = a9;
  uint64_t v65 = (uint64_t)a10;
  id v40 = a10;
  id v41 = v83;
  id v42 = v84;
  id v70 = v85;
  id v73 = a16;
  if (v37)
  {
    uint64_t v43 = sub_1DFDFDD20();
    uint64_t v71 = v44;
    uint64_t v72 = v43;

    if (v38) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v71 = 0;
    uint64_t v72 = 0;
    if (v38)
    {
LABEL_14:
      uint64_t v45 = sub_1DFDFDD20();
      uint64_t v68 = v46;
      uint64_t v69 = v45;

      if (v39) {
        goto LABEL_15;
      }
      goto LABEL_20;
    }
  }
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  if (v39)
  {
LABEL_15:
    uint64_t v47 = sub_1DFDFDD20();
    uint64_t v66 = v48;
    uint64_t v67 = v47;

    v49 = v42;
    if (v40) {
      goto LABEL_16;
    }
LABEL_21:
    uint64_t v65 = 0;
    uint64_t v51 = 0;
    if (v41) {
      goto LABEL_17;
    }
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  v49 = v42;
  if (!v40) {
    goto LABEL_21;
  }
LABEL_16:
  uint64_t v65 = sub_1DFDFDD20();
  uint64_t v51 = v50;

  if (v41)
  {
LABEL_17:
    uint64_t v52 = (uint64_t)v81;
    sub_1DFDE7570();

    uint64_t v53 = sub_1DFDE7600();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v52, 0, 1, v53);
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v54 = sub_1DFDE7600();
  uint64_t v52 = (uint64_t)v81;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v81, 1, 1, v54);
LABEL_23:
  if (v49)
  {
    uint64_t v55 = sub_1DFDFDD20();
    uint64_t v57 = v56;
  }
  else
  {
    uint64_t v55 = 0;
    uint64_t v57 = 0;
  }
  v58 = v70;
  if (v70)
  {
    uint64_t v59 = sub_1DFDFDD20();
    uint64_t v61 = v60;
  }
  else
  {
    uint64_t v59 = 0;
    uint64_t v61 = 0;
  }
  v62 = v73;
  v63 = (TSArticleContext *)sub_1DF26339C((uint64_t)v80, v79, v78, v77, v76, v75, v74, v72, v71, v69, v68, v67, v66, v65, v51, a11, v52, a13, v55,
                              v57,
                              v59,
                              v61,
                              v73,
                              a17);

  return v63;
}

- (TSArticleContext)init
{
  result = (TSArticleContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEA16D3C((uint64_t)self + OBJC_IVAR___TSArticleContext_url, (unint64_t *)&qword_1EBAA6D40, MEMORY[0x1E4F276F0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DEA16D3C((uint64_t)self + OBJC_IVAR___TSArticleContext_userActionDate, (unint64_t *)&qword_1EBAA6DB0, MEMORY[0x1E4F27928]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSArticleContext_referral);
}

@end