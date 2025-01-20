@interface MNLocationSimulationState
@end

@implementation MNLocationSimulationState

uint64_t __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findFirstJunction:");
}

uint64_t __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _findOffRouteLocationWithMatchedSegments:a2 stepFinishedHandler:a3];
}

void __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = MNGetMNNavigationSimulationLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v5 latLng];
    [v8 lat];
    uint64_t v10 = v9;
    v11 = [v5 latLng];
    [v11 lng];
    int v13 = 134218240;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    uint64_t v16 = v12;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "Looking for route to off route location: %f, %f", (uint8_t *)&v13, 0x16u);
  }
  [*(id *)(a1 + 32) _findRouteToOffRouteLocation:v5 stepFinishedHandler:v6];
}

void __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_264(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = *MEMORY[0x1E4F641A8];
    id v7 = v4;
    id v6 = [*(id *)(a1 + 32) data];
    [v6 setLastRouteCoordinate:v5];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
    id v4 = v7;
  }
}

uint64_t __70___MNLocationSimulationState_SearchingForOffRoute__findFirstJunction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70___MNLocationSimulationState_SearchingForOffRoute__nextOffRouteTarget__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "roadID"));
  LOBYTE(v4) = [v4 containsObject:v5];

  if (v4) {
    goto LABEL_2;
  }
  int v7 = *(_DWORD *)(a1 + 40);
  if (!v7)
  {
    if (![v3 isDrivable]) {
      goto LABEL_2;
    }
    int v7 = *(_DWORD *)(a1 + 40);
  }
  if (v7 == 2)
  {
    if (![v3 walkableSide]) {
      goto LABEL_2;
    }
    int v7 = *(_DWORD *)(a1 + 40);
  }
  if (v7 != 3 || [v3 bikeableSide])
  {
    uint64_t v6 = 1;
    goto LABEL_12;
  }
LABEL_2:
  uint64_t v6 = 0;
LABEL_12:

  return v6;
}

uint64_t __70___MNLocationSimulationState_SearchingForOffRoute__nextOffRouteTarget__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [a2 lastCoordinate2D];
  objc_msgSend(v5, "distanceToRouteFrom:");
  double v8 = v7;
  uint64_t v9 = *(void **)(a1 + 32);
  [v6 lastCoordinate2D];
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v9, "distanceToRouteFrom:", v11, v13);
  double v15 = v14;
  uint64_t v16 = [NSNumber numberWithDouble:v8];
  uint64_t v17 = [NSNumber numberWithDouble:v15];
  uint64_t v18 = [v16 compare:v17];

  return v18;
}

void __100___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation_stepFinishedHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  (*(void (**)(uint64_t, id, uint64_t))(v2 + 16))(v2, v3, 1);
}

uint64_t __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findParkingLocation:");
}

uint64_t __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _findRouteToParkingLocation:a2 finishedHandler:a3];
}

void __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *MEMORY[0x1E4F641A8];
  double v7 = *(void **)(a1 + 32);
  id v11 = a3;
  double v8 = [v7 data];
  [v8 setLastRouteCoordinate:v6];

  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v5;

  (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
}

void __84___MNLocationSimulationState_SearchingForParkingBeforeArrival__findParkingLocation___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(a1 + 32) _scoreForRoad:*(double *)(a1 + 56) coordinate:*(double *)(a1 + 64)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v4 > *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

void __84___MNLocationSimulationState_SearchingForParkingBeforeArrival__findParkingLocation___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    uint64_t v3 = [v2 coordinates3d];
    uint64_t v4 = v3 + 24 * [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) coordinateCount];
    double v6 = *(double *)(v4 - 24);
    double v5 = *(double *)(v4 - 16);
    double v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64660]), "initWithGEOCoordinate:", v6, v5);
    double v8 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) internalRoadName];
      int v11 = 138412802;
      double v12 = v9;
      __int16 v13 = 2048;
      double v14 = v6;
      __int16 v15 = 2048;
      double v16 = v5;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "Using \"%@\" for parking (%f, %f)", (uint8_t *)&v11, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    double v10 = MNGetMNNavigationSimulationLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Unable to find road for parking.", (uint8_t *)&v11, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __107___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingLocation_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  (*(void (**)(uint64_t, id, uint64_t))(v2 + 16))(v2, v3, 1);
}

@end