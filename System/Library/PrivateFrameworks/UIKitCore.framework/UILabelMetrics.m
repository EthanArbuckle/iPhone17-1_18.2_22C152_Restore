@interface UILabelMetrics
@end

@implementation UILabelMetrics

uint64_t __37___UILabelMetrics__calculateIfNeeded__block_invoke(uint64_t result)
{
  v1 = (void *)result;
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 64);
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  if (*(unsigned char *)(result + 64))
  {
    if (v2)
    {
      result = objc_msgSend(*(id *)(*(void *)(result + 32) + 64), "_calculateIfNecessary", 0.0);
      uint64_t v4 = *(void *)(v2 + 56);
    }
    *(void *)(*(void *)(v1[5] + 8) + 24) = v4;
    uint64_t v5 = v1[4];
    uint64_t v6 = *(void *)(v5 + 64);
    if (v6)
    {
      result = [*(id *)(v5 + 64) _calculateIfNecessary];
      uint64_t v3 = *(void *)(v6 + 56);
    }
    *(void *)(*(void *)(v1[6] + 8) + 24) = v3;
    uint64_t v7 = v1[4];
    uint64_t v8 = *(void *)(v7 + 64);
    if (!v8)
    {
      uint64_t v12 = 0;
      goto LABEL_14;
    }
    result = [*(id *)(v7 + 64) _calculateIfNecessary];
    v9 = (uint64_t *)(v8 + 104);
  }
  else
  {
    if (v2)
    {
      result = objc_msgSend(*(id *)(*(void *)(result + 32) + 64), "_calculateIfNecessary", 0.0);
      uint64_t v4 = *(void *)(v2 + 48);
    }
    *(void *)(*(void *)(v1[5] + 8) + 24) = v4;
    uint64_t v10 = v1[4];
    uint64_t v11 = *(void *)(v10 + 64);
    if (v11)
    {
      result = [*(id *)(v10 + 64) _calculateIfNecessary];
      uint64_t v3 = *(void *)(v11 + 56);
    }
    *(void *)(*(void *)(v1[6] + 8) + 24) = v3;
    v9 = (uint64_t *)(*(void *)(v1[5] + 8) + 24);
  }
  uint64_t v12 = *v9;
LABEL_14:
  *(void *)(*(void *)(v1[7] + 8) + 24) = v12;
  return result;
}

uint64_t __37___UILabelMetrics__calculateIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(char **)(*(void *)(a1 + 32) + 64);
  if (v3)
  {
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v4 = 32;
    }
    else {
      uint64_t v4 = 96;
    }
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v5 = 24;
    }
    else {
      uint64_t v5 = 88;
    }
    uint64_t result = [v3 _calculateIfNecessary];
    uint64_t v6 = *(void *)&v3[v5];
    uint64_t v7 = *(void *)&v3[v4];
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v8 + 32) = v6;
  *(void *)(v8 + 40) = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v9 + 64);
  if (v10)
  {
    uint64_t result = [*(id *)(v9 + 64) _calculateIfNecessary];
    uint64_t v11 = *(void *)(v10 + 72);
    uint64_t v9 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v11 = 0;
  }
  *(void *)(v9 + 184) = v11;
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v12 >= 1)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    if (*(void *)(v13 + 184) < v12) {
      uint64_t v12 = *(void *)(v13 + 184);
    }
    *(void *)(v13 + 184) = v12;
  }
  return result;
}

@end