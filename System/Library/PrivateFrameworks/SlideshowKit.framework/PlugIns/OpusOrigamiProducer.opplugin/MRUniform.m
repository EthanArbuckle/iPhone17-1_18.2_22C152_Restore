@interface MRUniform
+ ($428C0FB8A9BF713540BE3970CA928F37)poolInfo;
+ (BOOL)clearVars;
- (MRUniform)initWithFloat:(double)a3;
- (MRUniform)initWithI:(int64_t)a3;
- (MRUniform)initWithMat4:(float)a3[16];
- (MRUniform)initWithMat4ForMat3:(float)a3[16];
- (MRUniform)initWithVec2:(double)a3 :(double)a4;
- (MRUniform)initWithVec3:(double)a3 :(double)a4 :(double)a5;
- (MRUniform)initWithVec4:(double)a3 :(double)a4 :(double)a5 :(double)a6;
@end

@implementation MRUniform

- (MRUniform)initWithFloat:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRUniform;
  result = [(MRUniform *)&v6 init];
  if (result)
  {
    float v5 = a3;
    result->m[0] = v5;
    result->length = 1;
  }
  return result;
}

- (MRUniform)initWithVec2:(double)a3 :(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MRUniform;
  result = [(MRUniform *)&v9 init];
  if (result)
  {
    float v7 = a3;
    float v8 = a4;
    result->m[0] = v7;
    result->m[1] = v8;
    result->length = 2;
  }
  return result;
}

- (MRUniform)initWithVec3:(double)a3 :(double)a4 :(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)MRUniform;
  result = [(MRUniform *)&v12 init];
  if (result)
  {
    float v9 = a3;
    float v10 = a4;
    result->m[0] = v9;
    result->m[1] = v10;
    float v11 = a5;
    result->m[2] = v11;
    result->length = 3;
  }
  return result;
}

- (MRUniform)initWithVec4:(double)a3 :(double)a4 :(double)a5 :(double)a6
{
  v15.receiver = self;
  v15.super_class = (Class)MRUniform;
  result = [(MRUniform *)&v15 init];
  if (result)
  {
    float v11 = a3;
    float v12 = a4;
    result->m[0] = v11;
    result->m[1] = v12;
    float v13 = a5;
    float v14 = a6;
    result->m[2] = v13;
    result->m[3] = v14;
    result->length = 4;
  }
  return result;
}

- (MRUniform)initWithI:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRUniform;
  result = [(MRUniform *)&v5 init];
  if (result)
  {
    result->i = a3;
    result->length = 0;
  }
  return result;
}

- (MRUniform)initWithMat4ForMat3:(float)a3[16]
{
  v5.receiver = self;
  v5.super_class = (Class)MRUniform;
  result = [(MRUniform *)&v5 init];
  if (result)
  {
    result->m[0] = *a3;
    result->m[1] = a3[1];
    result->m[2] = a3[2];
    result->m[3] = a3[4];
    result->m[4] = a3[5];
    result->m[5] = a3[6];
    result->m[6] = a3[8];
    result->m[7] = a3[9];
    result->m[8] = a3[10];
    result->length = 9;
  }
  return result;
}

- (MRUniform)initWithMat4:(float)a3[16]
{
  v8.receiver = self;
  v8.super_class = (Class)MRUniform;
  result = [(MRUniform *)&v8 init];
  if (result)
  {
    long long v5 = *((_OWORD *)a3 + 3);
    long long v7 = *(_OWORD *)a3;
    long long v6 = *((_OWORD *)a3 + 1);
    *(_OWORD *)&result->m[8] = *((_OWORD *)a3 + 2);
    *(_OWORD *)&result->m[12] = v5;
    *(_OWORD *)result->m = v7;
    *(_OWORD *)&result->m[4] = v6;
    result->length = 16;
  }
  return result;
}

+ ($428C0FB8A9BF713540BE3970CA928F37)poolInfo
{
  result = ($428C0FB8A9BF713540BE3970CA928F37 *)&unk_1F13F8;
  byte_1F1410 = 1;
  return result;
}

+ (BOOL)clearVars
{
  return 0;
}

@end