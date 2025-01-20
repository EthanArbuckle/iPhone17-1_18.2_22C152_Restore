@interface ULOdometryMO
+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
- (optional<CLMiLoOdometryTable::Entry>)convertToEntry;
@end

@implementation ULOdometryMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  v6 = [[ULOdometryMO alloc] initWithContext:v5];
  LODWORD(v7) = llroundf(*(float *)a3 * 128.0);
  [(ULOdometryMO *)v6 setDeltaPositionX:v7];
  LODWORD(v8) = llroundf(*((float *)a3 + 1) * 128.0);
  [(ULOdometryMO *)v6 setDeltaPositionY:v8];
  LODWORD(v9) = llroundf(*((float *)a3 + 2) * 128.0);
  [(ULOdometryMO *)v6 setDeltaPositionZ:v9];
  [(ULOdometryMO *)v6 setTimestamp:*((double *)a3 + 2)];
  [(ULOdometryMO *)v6 setTrajectoryUUID:*((void *)a3 + 3)];

  return v6;
}

- (optional<CLMiLoOdometryTable::Entry>)convertToEntry
{
  uint64_t v3 = v1;
  float v4 = (float)(int)[(ULOdometryMO *)self deltaPositionX] * 0.0078125;
  float v5 = (float)(int)[(ULOdometryMO *)self deltaPositionY] * 0.0078125;
  float v6 = (float)(int)[(ULOdometryMO *)self deltaPositionZ] * 0.0078125;
  [(ULOdometryMO *)self timestamp];
  double v8 = v7;
  uint64_t v9 = [(ULOdometryMO *)self trajectoryUUID];
  CLMiLoOdometryTable::Entry::Entry((uint64_t)&v13, v9, v4, v5, v6, v8);
  *(_OWORD *)uint64_t v3 = v13;
  uint64_t v10 = v15;
  uint64_t v15 = 0;
  *(void *)(v3 + 16) = v14;
  *(void *)(v3 + 24) = v10;
  *(unsigned char *)(v3 + 32) = 1;

  *((void *)&result.var0.var2 + 1) = v12;
  result.var0.var2 = v11;
  return result;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ULOdometryMO"];
}

@end