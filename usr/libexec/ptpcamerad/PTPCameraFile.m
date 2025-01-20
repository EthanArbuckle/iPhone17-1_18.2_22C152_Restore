@interface PTPCameraFile
- (BOOL)hasThumbnail;
- (BOOL)imageIOSupported;
- (BOOL)isAppleDevice;
- (BOOL)previewThumbnail;
- (BOOL)processMetadata:(id)a3;
- (BOOL)raw;
- (BOOL)rawImageSupported;
- (BOOL)smallThumbnail;
- (BOOL)updatedBasicMetadata;
- (BOOL)updatedExpensiveMetadata;
- (CGImage)copyThumbnailForPixelWidth:(unsigned int)a3;
- (NSMutableDictionary)cachedMetadata;
- (NSMutableDictionary)subImages;
- (NSString)UTI;
- (PTPCameraFile)initWithStorageID:(unsigned int)a3 ptpObjectInfo:(id)a4 objHandle:(unsigned int)a5 parent:(id)a6 initiator:(id)a7;
- (id)altThumbnaillForMaxPixelSize:(unsigned int)a3;
- (id)fingerprintWithError:(id *)a3;
- (id)imageValidateSubImage:(id)a3 error:(id *)a4;
- (id)mediaItemType;
- (id)subImageDictForPixelWidth:(id)a3;
- (id)thumbnailForPixelWidth:(unsigned int)a3;
- (int)bitsPerPixel;
- (int)imageHeight;
- (int)imageOrientation;
- (int)imageWidth;
- (int)thmHeight;
- (int)thmOffset;
- (int)thmSize;
- (int)thmWidth;
- (int64_t)compare:(id)a3 against:(id)a4 withContext:(void *)a5;
- (int64_t)dpOffset;
- (int64_t)skipBytes:(int64_t)a3;
- (unint64_t)readStream:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5;
- (void)addSubImageDict:(id)a3;
- (void)fetchBasicMetadata;
- (void)fetchFullMetadata;
- (void)imageInspectMetadata;
- (void)imageScrapeAllocatedData:(char *)a3 length:(unint64_t)a4 bufferOffset:(unint64_t)a5;
- (void)metadataWithOptions:(id)a3 reply:(id)a4;
- (void)releaseProvider;
- (void)rewind;
- (void)setBitsPerPixel:(int)a3;
- (void)setDpOffset:(int64_t)a3;
- (void)setHasThumbnail:(BOOL)a3;
- (void)setImageHeight:(int)a3;
- (void)setImageOrientation:(int)a3;
- (void)setImageWidth:(int)a3;
- (void)setPreviewThumbnail:(BOOL)a3;
- (void)setRaw:(BOOL)a3;
- (void)setSizeAndOrientationFromImageProperties:(id)a3;
- (void)setSmallThumbnail:(BOOL)a3;
- (void)setSubImages:(id)a3;
- (void)setThmHeight:(int)a3;
- (void)setThmOffset:(int)a3;
- (void)setThmSize:(int)a3;
- (void)setThmWidth:(int)a3;
- (void)setUTI:(id)a3;
- (void)setUpdatedBasicMetadata:(BOOL)a3;
- (void)setUpdatedExpensiveMetadata:(BOOL)a3;
- (void)thumbnailDataWithOptions:(id)a3 reply:(id)a4;
@end

@implementation PTPCameraFile

- (id)mediaItemType
{
  return @"file";
}

- (BOOL)isAppleDevice
{
  v2 = [(PTPCameraItem *)self initiator];
  BOOL v3 = [v2 deviceVendorID] == 1452;

  return v3;
}

- (int64_t)skipBytes:(int64_t)a3
{
  v5 = (char *)[(PTPCameraFile *)self dpOffset] + a3;
  if (v5 <= (char *)[(PTPCameraItem *)self size]) {
    v6 = (char *)[(PTPCameraFile *)self dpOffset] + a3;
  }
  else {
    v6 = [(PTPCameraItem *)self size];
  }
  [(PTPCameraFile *)self setDpOffset:v6];

  return [(PTPCameraFile *)self dpOffset];
}

- (void)rewind
{
}

- (void)releaseProvider
{
}

- (unint64_t)readStream:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  v9 = [(PTPCameraItem *)self initiator];
  unint64_t v25 = 0;
  unint64_t v10 = a5;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v10 = [(PTPCameraFile *)self dpOffset];
  }
  if (v10 + a4 > [(PTPCameraItem *)self size]) {
    a4 = [(PTPCameraItem *)self size] - v10;
  }
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  dword_10006350C = 0;
  *(float *)&dword_10006350C = (float)mach_absolute_time();
  id v11 = [v9 partialDataFromFile:self fromOffset:v10 maxSize:a4 actualSize:&v25 useBuffer:a3];
  unint64_t v12 = v25;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL && v25) {
    [(PTPCameraFile *)self setDpOffset:v25 + v10];
  }
  float v13 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10006350C) * (float)info.numer)
              / (float)info.denom)
      / 1000000.0;
  __ICOSLogCreate();
  v14 = @"readStream";
  if ((unint64_t)[@"readStream" length] >= 0x15)
  {
    v15 = [@"readStream" substringWithRange:0, 18];
    v14 = [v15 stringByAppendingString:@".."];
  }
  if (v13 <= 300.0) {
    CFStringRef v16 = @"{𝚫}";
  }
  else {
    CFStringRef v16 = @"{⊗}";
  }
  v17 = +[NSString stringWithFormat:@"(requested):%lu @ (offset):%llu (bytes read):%u", a4, v10, v12];
  v18 = +[NSString stringWithFormat:@"%@:[%5.0f ms]:%@", v16, v13, v17];

  v19 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v14;
    v21 = v19;
    id v22 = [(__CFString *)v20 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v27 = v22;
    __int16 v28 = 2114;
    v29 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  dword_100063508 = LODWORD(v13);

  return v12;
}

- (PTPCameraFile)initWithStorageID:(unsigned int)a3 ptpObjectInfo:(id)a4 objHandle:(unsigned int)a5 parent:(id)a6 initiator:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a7;
  v31.receiver = self;
  v31.super_class = (Class)PTPCameraFile;
  v14 = [(PTPCameraItem *)&v31 initWithStorageID:v10 objHandle:v9 parent:a6 initiator:v13];
  v15 = v14;
  if (!v14) {
    goto LABEL_18;
  }
  [(PTPCameraItem *)v14 setInfo:v12];
  CFStringRef v16 = [(PTPCameraItem *)v15 name];
  v17 = [v16 pathExtension];
  v18 = [v17 lowercaseString];

  if (v18)
  {
    v19 = +[PTPCameraItem UTTypeWithFilenameExtension:v18];
  }
  else
  {
    v19 = 0;
  }
  if (![(PTPCameraFile *)v15 rawImageSupported]
    && ![(PTPCameraFile *)v15 imageIOSupported])
  {
    if (!v19) {
      goto LABEL_21;
    }
    if ([v19 conformsToType:UTTypeMovie])
    {
      v20 = UTTypeMovie;
      goto LABEL_8;
    }
    if ([v19 conformsToType:UTTypeAudio]) {
      id v27 = UTTypeAudio;
    }
    else {
LABEL_21:
    }
      id v27 = UTTypeData;
    __int16 v28 = [(UTType *)v27 identifier];
    [(PTPCameraFile *)v15 setUTI:v28];

    goto LABEL_9;
  }
  v20 = UTTypeImage;
LABEL_8:
  v21 = [(UTType *)v20 identifier];
  [(PTPCameraFile *)v15 setUTI:v21];

  [(PTPCameraFile *)v15 setHasThumbnail:1];
LABEL_9:
  id v22 = +[NSMutableDictionary dictionary];
  [(PTPCameraFile *)v15 setSubImages:v22];

  if (![(PTPCameraFile *)v15 isAppleDevice])
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000227F0;
    v29[3] = &unk_10004CA38;
    v30 = v15;
    v23 = objc_retainBlock(v29);
    if ([v13 prioritizeSpeed])
    {
      v24 = [v13 delegate];
      unint64_t v25 = +[NSBlockOperation blockOperationWithBlock:v23];
      [v24 addInitiatedOperation:v25];
    }
    else
    {
      ((void (*)(void *))v23[2])(v23);
    }
  }
LABEL_18:

  return v15;
}

