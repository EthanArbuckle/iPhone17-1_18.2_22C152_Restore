@interface SignpostReporterConfigObserverDelegate
- (SignpostReporterConfigObserverDelegate)initWithCallbackBlock:(id)a3;
- (id)callbackBlock;
- (void)observer:(id)a3 didChangeConfiguration:(id)a4 type:(id)a5;
- (void)setCallbackBlock:(id)a3;
@end

@implementation SignpostReporterConfigObserverDelegate

- (SignpostReporterConfigObserverDelegate)initWithCallbackBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SignpostReporterConfigObserverDelegate;
  v5 = [(SignpostReporterConfigObserverDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SignpostReporterConfigObserverDelegate *)v5 setCallbackBlock:v4];
  }

  return v6;
}

- (void)observer:(id)a3 didChangeConfiguration:(id)a4 type:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(SignpostReporterConfigObserverDelegate *)self callbackBlock];
  v9[2](v9, v8, v7);
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (void)setCallbackBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end