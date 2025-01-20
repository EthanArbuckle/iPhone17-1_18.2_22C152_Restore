@interface PKAddressFieldPickerViewHosting
+ (id)loadViewControllerWithAllowedValues:(id)a3 selectedValue:(id)a4 isValid:(BOOL)a5 onCommit:(id)a6;
- (_TtC9PassKitUI31PKAddressFieldPickerViewHosting)init;
@end

@implementation PKAddressFieldPickerViewHosting

+ (id)loadViewControllerWithAllowedValues:(id)a3 selectedValue:(id)a4 isValid:(BOOL)a5 onCommit:(id)a6
{
  v7 = _Block_copy(a6);
  sub_19FB90E7C();
  sub_1A03B4C58();
  *(void *)(swift_allocObject() + 16) = v7;
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E94B2EC8));
  id v8 = a4;
  v9 = (void *)sub_1A03B29C8();

  return v9;
}

- (_TtC9PassKitUI31PKAddressFieldPickerViewHosting)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PKAddressFieldPickerViewHosting();
  return [(PKAddressFieldPickerViewHosting *)&v3 init];
}

@end