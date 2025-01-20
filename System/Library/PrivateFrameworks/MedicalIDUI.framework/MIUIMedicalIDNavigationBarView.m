@interface MIUIMedicalIDNavigationBarView
- (MIUIMedicalIDNavigationBarView)initWithCoder:(id)a3;
- (MIUIMedicalIDNavigationBarView)initWithFrame:(CGRect)a3;
- (MIUIMedicalIDNavigationBarView)initWithHealthStore:(id)a3 medicalIDData:(id)a4 showDateUpdated:(BOOL)a5 locale:(id)a6;
@end

@implementation MIUIMedicalIDNavigationBarView

- (MIUIMedicalIDNavigationBarView)initWithHealthStore:(id)a3 medicalIDData:(id)a4 showDateUpdated:(BOOL)a5 locale:(id)a6
{
  BOOL v6 = a5;
  uint64_t v9 = sub_255EEE200();
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255EEE1E0();
  id v12 = a3;
  id v13 = a4;
  return (MIUIMedicalIDNavigationBarView *)MIUIMedicalIDNavigationBarView.init(healthStore:medicalIDData:showDateUpdated:locale:)(v12, a4, v6, (uint64_t)v11);
}

- (MIUIMedicalIDNavigationBarView)initWithCoder:(id)a3
{
  result = (MIUIMedicalIDNavigationBarView *)sub_255EF03D0();
  __break(1u);
  return result;
}

- (MIUIMedicalIDNavigationBarView)initWithFrame:(CGRect)a3
{
  result = (MIUIMedicalIDNavigationBarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MIUIMedicalIDNavigationBarView_dateUpdatedLabel);
}

@end