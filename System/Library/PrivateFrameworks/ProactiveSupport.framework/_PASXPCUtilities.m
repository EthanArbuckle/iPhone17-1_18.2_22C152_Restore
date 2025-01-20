@interface _PASXPCUtilities
+ (void)runWithExceptionBarrier:(id)a3;
@end

@implementation _PASXPCUtilities

+ (void)runWithExceptionBarrier:(id)a3
{
  v3 = (void (**)(void))a3;
  [MEMORY[0x1E4F29268] currentConnection];

  v3[2](v3);
}

@end