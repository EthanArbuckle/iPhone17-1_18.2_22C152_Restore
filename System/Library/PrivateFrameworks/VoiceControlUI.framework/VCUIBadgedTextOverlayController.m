@interface VCUIBadgedTextOverlayController
+ (id)textSegmentModelsForText:(id)a3 type:(int64_t)a4 start:(int64_t)a5;
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (BOOL)popoverShowing;
- (CGRect)focusRect;
- (CGSize)preferredContentSize;
- (NSString)text;
- (VCUIBadgedTextOverlayController)init;
- (id)displayedTextSegmentModels;
- (int64_t)startIndex;
- (int64_t)type;
- (int64_t)zOrder;
- (void)setFocusRect:(CGRect)a3;
- (void)setIsOverlay:(BOOL)a3;
- (void)setPopoverShowing:(BOOL)a3;
- (void)setStartIndex:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setZOrder:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation VCUIBadgedTextOverlayController

- (VCUIBadgedTextOverlayController)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCUIBadgedTextOverlayController;
  v2 = [(VCUIBadgedTextOverlayController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    swiftVC = v2->_swiftVC;
    v2->_swiftVC = (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *)v3;
  }
  return v2;
}

- (void)viewDidLoad
{
  v30[4] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)VCUIBadgedTextOverlayController;
  [(VCUIBadgedTextOverlayController *)&v29 viewDidLoad];
  [(VCUIBadgedTextOverlayController *)self addChildViewController:self->_swiftVC];
  uint64_t v3 = [MEMORY[0x263F825C8] clearColor];
  v4 = [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC view];
  [v4 setBackgroundColor:v3];

  v5 = [(VCUIBadgedTextOverlayController *)self view];
  objc_super v6 = [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC view];
  [v5 addSubview:v6];

  v19 = (void *)MEMORY[0x263F08938];
  v28 = [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC view];
  v26 = [v28 leadingAnchor];
  v27 = [(VCUIBadgedTextOverlayController *)self view];
  v25 = [v27 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v30[0] = v24;
  v23 = [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC view];
  v21 = [v23 trailingAnchor];
  v22 = [(VCUIBadgedTextOverlayController *)self view];
  v20 = [v22 trailingAnchor];
  v18 = [v21 constraintEqualToAnchor:v20];
  v30[1] = v18;
  v17 = [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC view];
  v7 = [v17 topAnchor];
  v8 = [(VCUIBadgedTextOverlayController *)self view];
  v9 = [v8 topAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v30[2] = v10;
  v11 = [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC view];
  v12 = [v11 bottomAnchor];
  v13 = [(VCUIBadgedTextOverlayController *)self view];
  v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v30[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
  [v19 activateConstraints:v16];
}

- (CGSize)preferredContentSize
{
  [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)text
{
  return [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC text];
}

- (void)setText:(id)a3
{
}

- (int64_t)startIndex
{
  return [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC startIndex];
}

- (void)setStartIndex:(int64_t)a3
{
}

- (BOOL)popoverShowing
{
  return [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC popoverShowing];
}

- (void)setPopoverShowing:(BOOL)a3
{
}

- (int64_t)type
{
  return [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC type];
}

- (void)setType:(int64_t)a3
{
}

- (CGRect)focusRect
{
  [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC focusRect];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFocusRect:(CGRect)a3
{
}

- (int64_t)zOrder
{
  return [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC zOrder];
}

- (void)setZOrder:(int64_t)a3
{
}

- (BOOL)isOverlay
{
  return [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC isOverlay];
}

- (void)setIsOverlay:(BOOL)a3
{
}

+ (id)textSegmentModelsForText:(id)a3 type:(int64_t)a4 start:(int64_t)a5
{
  return +[VCUIBadgedTextOverlayController_Swift textSegmentModelsForText:a3 type:a4 start:a5];
}

- (id)displayedTextSegmentModels
{
  return [(VCUIBadgedTextOverlayController_Swift *)self->_swiftVC displayedTextSegmentModels];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end