- (void)fetchBasicMetadata
{
  if (![(PTPCameraFile *)self updatedBasicMetadata]
    && ![(PTPCameraFile *)self isAppleDevice])
  {
    BOOL v3 = [(PTPCameraItem *)self initiator];
    v4 = [(PTPCameraItem *)self info];
    v5 = [v3 deviceInfo];
    v6 = [(PTPCameraFile *)self UTI];
    v7 = [UTTypeImage identifier];
    unsigned int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      if (v4
        && v5
        && ([v5 operationsSupported],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            +[NSNumber numberWithUnsignedShort:4123],
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            unsigned int v11 = [v9 containsObject:v10],
            v10,
            v9,
            v11))
      {
        if ([(PTPCameraItem *)self size] <= 0x80000) {
          uint64_t v12 = [(PTPCameraItem *)self size];
        }
        else {
          uint64_t v12 = 0x80000;
        }
        unsigned int v20 = [(PTPCameraFile *)self rawImageSupported];
        uint64_t v21 = v12 + 12;
        if (v12 < -12) {
          uint64_t v21 = v12 + 16395;
        }
        size_t v22 = (v21 & 0xFFFFFFFFFFFFC000) + 0x4000;
        if (v20)
        {
          mach_timebase_info info = 0;
          mach_timebase_info(&info);
          float v23 = (float)mach_absolute_time();
          v24 = +[NSMutableDictionary dictionary];
          unint64_t v25 = (char *)malloc_type_malloc(v22, 0x94EBF00BuLL);
          v26 = CGDataProviderCreateWithData(0, v25 + 12, [(PTPCameraFile *)self readStream:v25 size:v12 offset:0], 0);
          if (v26)
          {
            id v27 = v26;
            __int16 v28 = CGImageSourceCreateWithDataProvider(v26, 0);
            CFDictionaryRef v29 = CGImageSourceCopyProperties(v28, 0);
            CFDictionaryRef v30 = v29;
            if (v29)
            {
              v93 = v28;
              objc_super v31 = [(__CFDictionary *)v29 objectForKeyedSubscript:@"{raw}"];
              v92 = [v31 objectForKeyedSubscript:@"Thumbnails"];

              v32 = [(__CFDictionary *)v30 objectForKeyedSubscript:@"{raw}"];
              v95 = [v32 objectForKeyedSubscript:@"CropSize"];

              v33 = [(__CFDictionary *)v30 objectForKeyedSubscript:@"{raw}"];
              v94 = [v33 objectForKeyedSubscript:@"Orientation"];

              if (![(PTPCameraFile *)self imageWidth]
                && ![(PTPCameraFile *)self imageWidth]
                && v95)
              {
                v34 = [v95 objectForKeyedSubscript:@"Height"];
                -[PTPCameraFile setImageHeight:](self, "setImageHeight:", [v34 intValue]);

                [v95 objectForKeyedSubscript:@"Width"];
                CFDictionaryRef v35 = v30;
                v37 = v36 = v24;
                -[PTPCameraFile setImageWidth:](self, "setImageWidth:", [v37 intValue]);

                v24 = v36;
                CFDictionaryRef v30 = v35;
                v38 = [v95 objectForKeyedSubscript:@"Width"];
                [v24 setObject:v38 forKeyedSubscript:@"PixelWidth"];

                v39 = [v95 objectForKeyedSubscript:@"Height"];
                [v24 setObject:v39 forKeyedSubscript:@"PixelHeight"];
              }
              v40 = v92;
              __int16 v28 = v93;
              if (![(PTPCameraFile *)self imageOrientation])
              {
                v91 = v24;
                if (v94)
                {
                  -[PTPCameraFile setImageOrientation:](self, "setImageOrientation:", [v94 intValue]);
                  [v24 setObject:v94 forKeyedSubscript:@"Orientation"];
                }
                else if (v92)
                {
                  CFDictionaryRef v89 = v30;
                  v90 = v27;
                  long long v100 = 0u;
                  long long v101 = 0u;
                  long long v98 = 0u;
                  long long v99 = 0u;
                  id obja = v92;
                  id v63 = [obja countByEnumeratingWithState:&v98 objects:v110 count:16];
                  if (v63)
                  {
                    id v64 = v63;
                    uint64_t v65 = *(void *)v99;
                    while (2)
                    {
                      for (i = 0; i != v64; i = (char *)i + 1)
                      {
                        if (*(void *)v99 != v65) {
                          objc_enumerationMutation(obja);
                        }
                        v67 = *(void **)(*((void *)&v98 + 1) + 8 * i);
                        if (![(PTPCameraFile *)self imageOrientation])
                        {
                          v68 = [v67 objectForKeyedSubscript:@"Orientation"];

                          if (v68)
                          {
                            v69 = [v67 objectForKeyedSubscript:@"Orientation"];
                            -[PTPCameraFile setImageOrientation:](self, "setImageOrientation:", [v69 intValue]);

                            v70 = [v67 objectForKeyedSubscript:@"Orientation"];
                            v24 = v91;
                            [v91 setObject:v70 forKeyedSubscript:kCGImagePropertyTIFFOrientation];

                            goto LABEL_56;
                          }
                        }
                      }
                      id v64 = [obja countByEnumeratingWithState:&v98 objects:v110 count:16];
                      if (v64) {
                        continue;
                      }
                      break;
                    }
                  }

                  v24 = v91;
LABEL_56:
                  CFDictionaryRef v30 = v89;
                  id v27 = v90;
                  v40 = v92;
                  __int16 v28 = v93;
                }
              }
              [(PTPCameraFile *)self setSizeAndOrientationFromImageProperties:v24];
            }
            if (v28) {
              CFRelease(v28);
            }
            CFRelease(v27);
          }
          free(v25);
          float v71 = (float)((float)((float)((float)mach_absolute_time() - v23) * (float)info.numer) / (float)info.denom)
              / 1000000.0;
          __ICOSLogCreate();
          v72 = [(PTPCameraItem *)self name];
          if ((unint64_t)[v72 length] >= 0x15)
          {
            v73 = [v72 substringWithRange:0, 18];
            uint64_t v74 = [v73 stringByAppendingString:@".."];

            v72 = (void *)v74;
          }
          if (v71 <= 300.0) {
            CFStringRef v75 = @"{𝚫}";
          }
          else {
            CFStringRef v75 = @"{⊗}";
          }
          v76 = +[NSString stringWithFormat:@"raw:fetchBasicMetadata"];
          v77 = +[NSString stringWithFormat:@"%@:[%5.0f ms]:%@", v75, v71, v76];

          v78 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            id v79 = v72;
            v80 = v78;
            id v81 = [v79 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v107 = v81;
            __int16 v108 = 2114;
            v109 = v77;
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
        }
        else
        {
          mach_timebase_info info = 0;
          mach_timebase_info(&info);
          float v41 = (float)mach_absolute_time();
          v42 = +[NSMutableDictionary dictionary];
          v43 = (UInt8 *)malloc_type_malloc(v22, 0x6231B35EuLL);
          CFDataRef v44 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v43 + 12, [(PTPCameraFile *)self readStream:v43 size:v12 offset:0], kCFAllocatorNull);
          if (v44)
          {
            CFDataRef v45 = v44;
            v46 = (void *)CopyMetadataFromCFData();
            v47 = v46;
            if (v46)
            {
              id obj = [v46 objectForKeyedSubscript:@"PixelYDimension"];
              if (obj)
              {
                uint64_t v48 = [v47 objectForKeyedSubscript:@"PixelXDimension"];
                if (v48)
                {
                  v49 = (void *)v48;
                  [v42 setObject:v48 forKeyedSubscript:@"PixelWidth"];
                  [v42 setObject:obj forKeyedSubscript:@"PixelHeight"];
                }
              }
              v50 = [v47 objectForKeyedSubscript:@"Orientation"];
              if (v50) {
                [v42 setObject:v50 forKeyedSubscript:@"Orientation"];
              }
              [(PTPCameraFile *)self setSizeAndOrientationFromImageProperties:v42];
              v51 = [v47 objectForKeyedSubscript:@"ThumbnailSize"];
              -[PTPCameraFile setHasThumbnail:](self, "setHasThumbnail:", (int)[v51 intValue] > 0);
            }
            CFRelease(v45);
          }
          free(v43);
          float v52 = (float)((float)((float)((float)mach_absolute_time() - v41) * (float)info.numer) / (float)info.denom)
              / 1000000.0;
          __ICOSLogCreate();
          v53 = [(PTPCameraItem *)self name];
          if ((unint64_t)[v53 length] >= 0x15)
          {
            v54 = [v53 substringWithRange:0, 18];
            uint64_t v55 = [v54 stringByAppendingString:@".."];

            v53 = (void *)v55;
          }
          if (v52 <= 300.0) {
            CFStringRef v56 = @"{𝚫}";
          }
          else {
            CFStringRef v56 = @"{⊗}";
          }
          v57 = +[NSString stringWithFormat:@"jpeg/heif:fetchBasicMetadata"];
          v58 = +[NSString stringWithFormat:@"%@:[%5.0f ms]:%@", v56, v52, v57];

          v59 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            id v60 = v53;
            v61 = v59;
            id v62 = [v60 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v107 = v62;
            __int16 v108 = 2114;
            v109 = v58;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
        }
        [(PTPCameraFile *)self setUpdatedBasicMetadata:1];
        v82 = [(PTPCameraItem *)self initiator];
        v83 = [v82 delegate];

        CFStringRef v104 = @"ICPTPObjectInfoArray";
        v84 = [(PTPCameraItem *)self info];
        v85 = [v84 content:2];
        v103 = v85;
        v86 = +[NSArray arrayWithObjects:&v103 count:1];
        v105 = v86;
        v87 = +[NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];

        v88 = [v83 allConnections];
        [v83 sendUpdatedItemsNotification:v87 toConnections:v88];
      }
      else
      {
        __ICOSLogCreate();
        id v13 = [(PTPCameraItem *)self name];
        if ((unint64_t)[v13 length] >= 0x15)
        {
          v14 = [v13 substringWithRange:0, 18];
          uint64_t v15 = [v14 stringByAppendingString:@".."];

          id v13 = (void *)v15;
        }
        CFStringRef v16 = +[NSString stringWithFormat:@"No Partial Object Support:fetchBasicMetadata"];
        v17 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = v13;
          v19 = v17;
          *(_DWORD *)buf = 136446466;
          id v107 = [v18 UTF8String];
          __int16 v108 = 2114;
          v109 = v16;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        [(PTPCameraFile *)self setUpdatedBasicMetadata:1];
      }
    }
  }
}

