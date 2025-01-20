@interface SMContactsManagerInternal
+ (SMContactsManagerInternal)shared;
- (SMContactsManagerInternal)init;
- (id)activeSessionRecipientContactsFor:(id)a3;
- (id)contactWith:(id)a3;
- (id)fetchAdditionalInfoFor:(id)a3 keysToFetch:(id)a4;
- (id)fetchSelfContact;
- (void)dealloc;
@end

@implementation SMContactsManagerInternal

- (SMContactsManagerInternal)init
{
  return (SMContactsManagerInternal *)sub_25B6F4D18();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_name_object_, v4, *MEMORY[0x263EFE118], 0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ContactsManager();
  [(SMContactsManagerInternal *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (SMContactsManagerInternal)shared
{
  if (qword_26A50D7D0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26A50DD70;
  return (SMContactsManagerInternal *)v2;
}

- (id)contactWith:(id)a3
{
  if (a3)
  {
    v4 = (void *)sub_25B7582F0();
    objc_super v6 = v5;
  }
  else
  {
    v4 = 0;
    objc_super v6 = 0;
  }
  v7 = self;
  v8 = sub_25B6F5690(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)activeSessionRecipientContactsFor:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_25B6F67A4(a3);

  sub_25B6EDC70(0, &qword_26A50DDB0);
  v7 = (void *)sub_25B758390();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)fetchAdditionalInfoFor:(id)a3 keysToFetch:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  if (a3)
  {
    sub_25B6EDC70(0, &qword_26A50DDB0);
    unint64_t v5 = sub_25B7583A0();
  }
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A50DDA8);
    uint64_t v7 = sub_25B7583A0();
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  unint64_t v9 = sub_25B6F6EFC(v5, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
    sub_25B6EDC70(0, &qword_26A50DDB0);
    v10 = (void *)sub_25B758390();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)fetchSelfContact
{
  v2 = self;
  id v3 = sub_25B6F7798();

  return v3;
}

@end