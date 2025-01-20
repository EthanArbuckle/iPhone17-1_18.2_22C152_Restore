@interface PXManualAVResourceReclamationController
- (void)reclaimResources;
@end

@implementation PXManualAVResourceReclamationController

- (void)reclaimResources
{
  id v3 = [MEMORY[0x263EFF910] date];
  [(PXConcreteAVResourceReclamationController *)self reclamationEventDidOccur:v3];
}

@end