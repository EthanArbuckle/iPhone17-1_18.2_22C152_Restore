@interface TDVHomeButtonHandler
+ (id)handlerWithCompletion:(id)a3;
- (BSInvalidatable)homeButtonAssertion;
- (TDVHomeButtonHandler)initWithCompletion:(id)a3;
- (id)homeButtonHandlerCallback;
- (void)consumeSinglePressUpForButtonKind:(int64_t)a3;
- (void)setHomeButtonAssertion:(id)a3;
- (void)setHomeButtonHandlerCallback:(id)a3;
- (void)startConsumingHardwarePresses:(id)a3;
- (void)stopConsumingHardwarePresses;
@end

@implementation TDVHomeButtonHandler

- (TDVHomeButtonHandler)initWithCompletion:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TDVHomeButtonHandler;
  v5 = [(TDVHomeButtonHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    [(TDVHomeButtonHandler *)v5 startConsumingHardwarePresses:v4];
  }

  return v6;
}

+ (id)handlerWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [[TDVHomeButtonHandler alloc] initWithCompletion:v3];

  return v4;
}

- (void)startConsumingHardwarePresses:(id)a3
{
  [(TDVHomeButtonHandler *)self setHomeButtonHandlerCallback:a3];
  id v4 = [(TDVHomeButtonHandler *)self homeButtonAssertion];

  if (!v4)
  {
    v5 = [MEMORY[0x263F79398] sharedInstance];
    id v6 = [v5 beginConsumingPressesForButtonKind:1 eventConsumer:self priority:0];

    [(TDVHomeButtonHandler *)self setHomeButtonAssertion:v6];
  }
}

- (void)stopConsumingHardwarePresses
{
  id v3 = [(TDVHomeButtonHandler *)self homeButtonAssertion];
  [v3 invalidate];

  [(TDVHomeButtonHandler *)self setHomeButtonAssertion:0];
}

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
  homeButtonHandlerCallback = (void (**)(void))self->_homeButtonHandlerCallback;
  if (homeButtonHandlerCallback) {
    homeButtonHandlerCallback[2]();
  }
}

- (id)homeButtonHandlerCallback
{
  return self->_homeButtonHandlerCallback;
}

- (void)setHomeButtonHandlerCallback:(id)a3
{
}

- (BSInvalidatable)homeButtonAssertion
{
  return self->_homeButtonAssertion;
}

- (void)setHomeButtonAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeButtonAssertion, 0);
  objc_storeStrong(&self->_homeButtonHandlerCallback, 0);
}

@end