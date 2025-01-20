@interface PaperDocumentView.PaperDocumentViewProxy
- (BOOL)_supportsCanvasElements:(id)a3;
- (_TtCC8PaperKit17PaperDocumentViewP33_8424FDA94F5165E454D761243B26314A22PaperDocumentViewProxy)init;
- (void)_toolPicker:(id)a3 didChangeColor:(id)a4;
- (void)_toolPickerDidInvokeDoneAction:(id)a3;
@end

@implementation PaperDocumentView.PaperDocumentViewProxy

- (void)_toolPicker:(id)a3 didChangeColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized PaperDocumentView.PaperDocumentViewProxy._toolPicker(_:didChange:)(a4);
}

- (void)_toolPickerDidInvokeDoneAction:(id)a3
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  id v6 = (_TtCC8PaperKit17PaperDocumentViewP33_8424FDA94F5165E454D761243B26314A22PaperDocumentViewProxy *)a3;
  v8 = self;
  id v7 = (_TtCC8PaperKit17PaperDocumentViewP33_8424FDA94F5165E454D761243B26314A22PaperDocumentViewProxy *)PaperDocumentView.currentPageCanvas.getter();

  if (v7)
  {
    AnyCanvas.selection.setter(MEMORY[0x263F8EE88], MEMORY[0x263F8EE88], 6, 0);

    id v6 = v8;
    v8 = v7;
  }
}

- (BOOL)_supportsCanvasElements:(id)a3
{
  return 1;
}

- (_TtCC8PaperKit17PaperDocumentViewP33_8424FDA94F5165E454D761243B26314A22PaperDocumentViewProxy)init
{
  result = (_TtCC8PaperKit17PaperDocumentViewP33_8424FDA94F5165E454D761243B26314A22PaperDocumentViewProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end