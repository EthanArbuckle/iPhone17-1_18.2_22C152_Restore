@interface UIStoryboardSegue
+ (UIStoryboardSegue)segueWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination performHandler:(void *)performHandler;
- (NSString)identifier;
- (UIStoryboardSegue)init;
- (UIStoryboardSegue)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination;
- (UIViewController)destinationViewController;
- (UIViewController)sourceViewController;
- (id)performHandler;
- (id)prepareHandler;
- (id)sender;
- (void)_prepare;
- (void)perform;
- (void)setPerformHandler:(id)a3;
- (void)setPrepareHandler:(id)a3;
- (void)setSender:(id)a3;
@end

@implementation UIStoryboardSegue

- (UIStoryboardSegue)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
  v9 = identifier;
  v10 = source;
  v11 = destination;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UIStoryboardSegue.m", 18, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"UIStoryboardSegue.m", 19, @"Invalid parameter not satisfying: %@", @"destination" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)UIStoryboardSegue;
  v13 = [(UIStoryboardSegue *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [(NSString *)v9 copy];
    v15 = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_sourceViewController, source);
    objc_storeStrong((id *)&v13->_destinationViewController, destination);
  }

  return v13;
}

+ (UIStoryboardSegue)segueWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination performHandler:(void *)performHandler
{
  v11 = identifier;
  v12 = source;
  v13 = destination;
  uint64_t v14 = performHandler;
  if (!v14)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"UIStoryboardSegue.m", 29, @"Invalid parameter not satisfying: %@", @"performHandler != NULL" object file lineNumber description];
  }
  v15 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v11 source:v12 destination:v13];
  [v15 setPerformHandler:v14];

  return (UIStoryboardSegue *)v15;
}

- (UIStoryboardSegue)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[UIStoryboardSegue init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (void)perform
{
  performHandler = self->_performHandler;
  if (!performHandler)
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    v7 = NSString;
    v8 = [(UIStoryboardSegue *)self identifier];
    v9 = [v7 stringWithFormat:@"Could not perform segue with identifier '%@'. A segue must either have a performHandler or it must override -perform.", v8];
    id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

    objc_exception_throw(v10);
  }
  v3 = (void (*)(id))performHandler[2];
  id v4 = self->_performHandler;
  v3(v4);
}

- (void)_prepare
{
  prepareHandler = (void (**)(void))self->_prepareHandler;
  if (prepareHandler) {
    prepareHandler[2]();
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (UIViewController)destinationViewController
{
  return self->_destinationViewController;
}

- (id)performHandler
{
  return self->_performHandler;
}

- (void)setPerformHandler:(id)a3
{
}

- (id)prepareHandler
{
  return self->_prepareHandler;
}

- (void)setPrepareHandler:(id)a3
{
}

- (id)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong(&self->_prepareHandler, 0);
  objc_storeStrong(&self->_performHandler, 0);
  objc_storeStrong((id *)&self->_destinationViewController, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end