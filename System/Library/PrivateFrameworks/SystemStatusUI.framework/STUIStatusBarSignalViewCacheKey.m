@interface STUIStatusBarSignalViewCacheKey
- (BOOL)isEqual:(id)a3;
- (STUIStatusBarSignalViewCacheKey)initWithClass:(Class)a3 size:(CGSize)a4 rect:(CGRect)a5 radius:(double)a6 lineWidth:(double)a7 alternate:(BOOL)a8 scale:(double)a9;
- (double)initWithClass:(double)a3 size:(double)a4 rect:(double)a5 radius:(double)a6 lineWidth:(double)a7 secondarySize:(double)a8 secondaryRect:(double)a9 alternate:(uint64_t)a10 scale:(uint64_t)a11;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation STUIStatusBarSignalViewCacheKey

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_2(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 16);
}

id __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 32);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_9(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 136);
}

uint64_t __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_8(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 128);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_6(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 80);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_5(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 72);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 64);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_7(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 96);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  Class classType = self->_classType;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke;
  v47[3] = &unk_1E6AA3928;
  id v8 = v6;
  id v48 = v8;
  id v9 = (id)[v5 appendClass:classType counterpart:v47];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_2;
  v45[3] = &unk_1E6AA3950;
  id v10 = v8;
  id v46 = v10;
  id v11 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v45, self->_size.width, self->_size.height);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_3;
  v43[3] = &unk_1E6AA3978;
  id v12 = v10;
  id v44 = v12;
  id v13 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v43, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  double radius = self->_radius;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_4;
  v41[3] = &unk_1E6AA39A0;
  id v15 = v12;
  id v42 = v15;
  id v16 = (id)[v5 appendCGFloat:v41 counterpart:radius];
  double lineWidth = self->_lineWidth;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_5;
  v39[3] = &unk_1E6AA39A0;
  id v18 = v15;
  id v40 = v18;
  id v19 = (id)[v5 appendCGFloat:v39 counterpart:lineWidth];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_6;
  v37[3] = &unk_1E6AA3950;
  id v20 = v18;
  id v38 = v20;
  id v21 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v37, self->_secondarySize.width, self->_secondarySize.height);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_7;
  v35[3] = &unk_1E6AA3978;
  id v22 = v20;
  id v36 = v22;
  id v23 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v35, self->_secondaryRect.origin.x, self->_secondaryRect.origin.y, self->_secondaryRect.size.width, self->_secondaryRect.size.height);
  BOOL alternate = self->_alternate;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_8;
  v33[3] = &unk_1E6AA39C8;
  id v25 = v22;
  id v34 = v25;
  id v26 = (id)[v5 appendBool:alternate counterpart:v33];
  double scale = self->_scale;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_9;
  v31[3] = &unk_1E6AA39A0;
  id v32 = v25;
  id v28 = v25;
  id v29 = (id)[v5 appendCGFloat:v31 counterpart:scale];
  LOBYTE(v25) = [v5 isEqual];

  return (char)v25;
}

- (STUIStatusBarSignalViewCacheKey)initWithClass:(Class)a3 size:(CGSize)a4 rect:(CGRect)a5 radius:(double)a6 lineWidth:(double)a7 alternate:(BOOL)a8 scale:(double)a9
{
  return -[STUIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](self, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a3, a8, a4.width, a4.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6, a7, *MEMORY[0x1E4F1DB30], *(void *)(MEMORY[0x1E4F1DB30] + 8), *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8), *(void *)(MEMORY[0x1E4F1DB20] + 16), *(void *)(MEMORY[0x1E4F1DB20] + 24), *(void *)&a9);
}

