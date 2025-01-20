@interface SCMLVideoFrameProcessor
- (BOOL)addFrameBuffer:(opaqueCMSampleBuffer *)a3;
- (NSMutableArray)frameQueue;
- (SCMLImageAnalyzer)imageAnalyzer;
- (SCMLVideoAnalysisConfiguration)config;
- (SCMLVideoAnalysisResult)result;
- (SCMLVideoFrameProcessor)initWithImageAnalyzer:(id)a3;
- (id)analyze:(id *)a3;
- (id)finalizeAnalysis:(id *)a3;
- (id)popFrame;
- (unint64_t)frameCount;
- (unint64_t)sensitiveFrameCount;
- (void)dealloc;
- (void)outputDebugInfoForFrame:(id)a3 isSensitive:(BOOL)a4 sensitivityScore:(id)a5;
- (void)pushFrame:(id)a3;
- (void)reset;
- (void)setConfig:(id)a3;
- (void)setFrameCount:(unint64_t)a3;
- (void)setFrameQueue:(id)a3;
- (void)setImageAnalyzer:(id)a3;
- (void)setResult:(id)a3;
- (void)setSensitiveFrameCount:(unint64_t)a3;
- (void)startAnalysisWithConfig:(id)a3;
@end

@implementation SCMLVideoFrameProcessor

- (SCMLVideoFrameProcessor)initWithImageAnalyzer:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SCMLVideoFrameProcessor;
  v6 = [(SCMLVideoFrameProcessor *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageAnalyzer, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    frameQueue = v7->_frameQueue;
    v7->_frameQueue = (NSMutableArray *)v8;

    uint64_t v10 = +[SCMLVideoAnalysisConfiguration defaultConfig];
    config = v7->_config;
    v7->_config = (SCMLVideoAnalysisConfiguration *)v10;

    v12 = v7->_result;
    v7->_result = 0;

    v7->_frameCount = 0;
    v7->_sensitiveFrameCount = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(SCMLVideoFrameProcessor *)self frameQueue];
  [v3 removeAllObjects];

  v4.receiver = self;
  v4.super_class = (Class)SCMLVideoFrameProcessor;
  [(SCMLVideoFrameProcessor *)&v4 dealloc];
}

- (void)reset
{
  v3 = [(SCMLVideoFrameProcessor *)self frameQueue];
  [v3 removeAllObjects];

  [(SCMLVideoFrameProcessor *)self setFrameCount:0];
  [(SCMLVideoFrameProcessor *)self setSensitiveFrameCount:0];

  [(SCMLVideoFrameProcessor *)self setResult:0];
}

- (id)popFrame
{
  v3 = [(SCMLVideoFrameProcessor *)self frameQueue];
  objc_super v4 = (void *)[v3 count];

  if (v4)
  {
    id v5 = [(SCMLVideoFrameProcessor *)self frameQueue];
    objc_super v4 = [v5 objectAtIndexedSubscript:0];

    v6 = [(SCMLVideoFrameProcessor *)self frameQueue];
    [v6 removeObjectAtIndex:0];
  }

  return v4;
}

- (void)pushFrame:(id)a3
{
  id v4 = a3;
  -[NSMutableArray addObject:](self->_frameQueue, "addObject:");
  [(SCMLVideoFrameProcessor *)self setFrameCount:[(SCMLVideoFrameProcessor *)self frameCount] + 1];
}

- (void)startAnalysisWithConfig:(id)a3
{
  id v5 = a3;
  [(SCMLVideoFrameProcessor *)self reset];
  uint64_t v4 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v4 = +[SCMLVideoAnalysisConfiguration defaultConfig];
  }
  id v6 = (id)v4;
  -[SCMLVideoFrameProcessor setConfig:](self, "setConfig:");
}

- (BOOL)addFrameBuffer:(opaqueCMSampleBuffer *)a3
{
  if (a3)
  {
    id v5 = [[SCMLVideoFrame alloc] initWithFrameBuffer:a3 frameIndex:[(SCMLVideoFrameProcessor *)self frameCount]];
    [(SCMLVideoFrameProcessor *)self pushFrame:v5];
  }
  return a3 != 0;
}

- (void)outputDebugInfoForFrame:(id)a3 isSensitive:(BOOL)a4 sensitivityScore:(id)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v8 = a5;
  v9 = +[SCMLLog videoAnalyzer];
  uint64_t v10 = [(SCMLVideoFrameProcessor *)self config];
  v11 = [v10 debugFramesOutputPathPrefix];

  if (v11)
  {
    v12 = [v27 metaDataInfo];
    v13 = v9;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      [v8 doubleValue];
      if (v6) {
        v15 = "Y";
      }
      else {
        v15 = "N";
      }
      *(_DWORD *)buf = 138412802;
      v29 = v12;
      __int16 v30 = 2080;
      v31 = v15;
      __int16 v32 = 2048;
      uint64_t v33 = v14;
      _os_log_impl(&dword_25BF41000, v13, OS_LOG_TYPE_INFO, "Frame %@ sensitive=%s score=%.4f", buf, 0x20u);
    }

    v16 = v8;
    v17 = NSString;
    v18 = [(SCMLVideoFrameProcessor *)self config];
    v19 = [v18 debugFramesOutputPathPrefix];
    [v16 doubleValue];
    if (v6) {
      v21 = "Y";
    }
    else {
      v21 = "N";
    }
    v22 = [v17 stringWithFormat:@"%@%@-%s-%.4f.png", v19, v12, v21, v20];

    id v8 = v16;
    v23 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v22 isDirectory:0];
    [v27 saveToPngWithUrl:v23];

