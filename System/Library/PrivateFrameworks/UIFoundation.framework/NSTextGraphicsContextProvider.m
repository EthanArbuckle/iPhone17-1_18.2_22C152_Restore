@interface NSTextGraphicsContextProvider
+ (BOOL)textGraphicsContextProviderClassRespondsToColorQuery;
+ (Class)__defaultColorClass;
+ (Class)textGraphicsContextClass;
+ (Class)textGraphicsContextProviderClass;
+ (void)setCurrentTextGraphicsContext:(id)a3 duringBlock:(id)a4;
+ (void)setTextGraphicsContextClass:(Class)a3;
+ (void)setTextGraphicsContextProviderClass:(Class)a3;
@end

@implementation NSTextGraphicsContextProvider

+ (BOOL)textGraphicsContextProviderClassRespondsToColorQuery
{
  return _textGraphicsContextProviderClassRespondsToColorQuery;
}

+ (Class)textGraphicsContextProviderClass
{
  if (_textGraphicsContextProviderClassOnce != -1) {
    dispatch_once(&_textGraphicsContextProviderClassOnce, &__block_literal_global_7);
  }
  return (Class)_textGraphicsContextProviderClass;
}

uint64_t __65__NSTextGraphicsContextProvider_textGraphicsContextProviderClass__block_invoke()
{
  _textGraphicsContextProviderClass = objc_opt_class();
  uint64_t result = objc_opt_respondsToSelector();
  _textGraphicsContextProviderClassRespondsToColorQuery = result & 1;
  return result;
}

+ (void)setCurrentTextGraphicsContext:(id)a3 duringBlock:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    [a3 becomeCurrentGraphicsContextDuringBlock:a4];
  }
  else
  {
    v6 = (void (*)(id))*((void *)a4 + 2);
    v6(a4);
  }
}

+ (void)setTextGraphicsContextProviderClass:(Class)a3
{
  if (([(objc_class *)a3 conformsToProtocol:&unk_1EDD74978] & 1) == 0
    && ([(objc_class *)a3 conformsToProtocol:&unk_1EDD74B58] & 1) == 0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A Class %@ not conforming to NSTextGraphicsContextProvider was specified to textGraphicsContextProviderClass.", a3 format];
  }
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __69__NSTextGraphicsContextProvider_setTextGraphicsContextProviderClass___block_invoke;
  v7 = &unk_1E55C5470;
  Class v8 = a3;
  if (_textGraphicsContextProviderClassOnce != -1) {
    dispatch_once(&_textGraphicsContextProviderClassOnce, &block);
  }
  if ((Class)_textGraphicsContextProviderClass != a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Requested to reset textGraphicsContextProviderClass property with %@ after initialization.", a3, block, v5, v6, v7, v8 format];
  }
}

uint64_t __69__NSTextGraphicsContextProvider_setTextGraphicsContextProviderClass___block_invoke(uint64_t result)
{
  _textGraphicsContextProviderClass = *(void *)(result + 32);
  return result;
}

+ (Class)__defaultColorClass
{
  return (Class)getUIColorClass[0]();
}

+ (Class)textGraphicsContextClass
{
  return +[NSTextGraphicsContextProvider textGraphicsContextProviderClass];
}

+ (void)setTextGraphicsContextClass:(Class)a3
{
  if (([(objc_class *)a3 conformsToProtocol:&unk_1EDD74B58] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A Class %@ not conforming to NSTextGraphicsContext was specified to textGraphicsContextClass.", a3 format];
  }

  +[NSTextGraphicsContextProvider setTextGraphicsContextProviderClass:a3];
}

@end