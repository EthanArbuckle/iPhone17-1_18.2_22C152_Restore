@interface MCSOperation
- (BOOL)isFinalized;
- (id)applyPendingChangeToObjects:(id)a3;
@end

@implementation MCSOperation

- (id)applyPendingChangeToObjects:(id)a3
{
  id v5 = a3;
  [(MCSOperation *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MCSOperation applyPendingChangeToObjects:]", "MCSOperation.m", 16, "0");
}

- (BOOL)isFinalized
{
  return *((unsigned char *)self + 8) & 1;
}

@end