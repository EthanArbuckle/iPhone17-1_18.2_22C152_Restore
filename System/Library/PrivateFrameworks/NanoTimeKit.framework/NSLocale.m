@interface NSLocale
@end

@implementation NSLocale

void __66__NSLocale_NTKLocaleOverride____loadSwizzledCurrentLocaleIfNeeded__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v0, sel_currentLocale);
  v2 = class_getClassMethod(v0, sel___userCurrentLocale);
  method_exchangeImplementations(ClassMethod, v2);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "__userCurrentLocale");
  v4 = (void *)__currentLocaleOverride;
  __currentLocaleOverride = v3;
}

@end