- (void)fetchFullMetadata
{
  if (![(PTPCameraFile *)self updatedExpensiveMetadata])
  {
    BOOL v3 = [(PTPCameraItem *)self initiator];
    v4 = [(PTPCameraItem *)self info];
    if (!v4)
    {
LABEL_34:
      [(PTPCameraFile *)self setUpdatedExpensiveMetadata:1];

      return;
    }
    v6 = [v3 deviceInfo];
    v7 = v6;
    unsigned int v8 = &CFAllocatorReallocate_ptr;
    if (v6)
    {
      uint64_t v9 = [v6 operationsSupported];
      uint64_t v10 = +[NSNumber numberWithUnsignedShort:36873];
      if ([v9 containsObject:v10])
      {
        unsigned int v11 = [(PTPCameraFile *)self isAppleDevice];

        if (v11)
        {
          uint64_t v12 = [v3 metadataFromFile:self];
          if (v12)
          {
            id v13 = +[NSKeyedUnarchiver icUnarchivedObjectFromData:v12 withKey:@"metadata"];
            v14 = [(PTPCameraItem *)self metadata];

            if (!v14)
            {
              uint64_t v15 = +[NSMutableDictionary dictionary];
              [(PTPCameraItem *)self setMetadata:v15];
            }
            CFStringRef v16 = [(PTPCameraItem *)self metadata];
            [v16 addEntriesFromDictionary:v13];
          }
          goto LABEL_31;
        }
      }
      else
      {
      }
      v17 = [v7 operationsSupported];
      id v18 = +[NSNumber numberWithUnsignedShort:4123];
      if ([v17 containsObject:v18])
      {
        v19 = [(PTPCameraItem *)self metadata];

        if (!v19)
        {
          unsigned int v20 = [(PTPCameraFile *)self UTI];
          uint64_t v21 = [UTTypeImage identifier];
          unsigned int v22 = [v20 isEqualToString:v21];

          if (v22)
          {
            if ([(PTPCameraFile *)self rawImageSupported]
              || [(PTPCameraFile *)self imageIOSupported])
            {
              mach_timebase_info info = 0;
              mach_timebase_info(&info);
              dword_10006350C = 0;
              *(float *)&dword_10006350C = (float)mach_absolute_time();
              [(PTPCameraFile *)self setHasThumbnail:1];
              [(PTPCameraFile *)self imageInspectMetadata];
              float v23 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10006350C) * (float)info.numer)
                          / (float)info.denom)
                  / 1000000.0;
              __ICOSLogCreate();
              v24 = [(PTPCameraItem *)self name];
              if ((unint64_t)[v24 length] >= 0x15)
              {
                unint64_t v25 = [v24 substringWithRange:0, 18];
                uint64_t v26 = [v25 stringByAppendingString:@".."];

                v24 = (void *)v26;
              }
              if (v23 <= 300.0) {
                CFStringRef v27 = @"{𝚫}";
              }
              else {
                CFStringRef v27 = @"{⊗}";
              }
              __int16 v28 = +[NSString stringWithFormat:@"image:fetchFullMetadata"];
              CFDictionaryRef v29 = +[NSString stringWithFormat:@"%@:[%5.0f ms]:%@", v27, v23, v28];

              CFDictionaryRef v30 = (void *)_gICOSLog;
              if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
              {
                id v31 = v24;
                v32 = v30;
                id v33 = [v31 UTF8String];
                *(_DWORD *)buf = 136446466;
                id v73 = v33;
                __int16 v74 = 2114;
                CFStringRef v75 = v29;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
              }
              dword_100063508 = LODWORD(v23);
              unsigned int v8 = &CFAllocatorReallocate_ptr;
              goto LABEL_31;
            }
            [(PTPCameraFile *)self setThmSize:1];
            BOOL v65 = [(PTPCameraFile *)self thmSize] > 0;
            id v64 = self;
          }
          else
          {
            id v62 = [(PTPCameraFile *)self UTI];
            unsigned int v63 = [v62 isEqualToString:@"movie"];

            if (!v63)
            {
LABEL_31:
              float v41 = [(PTPCameraItem *)self metadata];
              v42 = [v41 allKeys];
              id v43 = [v42 count];

              if (!v43)
              {
                uint64_t v44 = [v8[212] numberWithUnsignedInt:[v4 imagePixWidth]];
                CFDataRef v45 = [v8[212] numberWithUnsignedInt:[v4 imagePixHeight]];
                v46 = [v4 captureDate];
                sub_1000216C4(v46);
                uint64_t v47 = v70 = v4;

                uint64_t v48 = [(PTPCameraItem *)self metadata];
                [v48 setObject:v45 forKey:kCGImagePropertyPixelHeight];

                v49 = [(PTPCameraItem *)self metadata];
                v66 = (void *)v44;
                [v49 setObject:v44 forKey:kCGImagePropertyPixelWidth];

                v50 = [(PTPCameraItem *)self metadata];
                v67 = v7;
                v51 = [v8[212] numberWithUnsignedInt:[v70 imageBitDepth]];
                [v50 setObject:v51 forKey:kCGImagePropertyDepth];

                float v52 = [(PTPCameraItem *)self metadata];
                [v70 modificationDate];
                v53 = v69 = v3;
                sub_1000216C4(v53);
                v54 = v68 = v5;
                uint64_t v55 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v54, kCGImagePropertyExifDateTimeDigitized, v47, kCGImagePropertyExifDateTimeOriginal, v44, kCGImagePropertyExifPixelXDimension, v45, kCGImagePropertyExifPixelYDimension, 0);
                [v52 setObject:v55 forKey:kCGImagePropertyExifDictionary];

                CFStringRef v56 = [(PTPCameraItem *)self metadata];
                v57 = [v8[212] numberWithUnsignedInt:2];
                v58 = [v8[212] numberWithUnsignedInt:72];
                v59 = [v8[212] numberWithUnsignedInt:72];
                id v60 = (void *)v47;
                v4 = v70;
                v61 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v60, kCGImagePropertyTIFFDateTime, v57, kCGImagePropertyTIFFResolutionUnit, v58, kCGImagePropertyTIFFXResolution, v59, kCGImagePropertyTIFFYResolution, 0);
                [v56 setObject:v61 forKey:kCGImagePropertyTIFFDictionary];

                BOOL v3 = v69;
                v5 = v68;

                v7 = v67;
              }

              goto LABEL_34;
            }
            id v64 = self;
            BOOL v65 = 1;
          }
          [(PTPCameraFile *)v64 setHasThumbnail:v65];
          goto LABEL_31;
        }
      }
      else
      {
      }
    }
    __ICOSLogCreate();
    v34 = [(PTPCameraItem *)self name];
    if ((unint64_t)[v34 length] >= 0x15)
    {
      CFDictionaryRef v35 = [v34 substringWithRange:0, 18];
      uint64_t v36 = [v35 stringByAppendingString:@".."];

      v34 = (void *)v36;
    }
    v37 = +[NSString stringWithFormat:@"No Partial Object Support:fetchFullMetadata"];
    v38 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = v34;
      v40 = v38;
      *(_DWORD *)buf = 136446466;
      id v73 = [v39 UTF8String];
      __int16 v74 = 2114;
      CFStringRef v75 = v37;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(PTPCameraFile *)self setUpdatedExpensiveMetadata:1];
    goto LABEL_31;
  }
}

