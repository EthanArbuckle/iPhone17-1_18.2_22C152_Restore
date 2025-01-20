@interface PNKeyPickerProcessor
+ (id)keyPickFromAssets:(id)a3 options:(id)a4;
- (PNKeyPickerProcessor)init;
@end

@implementation PNKeyPickerProcessor

+ (id)keyPickFromAssets:(id)a3 options:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D2408);
  uint64_t v5 = sub_259955FD0();
  id v6 = a4;
  v7 = (void *)static PNKeyPickerProcessor.keyPick(from:options:)(v5, v6);

  swift_bridgeObjectRelease();
  return v7;
}

- (PNKeyPickerProcessor)init
{
  return (PNKeyPickerProcessor *)PNKeyPickerProcessor.init()();
}

@end