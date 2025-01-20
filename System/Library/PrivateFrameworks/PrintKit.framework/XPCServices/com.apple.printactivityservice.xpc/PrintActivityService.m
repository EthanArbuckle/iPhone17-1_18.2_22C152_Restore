@interface PrintActivityService
- (PrintActivityObject)printActivityObject;
- (void)setPrintActivityObject:(id)a3;
- (void)startLiveActivity;
- (void)stopLiveActivity;
@end

@implementation PrintActivityService

- (void)startLiveActivity
{
  v3 = [(PrintActivityService *)self printActivityObject];

  if (!v3)
  {
    v4 = objc_opt_new();
    [(PrintActivityService *)self setPrintActivityObject:v4];
  }
  id v5 = [(PrintActivityService *)self printActivityObject];
  [v5 startPrintActivity];
}

- (void)stopLiveActivity
{
  id v2 = [(PrintActivityService *)self printActivityObject];
  [v2 stopPrintActivity];
}

- (PrintActivityObject)printActivityObject
{
  return self->_printActivityObject;
}

- (void)setPrintActivityObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end