- (void)thumbnailDataWithOptions:(id)a3 reply:(id)a4
{
  uint64_t v15 = (void (**)(id, void *))a4;
  v6 = [a3 objectForKeyedSubscript:@"kCGImageSourceThumbnailMaxPixelSize"];
  v7 = -[PTPCameraFile thumbnailForPixelWidth:](self, "thumbnailForPixelWidth:", [v6 intValue]);
  unsigned int v8 = +[NSMutableDictionary dictionary];
  [(PTPCameraFile *)self fetchFullMetadata];
  uint64_t v9 = [(PTPCameraItem *)self metadata];

  if (v9)
  {
    uint64_t v10 = [(PTPCameraItem *)self metadata];
    [v8 setObject:v10 forKeyedSubscript:@"metadata"];
  }
  if ([(PTPCameraFile *)self imageOrientation]
    && (+[NSNumber numberWithInt:[(PTPCameraFile *)self imageOrientation]], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v12 = (void *)v11;
    CFStringRef v13 = kCGImagePropertyOrientation;
  }
  else
  {
    v14 = [(PTPCameraItem *)self metadata];
    CFStringRef v13 = kCGImagePropertyOrientation;
    uint64_t v12 = [v14 objectForKey:kCGImagePropertyOrientation];

    if (!v12) {
      goto LABEL_8;
    }
  }
  [v8 setObject:v12 forKey:v13];

LABEL_8:
  if (v7) {
    [v8 setObject:v7 forKeyedSubscript:@"thumb"];
  }
  v15[2](v15, v8);
}

- (void)metadataWithOptions:(id)a3 reply:(id)a4
{
  v5 = (void (**)(id, id))a4;
  [(PTPCameraFile *)self fetchFullMetadata];
  id v6 = [(PTPCameraItem *)self metadata];
  v5[2](v5, v6);
}

- (id)altThumbnaillForMaxPixelSize:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(PTPCameraFile *)self UTI];
  id v6 = [UTTypeImage identifier];

  if (v5 != v6) {
    goto LABEL_2;
  }
  [(PTPCameraFile *)self fetchFullMetadata];
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  dword_10006350C = 0;
  *(float *)&dword_10006350C = (float)mach_absolute_time();
  unsigned int v8 = [(PTPCameraFile *)self copyThumbnailForPixelWidth:v3];
  float v9 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10006350C) * (float)info.numer)
             / (float)info.denom)
     / 1000000.0;
  __ICOSLogCreate();
  uint64_t v10 = [(PTPCameraItem *)self name];
  if ((unint64_t)[v10 length] >= 0x15)
  {
    uint64_t v11 = [v10 substringWithRange:0, 18];
    uint64_t v12 = [v11 stringByAppendingString:@".."];

    uint64_t v10 = (void *)v12;
  }
  if (v9 <= 300.0) {
    CFStringRef v13 = @"{𝚫}";
  }
  else {
    CFStringRef v13 = @"{⊗}";
  }
  v14 = +[NSString stringWithFormat:@"[%d] <<<< copyThumbnailForPixelWidth", v3];
  uint64_t v15 = +[NSString stringWithFormat:@"%@:[%5.0f ms]:%@", v13, v9, v14];

  CFStringRef v16 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v10;
    id v18 = v16;
    id v19 = [v17 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v41 = v19;
    __int16 v42 = 2114;
    id v43 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  dword_100063508 = LODWORD(v9);
  if (v8)
  {
    mach_timebase_info v38 = 0;
    mach_timebase_info(&v38);
    dword_10006350C = 0;
    *(float *)&dword_10006350C = (float)mach_absolute_time();
    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
    unsigned int v20 = [UTTypeJPEG identifier];
    uint64_t v21 = CGImageDestinationCreateWithData(Mutable, v20, 1uLL, 0);

    if (v21)
    {
      CGImageDestinationAddImage(v21, v8, 0);
      if (!CGImageDestinationFinalize(v21))
      {

        Mutable = 0;
      }
      CFRelease(v21);
    }
    else
    {

      Mutable = 0;
    }
    CFRelease(v8);
    float v22 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10006350C) * (float)v38.numer)
                / (float)v38.denom)
        / 1000000.0;
    __ICOSLogCreate();
    float v23 = [(PTPCameraItem *)self name];
    if ((unint64_t)[v23 length] >= 0x15)
    {
      v24 = [v23 substringWithRange:0, 18];
      uint64_t v25 = [v24 stringByAppendingString:@".."];

      float v23 = (void *)v25;
    }
    if (v22 <= 300.0) {
      CFStringRef v26 = @"{𝚫}";
    }
    else {
      CFStringRef v26 = @"{⊗}";
    }
    CFStringRef v27 = +[NSString stringWithFormat:@"[%d] <<<< CGImageDestinationFinalize", v3];
    __int16 v28 = +[NSString stringWithFormat:@"%@:[%5.0f ms]:%@", v26, v22, v27];

    CFDictionaryRef v29 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = v23;
      id v31 = v29;
      id v32 = [v30 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v41 = v32;
      __int16 v42 = 2114;
      id v43 = v28;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    dword_100063508 = LODWORD(v22);
  }
  else
  {
LABEL_2:
    Mutable = 0;
  }
  id v33 = [(PTPCameraFile *)self UTI];
  v34 = [UTTypeMovie identifier];

  if (v33 == v34)
  {
    CFDictionaryRef v35 = [(PTPCameraFile *)self thumbnailForPixelWidth:160];
    uint64_t v36 = (__CFData *)[v35 mutableCopy];

    Mutable = v36;
  }

  return Mutable;
}

- (BOOL)imageIOSupported
{
  if (qword_1000634C8 != -1) {
    dispatch_once(&qword_1000634C8, &stru_10004CD10);
  }
  uint64_t v3 = [(PTPCameraItem *)self name];
  v4 = [v3 pathExtension];
  v5 = [v4 lowercaseString];

  LOBYTE(v3) = [(id)qword_100063510 containsObject:v5];
  return (char)v3;
}

- (BOOL)rawImageSupported
{
  if (qword_1000634D0 != -1) {
    dispatch_once(&qword_1000634D0, &stru_10004CD30);
  }
  uint64_t v3 = [(PTPCameraItem *)self name];
  v4 = [v3 pathExtension];
  v5 = [v4 lowercaseString];

  LOBYTE(v3) = [(id)qword_100063518 containsObject:v5];
  return (char)v3;
}

- (void)setSizeAndOrientationFromImageProperties:(id)a3
{
  id v11 = 0;
  id v12 = 0;
  id v9 = a3;
  id v10 = 0;
  sub_10002179C(v9, &v12, &v11, &v10);
  id v4 = v12;
  id v5 = v11;
  id v6 = v10;
  v7 = [(PTPCameraItem *)self info];
  -[PTPCameraFile setImageOrientation:](self, "setImageOrientation:", [v4 intValue]);
  if ([(PTPCameraFile *)self imageOrientation] < 5)
  {
    -[PTPCameraFile setImageWidth:](self, "setImageWidth:", [v5 intValue]);
    -[PTPCameraFile setImageHeight:](self, "setImageHeight:", [v6 intValue]);
  }
  else
  {
    -[PTPCameraFile setImageWidth:](self, "setImageWidth:", [v6 intValue]);
    -[PTPCameraFile setImageHeight:](self, "setImageHeight:", [v5 intValue]);
    [v9 setObject:v5 forKeyedSubscript:@"PixelHeight"];
    [v9 setObject:v6 forKeyedSubscript:@"PixelWidth"];
    [v9 setObject:v5 forKeyedSubscript:@"PixelYDimension"];
    [v9 setObject:v6 forKeyedSubscript:@"PixelXDimension"];
  }
  [v7 setImagePixHeight:-[PTPCameraFile imageHeight](self, "imageHeight")];
  [v7 setImagePixWidth:-[PTPCameraFile imageWidth](self, "imageWidth")];
  unsigned int v8 = +[NSString stringWithFormat:@"%@", v4];
  [v7 addCustomKeyword:v8 withIdentifier:@"IO"];
}

