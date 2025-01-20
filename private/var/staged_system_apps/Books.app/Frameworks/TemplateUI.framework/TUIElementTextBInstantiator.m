@interface TUIElementTextBInstantiator
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementTextBInstantiator

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___TUIElementTextBInstantiator;
  uint64_t var0 = a4.var0;
  id v9 = a3;
  [super configureObject:v9 withNode:var0 attributes:a5 context:a6];
  [v9 setStyle:1];
}

@end