@interface GTDeviceCapabilities
- (id)daemonDeviceCapabilities;
- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3;
- (id)inferiorEnvironment:(id)a3;
@end

@implementation GTDeviceCapabilities

- (id)daemonDeviceCapabilities
{
  return DaemonDeviceCapabilities(@"/");
}

- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3
{
  id v3 = a3;
  apr_initialize();
  newpool = 0;
  apr_pool_create_ex(&newpool, 0, 0, 0);
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  v4 = [v3 objectForKeyedSubscript:@"heap-texture-info"];
  v5 = v4;
  char v43 = 0;
  if (v4)
  {
    uint64_t v44 = sub_100020774(v4, (uint64_t)newpool, &v43);
    uint64_t v45 = v6;
  }
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  v7 = [v3 objectForKeyedSubscript:@"heap-acceleration-structure-info"];
  v8 = v7;
  char v40 = 0;
  if (v7)
  {
    uint64_t v41 = sub_100020594(v7, (uint64_t)newpool, &v40);
    uint64_t v42 = v9;
  }
  v30 = v5;
  id v10 = MTLCreateSystemDefaultDevice();
  v31 = v3;
  v28 = v10;
  v29 = v8;
  if (v10)
  {
    id v50 = v10;
    v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1, v10, v8, v5, v3);
  }
  else
  {
    v11 = 0;
  }
  id v34 = objc_alloc_init((Class)NSMutableArray);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v33 = *(void *)v37;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        p = 0;
        apr_pool_create_ex(&p, 0, 0, 0);
        v16 = sub_100020C14(v15, (uint64_t)p);
        v17 = sub_1000203D8((const uint8_t *)v16);
        uint64_t v18 = sub_100021F90(&v44, (uint64_t)v16, v15);
        uint64_t v19 = sub_1000222B4((uint64_t)&v41, (uint64_t)v16, v15);
        v47[0] = @"device-name";
        v20 = [v15 name];
        v48[0] = v20;
        v48[1] = v17;
        v47[1] = @"capabilities-runtime";
        v47[2] = @"heap-texture-compatibility";
        v21 = +[NSNumber numberWithBool:v18];
        v48[2] = v21;
        v47[3] = @"heap-acceleration-structure-compatibility";
        v22 = +[NSNumber numberWithBool:v19];
        v48[3] = v22;
        v47[4] = @"heap-texture-info-decoded";
        v23 = +[NSNumber numberWithInt:v43 == 0];
        v48[4] = v23;
        v47[5] = @"heap-acceleration-structure-info-decoded";
        v24 = +[NSNumber numberWithInt:v40 == 0];
        v48[5] = v24;
        v25 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:6];
        [v34 addObject:v25];

        apr_pool_destroy(p);
      }
      id v13 = [obj countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v13);
  }

  apr_pool_destroy(newpool);
  id v26 = [v34 copy];

  return v26;
}

- (id)inferiorEnvironment:(id)a3
{
  return DaemonCreateGuestAppTransport(a3);
}

@end