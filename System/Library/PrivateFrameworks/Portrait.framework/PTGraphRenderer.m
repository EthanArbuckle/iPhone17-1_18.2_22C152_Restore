@interface PTGraphRenderer
- (NSString)title;
- (PTGraphRenderer)initWithMetalContext:(id)a3 range:(int)a4 samples:(int)a5 sequences:(id)a6 title:;
- (void)setTitle:(id)a3;
- (void)updateWithSequenceId:(int)a3 buffer:(id)a4 offset:(unint64_t)a5 frameIndex:(int)a6;
- (void)updateWithSequenceId:(int)a3 value:(float)a4 frameIndex:(int)a5;
@end

@implementation PTGraphRenderer

- (PTGraphRenderer)initWithMetalContext:(id)a3 range:(int)a4 samples:(int)a5 sequences:(id)a6 title:
{
  id v8 = a3;
  v9 = [(PTGraphRenderer *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metalContext, a3);
    v11 = v10;
  }

  return v10;
}

- (void)updateWithSequenceId:(int)a3 value:(float)a4 frameIndex:(int)a5
{
  id v8 = [(NSMutableArray *)self->_buffers objectAtIndexedSubscript:a3];
  uint64_t v9 = [v8 contents];

  *(float *)(v9 + 4 * (a5 % self->_samples)) = a4;
}

- (void)updateWithSequenceId:(int)a3 buffer:(id)a4 offset:(unint64_t)a5 frameIndex:(int)a6
{
  LODWORD(v6) = 1.0;
  [(PTGraphRenderer *)self updateWithSequenceId:*(void *)&a3 buffer:a4 offset:a5 scale:*(void *)&a6 frameIndex:v6];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_updateGraphSequenceWithTextureSample, 0);
  objc_storeStrong((id *)&self->_updateGraphSequenceWithBuffer, 0);
  objc_storeStrong((id *)&self->_renderGraphToRegion, 0);
  objc_storeStrong((id *)&self->_util, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end