- (BOOL)processMetadata:(id)a3
{
  id v4 = a3;
  if (![(PTPCameraFile *)self updatedExpensiveMetadata])
  {
    id v6 = +[NSMutableDictionary dictionary];
    if (!v4)
    {
      BOOL v5 = 0;
LABEL_77:

      goto LABEL_78;
    }
    v7 = [v4 objectForKeyedSubscript:kCGImagePropertyExifDictionary];
    unsigned int v8 = [v4 objectForKeyedSubscript:kCGImagePropertyTIFFDictionary];
    if (!v7)
    {
      BOOL v5 = 0;
LABEL_76:

      goto LABEL_77;
    }
    [v6 setObject:v7 forKeyedSubscript:kCGImagePropertyExifDictionary];
    if ([(PTPCameraFile *)self imageHeight])
    {
      uint64_t v9 = +[NSNumber numberWithInt:[(PTPCameraFile *)self imageHeight]];
    }
    else
    {
      uint64_t v9 = 0;
    }
    if ([(PTPCameraFile *)self imageWidth])
    {
      id v10 = +[NSNumber numberWithInt:[(PTPCameraFile *)self imageWidth]];
      if (v9) {
        goto LABEL_13;
      }
    }
    else
    {
      id v10 = 0;
      if (v9)
      {
LABEL_13:
        if (!v10)
        {
          id v10 = [v7 objectForKeyedSubscript:kCGImagePropertyExifPixelXDimension];
        }
        if (v9) {
          BOOL v11 = v10 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        BOOL v5 = !v11;
        v50 = (void *)v9;
        if (v11)
        {
          __ICOSLogCreate();
          unsigned int v20 = [(PTPCameraItem *)self name];
          uint64_t v21 = v8;
          if ((unint64_t)[v20 length] >= 0x15)
          {
            float v22 = [v20 substringWithRange:0, 18];
            uint64_t v23 = [v22 stringByAppendingString:@".."];

            unsigned int v20 = (void *)v23;
          }
          v24 = +[NSString stringWithFormat:@"Missing Metadata"];
          uint64_t v25 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            id v26 = v20;
            CFStringRef v27 = v25;
            *(_DWORD *)buf = 136446466;
            id v52 = [v26 UTF8String];
            __int16 v53 = 2114;
            v54 = v24;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          unsigned int v8 = v21;
          goto LABEL_75;
        }
        [v6 setObject:v9 forKeyedSubscript:kCGImagePropertyPixelHeight];
        [v6 setObject:v10 forKeyedSubscript:kCGImagePropertyPixelWidth];
        [v6 setObject:v9 forKeyedSubscript:kCGImagePropertyExifPixelYDimension];
        [v6 setObject:v10 forKeyedSubscript:kCGImagePropertyExifPixelXDimension];
        uint64_t v12 = [v7 objectForKeyedSubscript:kCGImagePropertyOrientation];
        if (!v12)
        {
          if (v8)
          {
            uint64_t v28 = [v8 objectForKeyedSubscript:];
            if (v28)
            {
              CFStringRef v13 = (void *)v28;
              v14 = v6;
              uint64_t v15 = v13;
              CFStringRef v16 = kCGImagePropertyTIFFOrientation;
              goto LABEL_24;
            }
          }
          if (![(PTPCameraFile *)self imageOrientation])
          {
LABEL_25:
            id v17 = [v7 objectForKeyedSubscript:kCGImagePropertyExifDateTimeOriginal];
            if (v17
              || v8
              && ([v8 objectForKeyedSubscript:kCGImagePropertyTIFFDateTime],
                  (id v17 = objc_claimAutoreleasedReturnValue()) != 0)
              || ([v7 objectForKeyedSubscript:kCGImagePropertyTIFFDateTime],
                  (id v17 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              [(PTPCameraItem *)self setExifCreationDateTime:v17];
            }
            uint64_t v18 = [v7 objectForKeyedSubscript:kCGImagePropertyExifDateTimeDigitized];
            if (v18)
            {
              id v19 = (void *)v18;
              [(PTPCameraItem *)self setExifModificationDateTime:v18];
            }
            else
            {
              if (v8)
              {
                uint64_t v29 = [v8 objectForKeyedSubscript:kCGImagePropertyTIFFDateTime];
                if (v29)
                {
                  id v19 = (void *)v29;
                  [(PTPCameraItem *)self setExifModificationDateTime:v29];
                  goto LABEL_48;
                }
              }
              id v19 = [v7 objectForKeyedSubscript:kCGImagePropertyTIFFDateTime];
              if (v19) {
                [(PTPCameraItem *)self setExifCreationDateTime:v19];
              }
            }
            if (!v8)
            {
LABEL_49:
              uint64_t v30 = [v7 objectForKeyedSubscript:kCGImagePropertyDepth];

              if (v30) {
                [v6 setObject:v30 forKeyedSubscript:kCGImagePropertyDepth];
              }
              uint64_t v48 = (void *)v30;
              v49 = v8;
              id v31 = [v7 objectForKeyedSubscript:@"ThumbnailOffset"];
              id v32 = [v31 intValue];
              if (v32)
              {
                id v33 = v32;
                v34 = [v7 objectForKeyedSubscript:@"ThumbnailSize"];
                id v35 = [v34 intValue];

                if (v35)
                {
                  [(PTPCameraFile *)self setThmOffset:v33];
                  [(PTPCameraFile *)self setThmSize:v35];
                  goto LABEL_63;
                }
              }
              else
              {
              }
              uint64_t v36 = [v7 objectForKeyedSubscript:@"JPEGOffset"];
              id v37 = [v36 intValue];
              if (v37)
              {
                id v38 = v37;
                id v39 = [v7 objectForKeyedSubscript:@"JPEGLength"];
                id v40 = [v39 intValue];

                unsigned int v8 = v49;
                if (v40)
                {
                  [(PTPCameraFile *)self setThmOffset:v38];
                  [(PTPCameraFile *)self setThmSize:v40];
                }
                goto LABEL_64;
              }

LABEL_63:
              unsigned int v8 = v49;
LABEL_64:
              [(PTPCameraFile *)self setSizeAndOrientationFromImageProperties:v6];
              id v41 = [(PTPCameraItem *)self exifModificationDateTime];
              __int16 v42 = v41;
              if (v41)
              {
                id v43 = sub_100021638(v41);
                if (v43) {
                  [(PTPCameraItem *)self setExifModificationDate:v43];
                }
              }
              else
              {
                id v43 = 0;
              }
              uint64_t v44 = [(PTPCameraItem *)self exifCreationDateTime];

              if (v44)
              {
                uint64_t v45 = sub_100021638(v44);

                v46 = v48;
                if (v45)
                {
                  [(PTPCameraItem *)self setExifCreationDate:v45];
                  id v43 = (void *)v45;
                }
                else
                {
                  id v43 = 0;
                }
                unsigned int v8 = v49;
              }
              else
              {
                v46 = v48;
              }
              [(PTPCameraItem *)self setMetadata:v6];

LABEL_75:
              goto LABEL_76;
            }
LABEL_48:
            [v6 setObject:v8 forKeyedSubscript:kCGImagePropertyTIFFDictionary];
            goto LABEL_49;
          }
          uint64_t v12 = +[NSNumber numberWithInt:[(PTPCameraFile *)self imageOrientation]];
        }
        CFStringRef v13 = (void *)v12;
        v14 = v6;
        uint64_t v15 = v13;
        CFStringRef v16 = kCGImagePropertyOrientation;
LABEL_24:
        [v14 setObject:v15 forKeyedSubscript:v16];

        goto LABEL_25;
      }
    }
    uint64_t v9 = [v7 objectForKeyedSubscript:kCGImagePropertyExifPixelYDimension];
    goto LABEL_13;
  }
  BOOL v5 = 1;
LABEL_78:

  return v5;
}

- (void)imageInspectMetadata
{
  unint64_t v3 = [(PTPCameraItem *)self size];
  v76 = self;
  id v4 = [(PTPCameraItem *)self name];
  uint64_t v5 = [v4 pathExtension];

  BOOL v65 = (void *)v5;
  uint64_t TypeWithExtension = CGImageSourceGetTypeWithExtension();
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  dword_10006350C = 0;
  *(float *)&dword_10006350C = (float)mach_absolute_time();
  if (TypeWithExtension) {
    CFDictionaryRef v7 = (const __CFDictionary *)[objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:TypeWithExtension, kCGImageSourceTypeIdentifierHint, 0];
  }
  else {
    CFDictionaryRef v7 = 0;
  }
  CFDictionaryRef options = v7;
  Incremental = CGImageSourceCreateIncremental(v7);
  double v9 = (double)v3;
  double v10 = (double)v3 * 0.3;
  if (v10 > 1048576.0) {
    double v10 = 1048576.0;
  }
  unint64_t v11 = (unint64_t)v10;
  v77 = +[NSMutableIndexSet indexSet];
  uint64_t v12 = v76;
  if (v11)
  {
    unint64_t v13 = 0;
    v14 = 0;
    CFDictionaryRef v15 = 0;
    unint64_t v67 = v11;
    v68 = Incremental;
    while (![(PTPCameraFile *)v12 smallThumbnail]
         || ![(PTPCameraFile *)v12 previewThumbnail])
    {
      uint64_t v16 = v11 - v13 >= 0x100000 ? 0x100000 : v11 - v13;
      CFIndex v17 = v16 + v13;
      v14 = (char *)CFAllocatorReallocate(kCFAllocatorDefault, v14, v16 + v13, 0);
      uint64_t v18 = (char *)malloc_type_malloc(((v16 + 12) & 0x3FC000) + 0x4000, 0xEB7C2612uLL);
      unint64_t v19 = [(PTPCameraFile *)v12 readStream:v18 size:v16 offset:v13];
      if (!v19) {
        break;
      }
      unint64_t v20 = v19;
      memcpy(&v14[v13], v18 + 12, v19);
      free(v18);
      CFDataRef v21 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v14, v17, kCFAllocatorNull);
      unint64_t v75 = v20;
      CGImageSourceUpdateData(Incremental, v21, v20 < 0x100000);
      CFDictionaryRef v22 = CGImageSourceCopyProperties(Incremental, 0);

      if (v22)
      {
        uint64_t v23 = [(__CFDictionary *)v22 objectForKeyedSubscript:@"{raw}"];
        __int16 v74 = [v23 objectForKeyedSubscript:@"Thumbnails"];

        v24 = [(__CFDictionary *)v22 objectForKeyedSubscript:@"{raw}"];
        uint64_t v25 = [v24 objectForKeyedSubscript:@"CropSize"];

        id v73 = v25;
        if (![(PTPCameraFile *)v12 imageHeight] && ![(PTPCameraFile *)v12 imageWidth] && v25)
        {
          id v26 = [v25 objectForKeyedSubscript:@"Height"];
          -[PTPCameraFile setImageHeight:](v12, "setImageHeight:", [v26 intValue]);

          CFStringRef v27 = [v25 objectForKeyedSubscript:@"Width"];
          -[PTPCameraFile setImageWidth:](v12, "setImageWidth:", [v27 intValue]);

          uint64_t v28 = [(__CFDictionary *)v22 objectForKeyedSubscript:@"{raw}"];
          [v28 objectForKeyedSubscript:@"Orientation"];
          v30 = CFDataRef v29 = v21;
          -[PTPCameraFile setImageOrientation:](v12, "setImageOrientation:", [v30 intValue]);

          CFDataRef v21 = v29;
        }
        id v31 = v74;
        if (v74)
        {
          CFDataRef v69 = v21;
          CFDictionaryRef v70 = v22;
          unint64_t v71 = v13;
          v72 = v14;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          id v32 = v74;
          id v33 = [v32 countByEnumeratingWithState:&v79 objects:v88 count:16];
          if (v33)
          {
            id v34 = v33;
            uint64_t v35 = *(void *)v80;
            do
            {
              for (i = 0; i != v34; i = (char *)i + 1)
              {
                if (*(void *)v80 != v35) {
                  objc_enumerationMutation(v32);
                }
                id v37 = *(void **)(*((void *)&v79 + 1) + 8 * i);
                id v78 = 0;
                id v38 = [(PTPCameraFile *)v12 imageValidateSubImage:v37 error:&v78];
                id v39 = v78;
                if (v39)
                {
                  id v40 = [v37 objectForKeyedSubscript:@"JPEGLength"];
                  signed int v41 = [v40 intValue];

                  __int16 v42 = [v37 objectForKeyedSubscript:@"JPEGOffset"];
                  signed int v43 = [v42 intValue];

                  uint64_t v12 = v76;
                  uint64_t v44 = v43;
                  if ([v77 containsIndex:v43]) {
                    BOOL v45 = 1;
                  }
                  else {
                    BOOL v45 = v43 == 0;
                  }
                  if (!v45 && v41 != 0)
                  {
                    uint64_t v47 = v41;
                    uint64_t v48 = v41 + 12;
                    if (v41 < -12) {
                      uint64_t v48 = v41 + 16395;
                    }
                    v49 = (char *)malloc_type_malloc((v48 & 0xFFFFFFFFFFFFC000) + 0x4000, 0xFA610251uLL);
                    id v50 = [(PTPCameraFile *)v76 readStream:v49 size:v47 offset:v44];
                    if (v50)
                    {
                      [(PTPCameraFile *)v76 imageScrapeAllocatedData:v49 + 12 length:v50 bufferOffset:v44];
                      [v77 addIndex:v44];
                    }
                    free(v49);
                  }
                }
                else
                {
                  [(PTPCameraFile *)v12 addSubImageDict:v38];
                }
              }
              id v34 = [v32 countByEnumeratingWithState:&v79 objects:v88 count:16];
            }
            while (v34);
          }

          unint64_t v13 = v71;
          v14 = v72;
          unint64_t v11 = v67;
          Incremental = v68;
          CFDataRef v21 = v69;
          CFDictionaryRef v22 = v70;
          id v31 = v74;
        }
      }
      if (v21) {
        CFRelease(v21);
      }
      v13 += v75;
      CFDictionaryRef v15 = v22;
      if (v13 >= v11) {
        goto LABEL_49;
      }
    }
    CFDictionaryRef v22 = v15;
  }
  else
  {
    CFDictionaryRef v22 = 0;
    unint64_t v13 = 0;
    v14 = 0;
  }
LABEL_49:
  float v51 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10006350C) * (float)info.numer)
              / (float)info.denom)
      / 1000000.0;
  __ICOSLogCreate();
  id v52 = [(PTPCameraItem *)v12 name];
  if ((unint64_t)[v52 length] >= 0x15)
  {
    __int16 v53 = [v52 substringWithRange:0, 18];
    uint64_t v54 = [v53 stringByAppendingString:@".."];

    id v52 = (void *)v54;
  }
  if (v51 <= 300.0) {
    CFStringRef v55 = @"{𝚫}";
  }
  else {
    CFStringRef v55 = @"{⊗}";
  }
  CFStringRef v56 = +[NSString stringWithFormat:@"CGImageSourceCopyProperties %@ %3u%% [%5.2f MB]", @" ", ((double)v13 / v9 * 100.0), v9 * 0.0009765625 * 0.0009765625];
  v57 = +[NSString stringWithFormat:@"%@:[%5.0f ms]:%@", v55, v51, v56];

  v58 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v59 = v52;
    id v60 = v58;
    id v61 = [v59 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v85 = v61;
    __int16 v86 = 2114;
    v87 = v57;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  dword_100063508 = LODWORD(v51);
  if (Incremental) {
    CFRelease(Incremental);
  }
  if (v13)
  {
    [(PTPCameraFile *)v76 imageScrapeAllocatedData:v14 length:v13 bufferOffset:0];
    CFDataRef v62 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v14, v13, kCFAllocatorNull);
    unsigned int v63 = CGImageSourceCreateWithData(v62, options);
    CFDictionaryRef v64 = CGImageSourceCopyPropertiesAtIndex(v63, 0, options);
    if (v64) {
      [(PTPCameraFile *)v76 processMetadata:v64];
    }
    if (v63) {
      CFRelease(v63);
    }
    if (v62) {
      CFRelease(v62);
    }
  }
  if (v14) {
    free(v14);
  }
}

