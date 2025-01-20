@interface PXScrubberSeekRequest
- (NSDate)dateCreated;
- (PXScrubberSeekRequest)init;
- (PXScrubberSeekRequest)initWithTarget:(id)a3 seekTime:(double)a4;
- (PXVideoScrubberControllerTarget)target;
- (double)seekTime;
- (void)setDateCreated:(id)a3;
- (void)setSeekTime:(double)a3;
- (void)setTarget:(id)a3;
@end

@implementation PXScrubberSeekRequest

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_dateCreated, 0);
}

- (void)setTarget:(id)a3
{
}

- (PXVideoScrubberControllerTarget)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return (PXVideoScrubberControllerTarget *)WeakRetained;
}

- (void)setSeekTime:(double)a3
{
  self->_seekTime = a3;
}

- (double)seekTime
{
  return self->_seekTime;
}

- (void)setDateCreated:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (PXScrubberSeekRequest)initWithTarget:(id)a3 seekTime:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXScrubberSeekRequest;
  v8 = [(PXScrubberSeekRequest *)&v13 init];
  if (v8)
  {
    if (!v7)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v8, @"PXVideoScrubberController.m", 440, @"Invalid parameter not satisfying: %@", @"target != nil" object file lineNumber description];
    }
    objc_storeWeak((id *)&v8->_target, v7);
    v8->_seekTime = a4;
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    dateCreated = v8->_dateCreated;
    v8->_dateCreated = (NSDate *)v9;
  }
  return v8;
}

- (PXScrubberSeekRequest)init
{
  return [(PXScrubberSeekRequest *)self initWithTarget:0 seekTime:0.0];
}

@end