@interface NSConcreteNotifyingMutableAttributedString
+ (Class)_mutableStringClass;
- (id)delegate;
- (void)beginEditing;
- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5;
- (void)endEditing;
- (void)setDelegate:(id)a3;
@end

@implementation NSConcreteNotifyingMutableAttributedString

+ (Class)_mutableStringClass
{
  return (Class)objc_opt_class();
}

- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (void)endEditing
{
}

- (void)beginEditing
{
}

- (id)delegate
{
  return self->_delegate;
}

@end