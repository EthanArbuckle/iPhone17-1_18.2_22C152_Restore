@interface EmergencyContactPicker.ContactPickerCoordinator
- (_TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator)init;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
@end

@implementation EmergencyContactPicker.ContactPickerCoordinator

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_255E7BB90(v7, 0);
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = objc_msgSend(v7, sel_contact);
  sub_255E7BB90(v9, (uint64_t)v7);
}

- (_TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator)init
{
  result = (_TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)&self->_contact[OBJC_IVAR____TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator__contact
                                + 104];
  v7[6] = *(_OWORD *)&self->_contact[OBJC_IVAR____TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator__contact
                                   + 88];
  v7[7] = v3;
  v7[8] = *(_OWORD *)&self->_contact[OBJC_IVAR____TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator__contact
                                   + 120];
  long long v4 = *(_OWORD *)&self->_contact[OBJC_IVAR____TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator__contact
                                + 40];
  v7[2] = *(_OWORD *)&self->_contact[OBJC_IVAR____TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator__contact
                                   + 24];
  v7[3] = v4;
  long long v5 = *(_OWORD *)&self->_contact[OBJC_IVAR____TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator__contact
                                + 72];
  v7[4] = *(_OWORD *)&self->_contact[OBJC_IVAR____TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator__contact
                                   + 56];
  v7[5] = v5;
  long long v6 = *(_OWORD *)&self->_contact[OBJC_IVAR____TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator__contact
                                + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.isa
                    + OBJC_IVAR____TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator__contact);
  v7[1] = v6;
  sub_255E7C018((uint64_t)v7);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV11MedicalIDUI22EmergencyContactPicker24ContactPickerCoordinator_coreTelephonyClient));
}

@end