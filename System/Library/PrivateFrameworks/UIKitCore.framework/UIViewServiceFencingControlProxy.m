@interface UIViewServiceFencingControlProxy
@end

@implementation UIViewServiceFencingControlProxy

uint64_t __93___UIViewServiceFencingControlProxy_proxyWithTarget_exportedProtocol_fencingBatchController___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(Protocol **)(a1 + 32);
  if (!v2) {
    return 0;
  }
  uint64_t v5 = 1;
  if (!(unint64_t)protocol_getMethodDescription(v2, (SEL)[a2 selector], 1, 1).name
    && !(unint64_t)protocol_getMethodDescription((Protocol *)*(void *)(a1 + 32), (SEL)[a2 selector], 0, 1).name)
  {
    return 0;
  }
  return v5;
}

@end