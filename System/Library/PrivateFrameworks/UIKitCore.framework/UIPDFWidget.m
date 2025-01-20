@interface UIPDFWidget
- (UIPDFWidget)initWithFrame:(CGRect)a3 withDocument:(id)a4;
- (void)addedPageView:(int)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)heartbeat;
- (void)removedPageView:(int)a3;
@end

@implementation UIPDFWidget

- (UIPDFWidget)initWithFrame:(CGRect)a3 withDocument:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UIPDFWidget;
  v5 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, 380.0, 120.0);
  if (v5)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v5, sel_didReceiveMemoryWarning_, @"UIApplicationDidReceiveMemoryWarningNotification", 0);
    uint64_t v6 = 0;
    v5->queueCount = 0;
    v5->queueIndex = 0;
    do
    {
      v7 = &v5->queueData[v6];
      v7->memWarning = 0;
      *(void *)&v7->byteCount = 0;
      ++v6;
    }
    while (v6 != 60);
    v5->renderJobsCount = 0;
    v5->totalPageCount = 0;
    v5->currentPageCount = 0;
    v5->activeDocument = (UIPDFDocument *)a4;
    v5->trackedPages = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v5->heartbeatTimer = (NSTimer *)[MEMORY[0x1E4F1CB00] timerWithTimeInterval:v5 target:sel_heartbeat selector:0 userInfo:1 repeats:0.25];
    v8 = (void *)[MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v8 addTimer:v5->heartbeatTimer forMode:*MEMORY[0x1E4F1C4B0]];
    v9 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 10.0, 30.0, 380.0, 120.0);
    v5->infoLabel = v9;
    -[UILabel setFont:](v9, "setFont:", [off_1E52D39B8 boldSystemFontOfSize:11.0]);
    [(UILabel *)v5->infoLabel setLineBreakMode:0];
    [(UILabel *)v5->infoLabel setNumberOfLines:0];
    [(UILabel *)v5->infoLabel setText:@"Loading..."];
    [(UIView *)v5 addSubview:v5->infoLabel];
  }
  return v5;
}

