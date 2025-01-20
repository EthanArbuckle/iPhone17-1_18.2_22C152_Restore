@interface MultiPlayerViewController.GestureManager
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtCC8VideosUI25MultiPlayerViewController14GestureManager)init;
- (void)viewPannedWithGesture:(id)a3;
- (void)viewPinchedWithGesture:(id)a3;
- (void)viewSwipedWithGesture:(id)a3;
@end

@implementation MultiPlayerViewController.GestureManager

- (void)viewSwipedWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E3323B24(v6);
}

- (void)viewPinchedWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E3323CFC(v6);
}

- (void)viewPannedWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E3323E9C(v6);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1E3323F48(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_1E3324174(v6, v7);

  return v9;
}

- (_TtCC8VideosUI25MultiPlayerViewController14GestureManager)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8VideosUI25MultiPlayerViewController14GestureManager____lazy_storage___activityTapGesture));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8VideosUI25MultiPlayerViewController14GestureManager____lazy_storage___detailsPanGesture));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8VideosUI25MultiPlayerViewController14GestureManager____lazy_storage___playerPinchGesture));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8VideosUI25MultiPlayerViewController14GestureManager____lazy_storage___panGesture));
  swift_unknownObjectWeakDestroy();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EADEEF20);
  OUTLINED_FUNCTION_15_3();
  uint64_t v3 = OUTLINED_FUNCTION_4_94();
  v4(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EADE9000);
  OUTLINED_FUNCTION_15_3();
  uint64_t v5 = OUTLINED_FUNCTION_4_94();
  v6(v5);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8VideosUI25MultiPlayerViewController14GestureManager_pinchPlayerViewController));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EADEEF10);
  OUTLINED_FUNCTION_15_3();
  uint64_t v7 = OUTLINED_FUNCTION_4_94();
  v8(v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EADE8FD0);
  OUTLINED_FUNCTION_15_3();
  uint64_t v9 = OUTLINED_FUNCTION_4_94();
  v10(v9);
  swift_release();
  swift_release();
}

@end