@interface MIUIMedicalIDLearnMoreNavigationViewControllerFactory
+ (id)makeViewController;
- (MIUIMedicalIDLearnMoreNavigationViewControllerFactory)init;
@end

@implementation MIUIMedicalIDLearnMoreNavigationViewControllerFactory

+ (id)makeViewController
{
  uint64_t v2 = type metadata accessor for MedicalIDLearnMoreNavigationView();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  v5 = (uint64_t *)((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v3);
  v7 = (char *)&v12 - v6;
  uint64_t *v5 = swift_getKeyPath();
  sub_255DF0220();
  swift_storeEnumTagMultiPayload();
  sub_255DF0278((uint64_t)v5, (uint64_t)v7);
  sub_255DF02DC();
  id v9 = objc_allocWithZone(v8);
  v10 = (void *)sub_255EEEDC0();
  return v10;
}

- (MIUIMedicalIDLearnMoreNavigationViewControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)MIUIMedicalIDLearnMoreNavigationViewControllerFactory;
  return [(MIUIMedicalIDLearnMoreNavigationViewControllerFactory *)&v3 init];
}

@end