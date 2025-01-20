@interface PXVideoPlaybackReporter
- (BOOL)isStateFinal;
- (NSDate)assetCreationDate;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSMutableArray)endpoints;
- (NSString)identifier;
- (PXVideoPlaybackReporter)init;
- (PXVideoPlaybackReporter)initWithIdentifier:(id)a3;
- (PXVideoPlaybackReporter)initWithIdentifier:(id)a3 CPAnalysticsEndpoint:(BOOL)a4;
- (_PXVideoPlaybackCPAnalyticsEndpoint)cpAnalyticsEndpoint;
- (id)description;
- (int64_t)priority;
- (int64_t)state;
- (void)_sendPayloadToEndpointIfNeeded:(id)a3;
- (void)_sendPayloadToEndpointsIfNeeded;
- (void)addEndpoint:(id)a3;
- (void)addEndpointWithPlayerItem:(id)a3;
- (void)reportAVAssetCreated;
- (void)reportPlaybackAbandoned;
- (void)reportPlaybackBegan;
- (void)reportPlaybackRequestedWithPriority:(int64_t)a3;
- (void)setAssetCreationDate:(id)a3;
- (void)setCpAnalyticsEndpoint:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation PXVideoPlaybackReporter

- (void)addEndpointWithPlayerItem:(id)a3
{
  id v4 = a3;
  v5 = [[PXVideoPlaybackReporterAVPlayerItemEndpoint alloc] initWithPlayerItem:v4];

  [(PXVideoPlaybackReporter *)self addEndpoint:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpAnalyticsEndpoint, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_assetCreationDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setCpAnalyticsEndpoint:(id)a3
{
}

- (_PXVideoPlaybackCPAnalyticsEndpoint)cpAnalyticsEndpoint
{
  return self->_cpAnalyticsEndpoint;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setAssetCreationDate:(id)a3
{
}

- (NSDate)assetCreationDate
{
  return self->_assetCreationDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSMutableArray)endpoints
{
  return self->_endpoints;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_sendPayloadToEndpointIfNeeded:(id)a3
{
  id v5 = a3;
  if ([(PXVideoPlaybackReporter *)self isStateFinal])
  {
    [(PXVideoPlaybackReporter *)self startDate];

    [(PXVideoPlaybackReporter *)self endDate];
    v6 = [(PXVideoPlaybackReporter *)self endDate];
    v7 = [(PXVideoPlaybackReporter *)self startDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    v10 = [(PXVideoPlaybackReporter *)self assetCreationDate];
    v11 = [(PXVideoPlaybackReporter *)self startDate];
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12;

    int64_t v14 = [(PXVideoPlaybackReporter *)self priority];
    unint64_t v15 = [(PXVideoPlaybackReporter *)self state];
    if (v15 == 2)
    {
      uint64_t v16 = 1;
    }
    else if (v15 == 3)
    {
      uint64_t v16 = 2;
    }
    else
    {
      if (v15 < 2)
      {
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2 object:self file:@"PXVideoPlaybackReporter.m" lineNumber:185 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      uint64_t v16 = 0;
    }
    v18[0] = llround(v9 * 1000.0);
    v18[1] = llround(v13 * 1000.0);
    v18[2] = v14;
    v18[3] = v16;
    [v5 sendPayload:v18];
  }
}

- (BOOL)isStateFinal
{
  return [(PXVideoPlaybackReporter *)self state] == 3 || [(PXVideoPlaybackReporter *)self state] == 2;
}

- (void)_sendPayloadToEndpointsIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(PXVideoPlaybackReporter *)self isStateFinal])
  {
    os_unfair_lock_lock(&self->_endpointsLock);
    v3 = [(PXVideoPlaybackReporter *)self endpoints];
    id v4 = (void *)[v3 copy];

    os_unfair_lock_unlock(&self->_endpointsLock);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[PXVideoPlaybackReporter _sendPayloadToEndpointIfNeeded:](self, "_sendPayloadToEndpointIfNeeded:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)reportPlaybackAbandoned
{
  if ([(PXVideoPlaybackReporter *)self state] == 1)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [(PXVideoPlaybackReporter *)self setEndDate:v3];

    [(PXVideoPlaybackReporter *)self setState:3];
  }
}

- (void)reportPlaybackBegan
{
  if ([(PXVideoPlaybackReporter *)self state] == 1)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [(PXVideoPlaybackReporter *)self setEndDate:v3];

    [(PXVideoPlaybackReporter *)self setState:2];
  }
}

- (void)reportAVAssetCreated
{
  if ([(PXVideoPlaybackReporter *)self state] == 1)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [(PXVideoPlaybackReporter *)self setAssetCreationDate:v3];
  }
}

- (void)reportPlaybackRequestedWithPriority:(int64_t)a3
{
  if (![(PXVideoPlaybackReporter *)self state])
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [(PXVideoPlaybackReporter *)self setStartDate:v5];

    [(PXVideoPlaybackReporter *)self setPriority:a3];
    [(PXVideoPlaybackReporter *)self setState:1];
    id v6 = [(PXVideoPlaybackReporter *)self cpAnalyticsEndpoint];
    [v6 playbackRequested];
  }
}

- (void)setState:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3) {
    self->_state = a3;
  }
  [(PXVideoPlaybackReporter *)self _sendPayloadToEndpointsIfNeeded];
  id v4 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(PXVideoPlaybackReporter *)self identifier];
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "[VideoPlaybackReporting] %@: Video playback reporting state changed: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)addEndpoint:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(PXVideoPlaybackReporter *)self identifier];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "[VideoPlaybackReporting] %@: Adding video playback reporter endpoint: %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(PXVideoPlaybackReporter *)self identifier];
  [v4 setLoggingIdentifier:v7];

  os_unfair_lock_lock(&self->_endpointsLock);
  [(NSMutableArray *)self->_endpoints addObject:v4];
  os_unfair_lock_unlock(&self->_endpointsLock);
  [(PXVideoPlaybackReporter *)self _sendPayloadToEndpointIfNeeded:v4];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = [(PXVideoPlaybackReporter *)self identifier];
  int64_t v7 = [(PXVideoPlaybackReporter *)self state];
  if ((unint64_t)(v7 - 1) > 2) {
    int v8 = @"Unknown";
  }
  else {
    int v8 = off_1E5DD11C8[v7 - 1];
  }
  uint64_t v9 = (void *)[v3 initWithFormat:@"<%@ %p; %@; State: %@>", v5, self, v6, v8];

  return v9;
}

- (PXVideoPlaybackReporter)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVideoPlaybackReporter.m", 89, @"%s is not available as initializer", "-[PXVideoPlaybackReporter init]");

  abort();
}

- (PXVideoPlaybackReporter)initWithIdentifier:(id)a3 CPAnalysticsEndpoint:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXVideoPlaybackReporter;
  int64_t v7 = [(PXVideoPlaybackReporter *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    __int16 v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    endpoints = v7->_endpoints;
    v7->_endpoints = v10;

    v7->_endpointsLock._os_unfair_lock_opaque = 0;
    if (v4)
    {
      uint64_t v12 = objc_alloc_init(_PXVideoPlaybackCPAnalyticsEndpoint);
      cpAnalyticsEndpoint = v7->_cpAnalyticsEndpoint;
      v7->_cpAnalyticsEndpoint = v12;

      [(PXVideoPlaybackReporter *)v7 addEndpoint:v7->_cpAnalyticsEndpoint];
    }
  }

  return v7;
}

- (PXVideoPlaybackReporter)initWithIdentifier:(id)a3
{
  return [(PXVideoPlaybackReporter *)self initWithIdentifier:a3 CPAnalysticsEndpoint:0];
}

@end