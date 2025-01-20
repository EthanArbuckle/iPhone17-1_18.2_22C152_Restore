@interface _NSTextViewportLayoutObserver
- (BOOL)isEqual:(id)a3;
- (_NSTextViewportLayoutObserver)initWithWeakObject:(id)a3;
- (id)description;
- (id)object;
- (void)dealloc;
@end

@implementation _NSTextViewportLayoutObserver

- (_NSTextViewportLayoutObserver)initWithWeakObject:(id)a3
{
  v4 = [(_NSTextViewportLayoutObserver *)self init];
  v5 = v4;
  if (v4 && !objc_storeWeakOrNil(&v4->location, a3))
  {
    [(_NSTextViewportLayoutObserver *)v5 dealloc];
    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_destroyWeak(&self->location);
  v3.receiver = self;
  v3.super_class = (Class)_NSTextViewportLayoutObserver;
  [(_NSTextViewportLayoutObserver *)&v3 dealloc];
}

- (id)object
{
  return objc_loadWeakRetained(&self->location);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = (void *)[a3 object];
  id v6 = [(_NSTextViewportLayoutObserver *)self object];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (id)description
{
  id v2 = [(_NSTextViewportLayoutObserver *)self object];
  if (objc_opt_respondsToSelector()) {
    objc_super v3 = (__CFString *)[v2 description];
  }
  else {
    objc_super v3 = &stru_1EDD49F70;
  }
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  id v6 = (void *)[v4 stringWithFormat:@"%@:%@", NSStringFromClass(v5), v3];

  return v6;
}

@end