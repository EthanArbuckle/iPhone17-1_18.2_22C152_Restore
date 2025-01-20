@interface FCForYouQueryResult
- (FCForYouQueryResult)init;
- (FCForYouQueryResult)initWithChannelDefaultSectionRequests:(id)a3 channelOtherSectionsRequests:(id)a4 topicRequests:(id)a5 paidBundleRequests:(id)a6 hiddenFeedRequests:(id)a7 sidecarRequests:(id)a8 feedContextByFeedID:(id)a9;
- (NSArray)allRequests;
- (NSArray)channelDefaultSectionRequests;
- (NSArray)channelOtherSectionsRequests;
- (NSArray)hiddenFeedRequests;
- (NSArray)paidBundleRequests;
- (NSArray)sidecarRequests;
- (NSArray)topicRequests;
- (NSDictionary)feedContextByFeedID;
@end

@implementation FCForYouQueryResult

- (FCForYouQueryResult)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCForYouQueryResult init]";
    __int16 v9 = 2080;
    v10 = "FCForYouQueryUtilities.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCForYouQueryResult init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCForYouQueryResult)initWithChannelDefaultSectionRequests:(id)a3 channelOtherSectionsRequests:(id)a4 topicRequests:(id)a5 paidBundleRequests:(id)a6 hiddenFeedRequests:(id)a7 sidecarRequests:(id)a8 feedContextByFeedID:(id)a9
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v38 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channelDefaultSectionRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    __int16 v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    __int16 v50 = 1024;
    int v51 = 37;
    __int16 v52 = 2114;
    v53 = v38;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v16) {
      goto LABEL_6;
    }
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v39 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channelOtherSectionsRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    __int16 v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    __int16 v50 = 1024;
    int v51 = 38;
    __int16 v52 = 2114;
    v53 = v39;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v40 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "topicRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    __int16 v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    __int16 v50 = 1024;
    int v51 = 39;
    __int16 v52 = 2114;
    v53 = v40;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18) {
      goto LABEL_11;
    }
  }
  else if (v18)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "paidBundleRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    __int16 v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    __int16 v50 = 1024;
    int v51 = 40;
    __int16 v52 = 2114;
    v53 = v41;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_11:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v42 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "hiddenFeedRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    __int16 v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    __int16 v50 = 1024;
    int v51 = 41;
    __int16 v52 = 2114;
    v53 = v42;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v20) {
      goto LABEL_16;
    }
  }
  else if (v20)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v43 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "sidecarRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    __int16 v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    __int16 v50 = 1024;
    int v51 = 42;
    __int16 v52 = 2114;
    v53 = v43;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_16:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v44 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "feedContextByFeedID");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    __int16 v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    __int16 v50 = 1024;
    int v51 = 43;
    __int16 v52 = 2114;
    v53 = v44;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v45.receiver = self;
  v45.super_class = (Class)FCForYouQueryResult;
  v22 = [(FCForYouQueryResult *)&v45 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    channelDefaultSectionRequests = v22->_channelDefaultSectionRequests;
    v22->_channelDefaultSectionRequests = (NSArray *)v23;

    uint64_t v25 = [v16 copy];
    channelOtherSectionsRequests = v22->_channelOtherSectionsRequests;
    v22->_channelOtherSectionsRequests = (NSArray *)v25;

    uint64_t v27 = [v17 copy];
    topicRequests = v22->_topicRequests;
    v22->_topicRequests = (NSArray *)v27;

    uint64_t v29 = [v18 copy];
    paidBundleRequests = v22->_paidBundleRequests;
    v22->_paidBundleRequests = (NSArray *)v29;

    uint64_t v31 = [v19 copy];
    hiddenFeedRequests = v22->_hiddenFeedRequests;
    v22->_hiddenFeedRequests = (NSArray *)v31;

    uint64_t v33 = [v20 copy];
    sidecarRequests = v22->_sidecarRequests;
    v22->_sidecarRequests = (NSArray *)v33;

    uint64_t v35 = [v21 copy];
    feedContextByFeedID = v22->_feedContextByFeedID;
    v22->_feedContextByFeedID = (NSDictionary *)v35;
  }
  return v22;
}

- (NSArray)allRequests
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v3 = [(FCForYouQueryResult *)self channelDefaultSectionRequests];
  v12[0] = v3;
  uint64_t v4 = [(FCForYouQueryResult *)self channelOtherSectionsRequests];
  v12[1] = v4;
  v5 = [(FCForYouQueryResult *)self topicRequests];
  v12[2] = v5;
  id v6 = [(FCForYouQueryResult *)self paidBundleRequests];
  v12[3] = v6;
  v7 = [(FCForYouQueryResult *)self hiddenFeedRequests];
  v12[4] = v7;
  v8 = [(FCForYouQueryResult *)self sidecarRequests];
  v12[5] = v8;
  __int16 v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:6];
  v10 = objc_msgSend(v9, "fc_arrayByFlattening");

  return (NSArray *)v10;
}

- (NSArray)channelDefaultSectionRequests
{
  return self->_channelDefaultSectionRequests;
}

- (NSArray)channelOtherSectionsRequests
{
  return self->_channelOtherSectionsRequests;
}

- (NSArray)topicRequests
{
  return self->_topicRequests;
}

- (NSArray)paidBundleRequests
{
  return self->_paidBundleRequests;
}

- (NSArray)hiddenFeedRequests
{
  return self->_hiddenFeedRequests;
}

- (NSArray)sidecarRequests
{
  return self->_sidecarRequests;
}

- (NSDictionary)feedContextByFeedID
{
  return self->_feedContextByFeedID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedContextByFeedID, 0);
  objc_storeStrong((id *)&self->_sidecarRequests, 0);
  objc_storeStrong((id *)&self->_hiddenFeedRequests, 0);
  objc_storeStrong((id *)&self->_paidBundleRequests, 0);
  objc_storeStrong((id *)&self->_topicRequests, 0);
  objc_storeStrong((id *)&self->_channelOtherSectionsRequests, 0);
  objc_storeStrong((id *)&self->_channelDefaultSectionRequests, 0);
}

@end