@interface PPSocialHighlightPropertyValueProvider
- (id)valueForHighlight:(id)a3;
- (void)initWithProvidingBlock:(void *)a1;
@end

@implementation PPSocialHighlightPropertyValueProvider

- (void).cxx_destruct
{
}

- (void)initWithProvidingBlock:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PPSocialHighlightPropertyValueProvider;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

- (id)valueForHighlight:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1CB79D060]();
  v6 = NSNumber;
  (*((void (**)(void))self->_providingBlock + 2))();
  objc_super v7 = objc_msgSend(v6, "numberWithDouble:");

  return v7;
}

@end