@interface UIVPA
@end

@implementation UIVPA

void ___UIVPA_CATransformDisplacement_block_invoke(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 64) = 0;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  long long v5 = a2[5];
  v27[4] = a2[4];
  v27[5] = v5;
  long long v6 = a2[7];
  v27[6] = a2[6];
  v27[7] = v6;
  long long v7 = a2[1];
  v27[0] = *a2;
  v27[1] = v7;
  long long v8 = a2[3];
  v27[2] = a2[2];
  v27[3] = v8;
  [*(id *)(a1 + 32) setTransform:v27];
  v9 = [*(id *)(a1 + 32) valueForKeyPath:@"transform.translation.x"];
  [v9 floatValue];
  *(double *)(a3 + 48) = v10;

  v11 = [*(id *)(a1 + 32) valueForKeyPath:@"transform.translation.y"];
  [v11 floatValue];
  *(double *)(a3 + 56) = v12;

  v13 = [*(id *)(a1 + 32) valueForKeyPath:@"transform.translation.z"];
  [v13 floatValue];
  *(double *)(a3 + 64) = v14;

  v15 = [*(id *)(a1 + 32) valueForKeyPath:@"transform.scale.x"];
  [v15 floatValue];
  *(double *)(a3 + 24) = v16;

  v17 = [*(id *)(a1 + 32) valueForKeyPath:@"transform.scale.y"];
  [v17 floatValue];
  *(double *)(a3 + 32) = v18;

  v19 = [*(id *)(a1 + 32) valueForKeyPath:@"transform.scale.z"];
  [v19 floatValue];
  *(double *)(a3 + 40) = v20;

  v21 = [*(id *)(a1 + 32) valueForKeyPath:@"transform.rotation.x"];
  [v21 floatValue];
  *(double *)a3 = v22;

  v23 = [*(id *)(a1 + 32) valueForKeyPath:@"transform.rotation.y"];
  [v23 floatValue];
  *(double *)(a3 + 8) = v24;

  v25 = [*(id *)(a1 + 32) valueForKeyPath:@"transform.rotation.z"];
  [v25 floatValue];
  *(double *)(a3 + 16) = v26;
}

@end