- (id)imageValidateSubImage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v17 = 0;
    goto LABEL_29;
  }
  CFDictionaryRef v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];
  unsigned int v8 = v7;
  if (v7)
  {
    double v9 = [v7 objectForKeyedSubscript:@"ImageWidth"];
    int v10 = [v9 intValue];

    if (!v10)
    {
      CFStringRef v11 = @"PixelWidth";
      uint64_t v12 = [v8 objectForKeyedSubscript:@"PixelWidth"];
      int v10 = [v12 intValue];

      if (v10
        || (CFStringRef v11 = @"Width",
            [v8 objectForKeyedSubscript:@"Width"],
            unint64_t v13 = objc_claimAutoreleasedReturnValue(),
            int v10 = [v13 intValue],
            v13,
            v10))
      {
        v14 = [v8 objectForKeyedSubscript:v11];
        [v8 setObject:v14 forKey:@"ImageWidth"];
      }
    }
    CFDictionaryRef v15 = [v8 objectForKeyedSubscript:@"ImageHeight"];
    unsigned int v16 = [v15 intValue];

    if (v16)
    {
      if (!v10)
      {
LABEL_18:
        if (a4)
        {
          +[NSError errorWithDomain:@"com.apple.imagecapture" code:-2 userInfo:0];
          id v17 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v17 = 0;
        }
        goto LABEL_28;
      }
    }
    else
    {
      CFStringRef v18 = @"PixelHeight";
      unint64_t v19 = [v8 objectForKeyedSubscript:@"PixelHeight"];
      unsigned int v20 = [v19 intValue];

      if (!v20)
      {
        CFStringRef v18 = @"Height";
        CFDataRef v21 = [v8 objectForKeyedSubscript:@"Height"];
        unsigned int v22 = [v21 intValue];

        if (!v22) {
          goto LABEL_18;
        }
      }
      uint64_t v23 = [v8 objectForKeyedSubscript:v18];
      [v8 setObject:v23 forKey:@"ImageHeight"];

      if (!v10) {
        goto LABEL_18;
      }
    }
    v24 = [v6 objectForKeyedSubscript:@"JPEGLength"];
    id v25 = [v24 intValue];

    id v26 = [v6 objectForKeyedSubscript:@"JPEGOffset"];
    id v27 = [v26 intValue];

    if (v25 && v27)
    {
      if (v10 == 160)
      {
        [(PTPCameraFile *)self setThmOffset:v27];
        [(PTPCameraFile *)self setThmSize:v25];
        [(PTPCameraFile *)self setSmallThumbnail:1];
        [v8 setObject:@"smallThumbnail" forKeyedSubscript:@"imageType"];
      }
      else if (v10 < 1400)
      {
        if (v10 <= 1024)
        {
          [v8 setObject:@"ptpSubThumbnailImage" forKeyedSubscript:@"imageType"];
          [(PTPCameraFile *)self setSmallThumbnail:1];
        }
      }
      else
      {
        [v8 setObject:@"previewImage" forKeyedSubscript:@"imageType"];
        [(PTPCameraFile *)self setPreviewThumbnail:1];
      }
    }
    else if (a4)
    {
      *a4 = +[NSError errorWithDomain:@"com.apple.imagecapture" code:-4 userInfo:0];
    }
  }
  id v17 = v8;
LABEL_28:

LABEL_29:

  return v17;
}

