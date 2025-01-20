@interface _UI3DPanGestureRecognizer
- (BOOL)_shouldTryToBeginWithEvent:(id)a3;
- (_UI3DPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_didUpdateCentroidWithTouches:(id)a3 event:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UI3DPanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)_didUpdateCentroidWithTouches:(id)a3 event:(id)a4
{
  sub_185928948();
  sub_185928988();
  uint64_t v6 = sub_186A1ED7C();
  id v7 = a4;
  v8 = self;
  sub_1859289E0(v6);

  swift_bridgeObjectRelease();
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UI3DPanGestureRecognizer();
  [(UIPanGestureRecognizer *)&v5 _shouldTryToBeginWithEvent:a3];
  return 1;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_UI3DPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_UI3DPanGestureRecognizer *)sub_1859286E8((uint64_t)v6, (uint64_t)a4);
}

@end