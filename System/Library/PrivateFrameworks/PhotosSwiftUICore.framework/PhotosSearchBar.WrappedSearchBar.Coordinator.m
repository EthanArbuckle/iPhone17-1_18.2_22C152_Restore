@interface PhotosSearchBar.WrappedSearchBar.Coordinator
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtCVV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852316WrappedSearchBar11Coordinator)init;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)tapAction:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation PhotosSearchBar.WrappedSearchBar.Coordinator

- (_TtCVV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852316WrappedSearchBar11Coordinator)init
{
}

- (void).cxx_destruct
{
  memcpy(v2, (char *)self+ OBJC_IVAR____TtCVV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852316WrappedSearchBar11Coordinator_parent, sizeof(v2));
  sub_259B837B0((uint64_t)v2);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_259B7E7F0(v4);
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_259B7E90C(v4);
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_259B7EA00(v4);
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_259B7EB80(v8, v9, v10);

  return v12;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = sub_259C445A8();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_259B7F0A8(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)tapAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_259B7FCC0();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return OUTLINED_FUNCTION_0_4() & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return OUTLINED_FUNCTION_0_4() & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4
{
  return OUTLINED_FUNCTION_0_4() & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  return OUTLINED_FUNCTION_0_4() & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return OUTLINED_FUNCTION_0_4() & 1;
}

@end