LABEL_13:
    goto LABEL_14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = v9;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v24 = [v27 metaDataInfo];
      [v8 doubleValue];
      v26 = "N";
      *(_DWORD *)buf = 138412802;
      v29 = v24;
      if (v6) {
        v26 = "Y";
      }
      __int16 v30 = 2080;
      v31 = v26;
      __int16 v32 = 2048;
      uint64_t v33 = v25;
      _os_log_debug_impl(&dword_25BF41000, v12, OS_LOG_TYPE_DEBUG, "Frame %@ sensitive=%s score=%.4f", buf, 0x20u);
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (id)analyze:(id *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v3 = [(SCMLVideoFrameProcessor *)self result];
  char v4 = [v3 sensitive];

  id v5 = [(SCMLVideoFrameProcessor *)self result];
  BOOL v6 = v5;
  if ((v4 & 1) == 0)
  {
    v37 = [v5 sensitivityScore];

    v7 = self;
    id v8 = [(SCMLVideoFrameProcessor *)self result];
    v9 = [v8 scoresForLabels];
    uint64_t v10 = (void *)[v9 mutableCopy];

    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    }
    v11 = 0;
    while (1)
    {
      unint64_t v12 = [(SCMLVideoFrameProcessor *)v7 sensitiveFrameCount];
      v13 = [(SCMLVideoFrameProcessor *)v7 config];
      if (v12 >= [v13 sensitiveFrameCountThreshold])
      {

        v39 = v11;
        goto LABEL_25;
      }
      v38 = [(SCMLVideoFrameProcessor *)v7 popFrame];

      if (!v38) {
        break;
      }
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)[v38 frameBuffer]);
      v15 = [(SCMLVideoFrameProcessor *)self imageAnalyzer];
      v16 = [v15 generateClassificationScoresForPixelBuffer:ImageBuffer error:a3];

      v17 = [(SCMLVideoFrameProcessor *)self imageAnalyzer];
      id v45 = &unk_27097A080;
      uint64_t v18 = [v17 isSensitive:v16 sensitivityScore:&v45 classificationMode:0];
      id v19 = v45;

      [(SCMLVideoFrameProcessor *)self outputDebugInfoForFrame:v38 isSensitive:v18 sensitivityScore:v19];
      if (v18) {
        [(SCMLVideoFrameProcessor *)self setSensitiveFrameCount:[(SCMLVideoFrameProcessor *)self sensitiveFrameCount] + 1];
      }
      uint64_t v20 = v37;
      if (!v37 || (uint64_t v20 = v37, [v19 compare:v37] == 1))
      {
        id v21 = v19;

        v37 = v21;
      }
      v22 = [v16 objectForKeyedSubscript:SCMLHandlerImageClassificationScores[0]];
      v23 = +[SCMLAnalysisResult obfuscateLabels:v22];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v24);
            }
            uint64_t v28 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            v29 = [v24 objectForKeyedSubscript:v28];
            __int16 v30 = [v10 objectForKeyedSubscript:v28];
            if (!v30 || [v29 compare:v30] == 1) {
              [v10 setObject:v29 forKeyedSubscript:v28];
            }
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v25);
      }

      v11 = v38;
      v7 = self;
    }
    v39 = 0;
LABEL_25:
    v31 = [SCMLVideoAnalysisResult alloc];
    unint64_t v32 = [(SCMLVideoFrameProcessor *)self sensitiveFrameCount];
    uint64_t v33 = [(SCMLVideoFrameProcessor *)self config];
    uint64_t v34 = -[SCMLAnalysisResult initWithSensitive:sensitivityScore:scoresForLabels:](v31, "initWithSensitive:sensitivityScore:scoresForLabels:", v32 >= [v33 sensitiveFrameCountThreshold], v37, v10);
    [(SCMLVideoFrameProcessor *)self setResult:v34];

    BOOL v6 = [(SCMLVideoFrameProcessor *)self result];
  }

  return v6;
}

- (id)finalizeAnalysis:(id *)a3
{
  char v4 = [(SCMLVideoFrameProcessor *)self result];

  if (v4)
  {
    id v5 = [(SCMLVideoFrameProcessor *)self result];
    uint64_t v6 = [v5 sensitive];

    unint64_t v7 = [(SCMLVideoFrameProcessor *)self frameCount];
    id v8 = [(SCMLVideoFrameProcessor *)self config];
    unint64_t v9 = [v8 sensitiveFrameCountThreshold];

    if (v7 < v9)
    {
      unint64_t v10 = [(SCMLVideoFrameProcessor *)self frameCount];
      uint64_t v6 = v10 == [(SCMLVideoFrameProcessor *)self sensitiveFrameCount];
    }
    v11 = [SCMLVideoAnalysisResult alloc];
    unint64_t v12 = [(SCMLVideoFrameProcessor *)self result];
    v13 = [v12 sensitivityScore];
    uint64_t v14 = [(SCMLVideoFrameProcessor *)self result];
    v15 = [v14 scoresForLabels];
    uint64_t v16 = [(SCMLAnalysisResult *)v11 initWithSensitive:v6 sensitivityScore:v13 scoresForLabels:v15];

    v17 = (void *)v16;
  }
  else
  {
    v17 = 0;
  }
  [(SCMLVideoFrameProcessor *)self reset];

  return v17;
}

- (SCMLImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (void)setImageAnalyzer:(id)a3
{
}

- (NSMutableArray)frameQueue
{
  return self->_frameQueue;
}

- (void)setFrameQueue:(id)a3
{
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(unint64_t)a3
{
  self->_frameCount = a3;
}

- (unint64_t)sensitiveFrameCount
{
  return self->_sensitiveFrameCount;
}

- (void)setSensitiveFrameCount:(unint64_t)a3
{
  self->_sensitiveFrameCount = a3;
}

- (SCMLVideoAnalysisResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (SCMLVideoAnalysisConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_frameQueue, 0);

  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
}

@end