@interface VGVehicleDeduper
+ (id)_vehicleMatchingVehicle:(id)a3 inArray:(id)a4;
+ (int64_t)actionForAddingNewVehicle:(id *)a3 withExistingGarageVehicles:(id)a4 andUnpairedVehicles:(id)a5;
@end

@implementation VGVehicleDeduper

+ (int64_t)actionForAddingNewVehicle:(id *)a3 withExistingGarageVehicles:(id)a4 andUnpairedVehicles:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!a3)
  {
    v15 = VGGetAssertLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v19 = 136446722;
    v20 = "+[VGVehicleDeduper actionForAddingNewVehicle:withExistingGarageVehicles:andUnpairedVehicles:]";
    __int16 v21 = 2082;
    v22 = "newVehicle == nil";
    __int16 v23 = 2082;
    v24 = "newVehicle cannot be nil";
LABEL_12:
    _os_log_impl(&dword_214A2C000, v15, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", (uint8_t *)&v19, 0x20u);
    goto LABEL_13;
  }
  if (!v8)
  {
    v15 = VGGetAssertLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v19 = 136446722;
    v20 = "+[VGVehicleDeduper actionForAddingNewVehicle:withExistingGarageVehicles:andUnpairedVehicles:]";
    __int16 v21 = 2082;
    v22 = "garageVehicles == nil";
    __int16 v23 = 2082;
    v24 = "garageVehicles cannot be nil";
    goto LABEL_12;
  }
  if (!v9)
  {
    v15 = VGGetAssertLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446722;
      v20 = "+[VGVehicleDeduper actionForAddingNewVehicle:withExistingGarageVehicles:andUnpairedVehicles:]";
      __int16 v21 = 2082;
      v22 = "unpairedVehicles == nil";
      __int16 v23 = 2082;
      v24 = "unpairedVehicles cannot be nil";
      goto LABEL_12;
    }
LABEL_13:

    int64_t v14 = 0;
    goto LABEL_19;
  }
  v11 = [a1 _vehicleMatchingVehicle:*a3 inArray:v8];
  v12 = v11;
  id v13 = *a3;
  if (v11)
  {
    *a3 = [v11 _vehicleByUpdatingWithVehicle:v13];
    int64_t v14 = 1;
  }
  else
  {
    v16 = [a1 _vehicleMatchingVehicle:v13 inArray:v10];
    v17 = v16;
    if (v16)
    {
      *a3 = [v16 _vehicleByUpdatingWithVehicle:*a3];
      int64_t v14 = 3;
    }
    else
    {
      int64_t v14 = 2;
    }
  }
LABEL_19:

  return v14;
}

+ (id)_vehicleMatchingVehicle:(id)a3 inArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__VGVehicleDeduper__vehicleMatchingVehicle_inArray___block_invoke;
  v11[3] = &unk_264225FC8;
  id v7 = v5;
  id v12 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v11];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v6 objectAtIndex:v8];
  }

  return v9;
}

uint64_t __52__VGVehicleDeduper__vehicleMatchingVehicle_inArray___block_invoke(uint64_t a1, void *a2)
{
  return VGVehiclesHaveMatchingVehicleStateProviders(*(void **)(a1 + 32), a2);
}

@end