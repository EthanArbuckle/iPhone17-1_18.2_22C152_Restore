@interface LockScreenDataModel
- (_TtC20HomeWidgetLockScreen19LockScreenDataModel)init;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation LockScreenDataModel

- (_TtC20HomeWidgetLockScreen19LockScreenDataModel)init
{
  return (_TtC20HomeWidgetLockScreen19LockScreenDataModel *)LockScreenDataModel.init()();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20HomeWidgetLockScreen19LockScreenDataModel_currentHome);
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s20HomeWidgetLockScreen0cD9DataModelC25homeManagerDidUpdateHomesyySo06HMHomeH0CF_0(v4);
}

@end