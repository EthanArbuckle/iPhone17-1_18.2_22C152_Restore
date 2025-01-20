@interface NSCoder
- (__n128)decodeMatrix4x4ForKey:(void *)a3;
- (__n128)decodeQuatForKey:(void *)a3;
- (__n128)decodeVector3ForKey:(void *)a3;
- (void)encodeMatrix4x4:(__n128)a3 forKey:(__n128)a4;
- (void)encodeQuat:(uint64_t)a3 forKey:(void *)a4;
- (void)encodeVector3:(id)a3 forKey:;
@end

@implementation NSCoder

- (void)encodeMatrix4x4:(__n128)a3 forKey:(__n128)a4
{
  __n128 v10 = a2;
  __n128 v11 = a3;
  __n128 v12 = a4;
  __n128 v13 = a5;
  id v8 = a7;
  v9 = +[NSData dataWithBytes:&v10 length:64];
  [a1 encodeObject:v9 forKey:v8];
}

- (__n128)decodeMatrix4x4ForKey:(void *)a3
{
  id v4 = a3;
  if ([a1 containsValueForKey:v4])
  {
    id v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
    if ((unint64_t)[v5 length] <= 0x3F)
    {
      v7 = +[NSAssertionHandler currentHandler];
      id v8 = +[NSString stringWithUTF8String:"simd_float4x4 GetMatrix4x4FromNSData(NSData *__strong)"];
      [v7 handleFailureInFunction:v8 file:@"NIVisionSupport.mm" lineNumber:111 description:@"NSData must contain enough bytes for simd_float4x4"];
    }
    [v5 getBytes:&v10 length:64];

    simd_float4 v9 = v10;
  }
  else
  {
    simd_float4 v9 = matrix_identity_float4x4.columns[0];
  }

  return (__n128)v9;
}

- (void)encodeVector3:(id)a3 forKey:
{
  long long v7 = v3;
  id v5 = a3;
  v6 = +[NSData dataWithBytes:&v7 length:16];
  -[NSCoder encodeObject:forKey:](self, "encodeObject:forKey:", v6, v5, v7);
}

- (__n128)decodeVector3ForKey:(void *)a3
{
  id v4 = a3;
  id v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  if ((unint64_t)[v5 length] <= 0xF)
  {
    long long v7 = +[NSAssertionHandler currentHandler];
    id v8 = +[NSString stringWithUTF8String:"simd_float3 GetVector3FromNSData(NSData *__strong)"];
    [v7 handleFailureInFunction:v8 file:@"NINearbyObject.mm" lineNumber:663 description:@"NSData must contain enough bytes for simd_float3"];
  }
  DWORD2(v10) = 0;
  *(void *)&long long v10 = 0;
  [v5 getBytes:&v10 length:16];
  long long v9 = v10;

  return (__n128)v9;
}

- (void)encodeQuat:(uint64_t)a3 forKey:(void *)a4
{
  __n128 v7 = a2;
  id v5 = a4;
  v6 = +[NSData dataWithBytes:&v7 length:16];
  [a1 encodeObject:v6 forKey:v5];
}

- (__n128)decodeQuatForKey:(void *)a3
{
  id v4 = a3;
  id v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  if ((unint64_t)[v5 length] <= 0xF)
  {
    __n128 v7 = +[NSAssertionHandler currentHandler];
    id v8 = +[NSString stringWithUTF8String:"simd_quatf GetQuaternionFromNSData(NSData *__strong)"];
    [v7 handleFailureInFunction:v8 file:@"NINearbyObject.mm" lineNumber:670 description:@"NSData must contain enough bytes for simd_quatf"];
  }
  [v5 getBytes:&v10 length:16];

  long long v9 = v10;
  return (__n128)v9;
}

@end