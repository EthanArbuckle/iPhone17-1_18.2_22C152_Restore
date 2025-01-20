@interface NTKCrownInputHandler
- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4;
- (BOOL)_wheelChangedWithEvent:(id)a3;
- (BOOL)useWideIdleCheck;
- (NTKCrownInputHandler)init;
- (NTKCrownInputHandlerDelegate)delegate;
- (double)offsetPerRevolution;
- (double)progress;
- (void)setDelegate:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation NTKCrownInputHandler

- (NTKCrownInputHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCrownInputHandler;
  return [(NTKCrownInputHandler *)&v3 init];
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)offsetPerRevolution
{
  return 0.0;
}

- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4
{
  return 0;
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  return 0;
}

- (NTKCrownInputHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKCrownInputHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useWideIdleCheck
{
  return self->_useWideIdleCheck;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
}

@end