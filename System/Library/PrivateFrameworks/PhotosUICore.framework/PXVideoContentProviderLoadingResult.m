@interface PXVideoContentProviderLoadingResult
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- (AVPlayerItem)playerItem;
- (NSError)error;
- (NSString)resultDebugDescription;
- (NSURL)url;
- (PFSlowMotionTimeRangeMapper)timeRangeMapper;
- (PXVideoContentProviderLoadingResult)initWithPlayerItem:(id)a3 url:(id)a4 timeRange:(id *)a5 timeRangeMapper:(id)a6 error:(id)a7 priority:(int64_t)a8 description:(id)a9;
- (id)description;
- (int64_t)priority;
@end

@implementation PXVideoContentProviderLoadingResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRangeMapper, 0);
  objc_storeStrong((id *)&self->_resultDebugDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
}

- (PFSlowMotionTimeRangeMapper)timeRangeMapper
{
  return self->_timeRangeMapper;
}

- (NSString)resultDebugDescription
{
  return self->_resultDebugDescription;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSError)error
{
  return self->_error;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  long long v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var3;
  return self;
}

- (NSURL)url
{
  return self->_url;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (id)description
{
  long long v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PXVideoContentProviderLoadingResult;
  v4 = [(PXVideoContentProviderLoadingResult *)&v12 description];
  [(PXVideoContentProviderLoadingResult *)self timeRange];
  v5 = PXCMTimeRangeDescription((uint64_t)v11);
  v6 = [(PXVideoContentProviderLoadingResult *)self playerItem];
  v7 = [(PXVideoContentProviderLoadingResult *)self url];
  v8 = [(PXVideoContentProviderLoadingResult *)self error];
  v9 = [v3 stringWithFormat:@"%@, TimeRange: %@, PlayerItem: %@, URL: %@, Error: %@, Priority: %ld", v4, v5, v6, v7, v8, -[PXVideoContentProviderLoadingResult priority](self, "priority")];

  return v9;
}

- (PXVideoContentProviderLoadingResult)initWithPlayerItem:(id)a3 url:(id)a4 timeRange:(id *)a5 timeRangeMapper:(id)a6 error:(id)a7 priority:(int64_t)a8 description:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v28 = a6;
  id v17 = a7;
  id v18 = a9;
  v29.receiver = self;
  v29.super_class = (Class)PXVideoContentProviderLoadingResult;
  v19 = [(PXVideoContentProviderLoadingResult *)&v29 init];
  if (v19)
  {
    if (!v15 && !v16 && !v17)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v19, @"PXVideoContentProvider.m", 85, @"Invalid parameter not satisfying: %@", @"playerItem || url || error" object file lineNumber description];
    }
    objc_storeStrong((id *)v19 + 1, a3);
    objc_storeStrong((id *)v19 + 2, a4);
    long long v20 = *(_OWORD *)&a5->var0.var0;
    long long v21 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)(v19 + 88) = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)(v19 + 72) = v21;
    *(_OWORD *)(v19 + 56) = v20;
    objc_storeStrong((id *)v19 + 3, a7);
    *((void *)v19 + 4) = a8;
    uint64_t v22 = [v18 copy];
    v23 = (void *)*((void *)v19 + 5);
    *((void *)v19 + 5) = v22;

    objc_storeStrong((id *)v19 + 6, a6);
  }

  return (PXVideoContentProviderLoadingResult *)v19;
}

@end