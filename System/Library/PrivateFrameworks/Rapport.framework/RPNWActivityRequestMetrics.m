@interface RPNWActivityRequestMetrics
- (NSString)destination;
- (id)_metricsDictionary;
- (unint64_t)replyTime;
- (unint64_t)requestSize;
- (unint64_t)responseSize;
- (void)setDestination:(id)a3;
- (void)setReplyTime:(unint64_t)a3;
- (void)setRequestSize:(unint64_t)a3;
- (void)setResponseSize:(unint64_t)a3;
@end

@implementation RPNWActivityRequestMetrics

- (void)setDestination:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__RPNWActivityRequestMetrics_setDestination___block_invoke;
  v6[3] = &unk_1E605B5D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v6);
}

void __45__RPNWActivityRequestMetrics_setDestination___block_invoke(uint64_t a1)
{
}

- (NSString)destination
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3;
  v9 = __Block_byref_object_dispose__3;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__RPNWActivityRequestMetrics_destination__block_invoke;
  v4[3] = &unk_1E605C400;
  v4[4] = self;
  v4[5] = &v5;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __41__RPNWActivityRequestMetrics_destination__block_invoke(uint64_t a1)
{
}

- (void)setRequestSize:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__RPNWActivityRequestMetrics_setRequestSize___block_invoke;
  v3[3] = &unk_1E605BCA0;
  v3[4] = self;
  v3[5] = a3;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v3);
}

uint64_t __45__RPNWActivityRequestMetrics_setRequestSize___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32) = *(void *)(result + 40);
  return result;
}

- (unint64_t)requestSize
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__RPNWActivityRequestMetrics_requestSize__block_invoke;
  v4[3] = &unk_1E605C400;
  v4[4] = self;
  v4[5] = &v5;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__RPNWActivityRequestMetrics_requestSize__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)setResponseSize:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__RPNWActivityRequestMetrics_setResponseSize___block_invoke;
  v3[3] = &unk_1E605BCA0;
  v3[4] = self;
  v3[5] = a3;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v3);
}

uint64_t __46__RPNWActivityRequestMetrics_setResponseSize___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = *(void *)(result + 40);
  return result;
}

- (unint64_t)responseSize
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__RPNWActivityRequestMetrics_responseSize__block_invoke;
  v4[3] = &unk_1E605C400;
  v4[4] = self;
  v4[5] = &v5;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __42__RPNWActivityRequestMetrics_responseSize__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)setReplyTime:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__RPNWActivityRequestMetrics_setReplyTime___block_invoke;
  v3[3] = &unk_1E605BCA0;
  v3[4] = self;
  v3[5] = a3;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v3);
}

uint64_t __43__RPNWActivityRequestMetrics_setReplyTime___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48) = *(void *)(result + 40);
  return result;
}

- (unint64_t)replyTime
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__RPNWActivityRequestMetrics_replyTime__block_invoke;
  v4[3] = &unk_1E605C400;
  v4[4] = self;
  v4[5] = &v5;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __39__RPNWActivityRequestMetrics_replyTime__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48);
  return result;
}

- (id)_metricsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(RPNWActivityRequestMetrics *)self destination];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"destination"];
  }
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[RPNWActivityRequestMetrics requestSize](self, "requestSize"));
  [v3 setObject:v5 forKeyedSubscript:@"bytesOut"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[RPNWActivityRequestMetrics responseSize](self, "responseSize"));
  [v3 setObject:v6 forKeyedSubscript:@"bytesIn"];

  if ([(RPNWActivityRequestMetrics *)self replyTime])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RPNWActivityRequestMetrics replyTime](self, "replyTime"));
    [v3 setObject:v7 forKeyedSubscript:@"replyTime"];
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end