@interface _UIOShowAlertAction_TestingOnly
- (BOOL)isPermitted;
- (NSString)message;
- (NSString)title;
- (_UIOShowAlertAction_TestingOnly)initWithTitle:(id)a3 message:(id)a4;
- (void)performActionFromConnection:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UIOShowAlertAction_TestingOnly

- (_UIOShowAlertAction_TestingOnly)initWithTitle:(id)a3 message:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setObject:v8 forSetting:0];

  [v9 setObject:v7 forSetting:1];
  v12.receiver = self;
  v12.super_class = (Class)_UIOShowAlertAction_TestingOnly;
  v10 = [(_UIOServerAction *)&v12 initWithOriginContext:0 info:v9 responder:0];

  return v10;
}

- (NSString)title
{
  v2 = [(_UIOShowAlertAction_TestingOnly *)self info];
  v3 = [v2 objectForSetting:0];

  return (NSString *)v3;
}

- (NSString)message
{
  v2 = [(_UIOShowAlertAction_TestingOnly *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSString *)v3;
}

- (BOOL)isPermitted
{
  return os_variant_has_internal_diagnostics();
}

- (void)performActionFromConnection:(id)a3
{
  v4 = [a3 server];
  v5 = [v4 displayDelegateForAction:self];

  v6 = [v5 rootViewController];
  id v7 = [(_UIOShowAlertAction_TestingOnly *)self title];
  id v8 = [(_UIOShowAlertAction_TestingOnly *)self message];
  id v9 = +[UIAlertController alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63___UIOShowAlertAction_TestingOnly_performActionFromConnection___block_invoke;
  v12[3] = &unk_1E52DC290;
  id v13 = v9;
  id v10 = v9;
  v11 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:v12];
  [v10 addAction:v11];

  [v6 presentViewController:v10 animated:1 completion:0];
}

- (void)setTitle:(id)a3
{
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end