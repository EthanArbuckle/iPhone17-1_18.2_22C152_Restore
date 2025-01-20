@interface NUVideoCorruptionInfo
- (NSArray)corruptedRanges;
- (NSString)trackMediaCharateristic;
- (NUVideoCorruptionInfo)initWithType:(unint64_t)a3;
- (NUVideoCorruptionInfo)initWithType:(unint64_t)a3 corruptedRanges:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)type;
- (void)setCorruptedRanges:(id)a3;
- (void)setTrackMediaCharateristic:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation NUVideoCorruptionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackMediaCharateristic, 0);

  objc_storeStrong((id *)&self->_corruptedRanges, 0);
}

- (void)setTrackMediaCharateristic:(id)a3
{
}

- (NSString)trackMediaCharateristic
{
  return self->_trackMediaCharateristic;
}

- (void)setCorruptedRanges:(id)a3
{
}

- (NSArray)corruptedRanges
{
  return self->_corruptedRanges;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)description
{
  switch([(NUVideoCorruptionInfo *)self type])
  {
    case 0uLL:
      v3 = @"Unknown";
      break;
    case 1uLL:
      v3 = @"DuplicatePTSInMainVideo";
      break;
    case 2uLL:
      v4 = NSString;
      v5 = [(NUVideoCorruptionInfo *)self trackMediaCharateristic];
      v3 = [v4 stringWithFormat:@"MissingAuxiliaryTrack (%@)", v5];

      break;
    case 3uLL:
      v3 = @"MalformedDeltaTrack";
      break;
    case 4uLL:
      v3 = @"MissingStyleMetadataTrack";
      break;
    case 5uLL:
      v3 = @"MalformedStyleMetadataTrack";
      break;
    default:
      v3 = 0;
      break;
  }
  v6 = [(NUVideoCorruptionInfo *)self corruptedRanges];
  v7 = PFMap();

  v8 = [NSString stringWithFormat:@"Issue: %@", v3];
  if (v7)
  {
    v9 = [v7 componentsJoinedByString:@","];
    uint64_t v10 = [v8 stringByAppendingFormat:@" time: %@", v9];

    v8 = (void *)v10;
  }

  return v8;
}

id __36__NUVideoCorruptionInfo_description__block_invoke(int a1, CFDictionaryRef dictionaryRepresentation)
{
  memset(&v7, 0, sizeof(v7));
  CMTimeRangeMakeFromDictionary(&v7, dictionaryRepresentation);
  CMTime time = v7.start;
  v2 = (__CFString *)CMTimeCopyDescription(0, &time);
  CMTime time = v7.duration;
  v3 = (__CFString *)CMTimeCopyDescription(0, &time);
  v4 = [NSString stringWithFormat:@"[%@x%@]", v2, v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(NUVideoCorruptionInfo);
  uint64_t v6 = [(NSArray *)self->_corruptedRanges copyWithZone:a3];
  corruptedRanges = v5->_corruptedRanges;
  v5->_corruptedRanges = (NSArray *)v6;

  v5->_type = self->_type;
  return v5;
}

- (NUVideoCorruptionInfo)initWithType:(unint64_t)a3 corruptedRanges:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    v12 = NUAssertLogger_13336();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "ranges != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_13336();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        __int16 v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCorruptionInfo initWithType:corruptedRanges:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 82, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"ranges != nil");
  }
  CMTimeRange v7 = v6;
  v8 = [(NUVideoCorruptionInfo *)self initWithType:a3];
  uint64_t v9 = [v7 copy];
  corruptedRanges = v8->_corruptedRanges;
  v8->_corruptedRanges = (NSArray *)v9;

  return v8;
}

- (NUVideoCorruptionInfo)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUVideoCorruptionInfo;
  result = [(NUVideoCorruptionInfo *)&v5 init];
  result->_type = a3;
  return result;
}

@end