- (void)dealloc
{
  [(NSTimer *)self->heartbeatTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UIPDFWidget;
  [(UIView *)&v3 dealloc];
}

- (void)heartbeat
{
  uint64_t v10 = 0;
  *(_OWORD *)task_info_out = 0u;
  long long v9 = 0u;
  mach_msg_type_number_t task_info_outCnt = 40;
  if (!task_info(*MEMORY[0x1E4F14960], 0x12u, task_info_out, &task_info_outCnt))
  {
    integer_t v3 = task_info_out[3];
    self->renderJobsCount = [(UIPDFPageImageCache *)[(UIPDFDocument *)self->activeDocument pageImageCache] getRenderQueueJobsCount];
    queueData = self->queueData;
    queueData[self->queueIndex].byteCount = v3;
    self->queueData[self->queueIndex].currentPageCount = self->currentPageCount;
    queueData[self->queueIndex].renderJobsCount = self->renderJobsCount;
    uint64_t queueIndex = self->queueIndex;
    queueData[queueIndex].memWarning = 0;
    self->uint64_t queueIndex = ((int)queueIndex + 1) % 60;
    int queueCount = self->queueCount;
    if (queueCount >= 59) {
      int queueCount = 59;
    }
    self->int queueCount = queueCount + 1;
    [(UIView *)self setNeedsDisplay];
  }
}

- (void)didReceiveMemoryWarning:(id)a3
{
  self->queueData[(self->queueIndex + 59) % 60].memWarning = 1;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  ContextStacuint64_t k = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    long long v9 = 0;
  }
  else {
    long long v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.CGFloat width = width;
  v64.size.CGFloat height = height;
  CGContextClearRect(v9, v64);
  int queueCount = self->queueCount;
  double v11 = 12.0;
  if (queueCount < 1)
  {
    double v14 = 0.0;
    double v16 = 0.0;
  }
  else
  {
    queueData = self->queueData;
    int v13 = self->queueIndex + 59;
    double v14 = 0.0;
    int v15 = self->queueCount;
    double v16 = 0.0;
    do
    {
      double byteCount = (double)queueData[v13 % 60].byteCount;
      if (v14 <= byteCount) {
        double v14 = (double)queueData[v13 % 60].byteCount;
      }
      double v16 = v16 + byteCount;
      --v13;
      --v15;
    }
    while (v15);
    if (v14 > 0.0) {
      double v11 = 120.0 / (v14 * 1.5);
    }
  }
  CGContextSaveGState(v9);
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  CGContextAddRect(v9, v65);
  CGContextSetRGBFillColor(v9, 0.9, 0.9, 0.9, 1.0);
  CGContextFillPath(v9);
  CGContextSetLineWidth(v9, 1.0);
  CGContextSetRGBStrokeColor(v9, 0.8, 0.8, 0.8, 1.0);
  for (int i = 380; i > 0x17; CGContextAddLineToPoint(v9, (double)i, 120.0))
  {
    i -= 24;
    CGContextMoveToPoint(v9, (double)i, 0.0);
  }
  for (int j = 120; j > 0xB; CGContextAddLineToPoint(v9, 380.0, (double)j))
  {
    j -= 12;
    CGContextMoveToPoint(v9, 0.0, (double)j);
  }
  CGContextStrokePath(v9);
  v66.origin.CGFloat x = x;
  v66.origin.CGFloat y = y;
  v66.size.CGFloat width = width;
  v66.size.CGFloat height = height;
  CGContextAddRect(v9, v66);
  CGContextSetLineWidth(v9, 3.0);
  CGContextSetRGBStrokeColor(v9, 0.1, 0.1, 0.1, 1.0);
  CGContextStrokePath(v9);
  CGContextRestoreGState(v9);
  if (self->queueCount >= 1)
  {
    int rect = queueCount;
    CGContextSaveGState(v9);
    CGContextSetLineWidth(v9, 1.5);
    CGContextSetRGBStrokeColor(v9, 1.0, 0.1, 0.1, 1.0);
    if (self->queueCount >= 1)
    {
      int v20 = 0;
      int v21 = 59;
      do
      {
        float v22 = (double)(v20 + 1) * -6.2295082 + 380.0;
        float v23 = 120.0 - v11 * (double)self->queueData[(v21 + self->queueIndex) % 60].byteCount;
        double v24 = v22;
        double v25 = v23;
        if (v20) {
          CGContextAddLineToPoint(v9, v24, v25);
        }
        else {
          CGContextMoveToPoint(v9, v24, v25);
        }
        --v21;
        ++v20;
      }
      while (v20 < self->queueCount);
    }
    CGContextStrokePath(v9);
    CGContextSetLineWidth(v9, 1.5);
    CGContextSetRGBStrokeColor(v9, 0.1, 0.8, 0.1, 1.0);
    if (self->queueCount >= 1)
    {
      int v26 = 0;
      int v27 = 59;
      do
      {
        float v28 = (double)(v26 + 1) * -6.2295082 + 380.0;
        float v29 = 120.0 - (double)(12 * self->queueData[(v27 + self->queueIndex) % 60].currentPageCount);
        double v30 = v28;
        double v31 = v29;
        if (v26) {
          CGContextAddLineToPoint(v9, v30, v31);
        }
        else {
          CGContextMoveToPoint(v9, v30, v31);
        }
        --v27;
        ++v26;
      }
      while (v26 < self->queueCount);
    }
    CGContextStrokePath(v9);
    CGContextSetLineWidth(v9, 1.5);
    CGContextSetRGBStrokeColor(v9, 0.1, 0.1, 0.8, 1.0);
    if (self->queueCount >= 1)
    {
      int v32 = 0;
      int v33 = 59;
      do
      {
        int renderJobsCount = self->queueData[(v33 + self->queueIndex) % 60].renderJobsCount;
        float v35 = (double)(v32 + 1) * -6.2295082 + 380.0;
        float v36 = 120.0 - (double)(12 * renderJobsCount);
        double v37 = v36;
        double v38 = v35;
        if (renderJobsCount < 1) {
          double v37 = 118.0;
        }
        if (v32) {
          CGContextAddLineToPoint(v9, v38, v37);
        }
        else {
          CGContextMoveToPoint(v9, v38, v37);
        }
        --v33;
        ++v32;
      }
      while (v32 < self->queueCount);
    }
    double recta = v16 / (double)rect;
    CGContextStrokePath(v9);
    CGContextRestoreGState(v9);
    CGContextSaveGState(v9);
    CGContextSetLineWidth(v9, 2.0);
    CGContextSetRGBStrokeColor(v9, 1.0, 0.5, 0.1, 1.0);
    int v39 = self->queueCount;
    if (v39 < 1)
    {
      uint64_t v41 = 0;
    }
    else
    {
      int v40 = 0;
      uint64_t v41 = 0;
      v42 = self->queueData;
      int v43 = 59;
      do
      {
        ++v40;
        int v44 = (v43 + self->queueIndex) % 60;
        if (v42[v44].memWarning)
        {
          float v46 = 120.0 - v11 * (double)v42[v44].byteCount;
          CGContextSaveGState(v9);
          CGContextSetRGBStrokeColor(v9, 1.0, 0.1, 0.1, 1.0);
          float v45 = (double)v40 * -6.2295082 + 380.0;
          v67.origin.CGFloat x = (float)(v45 + -4.0);
          v67.origin.CGFloat y = (float)(v46 + -4.0);
          v67.size.CGFloat width = 8.0;
          v67.size.CGFloat height = 8.0;
          CGContextStrokeEllipseInRect(v9, v67);
          CGContextRestoreGState(v9);
          uint64_t v41 = (v41 + 1);
          int v39 = self->queueCount;
        }
        --v43;
      }
      while (v40 < v39);
    }
    CGContextRestoreGState(v9);
    uint64_t v47 = [MEMORY[0x1E4F28B68] stringFromByteCount:(int)v14 countStyle:0];
    uint64_t v48 = [MEMORY[0x1E4F28B68] stringFromByteCount:(int)recta countStyle:0];
    v49 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"Peak: %@, Avg (Red): %@, Mem warnings (Circles): %d\nCurrent pages (Green): %d, Ever constructed: %d, Jobs (Blue): %d\nAllocated pages indices: ", v47, v48, v41, self->currentPageCount, self->totalPageCount, self->renderJobsCount];
    uint64_t v50 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
    v51 = (void *)-[NSMutableSet sortedArrayUsingDescriptors:](self->trackedPages, "sortedArrayUsingDescriptors:", [MEMORY[0x1E4F1C978] arrayWithObject:v50]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v59;
      do
      {
        for (uint64_t k = 0; k != v53; ++k)
        {
          if (*(void *)v59 != v54) {
            objc_enumerationMutation(v51);
          }
          objc_msgSend(v49, "appendFormat:", @"%d ", objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * k), "intValue"));
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v53);
    }
    [(UILabel *)self->infoLabel setText:v49];
  }
}

- (void)addedPageView:(int)a3
{
  ++self->currentPageCount;
  ++self->totalPageCount;
  uint64_t v4 = [NSNumber numberWithInt:*(void *)&a3];
  if (([(NSMutableSet *)self->trackedPages containsObject:v4] & 1) == 0)
  {
    trackedPages = self->trackedPages;
    [(NSMutableSet *)trackedPages addObject:v4];
  }
}

- (void)removedPageView:(int)a3
{
  --self->currentPageCount;
  uint64_t v4 = [NSNumber numberWithInt:*(void *)&a3];
  if ([(NSMutableSet *)self->trackedPages containsObject:v4])
  {
    trackedPages = self->trackedPages;
    [(NSMutableSet *)trackedPages removeObject:v4];
  }
}

@end