@interface PDFReplicaBarVisibilityAnimatorForiOS
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (_TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS)init;
- (void)handleTapGesture;
@end

@implementation PDFReplicaBarVisibilityAnimatorForiOS

- (_TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS)init
{
  result = (_TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BF4A7CC8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS_tapGestureRecognizer));
  swift_release();
}

- (void)handleTapGesture
{
  v2 = self;
  sub_1BF653D70();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  self;
  v4 = (void *)swift_dynamicCastObjCClass();
  return !v4 || objc_msgSend(v4, sel_numberOfTapsRequired) == (id)1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  self;
  v4 = (void *)swift_dynamicCastObjCClass();
  return !v4 || (uint64_t)objc_msgSend(v4, sel_numberOfTapsRequired) > 1;
}

@end