- (double)initWithClass:(double)a3 size:(double)a4 rect:(double)a5 radius:(double)a6 lineWidth:(double)a7 secondarySize:(double)a8 secondaryRect:(double)a9 alternate:(uint64_t)a10 scale:(uint64_t)a11
{
  v34.receiver = a1;
  v34.super_class = (Class)STUIStatusBarSignalViewCacheKey;
  result = (double *)objc_msgSendSuper2(&v34, sel_init);
  if (result)
  {
    *((void *)result + 1) = a11;
    result[2] = a2;
    result[3] = a3;
    result[4] = a4;
    result[5] = a5;
    result[6] = a6;
    result[7] = a7;
    result[8] = a8;
    result[9] = a9;
    *((void *)result + 10) = a17;
    *((void *)result + 11) = a18;
    *((void *)result + 12) = a19;
    *((void *)result + 13) = a20;
    *((void *)result + 14) = a21;
    *((void *)result + 15) = a22;
    *((unsigned char *)result + 128) = a12;
    *((void *)result + 17) = a23;
  }
  return result;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendClass:self->_classType];
  id v5 = (id)objc_msgSend(v3, "appendCGSize:", self->_size.width, self->_size.height);
  id v6 = (id)objc_msgSend(v3, "appendCGRect:", self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  id v7 = (id)[v3 appendCGFloat:self->_radius];
  id v8 = (id)[v3 appendCGFloat:self->_lineWidth];
  id v9 = (id)objc_msgSend(v3, "appendCGSize:", self->_secondarySize.width, self->_secondarySize.height);
  id v10 = (id)objc_msgSend(v3, "appendCGRect:", self->_secondaryRect.origin.x, self->_secondaryRect.origin.y, self->_secondaryRect.size.width, self->_secondaryRect.size.height);
  id v11 = (id)[v3 appendBool:self->_alternate];
  id v12 = (id)[v3 appendCGFloat:self->_scale];
  unint64_t v13 = [v3 hash];

  return v13;
}

- (id)description
{
  return [(STUIStatusBarSignalViewCacheKey *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STUIStatusBarSignalViewCacheKey *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STUIStatusBarSignalViewCacheKey *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STUIStatusBarSignalViewCacheKey *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarSignalViewCacheKey *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(STUIStatusBarSignalViewCacheKey *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__STUIStatusBarSignalViewCacheKey__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v11[3] = &unk_1E6AA39F0;
  id v8 = v7;
  id v12 = v8;
  unint64_t v13 = self;
  [v8 appendBodySectionWithName:0 multilinePrefix:v6 block:v11];

  id v9 = v8;
  return v9;
}

id __83__STUIStatusBarSignalViewCacheKey__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendClass:*(void *)(*(void *)(a1 + 40) + 8) withName:@"class"];
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", @"size", *(double *)(*(void *)(a1 + 40) + 16), *(double *)(*(void *)(a1 + 40) + 24));
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", @"rect", *(double *)(*(void *)(a1 + 40) + 32), *(double *)(*(void *)(a1 + 40) + 40), *(double *)(*(void *)(a1 + 40) + 48), *(double *)(*(void *)(a1 + 40) + 56));
  id v5 = (id)[*(id *)(a1 + 32) appendDouble:@"radius" withName:10 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 64)];
  id v6 = (id)[*(id *)(a1 + 32) appendDouble:@"lineWidth" withName:10 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 72)];
  id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", @"secondarySize", *(double *)(*(void *)(a1 + 40) + 80), *(double *)(*(void *)(a1 + 40) + 88));
  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", @"secondaryRect", *(double *)(*(void *)(a1 + 40) + 96), *(double *)(*(void *)(a1 + 40) + 104), *(double *)(*(void *)(a1 + 40) + 112), *(double *)(*(void *)(a1 + 40) + 120));
  double v9 = 0.0;
  if (*(unsigned char *)(*(void *)(a1 + 40) + 128)) {
    double v9 = 1.0;
  }
  id v10 = (id)[*(id *)(a1 + 32) appendDouble:@"alternate" withName:10 decimalPrecision:v9];
  return (id)[*(id *)(a1 + 32) appendDouble:@"scale" withName:10 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 136)];
}

@end