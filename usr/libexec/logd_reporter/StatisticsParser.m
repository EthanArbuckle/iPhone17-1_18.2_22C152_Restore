@interface StatisticsParser
- (BOOL)feedJSONLine:(id)a3 error:(id *)a4;
- (NSArray)topEmitters;
- (NSArray)totalBytes;
- (NSDictionary)quarantinedClients;
- (NSDictionary)snapshotClients;
- (StatisticsParser)initWithUnixTimeBoundFrom:(int64_t)a3 to:(int64_t)a4;
- (int)validLineCount;
- (int64_t)newestEntryUnixTime;
- (int64_t)oldestEntryUnixTime;
- (void)_handleEmitter:(id)a3 inBook:(unsigned __int8)a4;
- (void)_handleQuarantineRecord:(id)a3;
- (void)_handleSnapshotRecord:(id)a3;
- (void)_handleStatisticsRecord:(id)a3;
@end

@implementation StatisticsParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quarantinedClients, 0);
  objc_storeStrong((id *)&self->_totalBytes, 0);
  objc_storeStrong((id *)&self->_topEmitters, 0);

  objc_storeStrong((id *)&self->_snapshotClients, 0);
}

- (NSDictionary)quarantinedClients
{
  return &self->_quarantinedClients->super;
}

- (NSArray)topEmitters
{
  return &self->_topEmitters->super;
}

- (NSDictionary)snapshotClients
{
  return &self->_snapshotClients->super;
}

- (NSArray)totalBytes
{
  return &self->_totalBytes->super;
}

- (int64_t)newestEntryUnixTime
{
  return self->_newestEntryUnixTime;
}

- (int64_t)oldestEntryUnixTime
{
  return self->_oldestEntryUnixTime;
}

- (int)validLineCount
{
  return self->_validLineCount;
}

- (void)_handleQuarantineRecord:(id)a3
{
  id v4 = a3;
  v5 = sub_100002B64(v4, @"client");
  v6 = v5;
  if (v5)
  {
    v7 = [v5 lastPathComponent];
    v8 = sub_100002B64(v4, @"file");
    if (v8)
    {
      v9 = sub_100002BE4(v4, @"timeCovered");
      if (v9)
      {
        v10 = sub_100002BE4(v4, @"sizeBytes");
        if (v10)
        {
          v11 = sub_100002BE4(v4, @"totalBytes");
          if (v11)
          {
            v12 = [(NSMutableDictionary *)self->_quarantinedClients objectForKeyedSubscript:v7];

            if (v12)
            {
              v17 = [(NSMutableDictionary *)self->_quarantinedClients objectForKeyedSubscript:v7];
              v13 = [v17 objectForKeyedSubscript:@"quarantineCount"];
              uint64_t v14 = [v13 intValue] + 1;
            }
            else
            {
              uint64_t v14 = 1;
            }
            v18[0] = @"quarantineCount";
            v15 = +[NSNumber numberWithInt:v14];
            v19[0] = v15;
            v19[1] = v8;
            v18[1] = @"fileName";
            v18[2] = @"bytes";
            v19[2] = v10;
            v19[3] = v11;
            v18[3] = @"totalBytes";
            v18[4] = @"timeCovered";
            v19[4] = v9;
            v16 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
            [(NSMutableDictionary *)self->_quarantinedClients setObject:v16 forKeyedSubscript:v7];
          }
        }
      }
    }
  }
}

