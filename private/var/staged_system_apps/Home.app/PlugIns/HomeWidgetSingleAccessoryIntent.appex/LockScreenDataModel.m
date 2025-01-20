@interface LockScreenDataModel
- (_TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel)init;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation LockScreenDataModel

- (_TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel)init
{
  return (_TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel *)LockScreenDataModel.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_homeManager));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_currentHome);
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s31HomeWidgetSingleAccessoryIntent19LockScreenDataModelC25homeManagerDidUpdateHomesyySo06HMHomeK0CF_0(v4);
}

@end