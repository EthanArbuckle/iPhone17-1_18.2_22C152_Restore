@interface CRLiOSPencilTray
- (BOOL)hidden;
- (CGRect)rectangleObscuringCanvasScrollView;
- (_TtC8Freeform16CRLiOSPencilTray)init;
- (id)_colorPickerPopoverPresentationBarButtonItem:(id)a3;
- (id)_toolPickerCurrentSelectionColor:(id)a3;
- (void)_toggleLassoToolEditingViewColorPickerForToolPicker:(id)a3;
- (void)_toolPicker:(id)a3 didChangeColor:(id)a4;
- (void)bringForwardWithSender:(id)a3;
- (void)bringToFrontWithSender:(id)a3;
- (void)dealloc;
- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5;
- (void)fillColorChangedFromTrayWithSender:(id)a3;
- (void)installToolTray;
- (void)lassoSegmentedControlDidChangeType:(unint64_t)a3;
- (void)processChanges:(id)a3 forChangeSource:(id)a4;
- (void)sendBackwardWithSender:(id)a3;
- (void)sendToBackWithSender:(id)a3;
- (void)setToolTrayHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)strokeColorChangedFromTrayWithSender:(id)a3;
- (void)toolPickerFramesObscuredDidChange:(id)a3;
- (void)toolPickerIsRulerActiveDidChange:(id)a3;
- (void)toolPickerSelectedToolDidChange:(id)a3;
- (void)toolPickerVisibilityDidChange:(id)a3;
- (void)toolkitDidUpdateCurrentToolSelection;
- (void)toolkitDidUpdateRulerVisibility;
- (void)uninstallToolTray;
- (void)updateForToolPickerVisibilityDidChange;
@end

@implementation CRLiOSPencilTray

- (void)dealloc
{
  char v2 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_wasTearDownCalled);
  v3 = self;
  if ((v2 & 1) == 0)
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2, 194, (uint64_t)"Must call tearDown() before CRLiOSPencilTray is deinitialized.", 62, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2, 194);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CRLiOSPencilTray();
  [(CRLiOSPencilTray *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_1007E9E50((uint64_t)self + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_delegate);
  swift_unknownObjectUnownedDestroy();
  swift_unknownObjectUnownedDestroy();
  swift_unknownObjectUnownedDestroy();
  swift_unknownObjectUnownedDestroy();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_lassoEditingViewClippingWorkaround));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_lassoSegmentedViewController));

  sub_100522AD8(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray____lazy_storage___pickerManager));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fillColorChangedFromTrayWithSender:(id)a3
{
}

- (void)strokeColorChangedFromTrayWithSender:(id)a3
{
}

- (void)sendBackwardWithSender:(id)a3
{
}

- (void)sendToBackWithSender:(id)a3
{
}

- (void)bringForwardWithSender:(id)a3
{
}

- (void)bringToFrontWithSender:(id)a3
{
}

- (_TtC8Freeform16CRLiOSPencilTray)init
{
  result = (_TtC8Freeform16CRLiOSPencilTray *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)hidden
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_isHidden);
}

- (CGRect)rectangleObscuringCanvasScrollView
{
  char v2 = self;
  double v3 = sub_100D4CB30();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)installToolTray
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_isInstalled) == 1)
  {
    char v2 = self;
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"installToolTray()", 17, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2, 1421, (uint64_t)"Should not try to install a pencil tray which is already installed.", 67, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"installToolTray()", 17, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2, 1421);
  }
  else
  {
    *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_isInstalled) = 1;
    double v3 = self;
    sub_100D441F8();
  }
}

- (void)uninstallToolTray
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_isInstalled) == 1)
  {
    *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform16CRLiOSPencilTray_isInstalled) = 0;
  }
  else
  {
    char v2 = self;
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"uninstallToolTray()", 19, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2, 1432, (uint64_t)"Should not try to uninstall a pencil tray which is not installed.", 65, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"uninstallToolTray()", 19, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2, 1432);
  }
}

- (void)setToolTrayHidden:(BOOL)a3 animated:(BOOL)a4
{
  double v5 = self;
  sub_100D5320C(a3);
}

- (void)toolPickerSelectedToolDidChange:(id)a3
{
  id v4 = a3;
  double v9 = self;
  double v5 = (char *)sub_100D43BC0();
  if (v5)
  {
    double v6 = v5;
    id v7 = *(id *)&v5[OBJC_IVAR____TtC8Freeform29CRLiOSPencilTrayPickerManager_picker];
  }
  else
  {
    sub_100D43B08();
    id v7 = v8;
  }
  sub_10060EAF8((uint64_t)v4, (uint64_t)v7, (uint64_t)&_mh_execute_header, (uint64_t)"toolPickerSelectedToolDidChange(_:)", 35, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTray.swift", 86, 2u, 1496);

  sub_100D46518();
}

- (void)toolPickerIsRulerActiveDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100D4D014(v4);
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100D4D1E4((uint64_t)v4);
}

- (void)updateForToolPickerVisibilityDidChange
{
  char v2 = self;
  sub_100D4D43C();
}

- (void)toolPickerFramesObscuredDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100D4D760((uint64_t)v4);
}

- (void)_toolPicker:(id)a3 didChangeColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_100D4D8E8((uint64_t)v6, a4);
}

- (id)_toolPickerCurrentSelectionColor:(id)a3
{
  id v4 = a3;
  double v5 = self;
  id v6 = sub_100D4DB74((uint64_t)v4);

  return v6;
}

- (void)_toggleLassoToolEditingViewColorPickerForToolPicker:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100D4DCBC((uint64_t)v4);
}

- (id)_colorPickerPopoverPresentationBarButtonItem:(id)a3
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  id v6 = a3;
  id v7 = self;
  id v8 = [Strong barButtonItemForPresentingColorPickerWithHiddenPencilTray:v7];

  swift_unknownObjectRelease();

  return v8;
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  type metadata accessor for CRLChangeRecord();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  id v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100D4DF84(v5);

  swift_bridgeObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)&v7);
}

- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = self;
  if ([v9 pencilModeType]) {
    sub_100D441F8();
  }
}

- (void)toolkitDidUpdateCurrentToolSelection
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  id v6 = self;
  id v4 = [Strong mode];

  id v5 = [v4 pencilModeType];
  if (v5 == (id)1) {
    sub_100D441F8();
  }
}

- (void)toolkitDidUpdateRulerVisibility
{
  char v2 = self;
  sub_100D4E4F0();
}

- (void)lassoSegmentedControlDidChangeType:(unint64_t)a3
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  id v6 = self;
  id v7 = [Strong freehandDrawingToolkit];

  if (v7)
  {
    id v8 = [v7 toolkitUIState];

    [v8 setCurrentLassoType:a3];
  }
  else
  {
    __break(1u);
  }
}

@end