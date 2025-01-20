@interface STUserDeviceAddress
+ (id)fetchOrCreateUserDeviceAddressWithUser:(id)a3 device:(id)a4 context:(id)a5 error:(id *)a6;
@end

@implementation STUserDeviceAddress

+ (id)fetchOrCreateUserDeviceAddressWithUser:(id)a3 device:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [a1 fetchRequest];
  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ && %K == %@", @"user", v10, @"device", v11];
  [v13 setPredicate:v14];

  v15 = [v13 execute:a6];
  v16 = v15;
  if (v15)
  {
    if ((unint64_t)[v15 count] >= 2)
    {
      v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:8 userInfo:0];
      v18 = +[STLog persistence];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[STUserDeviceAddress fetchOrCreateUserDeviceAddressWithUser:device:context:error:]((uint64_t)v17, v18);
      }

      if (a6) {
        *a6 = v17;
      }
    }
    v19 = [v16 firstObject];
    if (!v19)
    {
      v19 = [[STUserDeviceAddress alloc] initWithContext:v12];
      [(STUserDeviceAddress *)v19 setUser:v10];
      [(STUserDeviceAddress *)v19 setDevice:v11];
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (void)fetchOrCreateUserDeviceAddressWithUser:(uint64_t)a1 device:(NSObject *)a2 context:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Multiple user-device addresses for a user and device pairing in database: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end