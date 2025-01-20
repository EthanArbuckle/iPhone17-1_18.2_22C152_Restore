@interface InteractiveViewController
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityPerformMagicTap;
- (NSArray)keyCommands;
- (_TtC11WeatherMaps25InteractiveViewController)initWithCoder:(id)a3;
- (_TtC11WeatherMaps25InteractiveViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)accessibilityModelOverlayKeyForMapView:(id)a3;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)dealloc;
- (void)didHoverMap:(id)a3;
- (void)didMoveToBackground;
- (void)didMoveToForeground;
- (void)didMoveToParentViewController:(id)a3;
- (void)didTapMap:(id)a3;
- (void)dismissFromKeyboard;
- (void)handleVoiceOverStatusDidChangeWithNotification:(id)a3;
- (void)mapGestureDidChange;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 requestedAccessibilityModelForLocation:(id)a4 completion:(id)a5;
- (void)mapViewDidChangeVisibleRegion:(id)a3;
- (void)selectAirQualityOverlay;
- (void)selectPrecipitationOverlay;
- (void)selectTemperatureOverlay;
- (void)selectWindOverlay;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)zoomIn;
- (void)zoomOut;
@end

@implementation InteractiveViewController

- (_TtC11WeatherMaps25InteractiveViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A2AB1D8();
}

- (void)handleVoiceOverStatusDidChangeWithNotification:(id)a3
{
  uint64_t v4 = sub_20A388FE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A388FB0();
  v8 = self;
  sub_20A2AB600();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A2AB6E8();
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_20A2AD548(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_20A2AD614();
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_20A2ADC88(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_20A2ADDAC((uint64_t)a3);
}

- (BOOL)accessibilityPerformEscape
{
  v2 = self;
  char v3 = sub_20A2AE024();

  return v3 & 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  v2 = self;
  sub_20A2AE0A8();
  char v4 = v3;

  return v4 & 1;
}

- (void)didMoveToBackground
{
  v2 = self;
  sub_20A2AE5E8();
}

- (void)didMoveToForeground
{
  v2 = self;
  sub_20A2AE6E4();
}

- (void)dealloc
{
  v2 = self;
  sub_20A2AEEC0();
}

- (void).cxx_destruct
{
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController____lazy_storage___mapView));
  sub_20A215748((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_configuration);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_cameraFocusFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_geocodeManager);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_locationMetadataManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_mapLocationAccessibilityModelManager);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_overlayProgressBar));
  sub_20A1F1460((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_activeOverlay, &qword_26AC39330);
  swift_bridgeObjectRelease();
  sub_20A1F1460((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_selectedLocation, (uint64_t *)&unk_26AC392C0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_debugLabel));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_controlsView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_windOverlayHintManager);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_scrubberOverlayViewController));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_contentStatusBannerViewController));
  sub_20A1E59F0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_pendingBannerReplacementBlock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_backdropLayerBlur));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_backdropLayerUltraThin));
  sub_20A1F1460((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_wasPlayingBeforeSonificationDate, &qword_26AC39100);
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_accessibilityFrameDateFormatter));
  sub_20A1E59F0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_onMapEventHandler));
  swift_bridgeObjectRelease();
}

- (void)mapGestureDidChange
{
  v2 = self;
  sub_20A2AF828();
}

- (void)didTapMap:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_20A2AFA58(v4);
}

- (void)didHoverMap:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_20A2AFCD4(v4);
}

- (NSArray)keyCommands
{
  v2 = self;
  sub_20A2B1C74();

  sub_20A1CC764(0, (unint64_t *)&unk_2676278B0);
  char v3 = (void *)sub_20A38B870();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)selectTemperatureOverlay
{
  v2 = self;
  sub_20A2B1E30();
}

- (void)selectPrecipitationOverlay
{
  v2 = self;
  sub_20A2B1F04();
}

- (void)selectAirQualityOverlay
{
  v2 = self;
  sub_20A2B1FD4();
}

- (void)selectWindOverlay
{
  v2 = self;
  sub_20A2B20A8();
}

- (void)zoomIn
{
  v2 = self;
  sub_20A2B21DC((void (*)(uint64_t, uint64_t, double))sub_20A2EFC08);
}

- (void)zoomOut
{
  v2 = self;
  sub_20A2B21DC((void (*)(uint64_t, uint64_t, double))sub_20A2EFE38);
}

- (void)dismissFromKeyboard
{
  v2 = self;
  sub_20A2B2308();
}

- (_TtC11WeatherMaps25InteractiveViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_20A38B610();
  }
  id v5 = a4;
  sub_20A2B23B0();
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_20A2B4220(v4);
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = sub_20A2B42CC((uint64_t)v7, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  v7 = sub_20A2B4370();

  swift_unknownObjectRelease();
  return v7;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_20A2B445C(v5);
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_20A2B47A8();
}

- (void)mapView:(id)a3 requestedAccessibilityModelForLocation:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v8;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_20A2B58D4();

  swift_release();
}

- (id)accessibilityModelOverlayKeyForMapView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_20A2B5B68();
  uint64_t v7 = v6;

  if (v7)
  {
    id v8 = (void *)sub_20A38B5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

@end