- (void)imageScrapeAllocatedData:(char *)a3 length:(unint64_t)a4 bufferOffset:(unint64_t)a5
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  dword_10006350C = 0;
  *(float *)&dword_10006350C = (float)mach_absolute_time();
  memset(v42, 0, sizeof(v42));
  unint64_t v32 = a4;
  unint64_t v8 = a4 - 1;
  if (v8)
  {
    int v9 = 0;
    unint64_t v10 = 0;
    do
    {
      if (a3[v10] == 255)
      {
        unint64_t v11 = v10 + 1;
        int v12 = a3[v10 + 1];
        if (v12 == 217)
        {
          if (v9 >= 1)
          {
            int v35 = v9 - 1;
            uint64_t v13 = *((void *)v42 + (v9 - 1));
            uint64_t v14 = v10 - v13 + 2;
            CFDataRef v34 = +[NSData dataWithBytesNoCopy:&a3[v13] length:v14 freeWhenDone:0];
            CFDictionaryRef v15 = CGImageSourceCreateWithData(v34, 0);
            CFDictionaryRef v16 = CGImageSourceCopyPropertiesAtIndex(v15, 0, 0);
            id v17 = +[NSMutableDictionary dictionaryWithDictionary:v16];
            CFStringRef v18 = +[NSNumber numberWithUnsignedLong:v13 + a5];
            [v17 setObject:v18 forKeyedSubscript:@"JPEGOffset"];

            unint64_t v19 = +[NSNumber numberWithUnsignedLong:v14];
            [v17 setObject:v19 forKeyedSubscript:@"JPEGLength"];

            uint64_t v36 = 0;
            unsigned int v20 = [(PTPCameraFile *)self imageValidateSubImage:v17 error:&v36];
            if (v20) {
              [(PTPCameraFile *)self addSubImageDict:v20];
            }
            if (v15) {
              CFRelease(v15);
            }

            int v9 = v35;
          }
        }
        else if (v12 == 216)
        {
          *((void *)v42 + v9) = v10;
          if (v9 < 0xA) {
            ++v9;
          }
        }
        else
        {
          unint64_t v11 = v10;
        }
        unint64_t v10 = v11 + 1;
      }
      ++v10;
    }
    while (v10 < v8 && v9 < 6);
  }
  float v21 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10006350C) * (float)info.numer)
              / (float)info.denom)
      / 1000000.0;
  __ICOSLogCreate();
  unsigned int v22 = [(PTPCameraItem *)self name];
  if ((unint64_t)[v22 length] >= 0x15)
  {
    uint64_t v23 = [v22 substringWithRange:0, 18];
    uint64_t v24 = [v23 stringByAppendingString:@".."];

    unsigned int v22 = (void *)v24;
  }
  if (v21 <= 300.0) {
    CFStringRef v25 = @"{𝚫}";
  }
  else {
    CFStringRef v25 = @"{⊗}";
  }
  id v26 = +[NSString stringWithFormat:@"imageScrapeAllocatedData [%5.2f MB]", (double)v32 * 0.0009765625 * 0.0009765625];
  id v27 = +[NSString stringWithFormat:@"%@:[%5.0f ms]:%@", v25, v21, v26];

  uint64_t v28 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = v22;
    uint64_t v30 = v28;
    id v31 = [v29 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v39 = v31;
    __int16 v40 = 2114;
    signed int v41 = v27;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  dword_100063508 = LODWORD(v21);
}

- (NSMutableDictionary)subImages
{
  return self->_subImages;
}

- (void)addSubImageDict:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"ImageWidth"];
  if (v5)
  {
    id v6 = (void *)v5;
    subImages = self->_subImages;
    unint64_t v8 = [v4 objectForKeyedSubscript:@"ImageWidth"];
    int v9 = [(NSMutableDictionary *)subImages objectForKeyedSubscript:v8];

    if (!v9)
    {
      unint64_t v10 = self->_subImages;
      unint64_t v11 = [v4 objectForKeyedSubscript:@"ImageWidth"];
      [(NSMutableDictionary *)v10 setObject:v4 forKey:v11];

      __ICOSLogCreate();
      int v12 = [(PTPCameraItem *)self name];
      if ((unint64_t)[v12 length] >= 0x15)
      {
        uint64_t v13 = [v12 substringWithRange:0, 18];
        uint64_t v14 = [v13 stringByAppendingString:@".."];

        int v12 = (void *)v14;
      }
      CFDictionaryRef v15 = [v4 objectForKeyedSubscript:@"ImageWidth"];
      id v16 = [v15 intValue];
      id v17 = [v4 objectForKeyedSubscript:@"ImageHeight"];
      CFStringRef v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"+ [%10d(w)x %10d(h)]", v16, [v17 intValue]);

      unint64_t v19 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = v12;
        float v21 = v19;
        *(_DWORD *)buf = 136446466;
        id v23 = [v20 UTF8String];
        __int16 v24 = 2114;
        CFStringRef v25 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
}

- (id)subImageDictForPixelWidth:(id)a3
{
  id v4 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_subImages allKeys];
  id v6 = [v5 sortedArrayUsingSelector:"compare:"];

  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v35;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v35 != v9) {
        objc_enumerationMutation(v6);
      }
      unint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
      int v12 = [v4 intValue];
      if (v12 <= (int)[v11 intValue]) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v13 = [(NSMutableDictionary *)self->_subImages objectForKeyedSubscript:v11];
    __ICOSLogCreate();
    uint64_t v14 = [(PTPCameraItem *)self name];
    if ((unint64_t)[v14 length] >= 0x15)
    {
      CFDictionaryRef v15 = [v14 substringWithRange:0, 18];
      uint64_t v16 = [v15 stringByAppendingString:@".."];

      uint64_t v14 = (void *)v16;
    }
    id v17 = [v13 objectForKeyedSubscript:@"ImageWidth"];
    id v18 = [v17 intValue];
    unint64_t v19 = [v13 objectForKeyedSubscript:@"ImageHeight"];
    id v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"⇲ [%10d(w)x %10d(h)]", v18, [v19 intValue]);

    float v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v14;
      id v23 = v21;
      id v24 = [v22 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v39 = v24;
      __int16 v40 = 2114;
      signed int v41 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    if (v13) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_9:
  }
  __ICOSLogCreate();
  CFStringRef v25 = [(PTPCameraItem *)self name];
  if ((unint64_t)[v25 length] >= 0x15)
  {
    id v26 = [v25 substringWithRange:0, 18];
    uint64_t v27 = [v26 stringByAppendingString:@".."];

    CFStringRef v25 = (void *)v27;
  }
  uint64_t v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"╳ [%10d] no match", [v4 intValue]);
  id v29 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = v25;
    id v31 = v29;
    id v32 = [v30 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v39 = v32;
    __int16 v40 = 2114;
    signed int v41 = v28;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v13 = 0;
LABEL_20:

  return v13;
}

