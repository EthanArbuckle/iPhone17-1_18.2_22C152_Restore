@interface _UIHostedTextServiceSession
+ (id)showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7;
+ (id)showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6;
+ (id)showServiceForType:(int64_t)a3 withContext:(id)a4;
- (_UIHostedTextServiceSessionDelegate)delegate;
- (void)dismissTextServiceAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UIHostedTextServiceSession

+ (id)showServiceForType:(int64_t)a3 withContext:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithType:a3];
  return v4;
}

+ (id)showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  v6 = (void *)[objc_alloc((Class)a1) initWithType:a4];
  return v6;
}

+ (id)showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7
{
  v7 = (void *)[objc_alloc((Class)a1) initWithType:a5];
  return v7;
}

- (void)dismissTextServiceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIHostedTextServiceSession *)self delegate];
  [v5 dismissHostedTextServiceSession:self animated:v3];
}

- (_UIHostedTextServiceSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIHostedTextServiceSessionDelegate *)a3;
}

@end