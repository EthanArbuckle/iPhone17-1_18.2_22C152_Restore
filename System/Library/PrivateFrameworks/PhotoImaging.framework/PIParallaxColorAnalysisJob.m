@interface PIParallaxColorAnalysisJob
@end

@implementation PIParallaxColorAnalysisJob

uint64_t __40___PIParallaxColorAnalysisJob_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 imageHistogram];
  uint64_t v6 = [v5 sampleCount];

  v7 = [v4 imageHistogram];

  uint64_t v8 = [v7 sampleCount];
  if (v6 > v8) {
    return -1;
  }
  else {
    return v6 < v8;
  }
}

void __53___PIParallaxColorAnalysisJob__computeAllHistograms___block_invoke(void *a1, uint64_t a2)
{
  v3 = (void *)a1[4];
  id v4 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  uint64_t v5 = [v3 computeHistogramFromBuffer:a2 error:&obj];
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end