- (void)_handleEmitter:(id)a3 inBook:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v25 = a3;
  v6 = sub_100002B64(v25, @"process");
  v7 = v6;
  if (v6)
  {
    v8 = [v6 lastPathComponent];
    v9 = sub_100002BE4(v25, @"sizeBytes");
    v10 = v9;
    if (v9)
    {
      v11 = (char *)[v9 unsignedLongValue];
      v12 = [(NSMutableArray *)self->_topEmitters objectAtIndexedSubscript:v4];
      v13 = [v12 objectForKeyedSubscript:v8];

      uint64_t v14 = v11;
      if (v13)
      {
        v15 = [(NSMutableArray *)self->_topEmitters objectAtIndexedSubscript:v4];
        v16 = [v15 objectForKeyedSubscript:v8];
        uint64_t v14 = &v11[(void)[v16 unsignedLongLongValue]];
      }
      v17 = [(NSMutableArray *)self->_topEmitters objectAtIndexedSubscript:4];
      v18 = [v17 objectForKeyedSubscript:v8];

      if (v18)
      {
        v19 = [(NSMutableArray *)self->_topEmitters objectAtIndexedSubscript:4];
        v20 = [v19 objectForKeyedSubscript:v8];
        v11 = &v11[(void)[v20 unsignedLongLongValue]];
      }
      v21 = +[NSNumber numberWithUnsignedLong:v14];
      v22 = [(NSMutableArray *)self->_topEmitters objectAtIndexedSubscript:v4];
      [v22 setObject:v21 forKeyedSubscript:v8];

      v23 = +[NSNumber numberWithUnsignedLong:v11];
      v24 = [(NSMutableArray *)self->_topEmitters objectAtIndexedSubscript:4];
      [v24 setObject:v23 forKeyedSubscript:v8];
    }
  }
}

- (void)_handleStatisticsRecord:(id)a3
{
  id v4 = a3;
  v5 = sub_100002B64(v4, @"type");
  v6 = v5;
  if (v5 && [v5 isEqualToString:@"File Rotate"])
  {
    v7 = sub_100002B64(v4, @"file");
    v8 = v7;
    if (!v7)
    {
LABEL_29:

      goto LABEL_30;
    }
    v9 = [v7 pathComponents];
    v10 = [v9 objectAtIndexedSubscript:0];

    id v11 = v10;
    v12 = (const char *)[v11 UTF8String];
    if (!strcmp(v12, "Persist"))
    {
      uint64_t v13 = 0;
    }
    else if (!strcmp(v12, "Special"))
    {
      uint64_t v13 = 1;
    }
    else if (!strcmp(v12, "Signpost"))
    {
      uint64_t v13 = 2;
    }
    else
    {
      if (strcmp(v12, "HighVolume"))
      {
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v13 = 3;
    }
    uint64_t v14 = sub_100002BE4(v4, @"totalBytes");
    if (v14)
    {
      v30 = v14;
      id v31 = v11;
      v15 = (char *)[v14 unsignedLongLongValue];
      v16 = [(NSMutableArray *)self->_totalBytes objectAtIndexedSubscript:v13];
      v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", &v15[(void)[v16 unsignedLongLongValue]]);
      [(NSMutableArray *)self->_totalBytes setObject:v17 atIndexedSubscript:v13];

      v18 = [(NSMutableArray *)self->_totalBytes objectAtIndexedSubscript:4];
      v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", &v15[(void)[v18 unsignedLongLongValue]]);
      [(NSMutableArray *)self->_totalBytes setObject:v19 atIndexedSubscript:4];

      v20 = [v4 objectForKeyedSubscript:@"processList"];
      if (v20
        && (objc_opt_class(),
            sub_100002C64(v20),
            v21 = objc_claimAutoreleasedReturnValue(),
            v21,
            v21))
      {
        v29 = v8;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v22 = v20;
        id v23 = [v22 countByEnumeratingWithState:&v33 objects:v32 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v34;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v34 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              objc_opt_class();
              v28 = sub_100002C64(v27);

              if (v28) {
                [(StatisticsParser *)self _handleEmitter:v27 inBook:v13];
              }
            }
            id v24 = [v22 countByEnumeratingWithState:&v33 objects:v32 count:16];
          }
          while (v24);
        }

        v8 = v29;
      }
      else
      {
      }
      uint64_t v14 = v30;
      id v11 = v31;
    }

    goto LABEL_28;
  }
LABEL_30:
}

