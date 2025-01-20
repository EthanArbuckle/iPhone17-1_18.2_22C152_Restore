@interface MTLDebugDeadlineProfile
- (void)validateCommandQueue:(id)a3;
@end

@implementation MTLDebugDeadlineProfile

- (void)validateCommandQueue:(id)a3
{
  id v3 = (id)atomic_load((unint64_t *)&self->_commandQueue);
  if (v3)
  {
    if (v3 != a3) {
LABEL_10:
    }
      MTLReportFailure();
  }
  else
  {
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_commandQueue, (unint64_t *)&v3, (unint64_t)a3);
    if (v3) {
      id v5 = v3;
    }
    else {
      id v5 = 0;
    }
    if (v3 && v5 != a3) {
      goto LABEL_10;
    }
  }
}

@end