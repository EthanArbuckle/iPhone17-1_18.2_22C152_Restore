@interface _BRCDownloadInfo
- (NSMutableDictionary)resumeUnitCounts;
- (_BRCDownloadInfo)init;
- (int64_t)previousCompletedUnitCount;
- (int64_t)previousTotalUnitCount;
- (void)copyProgressInfoToProgress:(id)a3 options:(char)a4;
- (void)setPreviousCompletedUnitCount:(int64_t)a3;
- (void)setPreviousTotalUnitCount:(int64_t)a3;
- (void)updateLocalizedDescriptionWithOptions:(char)a3;
@end

@implementation _BRCDownloadInfo

- (_BRCDownloadInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)_BRCDownloadInfo;
  v2 = [(_BRCTransferInfo *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(_BRCTransferInfo *)v2 progress];
    [v4 setUserInfoObject:*MEMORY[0x263F08478] forKey:*MEMORY[0x263F08480]];

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    resumeUnitCounts = v3->_resumeUnitCounts;
    v3->_resumeUnitCounts = v5;
  }
  return v3;
}

- (void)updateLocalizedDescriptionWithOptions:(char)a3
{
  v5 = @"GLOBAL_PROGRESS_DOWNLOADS_WAITING_DESCRIPTION";
  if ((a3 & 4) == 0) {
    v5 = @"GLOBAL_PROGRESS_DOWNLOADING_CAPITALIZE_DESCRIPTION";
  }
  v6 = (void *)MEMORY[0x263F086E0];
  v7 = v5;
  objc_super v8 = [v6 bundleForClass:objc_opt_class()];
  v9 = [(_BRCTransferInfo *)self progress];
  v10 = [v9 userInfo];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F08490]];
  uint64_t v19 = [v11 unsignedLongValue];
  v12 = _BRLocalizedStringWithFormat();

  v13 = [(_BRCTransferInfo *)self progress];
  [v13 setLocalizedDescription:v12];

  if ((a3 & 2) != 0)
  {
    v14 = [(_BRCTransferInfo *)self progress];
    [v14 completedUnitCount];

    v15 = [(_BRCTransferInfo *)self progress];
    [v15 totalUnitCount];

    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = BRLocalizedFileSizeDescription();
    BRLocalizedFileSizeDescription();
    v21 = v20 = v17;
    _BRLocalizedStringWithFormat();
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = &stru_26F3822F0;
  }
  v18 = [(_BRCTransferInfo *)self progress];
  [v18 setLocalizedAdditionalDescription:v22];
}

- (void)copyProgressInfoToProgress:(id)a3 options:(char)a4
{
  uint64_t v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)_BRCDownloadInfo;
  id v6 = a3;
  [(_BRCTransferInfo *)&v9 copyProgressInfoToProgress:v6 options:v4];
  v7 = [(BRCProgress *)self->super._progress localizedDescription];
  [v6 setLocalizedDescription:v7];

  objc_super v8 = [(BRCProgress *)self->super._progress localizedAdditionalDescription];
  [v6 setLocalizedAdditionalDescription:v8];
}

- (int64_t)previousCompletedUnitCount
{
  return self->previousCompletedUnitCount;
}

- (void)setPreviousCompletedUnitCount:(int64_t)a3
{
  self->previousCompletedUnitCount = a3;
}

- (int64_t)previousTotalUnitCount
{
  return self->previousTotalUnitCount;
}

- (void)setPreviousTotalUnitCount:(int64_t)a3
{
  self->previousTotalUnitCount = a3;
}

- (NSMutableDictionary)resumeUnitCounts
{
  return self->_resumeUnitCounts;
}

- (void).cxx_destruct
{
}

@end