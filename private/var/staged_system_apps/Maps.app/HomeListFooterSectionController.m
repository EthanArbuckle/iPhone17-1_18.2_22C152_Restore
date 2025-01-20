@interface HomeListFooterSectionController
- (id)homeActionFooterViewUIMenuForRAP:(id)a3;
- (void)homeActionFooterViewDidTapMarkMyLocation:(id)a3;
- (void)homeActionFooterViewDidTapReportAProblem:(id)a3;
- (void)homeActionFooterViewDidTapShareMyLocation:(id)a3;
- (void)homeActionFooterViewDidTapTermsAndConditions:(id)a3;
@end

@implementation HomeListFooterSectionController

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps31HomeListFooterSectionController_rapReportMenuProvider));
}

- (void)homeActionFooterViewDidTapShareMyLocation:(id)a3
{
}

- (void)homeActionFooterViewDidTapMarkMyLocation:(id)a3
{
}

- (void)homeActionFooterViewDidTapReportAProblem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002DD25C();
}

- (void)homeActionFooterViewDidTapTermsAndConditions:(id)a3
{
}

- (id)homeActionFooterViewUIMenuForRAP:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration);
  v5 = (_TtC4Maps31HomeListFooterSectionController *)a3;
  v6 = self;
  v7 = [v4 _maps_mapsSceneDelegate];
  if (v7)
  {
    v8 = v7;
    if (MapsFeature_IsEnabled_RAPCommunityID()) {
      id v9 = [*(id *)((char *)&v6->super.super.isa+ OBJC_IVAR____TtC4Maps31HomeListFooterSectionController_rapReportMenuProvider) getReportMenuFromEntryPoint:8 sceneDelegate:v8];
    }
    else {
      id v9 = 0;
    }

    v5 = v6;
  }
  else
  {
    id v9 = 0;
    v8 = v6;
  }

  return v9;
}

@end