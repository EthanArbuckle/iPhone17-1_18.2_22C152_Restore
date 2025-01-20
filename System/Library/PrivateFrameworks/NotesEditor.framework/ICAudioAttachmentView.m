@interface ICAudioAttachmentView
- (ICAttachment)attachment;
- (ICAudioAttachmentView)initWithCoder:(id)a3;
- (ICAudioAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6;
- (ICAudioAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5;
- (NSObject)icaxAudioPlayerViewAccessibilityElement;
- (UIColor)highlightColor;
- (UIViewController)contextMenuPreviewController;
- (id)_playerViewAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)contextualMenuElementsFromProposedActions:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)cut:(id)a3;
- (void)delete:(id)a3;
- (void)didChangeMedia;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAttachment:(id)a3;
- (void)setHighlightColor:(id)a3;
@end

@implementation ICAudioAttachmentView

- (id)accessibilityLabel
{
  v2 = [(ICAudioAttachmentView *)self _playerViewAccessibilityElement];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(ICAudioAttachmentView *)self _playerViewAccessibilityElement];
  v3 = [v2 accessibilityValue];

  return v3;
}

- (id)accessibilityUserInputLabels
{
  v2 = [(ICAudioAttachmentView *)self _playerViewAccessibilityElement];
  v3 = [v2 accessibilityUserInputLabels];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(ICAudioAttachmentView *)self _playerViewAccessibilityElement];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (id)accessibilityCustomActions
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  v8.receiver = self;
  v8.super_class = (Class)ICAudioAttachmentView;
  v4 = [(ICAttachmentView *)&v8 accessibilityCustomActions];
  objc_msgSend(v3, "ic_addObjectsFromNonNilArray:", v4);

  v5 = [(ICAudioAttachmentView *)self _playerViewAccessibilityElement];
  v6 = [v5 accessibilityCustomActions];
  objc_msgSend(v3, "ic_addObjectsFromNonNilArray:", v6);

  return v3;
}

- (id)accessibilityCustomContent
{
  v2 = [(ICAudioAttachmentView *)self _playerViewAccessibilityElement];
  unint64_t v3 = [v2 accessibilityCustomContent];

  return v3;
}

- (id)_playerViewAccessibilityElement
{
  v2 = [(ICAudioAttachmentView *)self icaxAudioPlayerViewAccessibilityElement];
  NSClassFromString(&cfstr_SwiftuiAccessi.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[swiftUIAccessibilityElement isKindOfClass:NSClassFromString(@\"SwiftUI.AccessibilityNode\")]" functionName:"-[ICAudioAttachmentView(ICAccessibility_iOS) _playerViewAccessibilityElement]" simulateCrash:1 showAlert:0 format:@"Unexpected accessibility element type for SwiftUI representation"];
  }
  if (!v2) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((swiftUIAccessibilityElement) != nil)", "-[ICAudioAttachmentView(ICAccessibility_iOS) _playerViewAccessibilityElement]", 1, 0, @"Expected non-nil value for '%s'", "swiftUIAccessibilityElement");
  }

  return v2;
}

- (void)didChangeMedia
{
  v2 = self;
  sub_20C0EE13C();
}

- (ICAttachment)attachment
{
  return (ICAttachment *)sub_20C0EEFD4(self, (uint64_t)a2, (SEL *)&selRef_attachment);
}

- (void)setAttachment:(id)a3
{
}

- (UIColor)highlightColor
{
  return (UIColor *)sub_20C0EEFD4(self, (uint64_t)a2, (SEL *)&selRef_highlightColor);
}

- (void)setHighlightColor:(id)a3
{
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioAttachmentView();
  id v2 = v3.receiver;
  [(ICAttachmentView *)&v3 didMoveToWindow];
  sub_20C0EFA0C();
}

- (void)didMoveToSuperview
{
  id v2 = self;
  sub_20C0EF24C();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudioAttachmentView();
  id v2 = v5.receiver;
  [(ICAudioAttachmentView *)&v5 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v5.receiver, v5.super_class);
  if (qword_2676BAF60 != -1) {
    swift_once();
  }
  objc_msgSend(v3, sel_setCornerRadius_, *(double *)&qword_2676BF330);

  id v4 = objc_msgSend(v2, sel_layer);
  objc_msgSend(v4, sel_setCornerCurve_, *MEMORY[0x263F15A20]);
}

- (UIViewController)contextMenuPreviewController
{
  id v2 = self;
  id v3 = sub_20C0EF4D4();

  return (UIViewController *)v3;
}

- (id)contextualMenuElementsFromProposedActions:(id)a3
{
  sub_20BFCEE58(0, (unint64_t *)&qword_2676BBC20);
  sub_20C162CF0();
  id v3 = (void *)sub_20C162CE0();
  swift_bridgeObjectRelease();

  return v3;
}

- (void)cut:(id)a3
{
}

- (void)delete:(id)a3
{
}

- (NSObject)icaxAudioPlayerViewAccessibilityElement
{
  id v2 = self;
  id v3 = sub_20C0EFC50();

  return v3;
}

- (ICAudioAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  v15 = (ICAudioAttachmentView *)sub_20C0FF48C((uint64_t)a4, (uint64_t)a5, a6, x, y, width, height);

  return v15;
}

- (ICAudioAttachmentView)initWithCoder:(id)a3
{
  return (ICAudioAttachmentView *)AudioAttachmentView.init(coder:)(a3);
}

- (ICAudioAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (ICAudioAttachmentView *)sub_20C0FF5B4((uint64_t)a3, (uint64_t)a4, a5);

  return v10;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end