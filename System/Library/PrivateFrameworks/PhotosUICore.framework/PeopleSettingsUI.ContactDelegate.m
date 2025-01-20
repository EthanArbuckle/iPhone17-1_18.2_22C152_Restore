@interface PeopleSettingsUI.ContactDelegate
- (_TtCV12PhotosUICore16PeopleSettingsUIP33_E1EA5DB3545FF0DE93FEB1445B7F370215ContactDelegate)init;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
@end

@implementation PeopleSettingsUI.ContactDelegate

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  sub_1A9B21070(0, &qword_1E9831810);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = objc_msgSend(ObjCClassFromMetadata, sel_sharedInstance);
  id v12 = objc_msgSend(v9, sel_identifier);
  if (!v12)
  {
    sub_1AB23A76C();
    id v13 = (id)sub_1AB23A72C();
    swift_bridgeObjectRelease();
    id v12 = v13;
  }
  id v14 = v12;
  objc_msgSend(v11, sel_setDebugContactIdentifier_);
}

- (_TtCV12PhotosUICore16PeopleSettingsUIP33_E1EA5DB3545FF0DE93FEB1445B7F370215ContactDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PeopleSettingsUI.ContactDelegate *)&v3 init];
}

@end