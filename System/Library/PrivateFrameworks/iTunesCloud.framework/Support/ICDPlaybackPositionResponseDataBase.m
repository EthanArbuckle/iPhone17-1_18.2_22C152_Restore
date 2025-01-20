@interface ICDPlaybackPositionResponseDataBase
- (ICDPlaybackPositionResponseDataBase)initWithDomain:(id)a3;
- (id)dataByInflatingWithNoZipHeader:(id)a3;
- (id)description;
- (id)metadataWithItemIdentifier:(id)a3 keyValueStorePayload:(id)a4 failuresOkay:(BOOL)a5;
@end

@implementation ICDPlaybackPositionResponseDataBase

- (void).cxx_destruct
{
}

- (id)metadataWithItemIdentifier:(id)a3 keyValueStorePayload:(id)a4 failuresOkay:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v10)
  {
    id v34 = 0;
    v11 = +[NSPropertyListSerialization propertyListWithData:v10 options:1 format:0 error:&v34];
    id v12 = v34;
    if (v12)
    {
      v13 = v12;
      v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        __int16 v37 = 2114;
        id v38 = v13;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@ metadataWithItemIdentifier - error deserializing data. error=%{public}@,", buf, 0x16u);
      }
    }
    if (v11)
    {
      id v32 = 0;
    }
    else
    {
      id v33 = 0;
      v5 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v10 error:&v33];
      id v32 = v33;
      [v5 setDecodingFailurePolicy:0];
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
      v11 = [v5 decodeObjectOfClasses:v18 forKey:NSKeyedArchiveRootObjectKey];

      [v5 finishDecoding];
      if (!v11)
      {
        if (!a5)
        {
          v29 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v36 = self;
            __int16 v37 = 2112;
            id v38 = v9;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@ metadataWithItemIdentifier - encountered invalid data while unarchiving payload for itemIdentifier: %@", buf, 0x16u);
          }
          v11 = 0;
          id v14 = 0;
          goto LABEL_37;
        }
        v11 = 0;
LABEL_33:
        id v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_33;
    }
    v19 = [v11 objectForKey:@"pver"];
    if (!v19
      || ([v11 objectForKey:@"pver"],
          v5 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      v22 = [v11 objectForKey:@"pver"];
      id v21 = [v22 integerValue];

      if (!v19) {
        goto LABEL_18;
      }
    }
    else
    {
      v20 = [v11 objectForKey:@"pver"];
      id v21 = [v20 integerValue];
    }
LABEL_18:

    if (!v21)
    {
      id v14 = [objc_alloc((Class)ICPlaybackPositionEntity) initWithDomain:self->_domain];
      [v14 setPlaybackPositionKey:v9];
      v23 = [v11 objectForKey:@"bktm"];
      if (_NSIsNSNumber())
      {
        v24 = [v11 objectForKey:@"bktm"];
        [v14 setBookmarkTime:v24];
      }
      else
      {
        [v14 setBookmarkTime:0];
      }

      v25 = [v11 objectForKey:@"hbpl"];
      if (_NSIsNSNumber())
      {
        v26 = [v11 objectForKey:@"hbpl"];
        [v14 setHasBeenPlayed:v26];
      }
      else
      {
        [v14 setHasBeenPlayed:0];
      }

      v27 = [v11 objectForKey:@"plct"];
      if (_NSIsNSNumber())
      {
        v28 = [v11 objectForKey:@"plct"];
        [v14 setUserPlayCount:v28];
      }
      else
      {
        [v14 setUserPlayCount:0];
      }

      v29 = [v11 objectForKey:@"tstm"];
      if (_NSIsNSNumber())
      {
        v30 = [v11 objectForKey:@"tstm"];
        [v14 setBookmarkTimestamp:v30];
      }
      else
      {
        [v14 setBookmarkTimestamp:0];
      }
LABEL_37:

      goto LABEL_38;
    }
    goto LABEL_33;
  }
  v11 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v36 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@ metadataWithItemIdentifier - keyValueStorePayload=nil", buf, 0xCu);
  }
  id v14 = 0;
LABEL_39:

  return v14;
}

- (id)dataByInflatingWithNoZipHeader:(id)a3
{
  uint64_t v3 = __chkstk_darwin(self, a2, a3);
  id v5 = v4;
  if ((unint64_t)[v5 length] >> 32)
  {
    v6 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v3;
      __int16 v17 = 2048;
      double v18 = (double)(unint64_t)[v5 length] / 1000000000.0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@ ERROR: unable to zip large data of size ~%.3f GB", buf, 0x16u);
    }

    id v7 = 0;
  }
  else
  {
    memset(&v14.avail_in, 0, 104);
    v14.avail_in = [v5 length];
    id v8 = v5;
    v14.next_in = (Bytef *)[v8 bytes];
    if (inflateInit2_(&v14, -15, "1.2.12", 112))
    {
LABEL_16:
      id v12 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = v3;
        __int16 v17 = 2114;
        double v18 = *(double *)&v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}@ could not unzip. returning inputdata: %{public}@", buf, 0x16u);
      }

      id v7 = v8;
    }
    else
    {
      id v7 = objc_alloc_init((Class)NSMutableData);
      do
      {
        v14.avail_out = 0x4000;
        v14.next_out = buf;
        unsigned int v9 = inflate(&v14, 0);
        if (v9 > 1)
        {
          inflateEnd(&v14);

          goto LABEL_16;
        }
        unsigned int v10 = v9;
        if (v14.avail_out != 0x4000) {
          [v7 appendBytes:buf length:0x4000 - v14.avail_out];
        }
      }
      while (!v10);
      inflateEnd(&v14);
      if (!v7) {
        goto LABEL_16;
      }
      v11 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = v3;
        __int16 v17 = 2114;
        double v18 = *(double *)&v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@ successfully unzipped. outputData=%{public}@", buf, 0x16u);
      }
    }
  }

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (ICDPlaybackPositionResponseDataBase)initWithDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDPlaybackPositionResponseDataBase;
  v6 = [(ICDPlaybackPositionResponseDataBase *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_domain, a3);
  }

  return v7;
}

@end