- (int64_t)compare:(id)a3 against:(id)a4 withContext:(void *)a5
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 objHandle];
  if (v8 >= [v7 objHandle])
  {
    unsigned int v10 = [v6 objHandle];
    int64_t v9 = v10 > [v7 objHandle];
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

- (id)thumbnailForPixelWidth:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(PTPCameraItem *)self initiator];
  int v10 = 0;
  id v6 = [v5 thumbDataFromFile:self maxPixelSize:v3 actualSize:&v10 useBuffer:0];
  id v7 = v6;
  if (v6 && [v6 length]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (CGImage)copyThumbnailForPixelWidth:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(PTPCameraItem *)self name];
  id v6 = [v5 pathExtension];
  uint64_t TypeWithExtension = CGImageSourceGetTypeWithExtension();

  value = +[NSNumber numberWithInt:v3];
  id v8 = -[PTPCameraFile subImageDictForPixelWidth:](self, "subImageDictForPixelWidth:");
  id v60 = v8;
  if (v8)
  {
    int64_t v9 = v8;
    int v10 = [v8 objectForKeyedSubscript:@"JPEGOffset"];
    unint64_t v11 = [v9 objectForKeyedSubscript:@"JPEGLength"];
    id v59 = v10;
    id v12 = [v10 unsignedIntegerValue];
    uint64_t v13 = (uint64_t)[v11 unsignedIntegerValue];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = v13 + 12;
      if (v13 < -12) {
        uint64_t v15 = v13 + 16395;
      }
      uint64_t v16 = (char *)malloc_type_malloc((v15 & 0xFFFFFFFFFFFFC000) + 0x4000, 0xEE2893C7uLL);
      if (v16)
      {
        id v17 = v16;
        unint64_t v18 = [(PTPCameraFile *)self readStream:v16 size:v14 offset:v12];
        if (v14 == v18)
        {
          CFDataRef v19 = +[NSData dataWithBytes:v17 + 12 length:v14];
          free(v17);
          if (v19)
          {
            Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            float v21 = CGImageSourceCreateWithData(v19, 0);
            id v22 = value;
            CFDictionarySetValue(Mutable, kCGImageSourceThumbnailMaxPixelSize, value);
            CFDictionarySetValue(Mutable, kCGImageSourceCreateThumbnailFromImageAlways, kCFBooleanTrue);
            if (v21)
            {
              ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v21, 0, Mutable);
              CFRelease(v21);
              if (!Mutable)
              {
LABEL_11:
                if (ThumbnailAtIndex)
                {
                  __ICOSLogCreate();
                  id v24 = [(PTPCameraItem *)self name];
                  if ((unint64_t)[v24 length] >= 0x15)
                  {
                    CFStringRef v25 = [v24 substringWithRange:0, 18];
                    uint64_t v26 = [v25 stringByAppendingString:@".."];

                    id v24 = (void *)v26;
                  }
                  uint64_t v27 = +[NSString stringWithFormat:@"✓ Thumbnail SubImage Dict"];
                  uint64_t v28 = (void *)_gICOSLog;
                  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
                  {
                    id v29 = v24;
                    id v30 = v28;
                    id v31 = v29;
                    id v22 = value;
                    buf.version = 136446466;
                    *(void *)(&buf.version + 1) = [v31 UTF8String];
                    WORD2(buf.getBytePointer) = 2114;
                    *(CGDataProviderGetBytePointerCallback *)((char *)&buf.getBytePointer + 6) = v27;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
                  }
                }

                goto LABEL_45;
              }
            }
            else
            {
              ThumbnailAtIndex = 0;
              if (!Mutable) {
                goto LABEL_11;
              }
            }
            CFRelease(Mutable);
            goto LABEL_11;
          }
        }
        else
        {
          unint64_t v32 = v18;
          __ICOSLogCreate();
          id v33 = [(PTPCameraItem *)self name];
          if ((unint64_t)[v33 length] >= 0x15)
          {
            long long v34 = [v33 substringWithRange:0, 18];
            uint64_t v58 = [v34 stringByAppendingString:@".."];

            id v33 = (void *)v58;
          }
          long long v35 = +[NSString stringWithFormat:@"Received %zu bytes, expected %lu", v32, v14];
          long long v36 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
            sub_100033D60(v33, v36, (uint64_t)v35);
          }

          free(v17);
        }
      }
    }
  }
  id v37 = objc_alloc((Class)NSMutableDictionary);
  size_t v38 = v3;
  id v39 = +[NSNumber numberWithLong:v3];
  CFDataRef v19 = (const __CFData *)[v37 initWithObjectsAndKeys:TypeWithExtension, kCGImageSourceTypeIdentifierHint, v39, kCGImageSourceThumbnailMaxPixelSize, kCFBooleanTrue, kCGImageSourceCreateThumbnailFromImageAlways, 0];

  *(_OWORD *)&buf.version = xmmword_10004CD50;
  *(_OWORD *)&buf.releaseBytePointer = unk_10004CD60;
  buf.releaseInfo = (CGDataProviderReleaseInfoCallback)nullsub_4;
  __int16 v40 = CGDataProviderCreateDirect(self, [(PTPCameraItem *)self size], &buf);
  signed int v41 = CGImageSourceCreateWithDataProvider(v40, v19);
  size_t Count = CGImageSourceGetCount(v41);
  __ICOSLogCreate();
  signed int v43 = +[NSString stringWithFormat:@"     numImages: %d\n", Count];
  if (__ICLogTypeEnabled(4))
  {
    uint64_t v44 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CFDataRef v62 = 138543362;
      id v63 = v43;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}@", v62, 0xCu);
    }
  }

  if (Count)
  {
    size_t v45 = 0;
    size_t v46 = 0;
    do
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v41, v45, 0);
      if (ImageAtIndex)
      {
        uint64_t v48 = ImageAtIndex;
        if (CGImageGetHeight(ImageAtIndex) > v38) {
          size_t v46 = v45;
        }
        CFRelease(v48);
      }
      ++v45;
    }
    while (Count != v45);
  }
  else
  {
    size_t v46 = 0;
  }
  id v22 = value;
  if (v41)
  {
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v41, v46, v19);
    CFRelease(v41);
    CGDataProviderRelease(v40);
    if (ThumbnailAtIndex)
    {
      __ICOSLogCreate();
      v49 = [(PTPCameraItem *)self name];
      if ((unint64_t)[v49 length] >= 0x15)
      {
        id v50 = [v49 substringWithRange:0, 18];
        uint64_t v51 = [v50 stringByAppendingString:@".."];

        v49 = (void *)v51;
      }
      id v52 = +[NSString stringWithFormat:@"✓ ImageIO Created"];
      __int16 v53 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v54 = v49;
        CFStringRef v55 = v53;
        id v56 = [v54 UTF8String];
        *(_DWORD *)CFDataRef v62 = 136446466;
        id v63 = v56;
        __int16 v64 = 2114;
        BOOL v65 = v52;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v62, 0x16u);
      }
    }
  }
  else
  {
    CGDataProviderRelease(v40);
    ThumbnailAtIndex = 0;
  }
  int64_t v9 = v60;
LABEL_45:

  return ThumbnailAtIndex;
}

- (id)fingerprintWithError:(id *)a3
{
  uint64_t v5 = [(PTPCameraItem *)self fingerprint];

  if (!v5)
  {
    id v6 = (char *)malloc_type_malloc(0x24000uLL, 0xBE777E6FuLL);
    if (v6)
    {
      id v7 = v6;
      unint64_t v8 = [(PTPCameraFile *)self readStream:v6 size:147456 offset:0];
      int64_t v9 = objc_alloc_init(ICCameraFileFingerprint);
      int v10 = +[NSData dataWithBytes:v7 + 12 length:v8];
      unint64_t v11 = [(ICCameraFileFingerprint *)v9 fingerprintForData:v10 error:a3];
      [(PTPCameraItem *)self setFingerprint:v11];

      __ICOSLogCreate();
      id v12 = [(PTPCameraItem *)self name];
      if ((unint64_t)[v12 length] >= 0x15)
      {
        uint64_t v13 = [v12 substringWithRange:0, 18];
        uint64_t v14 = [v13 stringByAppendingString:@".."];

        id v12 = (void *)v14;
      }
      uint64_t v15 = [(PTPCameraItem *)self fingerprint];
      uint64_t v16 = +[NSString stringWithFormat:@"fingerprint: %@", v15];

      id v17 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v12;
        CFDataRef v19 = v17;
        *(_DWORD *)CGDataProviderDirectCallbacks buf = 136446466;
        id v23 = [v18 UTF8String];
        __int16 v24 = 2114;
        CFStringRef v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
  id v20 = [(PTPCameraItem *)self fingerprint];

  return v20;
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)raw
{
  return self->_raw;
}

- (void)setRaw:(BOOL)a3
{
  self->_raw = a3;
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (NSString)UTI
{
  return self->_UTI;
}

- (void)setUTI:(id)a3
{
}

- (void)setSubImages:(id)a3
{
}

- (int)thmSize
{
  return self->_thmSize;
}

- (void)setThmSize:(int)a3
{
  self->_thmSize = a3;
}

- (int)thmOffset
{
  return self->_thmOffset;
}

- (void)setThmOffset:(int)a3
{
  self->_thmOffset = a3;
}

- (int)thmWidth
{
  return self->_thmWidth;
}

- (void)setThmWidth:(int)a3
{
  self->_thmWidth = a3;
}

- (int)thmHeight
{
  return self->_thmHeight;
}

- (void)setThmHeight:(int)a3
{
  self->_thmHeight = a3;
}

- (int)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(int)a3
{
  self->_imageWidth = a3;
}

- (int)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(int)a3
{
  self->_imageHeight = a3;
}

- (int)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int)a3
{
  self->_imageOrientation = a3;
}

- (int)bitsPerPixel
{
  return self->_bitsPerPixel;
}

- (void)setBitsPerPixel:(int)a3
{
  self->_bitsPerPixel = a3;
}

- (int64_t)dpOffset
{
  return self->_dpOffset;
}

- (void)setDpOffset:(int64_t)a3
{
  self->_dpOffset = a3;
}

- (BOOL)updatedBasicMetadata
{
  return self->_updatedBasicMetadata;
}

- (void)setUpdatedBasicMetadata:(BOOL)a3
{
  self->_updatedBasicMetadata = a3;
}

- (BOOL)updatedExpensiveMetadata
{
  return self->_updatedExpensiveMetadata;
}

- (void)setUpdatedExpensiveMetadata:(BOOL)a3
{
  self->_updatedExpensiveMetadata = a3;
}

- (BOOL)previewThumbnail
{
  return self->_previewThumbnail;
}

- (void)setPreviewThumbnail:(BOOL)a3
{
  self->_previewThumbnail = a3;
}

- (BOOL)smallThumbnail
{
  return self->_smallThumbnail;
}

- (void)setSmallThumbnail:(BOOL)a3
{
  self->_smallThumbnail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subImages, 0);
  objc_storeStrong((id *)&self->_UTI, 0);

  objc_storeStrong((id *)&self->_cachedMetadata, 0);
}

@end