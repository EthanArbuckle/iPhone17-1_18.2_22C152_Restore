@interface UIResponder
+ (id)currentFirstResponder;
- (void)findFirstResponder:(id)a3;
@end

@implementation UIResponder

+ (id)currentFirstResponder
{
  objc_storeWeak(&qword_10026A8A0, 0);
  v2 = +[UIApplication sharedApplication];
  [v2 sendAction:"findFirstResponder:" to:0 from:0 forEvent:0];

  id WeakRetained = objc_loadWeakRetained(&qword_10026A8A0);

  return WeakRetained;
}

- (void)findFirstResponder:(id)a3
{
}

@end