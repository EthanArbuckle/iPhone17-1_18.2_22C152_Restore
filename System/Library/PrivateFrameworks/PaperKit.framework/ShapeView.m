@interface ShapeView
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (CGRect)textBoxViewActiveTextBoxFrame:(id)a3;
- (void)textBoxViewUpdateModelFrame:(id)a3 modelFrame:(CGRect)a4;
- (void)textBoxViewUpdateViewFrame:(id)a3 viewFrame:(CGRect)a4;
@end

@implementation ShapeView

- (BOOL)becomeFirstResponder
{
  v2 = self;
  Swift::Bool v3 = ShapeView.becomeFirstResponder()();

  return v3;
}

- (BOOL)resignFirstResponder
{
  v2 = self;
  Swift::Bool v3 = ShapeView.resignFirstResponder()();

  return v3;
}

- (CGRect)textBoxViewActiveTextBoxFrame:(id)a3
{
  [(ShapeView *)self frame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)textBoxViewUpdateViewFrame:(id)a3 viewFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Capsule<Shape>);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (char *)self + *(void *)((*MEMORY[0x263F8EED0] & *(void *)self) + 0x380);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v14, v10);
  id v15 = a3;
  v16 = self;
  LOBYTE(self) = specialized Capsule<>.isTextBox.getter();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (self) {
    -[ShapeView setFrame:](v16, sel_setFrame_, x, y, width, height);
  }
}

- (void)textBoxViewUpdateModelFrame:(id)a3 modelFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Capsule<Shape>);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (char *)self + *(void *)((*MEMORY[0x263F8EED0] & *(void *)self) + 0x380);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v14, v10);
  id v15 = a3;
  v16 = self;
  LOBYTE(self) = specialized Capsule<>.isTextBox.getter();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (self) {
    specialized CanvasElementView.modelFrame.setter(x, y, width, height);
  }
}

@end