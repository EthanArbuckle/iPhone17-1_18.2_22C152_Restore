@interface AppStoreReviewRequirementConstantStorage
- (_TtC10MobileMail40AppStoreReviewRequirementConstantStorage)init;
- (_TtC10MobileMail40AppStoreReviewRequirementConstantStorage)initWithRemindMeCount:(int64_t)a3 nonDefaultFilterCount:(int64_t)a4 undoSendCount:(int64_t)a5 sendLaterCount:(int64_t)a6 omittedAttachmentRecipientCount:(int64_t)a7 markAsReadCount:(int64_t)a8 topHitSearchCount:(int64_t)a9 moveToPredictionCount:(int64_t)a10;
- (int64_t)countOf:(int64_t)a3;
@end

@implementation AppStoreReviewRequirementConstantStorage

- (_TtC10MobileMail40AppStoreReviewRequirementConstantStorage)initWithRemindMeCount:(int64_t)a3 nonDefaultFilterCount:(int64_t)a4 undoSendCount:(int64_t)a5 sendLaterCount:(int64_t)a6 omittedAttachmentRecipientCount:(int64_t)a7 markAsReadCount:(int64_t)a8 topHitSearchCount:(int64_t)a9 moveToPredictionCount:(int64_t)a10
{
  return (_TtC10MobileMail40AppStoreReviewRequirementConstantStorage *)sub_100261D08(a3, a4, a5, a6, a7, a8, a9, a10);
}

- (_TtC10MobileMail40AppStoreReviewRequirementConstantStorage)init
{
  return (_TtC10MobileMail40AppStoreReviewRequirementConstantStorage *)sub_100261F30();
}

- (int64_t)countOf:(int64_t)a3
{
  v3 = self;
  int64_t v7 = sub_100261FCC(a3);

  return v7;
}

- (void).cxx_destruct
{
}

@end