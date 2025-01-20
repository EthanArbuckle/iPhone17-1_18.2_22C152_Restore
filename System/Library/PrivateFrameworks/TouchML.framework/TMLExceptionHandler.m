@interface TMLExceptionHandler
+ (void)raiseException:(id)a3;
+ (void)setExceptionHandlerBlock:(id)a3;
@end

@implementation TMLExceptionHandler

+ (void)setExceptionHandlerBlock:(id)a3
{
  qword_268A059B0 = MEMORY[0x23ECA7DD0](a3, a2);
  MEMORY[0x270F9A758]();
}

+ (void)raiseException:(id)a3
{
  id v3 = a3;
  if (!qword_268A059B0) {
    objc_exception_throw(v3);
  }
  id v4 = v3;
  (*(void (**)(void))(qword_268A059B0 + 16))();
}

@end