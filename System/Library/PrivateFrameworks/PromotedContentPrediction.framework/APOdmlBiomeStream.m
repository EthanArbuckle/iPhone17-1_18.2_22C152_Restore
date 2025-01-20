@interface APOdmlBiomeStream
- (APOdmlBiomeStream)initWithName:(id)a3;
- (BMStoreConfig)config;
- (BMStoreStream)stream;
- (BOOL)reverse;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)maxEvents;
- (NSString)streamName;
- (id)_applicationSupportDirectory;
- (id)publisher;
- (void)enumerateEvents:(id)a3;
- (void)enumerateEvents:(id)a3 result:(id)a4;
- (void)enumerateEventsWithDictionary:(id)a3;
- (void)filterEvents:(id)a3 result:(id)a4;
- (void)filterEventsWithDictionary:(id)a3 result:(id)a4;
- (void)removeAllEvents;
- (void)removeEvents:(id)a3;
- (void)removeEventsWithDictionary:(id)a3;
- (void)setConfig:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setMaxEvents:(id)a3;
- (void)setReverse:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStream:(id)a3;
- (void)setStreamName:(id)a3;
- (void)writeEvent:(id)a3;
@end

@implementation APOdmlBiomeStream

- (APOdmlBiomeStream)initWithName:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)APOdmlBiomeStream;
  v6 = [(APOdmlBiomeStream *)&v27 init];
  v9 = v6;
  if (v6)
  {
    v10 = objc_msgSend__applicationSupportDirectory(v6, v7, v8);
    v12 = objc_msgSend_stringByAppendingPathComponent_(v10, v11, @"odml_biome");

    uint64_t v14 = objc_msgSend_newPrivateStreamDefaultConfigurationWithStoreBasePath_(MEMORY[0x1E4F50278], v13, (uint64_t)v12);
    config = v9->_config;
    v9->_config = (BMStoreConfig *)v14;

    objc_storeStrong((id *)&v9->_streamName, a3);
    id v16 = objc_alloc(MEMORY[0x1E4F50490]);
    v19 = objc_msgSend_streamName(v9, v17, v18);
    v22 = objc_msgSend_config(v9, v20, v21);
    uint64_t v24 = objc_msgSend_initWithPrivateStreamIdentifier_storeConfig_(v16, v23, (uint64_t)v19, v22);
    stream = v9->_stream;
    v9->_stream = (BMStoreStream *)v24;
  }
  return v9;
}

- (void)enumerateEventsWithDictionary:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1BBC4D604;
  v7[3] = &unk_1E624A6A0;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_enumerateEvents_(self, v6, (uint64_t)v7);
}

- (void)filterEventsWithDictionary:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1BBC4D76C;
  v13[3] = &unk_1E624A6C8;
  id v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1BBC4D7BC;
  v11[3] = &unk_1E624A6A0;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend_filterEvents_result_(self, v10, (uint64_t)v13, v11);
}

- (void)enumerateEvents:(id)a3
{
  id v4 = a3;
  objc_msgSend_publisher(self, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateEvents_result_(self, v7, (uint64_t)v8, v4);
}

- (void)filterEvents:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_publisher(self, v8, v9);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1BBC4D974;
  v15[3] = &unk_1E624A6F0;
  id v16 = v6;
  id v11 = v6;
  v13 = objc_msgSend_filterWithIsIncluded_(v10, v12, (uint64_t)v15);

  objc_msgSend_enumerateEvents_result_(self, v14, (uint64_t)v13, v7);
}

- (void)removeAllEvents
{
}

- (void)removeEventsWithDictionary:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1BBC4DA6C;
  v7[3] = &unk_1E624A738;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_removeEvents_(self, v6, (uint64_t)v7);
}

- (void)removeEvents:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_stream(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1BBC4DB78;
  v10[3] = &unk_1E624A760;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_pruneWithPredicateBlock_(v7, v9, (uint64_t)v10);
}

- (void)writeEvent:(id)a3
{
  id v4 = a3;
  objc_msgSend_stream(self, v5, v6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_source(v11, v7, v8);
  objc_msgSend_sendEvent_(v9, v10, (uint64_t)v4);
}

- (void)enumerateEvents:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1BBC4DD7C;
  v14[3] = &unk_1E624A788;
  v14[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1BBC4DEE8;
  v11[3] = &unk_1E624A7B0;
  id v8 = v7;
  id v12 = v8;
  v13 = v15;
  id v10 = (id)objc_msgSend_sinkWithCompletion_shouldContinue_(v6, v9, (uint64_t)v14, v11);

  _Block_object_dispose(v15, 8);
}

- (id)publisher
{
  id v6 = objc_msgSend_startDate(self, a2, v2);
  if (v6)
  {
    id v7 = NSNumber;
    id v8 = objc_msgSend_startDate(self, v4, v5);
    objc_msgSend_timeIntervalSinceReferenceDate(v8, v9, v10);
    v13 = objc_msgSend_numberWithDouble_(v7, v11, v12);
  }
  else
  {
    v13 = 0;
  }

  uint64_t v18 = objc_msgSend_endDate(self, v14, v15);
  if (v18)
  {
    v19 = NSNumber;
    v20 = objc_msgSend_endDate(self, v16, v17);
    objc_msgSend_timeIntervalSinceReferenceDate(v20, v21, v22);
    v25 = objc_msgSend_numberWithDouble_(v19, v23, v24);
  }
  else
  {
    v25 = 0;
  }

  v28 = objc_msgSend_stream(self, v26, v27);
  v31 = objc_msgSend_maxEvents(self, v29, v30);
  uint64_t v34 = objc_msgSend_reverse(self, v32, v33);
  v36 = objc_msgSend_publisherWithStartTime_endTime_maxEvents_lastN_reversed_(v28, v35, (uint64_t)v13, v25, v31, 0, v34);

  return v36;
}

- (id)_applicationSupportDirectory
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], a2, v2);
  id v4 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  id v7 = objc_msgSend_lastObject(v4, v5, v6);

  uint64_t v9 = objc_msgSend_stringByAppendingPathComponent_(v7, v8, @"com.apple.ap.promotedcontentd");
  id v27 = 0;
  char v11 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v3, v10, (uint64_t)v9, 1, 0, &v27);
  id v12 = v27;
  if (v11)
  {
    id v13 = v9;
  }
  else
  {
    id v14 = OdmlLogForCategory(0xCuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      id v16 = v15;
      uint64_t v19 = objc_msgSend_code(v12, v17, v18);
      uint64_t v22 = objc_msgSend_localizedFailureReason(v12, v20, v21);
      v25 = objc_msgSend_userInfo(v12, v23, v24);
      *(_DWORD *)buf = 138478851;
      v29 = v15;
      __int16 v30 = 2048;
      uint64_t v31 = v19;
      __int16 v32 = 2113;
      uint64_t v33 = v9;
      __int16 v34 = 2113;
      v35 = v22;
      __int16 v36 = 2113;
      v37 = v25;
      _os_log_impl(&dword_1BBC44000, v14, OS_LOG_TYPE_ERROR, "[%{private}@] Error %ld creating 'Application Support' subdirectory '%{private}@': %{private}@ %{private}@", buf, 0x34u);
    }
    id v13 = 0;
  }

  return v13;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSNumber)maxEvents
{
  return self->_maxEvents;
}

- (void)setMaxEvents:(id)a3
{
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (BMStoreConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (BMStoreStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_maxEvents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_streamName, 0);
}

@end