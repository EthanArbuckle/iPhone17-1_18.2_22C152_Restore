@interface ColorPickerRepresentable.Coordinator
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)colorPickerViewControllerDidFinish:(id)a3;
@end

@implementation ColorPickerRepresentable.Coordinator

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  v7 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCV8PaperKit24ColorPickerRepresentable11Coordinator_pickedColor);
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  v7(v9);
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  uint64_t v5 = type metadata accessor for PresentationMode();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<PresentationMode>);
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ColorPickerRepresentable(0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ColorPickerRepresentable((uint64_t)self + OBJC_IVAR____TtCV8PaperKit24ColorPickerRepresentable11Coordinator_parent, (uint64_t)v11, type metadata accessor for ColorPickerRepresentable);
  id v12 = a3;
  v13 = self;
  specialized Environment.wrappedValue.getter((uint64_t)v8);
  outlined destroy of ColorPickerRepresentable((uint64_t)v11, type metadata accessor for ColorPickerRepresentable);
  MEMORY[0x21054A870](v6);
  PresentationMode.dismiss()();
  Binding.wrappedValue.setter();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for Binding<PresentationMode>);
}

- (void).cxx_destruct
{
  outlined destroy of ColorPickerRepresentable((uint64_t)self + OBJC_IVAR____TtCV8PaperKit24ColorPickerRepresentable11Coordinator_parent, type metadata accessor for ColorPickerRepresentable);
  swift_release();
}

@end