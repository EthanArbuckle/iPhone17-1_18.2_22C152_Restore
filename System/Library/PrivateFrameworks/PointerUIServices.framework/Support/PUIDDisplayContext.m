@interface PUIDDisplayContext
- (NSString)description;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)invalidate;
- (void)setDisplay:(id)a3;
- (void)setPointerEventStream:(id)a3;
- (void)setPointerRenderingController:(id)a3;
- (void)setPointerRenderingWindow:(id)a3;
- (void)setSystemPointerClient:(id)a3;
- (void)setSystemPointerRenderingController:(id)a3;
- (void)setSystemPointerWindow:(id)a3;
- (void)setTouchStream:(id)a3;
@end

@implementation PUIDDisplayContext

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (void)invalidate
{
  [(BSInvalidatable *)self->_pointerEventStream invalidate];
  touchStream = self->_touchStream;
  [(BKSTouchStream *)touchStream invalidate];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000116EC;
  v5[3] = &unk_100044C88;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [v4 appendProem:self block:v5];
}

- (void)setDisplay:(id)a3
{
}

- (void)setPointerRenderingController:(id)a3
{
}

- (void)setPointerRenderingWindow:(id)a3
{
}

- (void)setSystemPointerRenderingController:(id)a3
{
}

- (void)setSystemPointerWindow:(id)a3
{
}

- (void)setPointerEventStream:(id)a3
{
}

- (void)setTouchStream:(id)a3
{
}

- (void)setSystemPointerClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_systemPointerClient, 0);
  objc_storeStrong((id *)&self->_touchStream, 0);
  objc_storeStrong((id *)&self->_pointerEventStream, 0);
  objc_storeStrong((id *)&self->_systemPointerWindow, 0);
  objc_storeStrong((id *)&self->_systemPointerRenderingController, 0);
  objc_storeStrong((id *)&self->_pointerRenderingWindow, 0);
  objc_storeStrong((id *)&self->_pointerRenderingController, 0);
  objc_destroyWeak((id *)&self->_display);
}

@end