@interface PLVideoStreamingResourceChoiceOptimizer
- (NSArray)preferredVideoResources;
- (PLVideoStreamingResourceChoiceOptimizer)initWithVideoResources:(id)a3;
@end

@implementation PLVideoStreamingResourceChoiceOptimizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamableVideos, 0);
  objc_storeStrong((id *)&self->_videoResources, 0);
}

- (NSArray)preferredVideoResources
{
  streamableVideos = self->_streamableVideos;
  if (!streamableVideos)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    videoResources = self->_videoResources;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PLVideoStreamingResourceChoiceOptimizer_preferredVideoResources__block_invoke;
    v10[3] = &unk_1E586ABD0;
    v6 = (NSArray *)v4;
    v11 = v6;
    [(NSArray *)videoResources enumerateObjectsUsingBlock:v10];
    v7 = self->_streamableVideos;
    self->_streamableVideos = v6;
    v8 = v6;

    streamableVideos = self->_streamableVideos;
  }
  return streamableVideos;
}

void __66__PLVideoStreamingResourceChoiceOptimizer_preferredVideoResources__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isStreamable]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (PLVideoStreamingResourceChoiceOptimizer)initWithVideoResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLVideoStreamingResourceChoiceOptimizer;
  v6 = [(PLVideoStreamingResourceChoiceOptimizer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_videoResources, a3);
  }

  return v7;
}

@end