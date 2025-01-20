@interface ARSessionFrameObserver
- (ARSessionFrameObserver)initWithCallback:(function<void (rf::data_flow::provider::InputFrame)&&;
- (id).cxx_construct;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)setCallback:(function<void (rf::data_flow::provider::InputFrame)&&;
@end

@implementation ARSessionFrameObserver

- (ARSessionFrameObserver)initWithCallback:(function<void (rf::data_flow::provider::InputFrame)&&
{
  std::function<void ()(rf::data_flow::provider::InputFrame &&)>::operator=(self->_callback.__f_.__buf_.__lx, a3);
  return self;
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 camera];
  [v8 transform];
  v14[0] = v9;
  v14[1] = v10;
  v14[2] = v11;
  v14[3] = v12;

  f = self->_callback.__f_.__f_;
  if (f) {
    (*(void (**)(void *, _OWORD *))(*(void *)f + 48))(f, v14);
  }
}

- (void)setCallback:(function<void (rf::data_flow::provider::InputFrame)&&
{
  std::function<void ()(rf::data_flow::provider::InputFrame &&)>::operator=(self->_callback.__f_.__buf_.__lx, a3);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end