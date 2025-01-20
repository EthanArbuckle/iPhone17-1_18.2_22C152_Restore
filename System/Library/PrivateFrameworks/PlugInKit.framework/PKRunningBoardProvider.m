@interface PKRunningBoardProvider
- (id)processAssertionWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6;
- (id)taskStatesForPID:(id)a3 error:(id *)a4;
- (void)plugInHandshakeComplete;
@end

@implementation PKRunningBoardProvider

- (id)processAssertionWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  v10 = [[PKProcessAssertionProxy alloc] initWithPID:v8 flags:v7 reason:v6 name:v9];

  return v10;
}

- (id)taskStatesForPID:(id)a3 error:(id *)a4
{
  v5 = [MEMORY[0x1E4F96428] predicateMatchingIdentifier:a3];
  uint64_t v6 = [MEMORY[0x1E4F96450] descriptor];
  [v6 setValues:1];
  uint64_t v7 = [MEMORY[0x1E4F96440] statesForPredicate:v5 withDescriptor:v6 error:a4];

  return v7;
}

- (void)plugInHandshakeComplete
{
  id v2 = [MEMORY[0x1E4F963F0] currentProcess];
  [v2 plugInHandshakeComplete];
}

@end