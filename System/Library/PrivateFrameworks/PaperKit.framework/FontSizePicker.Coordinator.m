@interface FontSizePicker.Coordinator
- (void)valueEditingViewController:(id)a3 didChangeValue:(int64_t)a4;
@end

@implementation FontSizePicker.Coordinator

- (void)valueEditingViewController:(id)a3 didChangeValue:(int64_t)a4
{
  type metadata accessor for FontSizeViewController();
  if (swift_dynamicCastClass())
  {
    v7 = *(void (**)(int64_t))((char *)&self->super.isa
                                               + OBJC_IVAR____TtCV8PaperKit14FontSizePicker11Coordinator_pickedSize);
    id v8 = a3;
    v9 = self;
    v7(a4);
  }
}

- (void).cxx_destruct
{
}

@end