@interface OnBoardingPresenter
- (_TtC17SequoiaTranslator19OnBoardingPresenter)init;
- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3;
@end

@implementation OnBoardingPresenter

- (_TtC17SequoiaTranslator19OnBoardingPresenter)init
{
  return (_TtC17SequoiaTranslator19OnBoardingPresenter *)sub_10018036C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19OnBoardingPresenter_settingsConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19OnBoardingPresenter_dataSharingPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19OnBoardingPresenter_initialLocalePair));
  v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19OnBoardingPresenter_presentationContinuation;

  sub_100180B20((uint64_t)v3);
}

- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100180918();
}

@end