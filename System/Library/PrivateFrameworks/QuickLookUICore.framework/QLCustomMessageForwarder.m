@interface QLCustomMessageForwarder
- (QLCustomMessageForwarder)initWithPreviewDelegate:(id)a3;
- (void)forwardMessageToHostOfCustomViewController:(id)a3 message:(id)a4 completionHandler:(id)a5;
@end

@implementation QLCustomMessageForwarder

- (QLCustomMessageForwarder)initWithPreviewDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLCustomMessageForwarder;
  v6 = [(QLCustomMessageForwarder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_previewDelegate, a3);
  }

  return v7;
}

- (void)forwardMessageToHostOfCustomViewController:(id)a3 message:(id)a4 completionHandler:(id)a5
{
}

- (void).cxx_destruct
{
}

@end