- (void)_handleSnapshotRecord:(id)a3
{
  uint64_t v4 = sub_100002B64(a3, @"client");
  if (v4)
  {
    uint64_t v9 = v4;
    v5 = [(NSMutableDictionary *)self->_snapshotClients objectForKeyedSubscript:v4];

    if (v5)
    {
      v6 = [(NSMutableDictionary *)self->_snapshotClients objectForKeyedSubscript:v9];
      uint64_t v7 = [v6 intValue] + 1;
    }
    else
    {
      uint64_t v7 = 1;
    }
    v8 = +[NSNumber numberWithInt:v7];
    [(NSMutableDictionary *)self->_snapshotClients setObject:v8 forKeyedSubscript:v9];
  }

  _objc_release_x1();
}

- (BOOL)feedJSONLine:(id)a3 error:(id *)a4
{
  v6 = [a3 dataUsingEncoding:4];
  uint64_t v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:a4];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = sub_100002BE4(v7, @"unixTime");
    v10 = v9;
    if (!v9 || (signed int v11 = [v9 intValue], self->_lowerBound > v11) || self->_upperBound <= v11)
    {
LABEL_20:

      goto LABEL_21;
    }
    int validLineCount = self->_validLineCount;
    if (validLineCount)
    {
      if (self->_oldestEntryUnixTime > v11) {
        self->_oldestEntryUnixTime = v11;
      }
      p_newestEntryUnixTime = &self->_newestEntryUnixTime;
      if (self->_newestEntryUnixTime >= v11) {
        goto LABEL_12;
      }
    }
    else
    {
      self->_newestEntryUnixTime = v11;
      p_newestEntryUnixTime = &self->_oldestEntryUnixTime;
    }
    int64_t *p_newestEntryUnixTime = v11;
LABEL_12:
    self->_int validLineCount = validLineCount + 1;
    uint64_t v14 = sub_100002B64(v8, @"record");
    v15 = v14;
    if (v14)
    {
      if ([v14 isEqualToString:@"logd snapshot"])
      {
        [(StatisticsParser *)self _handleSnapshotRecord:v8];
      }
      else if ([v15 isEqualToString:@"logd statistics"])
      {
        [(StatisticsParser *)self _handleStatisticsRecord:v8];
      }
      else if ([v15 isEqualToString:@"logd quarantine"])
      {
        [(StatisticsParser *)self _handleQuarantineRecord:v8];
      }
    }

    goto LABEL_20;
  }
LABEL_21:

  return v8 != 0;
}

- (StatisticsParser)initWithUnixTimeBoundFrom:(int64_t)a3 to:(int64_t)a4
{
  v24.receiver = self;
  v24.super_class = (Class)StatisticsParser;
  v6 = [(StatisticsParser *)&v24 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_lowerBound = a3;
    v6->_upperBound = a4;
    uint64_t v8 = objc_opt_new();
    snapshotClients = v7->_snapshotClients;
    v7->_snapshotClients = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    v25[0] = v10;
    signed int v11 = objc_opt_new();
    v25[1] = v11;
    v12 = objc_opt_new();
    v25[2] = v12;
    uint64_t v13 = objc_opt_new();
    v25[3] = v13;
    uint64_t v14 = objc_opt_new();
    v25[4] = v14;
    v15 = +[NSArray arrayWithObjects:v25 count:5];
    v16 = (NSMutableArray *)[v15 mutableCopy];
    topEmitters = v7->_topEmitters;
    v7->_topEmitters = v16;

    uint64_t v18 = objc_opt_new();
    quarantinedClients = v7->_quarantinedClients;
    v7->_quarantinedClients = (NSMutableDictionary *)v18;

    v20 = (NSMutableArray *)[&off_100008AD8 mutableCopy];
    totalBytes = v7->_totalBytes;
    v7->_totalBytes = v20;

    v7->_int validLineCount = 0;
    v7->_oldestEntryUnixTime = 0;
    v7->_newestEntryUnixTime = 0;
    id v22 = v7;
  }

  return v7;
}

@end