@interface PXCuratedLibraryConcreteAnalysisStatus
@end

@implementation PXCuratedLibraryConcreteAnalysisStatus

void __66___PXCuratedLibraryConcreteAnalysisStatus__updateStatusProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = a2;
  [v6 setState:v3];
  [v6 setLocalizedTitle:*(void *)(a1 + 32)];
  [v6 setLocalizedDescription:*(void *)(a1 + 40)];
  LODWORD(v4) = *(_DWORD *)(a1 + 56);
  [v6 setProgress:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 60);
  [v6 setDisplayProgress:v5];
  [v6 setIsDaysMonthsYearsStructureEnabled:*(unsigned __int8 *)(a1 + 64)];
  [v6 setIsDevicePlugged:*(unsigned char *)(a1 + 65) == 0];
}

uint64_t __70___PXCuratedLibraryConcreteAnalysisStatus__configureBatteryMonitoring__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  [v2 setBatteryMonitoringEnabled:1];

  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel__batteryStateDidChange_ name:*MEMORY[0x1E4FB2818] object:0];

  double v4 = *(void **)(a1 + 32);
  return [v4 _updateStatusProperties];
}

uint64_t __66___PXCuratedLibraryConcreteAnalysisStatus__batteryStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStatusProperties];
}

@end